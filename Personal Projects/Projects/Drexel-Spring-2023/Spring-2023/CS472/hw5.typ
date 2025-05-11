#import "/template.typ": project

#show: project.with(
  title: "CS 472 - Homework 05",
  author: "Satwik Shresth",
  date: "May 31, 2024",
)
#set enum(body-indent: 1em,indent: 1em)

= Part 1 : Function Descriptions
\
#enum()[
  ```c
  //initializes a new dynamically allocated dp_connp struct 
  static dp_connp dpinit()
  ```
  - What it does:
    - Initializes a new `dp_connection` structure and sets default values.
  - How it accomplishes it:
    - Allocates memory for a `dp_connection` structure.
    - Clears the pre-allocated memory in the structure.
    - Sets initial values for the structure's fields
    - Returns a pointer to the initialized structure.
  \
][
  ```C
//frees dp_connp struct
void dpclose(dp_connp dpsession)
  ```
  - What it does:
    - Frees the memory allocated for a `dp_connection` structure.
  \
][
  ```c
  //get max buffer size for datagram
  int dpmaxdgram()
  ```
  - What it does:
    - Returns the maximum size of a datagram i.e. `DP_MAX_BUFF_SZ`.
  
  \
][
  ```c
  //create a dp_connp struct with a new live udp socket fd for server
  dp_connp dpServerInit(int port)
  ```
  - What it does:
    - Initializes a server-side `dp_connection`.
    - Returns a pointer to `dp_connection`.
  
  - How it accomplishes it:
    - Calls `dpinit()` to create a new `dp_connection`
    - Initialize the sock pointer to the address of dpc socket.
    - Creates a new socket fd and set it to dereferenced sock.
    - Configures the socket options to allow address reuse.
    - Binds the socket to the specified port and marks the inbound socket address as initialized.
    - Returns the initialized `dp_connection` pointer.
  \
][
  ```c
  //create a dp_connp struct with a new live udp socket fd for client
  dp_connp dpClientInit(char* addr, int port)
  ```
- What it does:
  - Initializes a client-side `dp_connection`.

- How it accomplishes it:
  - Calls `dpinit()` to create a new `dp_connection`
    - Initialize the sock pointer to the address of dpc socket.
    - Creates a new socket fd and set it to dereferenced sock.
  - Copies the outbound address to the inbound address.
  - Returns the initialized `dp_connection` pointer.
][
  ```c
  // recieve filled buffer from the udp socket
  int dprecv(dp_connp dp, void* buff, int buff_sz)
  ```
  - What it does:
    - Receives data from the socket and copies it into the provided buffer.

  - How it accomplishes it:
    - Calls `dprecvdgram()` to receive a datagram into a temporary buffer.
    - If the datagram is larger than the PDU header, copies the data part into the provided buffer.
    - Returns the size of the data received.
  \
][
  ```c
//recieve raw buffer from the connected socket
dprecvraw(dp_connp dp, void* buff, int buff_sz)
  ```
- What it does:
  - Receives raw data from the socket.

- How it accomplishes it:
  - Calls `recvfrom()` to receive data from the socket.
  - Checks for errors in the reception and marks the outbound address as initialized.
  - Prints the PDU details if debugging is enabled.
  - Returns the number of bytes received. 
  \
][
  ```c
//recieve raw datagram process from the data recieved from the socket
static int dprecvdgram(dp_connp dp, void* buff, int buff_sz)
  ```
  
- What it does:
  - uses recieved raw data to error check, update sequence and acknowledge out bound/error messages

- How it accomplishes it:
  - Calls `dprecvraw()` to receive raw datagram.
  - Checks for errors in data gram size and copy buffer to a static dp_pdu struct
  - Checks for errors in dp_pdu size and updates the sequence number.
  - prepare out bound dp_pdu and check for error, send it and handle its acknowledgement
  \
][
  ```c
//send data through the udp socket
int dpsend(dp_connp dp, void* sbuff, int sbuff_sz)
  ```
- What it does:
  - Sends data through the socket.

- How it accomplishes it:
  - Checks if the buffer size is within the maximum datagram size.
  - Calls `dpsenddgram()` to send the data as a datagram.
  - Returns the size of the data sent. 
  \
][
  ```c
//construct a proper datagram to send a udp socket using dp_connection struct
static int dpsenddgram(dp_connp dp, void* sbuff, int sbuff_sz)
  ```
  - What it does:
    - Sends a with the provided data.

- How it accomplishes it:
  - Checks if the connection is properly initialized.
  - Builds a PDU with the data.
  - Calls `dpsendraw()` to send the raw data.
  - Receives an acknowledgment for the sent data and updates the sequence number.
  - Returns the number of bytes sent excluding the PDU header.
][
  ```c
//send buffer to the udp socket
dpsendraw(dp_connp dp, void* sbuff, int sbuff_sz)  
  ```
- What it does:
   - Sends raw data through the socket.

- How it accomplishes it:
  - Calls `sendto()` to send data to the specified address.
  - Prints the PDU details if debugging is enabled.
  - Returns the number of bytes sent.  
\
][
  ```c
//listend to the live udp socket
dplisten(dp_connp dp)
  ```
- What it does:
  - accepts an incoming connection.

- How it accomplishes it:
  - receives a connection request by calling `dprecvraw()`.
  - Sends a connection acknowledgment.
  - Marks the connection as established.
  - Returns true on successful connection establishment.
  \
][
```c
//try to connect the udp socket fd
dpconnect(dp_connp dp)
```
- What it does:
   - Initiates a connection to the server.

- How it accomplishes it:
  - Sends a connection request.
  - Waits for a connection acknowledgment.
  - Marks the connection as established.
  - Returns true on successful connection establishment.
\
][
```c
//disconnect from socket and frees the dp_conn struct
dpdisconnect(dp_connp dp)
```
- What it does:
   - disconnects from server and free the dp_conn struct.

- How it accomplishes it:
  - Checks if the connection is still alive by sending a close request.
  - Waits for a disconnection acknowledgment.
  - Marks the connection as disconnected.
  - free the dp_conn struct.
  - Returns true on successful disconnection establishment.
\
][
```c
//add pdu header to buffer 
dp_prepare_send(dp_pdu* pdu_ptr, void* buff, int buff_sz)
```
- What it does:
  - Prepares a buffer for sending by copying the PDU header into it.

- How it accomplishes it:
  - Clears the buffer.
  - Copies the PDU header into the buffer.
  - Returns a pointer to the location after the PDU header in the buffer. 
  \
][
```c
//printst the pdu struct with desc
print_out_pdu(dp_pdu* pdu)
```
- What it does:
  - Prints the details of an outbound PDU if debugging is enabled adds out header.
\
][
```c
print_in_pdu(dp_pdu* pdu)
```
- What it does:
  - Prints the details of an inbound PDU if debugging is enabled and in header.
  \
][
  ```c
print_pdu_details(dp_pdu* pdu)
  ```
 - What it does:
   - Prints the detailed information of a PDU.

- How it accomplishes it:
  - Prints the protocol version, message type, datagram size, and sequence number. 
 \ 
][
  
  ```c
pdu_msg_to_string(dp_pdu* pdu)
  ```
 - What it does:
  - Converts the PDU message type to a string representation.

- How it accomplishes it:
  - Uses a switch statement to map the message type to a corresponding string.
  - Returns the string representation of the message type. 
  \
][
```c
//create a random integer
dprand(int threshold)
```
 - What it does:
   - Generates a random boolean value based on the given threshold.
  \
]
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\



= Part 2 : 

#enum()[
  Top layer
  - `dpsend` and `dprecv`
    - High Level implementation, abstracts implementations
    - Deals with only `dp_conn` and the buffer pointer and length struct that  contains information about the socket fd
  Middle Layer
  - `dpsenddgram` and `dprecvdgram`
   - Handles construction and parsing of PDUs, handles errors and sequence number management
  Bottom Layer
  - `dpsendraw` and `dprecvraw`
   - Handles raw data, sending and receiving, using os calls
   - Handles errors, related to buffer sent and received only
  Design Improvement
  - I think the middle layer handles a lot of work, considering the distribution of work load in term of layer
  - I would move sequence management and error handling regarding the correct PDUs construction to top layer
    - Allowing me to move the dependency of middle layer on bottom layer to top layer
    - It will also assert single responsibility principal(SRP) and compartmentalize the work
    - It think I am little biased towards OOP way of thinking and also maintenance and detection functions
    - Such level of abstraction creates a illusion of satisfaction, but creates problem in long run
  - So now I will call `dpsenddgram / dprecvdgram` from `dpsend / dprecv`
    - check for error from the received PDU
    - send/receive and manage sequence
][
  Sequence number are used in UDP to keep track all the acknowledged PDU received. It helps in ensuring the the data is processed in the correct order and rejected if duplicate packet is received. We update the sequence at ack to track the flow of correctly received and processed packet.
][
  Drawback of Ack:
    - In TCP, multiple packets can in transit due to the sliding window protocol, allowing higher throughput and efficient network usage.
    - On the other hand, udp ack based acknowledgement, can cause packet,rejection resulting in delays and inefficient usage of network . 
][
  #table(
      columns: (auto,auto),
      inset: 8pt,
      gutter: 7,
      table.header(table.cell(align: center, colspan: 2, [TCP vs UDP] )),
      table.cell(align: center,[TCP]),table.cell(align: center,[UDP]),
      [
        - Connection Oriented
          - There was always a need to keep the connection alive or disconnect it before exiting
        - Sending / Receiving
          - do not need to specify the source or destination address
          - socket needs to have established connection
        - State is managed by TCP
      ],[
        - Connection less
          - No established connection
          - simply creating a socket is enough to start sending and receiving data form the server
        - Sending / Receiving
          - Need to specify source and destination addresses every time we make a os level system call
        - Each packet can be handled independently
        - No state management by UDP
      ]
    )
]