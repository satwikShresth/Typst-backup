#import "/template.typ": project

#show: project.with(
  title: "CS 361 - Reflection 07",
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
  - I really liked the fast multi-threaded queue, which allows multiple operations on the queue at the same time.
  - I also found the multi threaded hashmap context very interesting
  \
][
  What was the most confusing thing you learned in lecture ?
  - Didn't find anything confusing
  \
][
  What was the most interesting thing you learned in the reading ?
  - I found the concept of cache ping-pong really interesting.
  \
][
  What was the most confusing thing you learned in the reading ?
  - False-sharing of data was a little confusing to understand, I do remember prof talking about cache and how it does a lot of work overwriting and maintain consistent data, but if the instance is different how will it affect the memory cache
  \
][
  How is the current homework assignment going ?
  - Its complete and shortly will submit it, it was quite easy and It was very similar to mid-term's puzzle
  \
][
 How did the last homework assignment go ?
 - Pretty good, have not received the feedback yet, but hoping for the best.
]