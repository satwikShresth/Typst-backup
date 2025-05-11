
#import "/template.typ": project

#show: project.with(
  title: "CS 361 - Reflection 9",
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
  - Hadoop that its language agnostic, my uncle is data engineer and he talks about it a lot, seems like it is implemented in C and wrapped around for all other languages. Really interesting
  \
][
  What was the most confusing thing you learned in lecture ?
  - Nothing was confusing
  \
][
  What was the most interesting thing you learned in the reading ?
  - Reducing locks using multiple locks and fine-grain control over the data structure
  - I think its a segway for the lock-less queues
  \
][
  What was the most confusing thing you learned in the reading ?
  - I dont know what atomic means, and what it does
  \
][
  How is the current homework assignment going ?
  - Its completed and submitted
    - debugging is a big issue, because I needed consistent results to match it against
    - ripgrep was handy to do so, but I think there is a need for validator, since when the code base was large and I was trying to do a excess buffer line reading, it gave me inconsistent results
    - I did some optimization
      - I love searching algorithms and things built on it, mostly because when I was frustrated by very slow file and text searching I found FZF and RipGrep, and it changed everything for me
      - Read the blog by the author of ripgrep Andrew #link("https://blog.burntsushi.net/ripgrep/")[https://blog.burntsushi.net/ripgrep/] again and figured out
        - Work stealing queues is the way to go
        - Boyers-Moore algorithm is what cool people are using for matching and rest are very heavy optimization done by hundreds of member of the ripgrep community
      - I worked with Cpp, files and buffers for my coop and I have some work specifc knowledge about optimizing file seaching
        - Mmap is the way to go, but I am sure I cannot make a perfect algorithm for mmap, also it is not fail proof, so added a fallback algorithm
        - working with raw pointers, didn't using string, it copies a bunch of stuff
        - using string_view instead of raw pointers
  \
][
 How did the last homework assignment go ?
 - Pretty good, have not received the feedback yet, but hoping for the best.
]