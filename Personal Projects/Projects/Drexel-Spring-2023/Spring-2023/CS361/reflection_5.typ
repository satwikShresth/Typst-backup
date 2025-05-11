
#import "/template.typ": project

#show: project.with(
  title: "CS 361 - Reflection 05",
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
  - I really liked the turnstile context, when I think about modern turnstile, I can picture it using the reader-writer concept where writers are the one its locked for and readers can walk right through from the other side.
  \
][
  What was the most confusing thing you learned in lecture ?
  - I still am having issue understanding why producers need ti get the lock, if consumer is consuming and producer is continuously producing at a different offset, I believe we just need to make sure offset is not available to the producer until it written
  \
][
  What was the most interesting thing you learned in the reading ?
  - I found condition variables interesting as it looks like a really efficient way to ask a thread to sleep and only wake up when condition is met making it really for increasing efficiency of the cpu cores
  \
][
  What was the most confusing thing you learned in the reading ?
  - I think the part that bothering me is how condition variable is able to achieve this, how is it putting it to sleep while look for the condition variable to change, it scheduled by the os?
  \
][
  How is the current homework assignment going ?
  - Its complete and shortly will submit it, it was quite easy and I only need to add 2 extra line of code to make it multi-threaded
  - It was pretty effortless and honestly I am happy that it is like that since I have 5 other assignment and 4 other midterms to complete
  \
][
 How did the last homework assignment go ?
 - Pretty good, have not received the feedback yet, but hoping for the best.
]
