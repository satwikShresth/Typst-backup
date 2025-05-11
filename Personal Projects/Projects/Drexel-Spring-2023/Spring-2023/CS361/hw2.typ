#import "/template.typ": project

#show: project.with(
  title: "CS 361 - Homework 02",
  author: "Satwik Shresth",
  date: "April 16, 2024",
)

#set enum(body-indent: 1em,indent: 1em)

== Question 1 <question1>

#enum(numbering: "a.")[
  There can be 2 different outcome:
  #enum(numbering: "i.")[
    If *p1* executes first, it obtains the lock *lk* stopping process *Q* from obtaining the lock until it process *P* releases it, making the stdout "PQ"
  ][
    If *q1* executes first, it obtains the lock *lk* stopping process *P* from obtaining the lock until it process *Q* releases it, making the stdout "QP"
  ]
][
  There can be 2 different outcome:
  #enum(numbering: "i.")[
    If *q1* executes first, it obtains the lock *lk* stopping process *P* from obtaining the lock until process *Q* releases it, making the stdout "QP". Process *P* does not release the lock *lk,* but there is no change in the stdout
  ][
    If *p1* executes first, it obtains the lock *lk* stopping process *Q* from obtaining the lock until process *P* releases it, making the stdout "P" because process *P* never releases the lock. So, in this scenario we encounter a deadlock situation where process *Q* is waiting to obtain the lock *lk* at *q1* forever as process *P* didn't release it 
  ]
]

== Question 2 <question2>

#enum(numbering: "a.")[
  Minimum number is 0, becuase if *p1* obtains the lock *lk* first stopping Process "Q" from executing "q1" and obtaining the lock, *p2: B = True* executes and then releases the lock *lk*. Now *q1* executes and obtains the lock, and is trying to meet the while loop condition false as *B* is *True*  
][
  Maximum number is infinite, becuase if *q1* obtains the lock *lk* first stopping Process "P" from executing "p1" and obtaining the lock *lk*. Now process "Q"  executes *q2* infinitely as it meets the condition for the while loop forever and never moves on to *q3* to release the lock
]

== Question 3 <question3>

#enum(numbering: "a.")[
  *lk* = mutex lock 
  #table(
          columns: (auto, auto),
          inset: 8pt,
          gutter: 1,
          align: center,
          table.header(
            table.cell(colspan: 2)[*Algorithm Concurrent Counting*],
            table.cell(colspan: 2)[Setup: n=0, lock lk],
            [*Process P*], [*Process Q*]
          ),
          [p1: for i from 1 to 10 do],[q1: for j from 1 to 10 do], 
          [p2: lk.lock()],[q2: lk.lock()], 
          [p3: temp = n ],[q3: temp = n ], 
          [p4: n = temp + 1],[q4: n = temp + 1], 
        )
  \
][
  No, because computation is not being done concurrently as to maintain the correct state for var *n* and *temp* in order to determine n computes to 20, one of the process has to obtain a lock before setting  var *temp* making the other one wait for the lock. This stop both process to do computation parallely, instead make them do the computation sequentially.
]
\
\
\
\

== Question 4 <question4>

#let add(int) = return 2 * int + 1

#let p1 = [ Process P has the lock. ]
#let p2(int) = return [Add: #add(int)]
#let p3 = [ Process P gives lock up and signals. ]

#let q1 = [ Process Q has the lock. ]
#let q2(int) = return [Remove: #int]
#let q3 = [ Process Q gives lock up and signals. ]

// 0
\
- #p1 
- #p2(0) 
- #p3
- #q1 
- #q2(1) 
- #q3
- #p1 
- #p2(1) 
- #p3
- #q1 
- #q2(3) 
- #q3
- #p1 
- #p2(2) 
- #p3
- #q1 
- #q2(5) 
- #q3
- #p1 
- #p2(3) 
- #p3
- #q1 
- #q2(7) 
- #q3
- #p1 
- #p2(4) 
- #p3
- #q1 
- #q2(9) 
- #q3