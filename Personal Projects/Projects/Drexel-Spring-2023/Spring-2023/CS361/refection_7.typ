#import "/template.typ": project

#show: project.with(
  title: "CS 361 - Reflection 8",
  author: "Satwik Shresth",
  date: "May 2, 2024",
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
  - channel
    - I tried understanding channels when I was learning go, but there were so many buzz words around it
    - I found C++ concurrency much easier to understand, and now channels is much easier to wrap my head around
    - I thinks that is the whole reason we learn C after python
      - I gives a whole new level of understanding of the concepts behind a higher level language once you have "looked underneath the hood"
  \
][
  What was the most confusing thing you learned in lecture ?
  - Didn't find anything confusing, it was fairly simple, I also have tried building my own thread pool so maybe it aided in my understanding
  \
][
  What was the most interesting thing you learned in the reading ?
  - Tasks that wait on other task, very interesting to think if we can directly provide a data structure like a tree to a specialized threadpool, would be cool I think
  \
][
  What was the most confusing thing you learned in the reading ?
  - I think contention on work queue was a little difficult, but I understand the underlying concept, also I think I could have def implemented it for the trapped on the island problem and it would have worked out very well.
  \
][
  How is the current homework assignment going ?
  - Its completed and submitted
    - debuggin it was a great issue
    - Also I took the route of making it work like a threadpool but then realised there was some issue
      - I was facing seg fault 1 out of 40 times, which is bad
      - I redesigned the code, used a lot of cpp inheritance features, which was really fun
      - I tried to make the code abstract to make it feel like python, and it helped but I ended up with a lot of functions
  \
][
 How did the last homework assignment go ?
 - Pretty good, have not received the feedback yet, but hoping for the best.
]