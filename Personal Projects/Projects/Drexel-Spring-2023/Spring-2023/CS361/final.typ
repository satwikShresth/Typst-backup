
#import "/template.typ": project
#show: project.with(
  title: "CS 361 - Final",
  author: "Satwik Shresth",
  date: "June 12, 2024",
)

#set enum(body-indent: 1em,indent: 1em)
== Question 2: Course Material

#enum()[
  *What do you think of C++ as a Programming Language?*
  - First off, I really like C++, I really feel I have grown as a programmer because I understand C++ pretty well now, It is quite an achievement to work without LSPs and relying solely on compiler errors
  - It is really powerful and with great power comes great responsibility
  - Pointers, memory allocation.. etc there are plethora of things to shoot yourself on the foot, but C++ does a good job at hiding it, which also allows you to blow off your foot
  - Sometimes I have no idea where the issue is because the variable going out of scope is destructing
  - In short I love C++ but it took me 3 years to fully understand pointers and reference, rvalue, lvalue, xvalue and I still dont fully understand &&& or &&\* etc
  - Sure I do understand in genereal what it means but do I understand fully whats going on, maybe not
  - I really hope people see C++ what a beautiful language it is, but adoption of other languages are on rise, Rust and Zig are catching up
  - But I will continue programing in C++, the performance and community support is amazing but it really need to do a better job at giving better compiler errors
  \
][
*Pick four of the concepts listed in the description. For each one, give a specific example of how you used that concept in a homework assignment.*
  - Mutual Exclusion
    - In short Mutex, In all the assignments I used to make sure all the STDOUT (print statment) do not have interleaving. 
  - Semaphores
    - I used semaphores in the Assignment 5 Thread racer to synchronize the thread a way that only one thread pops the dice from queue and run the length.
    - Semaphore me to direct each  thread complete few atomic statements one by one
  - Monitor
    - In my last assignment NS1D0 sequences, I used monitor to make the main thread wait for all the channels to close before freeing the memory allocated for them and exiting
  - Rendezvous
    - I did not use semaphore to achieve this, but I used conditional variable to make the thread meet at the boat, travel together and then decide who will get off at the island in the Trapped on the island assignment
]
#pagebreak()

== Question 3: Threading Puzzle

I will go with option 1 for this
=== Referenece
 - This program was developed with insights and techniques from Dr. Brian Mitchell Class472 Assignment4-UDP:
 - #link("https://github.com/ArchitectingSoftware/CS472-Class-Files/tree/main/hw4-udp")

=== Implementation
- I created a UDP File Transfer Protocol server which can handle multiple clients sending in data for a file
- Original code given by prof was written in c with purely functional, I took most of the code and made very object oriented, so that concurrency is easier to implement

- Different classes to do different work
  - Connection
    - own socket created for udp and does does the main job of accepting the data and sending the acknoledgement
    - It is templated,so it can work with any new struct but they have to have the similar implementation
    - send funciton
    ```cpp
template <typename PDU>
int Connection<PDU>::sendRaw(void* sbuff, int sbuff_sz)
{
   int bytesOut = 0;

   if (!outSockAddr.isAddrInit)
   {
      perror("sendRaw: connection not setup properly");
      return -1;
   }

   PDU* outPdu = (PDU*) sbuff;
   bytesOut    = sendto(udpSock, (const char*) sbuff, sbuff_sz, 0, (const struct sockaddr*) &(outSockAddr.addr), outSockAddr.len);

   outPdu->printOut(dbgMode);

   return bytesOut;
}

    ```

#pagebreak()
    - recv function
    ```cpp
    template <typename PDU>
int Connection<PDU>::recvRaw(void* buff, int buffSz)
{
   int bytes = 0;

   if (!inSockAddr.isAddrInit)
   {
      perror("recv: connection not setup properly - cli struct not init");
      return -1;
   }

   bytes = recvfrom(udpSock, (char*) buff, buffSz, MSG_WAITALL, (struct sockaddr*) &(outSockAddr.addr), &(outSockAddr.len));

   if (bytes < 0)
   {
      perror("recv: received error from recvfrom()");
      return -1;
   }
   outSockAddr.isAddrInit = true;

   if (bytes > sizeof(PDU))
   {
      if (false)
      {
         PDU*  inPdu   = (PDU*) buff;
         char* payload = (char*) buff + sizeof(PDU);
         printf("DATA : %.*s\n", inPdu->dgram_sz, payload);
      }
   }

   PDU* inPdu = (PDU*) buff;
   inPdu->printIn(dbgMode);

   return bytes;
}

    ```
#pagebreak()
    
  - FTPFileWriter
    - Own the Channel Data structre and iterates over it until its closed
    - Its main work is to take the buffer provided to ti and write it to the file
    - ```cpp
void writer::serverLoop()
{
   while (!channel->isClosed())
   {
      std::string buff;

      try
      {
         buff = channel->receive();
      }
      catch (std::runtime_error e)
      {
         break;
      }
      FTP_PDU* pdu = reinterpret_cast<FTP_PDU*>(buff.data());
      std::cout << "filename: " << pdu->fileName << std::endl;

      auto mode = (pdu->status == Status::NEW) ? std::ios::trunc : std::ios::app;

      std::ofstream outFile{pdu->fileName, std::ios::out | mode};

      if (!outFile.is_open())
      {
         std::cerr << "ERROR:  Cannot open file " << pdu->fileName << std::endl;
         exit(-1);
      }
      buff.erase(0, sizeof(FTP_PDU));
      outFile << buff;

      // fwrite(dataPtr, 1, dataSz, f);
      std::cout << "========================> \n" << buff << "\n========================> \n";
   }
   delete channel;
   closed = true;
}
 
    ```
#pagebreak()
  - FTPServer
    - Owns connection and all the file writer
    - If a message comes with a request to connect creates a new filewriter, which intern creates a new channel
    - It creates a filewriter for each Sender, not for file, so that we can also limit the amount of load put on by a sender
    - listen function
    ```cpp
void server::listen()
{
...
   rcvSz = dpc->recvRaw(dpc->_buffer, sizeof(dpc->_buffer));
   std::string address = inet_ntoa(dpc->getOutSockAddr()->addr.sin_addr);

   if (rcvSz == sizeof(PDU))
   {
      PDU pdu;
      pdu.seqnum = 0;
      pdu.mtype  = MsgType::CNTACK;

      dpc->seqNums[inet_ntoa(dpc->getOutSockAddr()->addr.sin_addr)] = pdu.seqnum + 1;

      pdu.seqnum = dpc->seqNums[inet_ntoa(dpc->getOutSockAddr()->addr.sin_addr)];

      sndSz = dpc->sendRaw(&pdu, sizeof(PDU));

      if (sndSz != sizeof(PDU))
      {
         perror("listen: The wrong number of bytes were sent");
      }

      connected++;
      fw.push_back(new FTPFileWriter{address});

      pool->submit([&] {
         FTPFileWriter* writer = fw.back();
         fw.pop_back();
         writer->serverLoop();
         delete writer;
         ftpWriters.erase(writer->address);
      });

      ftpWriters[address] = fw.back();
      std::cout << "Connection established OK!" << std::endl;
   }
   else
   {
     ... handles the message accordingly
      ftpWriters[address]->pushToChannel(dpc->_buffer + sizeof(PDU), rcvSz - sizeof(PDU));
   }

   std::this_thread::sleep_for(std::chrono::seconds(3));
}

    ```
  - FTPClient
    - Connectes to the Server and send it file data

- This is just the pseudocode, I have tested it, it works, with full code, I will be adding the code to the submission
#pagebreak()

== Example output
#figure(
  image(fit: "contain",height: 10cm,width: 10cm,"/CS361/img1.png"),
)
- As you can see the server starts and accepts a file rfc768 from one client
#figure(
  image(fit: "contain",height: 10cm,width: 10cm,"/CS361/img2.png"),
)
- Now you can see the server connecting to another client, receiving data for test.c and processing it
#figure(
  image(fit: "contain",height: 10cm,width: 10cm,"/CS361/img3.png"),
)
- here you can see me starting and sending rfc768.txt connecting ans sending data to server
#figure(
  image(fit: "contain",height: 10cm,width: 10cm,"/CS361/img4.png"),
)

- here you can see me starting and sending test.c connecting ans sending data to server
#figure(
  image(fit: "contain",height: 10cm,width: 10cm,"/CS361/img6.png"),
)
- Here you can se server writing this file in a new file outside of outfile the data it was sent
#figure(
  image(fit: "contain",height: 10cm,width: 10cm,"/CS361/img7.png"),
)
- Here you can se server writing this file in a new file outside of outfile the data it was sent for test.c
- I will add the source code to the submission for inspection 

#pagebreak()

= Final Letter Grade

== Question 5
- I would like to give myself A+
- I feel I deserve this because I have
  - Completed all my assignments on time
  - Read all the assigned readings
  - Completed all the reflection on time except the first one
  - Watched/attended all the lectures
  - Been responsive in class
- I have completed all my assignments without silly mistakes
  - I have learned a lot and I am constantly applying these knowledge where I see possible
- I have learned a lot more about the concurrent way of thinking, and I feel confident that I if there is a need for concurrency, I can utilize the correct data structure to solve the problem efficiently
- I have also improved my C++ skills a lot throughout the course, I feel I now understand the language better than before
- I feel like I could've created a really fast ns1d0 sequence generator if I had more time, I had already got a submission ready position, but I just like working on these puzzles so much, that I designed a way to make things more efficient
- I would love to work more on concurrent systems and take such challenging class in general
  - I don't think the class is challenging in general, all the assignment expectation are very reasonable
  - But the fact that I can make something work faster just gets me going, I love the fact that I can improve algorithm and the code structure and the reward is very evident
- I took cs472 and the final project was the UDP FTP, the above code I am displaying is heavily inspired by the last assignment of that course, I had a lot of fun writing it in C++ and implementing concurrency on it
  - combining concepts learned in two different classes was a really good experience, gives a lot of perspective why we are focusing on these things in separate class and how they have the potential to one day translate into something meaningful
  