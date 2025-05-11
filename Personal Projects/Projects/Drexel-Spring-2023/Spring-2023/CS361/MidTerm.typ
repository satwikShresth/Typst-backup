#import "/template.typ": project
#show: project.with(
  title: "CS 361 - Midterm",
  author: "Satwik Shresth",
  date: "May 8, 2024",
)

#set enum(body-indent: 1em,indent: 1em)
= Overview
== Question 1: Logistics

#enum(numbering: "(a)")[
  How many reflections did you complete?
  - 5
][
  How many homework assignments did you complete?
  - 4
][
  Did you attend/watch all the lectures? If not, how many did you watch/attend?
  - All of them 12 in total
][
  Do you feel confident in your homework answers when you submit them?
  - Yeah, I felt really confident
]


== Question 2: Homework Review

#enum(numbering: "(a)")[
What homework did you learn the most doing? Why?
  - Homework 1 was something new for me and it really helped me understand how to think about multi-threaded situations
  - It helped me visualize what is possible, even though it looks very strange 
][
What homework was most frustrating? Why?
  - The most frustrating homework was Homework 2 for me, because it was easy but I messed up by not unlocking the locks in the Theory part of the assignment
  - I was in disbelieve that I missed that, but I guess that is the reason why lock-guard is such an important feature in C++
][
Looking back on the homework you have done so far, is there anything you would change or revise
if you could redo one?
  - I would definitely go back and unlock the locks in the theory part of Homework 2
]


== Question 3: Course Review

#enum(numbering: "(a)")[
  Why are you taking this class? What do you plan to gain from it?
  - I have completed 2 Co-op at firms where C++ is heavily used
  - Since concurrency is so difficult, my mentors have been reluctant to hand me any task related to it
  - I am very enticed by the concept of managing two different threads in one process and have attempted many multi-threaded, but never really able to take out time to master it
  - I want to explore the more difficult situations where it can be used and most importantly when to avoid it 
][
  Imagine you had to write an Amazon review of the textbook based on what you have read so far. Give the textbook a rating (out of 5 stars) and write a review.
  - I will give it 4 out of 5, since it really good at explaining concepts but I have felt there is a lot of noise
  - I sometimes ended up reading a lot about topics not really related to concurrency
  - I also feel there should be more picture representation in it, to help visualize the situation than raw C++ code
][
  What was the most interesting thing you have learned in class so far?
  - Semaphores, is definitely the most interesting thing I have learnt in the class
][
  What was the most confusing thing you have learned in class so far?
  - I would have said Semaphores a week ago, but I had enough time to digest the content and watch some YouTube video on it to understand it better
]

\
\
== Question 3: Threading Puzzle

- We will be using pseudocode to construct the simulation
- Basically we will be using the finite Consumer-Producer concept, but here there are multiple consumers and one producer
- We will have some global variables
  - we are using the semaphore from lecture

```cpp
std::mutex lock;
std::mutex pledge_lock;
Keg *keg;
std::condition_variable kegIsEmpty;
bool needRefill = false;
bool partyOver = true;
semaphore servingsAvailable{0};
```

- To stimulate the puzzle we will decide that all the partygoer are a thread and the pledge is also a thread, We initialize them and put them in a Party

```Cpp
int startTheParty(int N, int M) {
  partyOver = false;
  keg = new Keg(N);
  servingsAvailable.signal();

  std::thread pledgeThread(pledge, N);
  std::vector<std::thread> partyGoers;

  for (int i = 0; i < M; i++) {
    partyGoers.emplace_back(partyGoer);
  }
  std::this_tread::sleep(3hr);// pesudocode
  partyOver = True;
  for (auto &t : partyGoers) {
    t.join();
  }
  kegIsEmpty.notify_all();
  pledgeThread.join();
  delete keg;
  return 0;
}
```

- The partygoers are independent and can do whatever they want a but they will want to refill from keg when they need to so we will use conditional variable to 

```cpp
void partyGoer() {
  while(!partyOver) {
    bool needADrink = decide();
    if (needADrink) {
      servingsAvailable.wait();
      std::lock_guard<std::mutex> guard(lock);
      std::unique_lock<std::mutex> ulk(pledge_lock);
      if (keg->isEmpty()) {
        needRefill = true;
        kegIsEmpty.notify_all();
        kegIsEmpty.wait(ulk, [] { return !needRefill || partyOver; });
      }
      if (!partyOver){ keg->getDrink(); } // deny drink if party over
      servingsAvailable.signal();
    }
  }
}
```
\
- The pledge is not independent and we will consider that he is below 21 and he the designated producer, he cannot have fun at all at the party
- Hence the unlucky pledge
```cpp
void pledge() {
  while (!partyOver) {
    std::unique_lock<std::mutex> ulk(pledge_lock);
    kegIsEmpty.wait(ulk, [] { return needRefill || partyOver; });

    if (!partyOver) {
      ulk.unlock();

      keg->refill();
      needRefill = false;

      kegIsEmpty.notify_all();
    }
  }
}

```

- This is just the pseudocode, I have tested it, it works, with full code.

= Midterm Letter Grade

== Question 5
- I would like to give myself A+
- I feel I deserve this because I have
  - Completed all my assignments on time
  - Read all the assigned readings
  - Completed all the reflection on time except the first one
  - Watched/attended all the lectures
  - Been responsive in class
  - I genuinely enjoy learning new things and I put effort to learn more about concurrency outside of class
- I had a fair amount of knowledge about C++, but I haven't really worked very too much with it, so I lacked experience
  - I have feel that this class has helped me explore more areas of C++
- I plan to improve my silly mistakes that I tend to make on my theory part of assignments
  - I also really want to have the fastest execution time on the leaderboard before finals