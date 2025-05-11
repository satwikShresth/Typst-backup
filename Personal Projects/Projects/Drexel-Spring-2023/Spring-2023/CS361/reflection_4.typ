
#import "/template.typ": project

#show: project.with(
  title: "CS 361 - Reflection 04",
  author: "Satwik Shresth",
  date: "April 23, 2024",
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
  - I found conditional locks and lambda functions facinating, I have been using lambda functions in production code and in general for a while, absolutly love it, but seeing that c++ has so many pockets designed just for its use is awsome.
  \
][
  What was the most confusing thing you learned in lecture ?
  - I think I don't understand by the term "I wish threads meet at a certain point", but by the sound of it I think I will find more about it near the final assignment.
  \
][
  What was the most interesting thing you learned in the reading ?
  - That somethimes we can have threads that we have already used, so there is a thread guard just like lock guard. I also think I understand that guards are very simple classes that locks with constructor and unlocks with destructor.
  \
][
  What was the most confusing thing you learned in the reading ?
  - I think I have difficulty understanding the ownership of threads, ownership has always been a difficult concept for me in general. So threads can be copied and it will spawn a new prcoess of the function ? 
  \
][
  How is the current homework assignment going ?
  - Its complete and submitted, loved working on it.
  - I basically desinged a lazy thread safe stack to push out all the coordinates for block.
  - Then use thread to keep poping the blocks and use it to fill up the array.
  - I used blocksize 128x128 pixel which I decided after series of experiments.
  - I even have benchmarks saved in excel.
  - I have set up gitlab for the class so, now its very smooth whenever I make any changes on tux or local machine
  - Also its very easy to download as zip from gitlab
  \
][
 How did the last homework assignment go ?
 - Pretty good, have not recieved the feedback yet, but hoping for the best.
]
