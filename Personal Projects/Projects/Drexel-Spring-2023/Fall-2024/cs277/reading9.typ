#import "/template.typ": project
#import "@preview/mitex:0.2.4": *


#show: project.with(
  title: "CS 277 - Reading 9",
  author: "Satwik Shresth",
  date: "November 25, 2024",
)

#set enum(body-indent: 2em,indent: 1em)
#set box(radius:1pt,stroke: 1pt,inset: 5pt)
#set text(size: 10pt)


#v(11pt)
#enum(spacing: 2em)[
  #image("r9_q1.svg")
][
#enum(spacing: 2em, numbering: "a)")[
  $(a|b)\*$
][
  $(a|b|c)\*a b c(a|b|c)\*$
][
  $(a∣b)∗a((a∣b){1}∣(a∣b){3})$
][
  $(a∣b|c)\* (a b c | b a | b b a) (a|b|c)\*$
]
  
][
#enum(spacing: 2em, numbering: "a)")[
  #image("r9_q3_a.svg")
][
  #image("r9_q3_b.svg")
][
  #image("r9_q3_c.svg")
]
  

]