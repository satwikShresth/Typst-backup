#import "/template.typ": project

#show: project.with(
  title: "CS 361 - Reflection 03",
  author: "Satwik Shresth",
  date: "April 17, 2024",
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
  What was the most interesting thing you learned in lecture?
  - I found Mandelbrot set fascinating, the blend of mathematics and colours creating such beautiful art. I really love the fact that programmers took up this theorm and ran wild with it creating hours long youtube videos.
  \
][
  What was the most confusing thing you learned in lecture?
  - I dont think I found anything confusing, maybe its because of my prior exposure to the language.
  \
][
  What was the most interesting thing you learned in the reading?
  - It has to be context switching by the os. If I am playing a video which is 60 frames per sec, the thread will have to do that while doing other tasks like updating the unix epoch time, so does that mean the processor is doing all of that withn nanosecs. I believe they can just use another thread for it now but what about the old computers, how did they generate the epoch time.
  \
][
  What was the most confusing thing you learned in the reading?
  - I think it was very simple to understand, I didn't find anything confusing.
  \
][
  How is the current homework assignment going?
  - Its complete just working on the documentaion of the code, wrote some testcases just to make sure its working well.
  - I noticed there were some issues building it on tux after I transfered it from my mac, fixing that.
  \
][
 How did the last homework assignment go?
 - Pretty good, have not recieved the feedback yet, but hoping for the best.
]
