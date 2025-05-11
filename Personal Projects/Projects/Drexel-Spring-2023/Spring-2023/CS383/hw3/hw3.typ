#import "/template.typ": project
#show: project.with(
  title: "CS 383 - Homework 03",
  author: "Satwik Shresth",
  date: "April 29, 2024",
)

== Question 1 <question1>
\
#enum()[
  $ 
    J = (x_1w_1 - 5x_2w_2 -2)^2
    \
    w = [w_1,w_2]
  $
  \
  
  #let u1 = $ x_1w_1 - 5x_2w_2 -2 $;
  #enum(numbering: "(a)")[
    Finding partial gradient for $ (partial J)/(partial w_1) "," (partial J)/(partial w_2) $
    \
    - $ 
        "let" u "="  x_1w_1 - 5x_2w_2 -2 
      $
      \
    - $
        (partial J)/(partial u) = (partial u^2)/(partial u)
        \
        \
        = 2u
      $
      \
    - $
        (partial u)/(partial w_1) = partial/(partial w_1)(x_1w_1) - partial/(partial w_1)5x_2w_2 - partial/ (partial w_1)2
        \
        \
        = x_1 - 0 - 0
        \
        \
        = x_1
      $
    - Using Chain rule
    $
      (partial J)/(partial u) dot (partial u)/(partial w_1) =  x_1 dot 2 dot u
      \
      \
      (partial J)/(partial w_1)= 2x_1 (#u1)
    $
      \
    - $
        (partial u)/(partial w_2) = partial/(partial w_2)(x_1w_1) - partial/(partial w_2)5x_2w_2 - partial/ (partial w_1)2
        \
        \
        = 0 - 5x_2 - 0
        \
        \
        = -5x_2
      $
      \
    - Using Chain rule
    $
      (partial J)/(partial u) dot (partial u)/(partial w_2) =  x_2 dot -5 dot 2 dot u 
      \
      \
      (partial J)/(partial w_2)= -10x_2 (#u1)
    $
    \
  ][
    With values $ w = [0,0], x=[1,1] $
    - $
        (partial u)/(partial w_1) = 2x_1 (#u1)
        \
        \
        = 2 dot 1 dot ( 1 dot 0 - 5 dot 1 dot 0 - 2 )
        \
        \
        = -4
      $
    - $
        (partial u)/(partial w_2) = 10x_2 (#u1)
        \
        \
        = -10 dot 1 dot ( 1 dot 0 - 5 dot 1 dot 0 - 2 )
        \
        \
        = 20
      $
  ]
  \
][
  Class Prior for the spambase.data
  #let total = 4601
  #let zeros = 2788
  #let ones = total - zeros
  #let c0 = calc.round(zeros/total,digits:3)
  #let c1 = calc.round(ones/total,digits: 3)
  \
  Total Occurances = 4601
  \
  Occurances of 0 = #zeros 
  Occurances of 1 = #ones 
  \
  \
  - Class 0 : $  #zeros/#total = c0  $
  \
  - Class 1 : $ #ones/#total = c1 $
]
\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \  \ \ \ \ \ \ \ 
== Question 2 <question2>
\
- Training Accuracy: 92.66%
- Validation Accuracy: 92.76%
- Validation Precision: 0.90
- Validation Recall: 0.91
- Validation F-Measure Score: 0.90

\
\
Plot of epoch vs log-loss for the training and validation data sets:
#figure(
  image("/Spring-2023/CS383/hw3/Figure_1.png"),
)