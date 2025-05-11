#import "/template.typ": project

#show: project.with(
  title: "CS 361 - Homework 01",
  author: "Satwik Shresth",
  date: "April 10, 2024",
)

== Question 1 <question1>
There are 2 scenarios

#table(
  columns: (auto, auto),
  inset: 5pt,
  gutter: 1,
  align: center,
  [Scenario], [stdout],
  [1],
  [ax],
  [2],
  [xa],
)

== Question 2 <question2>

There are 6 scenarios

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: auto,
  table(
    columns: (auto, auto),
    inset: 5pt,
    gutter: 1,
    align: center,
    [Scenario], [stdout],
    [1], [axby],
    [2], [axyb],
    [3], [abxy],
  ),
  table(
    columns: (auto, auto),
    inset: 5pt,
    gutter: 1,
    align: center,
    [Scenario], [stdout],
    [4], [xaby],
    [5], [xayb],
    [6], [xyab],
  )
)

== Question 3 <question3>
There are 10 scenarios

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: auto,
  table(
    columns: (auto, auto),
    inset: 6pt,
    gutter: 1,
    align: center,
    [Scenario], [stdout],
    [1], [abcxy],
    [2], [abxcy],
    [3], [abxyc],
    [4], [axbcy],
    [5], [axbyc],
    [6], [axybc],
  ),
  table(
    columns: (auto, auto),
    inset: 6pt,
    gutter: 1,
    align: center,
    [Scenario], [stdout],
    [7], [xyabc],
    [8], [xaybc],
    [9], [xabyc],
    [10], [xabcy],
  )
)

== Question 4 <question4>
\
#{
  let processOne(process,var) = return process +"1: for "+var+" from 1 to 10 do"
  let processTwo(process) = return process +"2: temp=n"
  let processThree(process) = return process +"3: n=temp+1"
  
  let p1 = processOne("p","i")
  let p2 = processTwo("p")
  let p3 = processThree("p")

  let q1 = processOne("q","i")
  let q2 = processTwo("q")
  let q3 = processThree("q")
  
  enum(
    body-indent: 1em,
    indent: 1em,
    numbering:"(a)",
    [ u = uninitialized\
      #table(
        columns: (auto, auto,auto,auto,auto,auto,auto),
        inset: 8pt,
        gutter: 1,
        align: center,
        table.header([*Process P*], [*Process Q*],[*n*],[*i*],[*j*],[*p::temp*],[*q::temp*]),
        [*#p1*],[#q1], [0],[u],[u],[u],[u],
        [#p2],[*#q1*], [0],[1],[u],[u],[u],
        [*#p2*],[#q2], [0],[1],[1],[u],[u],
        [#p2],[*#q2*], [0],[1],[1],[0],[u],
        [*#p3*],[#q3], [0],[1],[1],[0],[0],
        [#p3],[*#q3*], [1],[1],[1],[0],[0],
        table.cell(colspan: 7,[last 7 lines repats 8 times]),
        [*#p1*],[#q1], [9],[9],[9],[8],[8],
        [#p2],[*#q1*], [9],[9],[9],[8],[8],
        [*#p2*],[#q2], [9],[10],[9],[8],[8],
        [#p2],[*#q2*], [9],[10],[10],[9],[8],
        [*#p3*],[#q3], [9],[10],[10],[9],[9],
        [exited],[*#q3*], [10],[10],[10],[9],[9],
        [exited],[exited], [10],[10],[10],[9],[9],
      )
      \
    ],
    [ u = uninitialized
      #table(
        columns: (auto, auto,auto,auto,auto,auto,auto),
        inset: 8pt,
        gutter: 1,
        align: center,
        table.header([*Process P*], [*Process Q*],[*n*],[*i*],[*j*],[*p::temp*],[*q::temp*]),
        [*#p1*],[#q1], [0],[u],[u],[u],[u],
        [#p2],[*#q1*], [0],[1],[u],[u],[u],
        [*#p2*],[#q2], [0],[1],[1],[u],[u],
        [#p2],[*#q2*], [0],[1],[1],[0],[u],
        [*#p3*],[#q3], [0],[1],[1],[0],[0],
        [*#p1*],[#q1], [1],[1],[1],[0],[0],
        [*#p2*],[#q2], [1],[2],[1],[0],[0],
        [*#p3*],[#q3], [1],[2],[1],[1],[0],
        table.cell(colspan: 7,[last 4 lines repeat 7 times]),
        [#p3],[*#q3*], [9],[9],[1],[8],[0],
        [*#p1*],[#q1], [1],[9],[1],[8],[0],
        [*#p2*],[#q2], [1],[10],[2],[8],[0],
        [#p1],[*#q1*], [1],[10],[2],[1],[0],
        [#p2],[*#q2*], [1],[10],[2],[1],[0],
        [#p3],[*#q3*], [1],[10],[2],[1],[1],
        table.cell(colspan: 7,[last 4 lines repeat 8 times]),
        [*#p3*],[exited], [10],[10],[10],[1],[9],
        [exited],[exited], [2],[10],[10],[1],[9],
      )
      \
    ],
    [
      The largest number possible for variable n is 20, because both processes *P* and *Q* can incremeant n by 10 times because the loop will run 10 times *(1 to 10)*. So if for both processes complete all their atomic statments for one loop without context switch or complete all atomic statments for one processes before moving to another then we will get the highest number possible.
    ]
  )
}
== Question 5 <question5>
\
#enum(
  body-indent: 1em,
  indent: 1em,
  numbering:"(a)",
  [
    #table(
      columns: (auto, auto),
      inset: 5pt,     
      gutter: 1,
      align: center,
      [Scenario], [n],
      [1],[-1],
      [2],[0],
      [3],[1],
    )
  ],
  [
    #table(
      columns: (auto, auto),
      inset: 5pt,
      gutter: 1,
      align: center,
      
      [Scenario], [n],
      [1],[-2],
      [2],[-1],
      [3],[0],
      [4],[1],
      [5],[2],
    )
  ],
  [ The largest value of n possible is K. ],
  [ The smallest value of n possible is -K.],
  [ Yes, every value between -K to K is a possible. The 2nd atomic statment for both processes where it stores the value make it possible for it to resume incrementing or decrementing the number from any point of the process.]
)
== Question 6 <question6>
\
#enum(
  body-indent: 1em,
  indent: 1em,
  numbering:"(a)",
  [
    #let p4 = [p4: found = (f(i)==0)]
    Process P has found f(i) = 0 for i = 2, so variable found = true after p4, 
    #table(
      columns: (auto,auto,auto,auto,auto),
      inset: 6pt,
      gutter: 1,
      align: center,
      table.header(
        table.cell( colspan: 5, [Algorithm Zero A] ),
        [*Process P*],[*Process Q*],[*i*],[*j*],[*found*]
      ),
      [*#p4*],[q1: found = false],[2],[1],[false],
      [exited],[*q1: found = false*],[2],[1],[true],
      [exited],[*q2: while not found*],[2],[1],[false],
      [exited],[*q3: j=j-1*],[2],[0],[false],
      [exited],[*q4: found = (f(j)==0)*],[2],[0],[false],
      table.cell( colspan: 5, [last 4 lines will repeat infinity] ),
    )
    Process P was able to find the integer for which function f is 0 and exited, but due to q1 Process Q lost the information stored in found and got stuck in a live lock.
  ],
  [
    #let p1 = [p1: while not found]
    #let p2 = [p2: i=i+1]
    #let p3 = [p3: found = (f(i)==0)]
    #let q1 = [q1: while not found]
    #let q2 = [q2: j=j-1]
    #let q3 = [q3: found = (f(j)==0)]
    let f(i) = 0 , when i is 2
    #table(
      columns: (auto,auto,auto,auto,auto),
      inset: 6pt,
      gutter: 1,
      align: center,
      table.header(
        table.cell( colspan: 5, [Algorithm Zero B] ),
        [*Process P*],[*Process Q*],[*i*],[*j*],[*found*]
      ),
      [*#p1*],[#q1],[0],[1],[false],
      [*#p2*],[#q2],[0],[1],[false],
      [*#p3*],[#q3],[1],[1],[false],
      [#p1],[*#q1*],[0],[1],[false],
      [#p2],[*#q2*],[0],[1],[false],
      [#p3],[*#q3*],[1],[0],[false],
      [*#p1*],[#q1],[1],[0],[false],
      [#p1],[*#q1*],[1],[0],[false],
      [*#p2*],[#q2],[1],[0],[false],
      [*#p3*],[#q3],[2],[0],[false],
      [#p2],[*#q2*],[2],[0],[true],
      [#p3],[*#q3*],[2],[-1],[true],
      [*#p1*],[#q1],[2],[-1],[false],
      [#p1],[*#q1*],[2],[-1],[false],
      table.cell( colspan: 5, [This loop will now continue till infinity] ),
    )
    Process P is able to find the integer for which function f is 0 allowing process P to exit, but since there was a context switch and Process Q was allowed to execute q2 and q3, changing found back to false, resulting both processes to get stuck in a live lock.
    \
    \
  ],
  [
    #let p1 = [p1: while not found]
    #let p2 = [p2: await turn==1 \ then turn==2]
    #let p3 = [p3: i=i+1]
    #let p4 = [p4: if f(i)==0]
    #let p5 = [p5: found = true]

    
    #let q1 = [q1: while not found]
    #let q2 = [q2: await turn==2 \ then turn==1]
    #let q3 = [q3: j=j-1]
    #let q4 = [q4: if f(j)==0]
    #let q5 = [q5: found = true]
    let f(2) = 0, and now lets consider i = 1 and j = 0 with turn = 1, when i becomes 2, the program will need to stop
    #table(
      columns: (auto,auto,auto,auto,auto,auto),
      inset: 8pt,
      gutter: 1,
      align: center,
      table.header(
        table.cell( colspan: 6, [Algorithm Zero C] ),
        [*Process P*],[*Process Q*],[*i*],[*j*],[*found*],[*turn*]
      ),
      [*#p1*],[#q1],[1],[0],[false],[1],
      [#p1],[*#q1*],[1],[0],[false],[1],
      [*#p2*],[#q2],[1],[0],[false],[1],
      [#p2],[*#q2*],[1],[0],[false],[2],
      [*#p3*],[#q3],[1],[0],[false],[1],
      [#p3],[*#q3*],[2],[0],[false],[1],
      [*#p4*],[#q4],[2],[-1],[false],[1],
      [#p4],[*#q4*],[2],[-1],[false],[1],
      [#p1],[*#q1*],[2],[-1],[false],[1],
      [*#p5*],[#q5],[2],[-1],[false],[1],
      [*#p1*],[#q1],[2],[-1],[true],[1],
      [exited],[*#q2*],[2],[-1],[true],[1],
      table.cell(colspan: 6,[Process Q will wait at q2 till infinity])
    )
    Process Q gets stuck forever waiting for variable turn to become 2 because process P has already exited ( only process Q cant change turn to 2 at p2 ).
  ]
)
