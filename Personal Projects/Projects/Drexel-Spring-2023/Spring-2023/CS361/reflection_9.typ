
#import "/template.typ": project

#show: project.with(
  title: "CS 361 - Reflection 10",
  author: "Satwik Shresth",
  date: "June 6, 2024",
)

\
/*
What was the most interesting thing you learned in lecture?
What was the most confusing thing you learned in lecture?
What was the most interesting thing you learned in the reading?
What was the most confusing thing you learned in the reading?
How is the current homework assignment going?
How did the last homework assignment go? (don't answer if there wasn't an HW in the previous week)
*/

#enum(body-indent: 1em,indent: 1em)[
  What was the most interesting thing you learned in lecture ?
  - Lock-free queues, really interesting, also it seems like a great way to steal time in a time critical system
  \
][
  What was the most confusing thing you learned in lecture ?
  - Nothing was confusing
  \
][
  What was the most interesting thing you learned in the reading ?
  - We can make algorithms parallel from C++ std::library without writing any extra code
  - C++ never fails to surprise me
  \
][
  What was the most confusing thing you learned in the reading ?
  - Nothing was confusing
  \
][
  How is the current homework assignment going ?
  - Its completed and submitted
    - debugging is still a big issue
    - I created a factory like situation where there are a permutation functions running for each thread and combination are are created checked for rule 5 and then transferred to the permutation factories
  \
][
 How did the last homework assignment go ?
 - Pretty good, have not received the feedback yet, but hoping for the best.
]