#import "/template.typ": project
#import "@preview/gviz:0.1.0": *
#show raw.where(lang: "dot-render"): it => render-image(it.text)

#show: project.with(
  title: "CS 383 - Homework 06",
  author: "Satwik Shresth",
  date: "May 22, 2024",
)
== Question 1 <question1>
#enum()[
  Training examples for an unknown target function $(x_1,x_2)-> y:$
  $
    #table(
      columns: (auto, auto,auto,auto),
      inset: 7pt,
      gutter: 1,
      align: center,
      table.header($Y$,$x_1$,$x_2$,"count"),
      [+],[T],[T],[3],
      [+],[T],[F],[4],
      [+],[F],[T],[4],
      [+],[F],[F],[1],
      [-],[T],[T],[0],
      [-],[T],[F],[1],
      [-],[F],[T],[3],
      [-],[F],[F],[5]
    )
  $
  #enum(numbering: "(a)")[
    - Counts:
      - + : 12
      - - : 9
      - total : 21
    \
    $
      p(+)= 12/21 = 4/7 
      \
      p(-) = 9/21 = 3/7 
      \
      P(x=[T,T]) = (1/4) dot (4/7) + 0 dot (3/7) = 1/7
      \
      P(x=[T,T]| y = +) = 3/12 = 1/4
      \
      P(x=[T,T]| y = -) = 0/9 = 0
    $
    Posterior Probabilities:
    $
      P(y=+|x=[T,T]) = (1/4) dot (4/7)/((1/7)) = (1/7) dot (7) = 1
      \
      P(y=-|x=[T,T]) = 0
    $
    \
    \
    \
    \
    \
    \
    \
    \
    \
  ][
    Conditional probabilities:
    $
      P(x_1 = T | y = + ) = (3+4)/12 = 7/12
      \
      P(x_1 = T | y = - ) = (1+0)/9 = 1/9
      \
      P(x_2 = T | y = + ) = (3+4)/12 = 7/12
      \
      P(x_2 = T | y = - ) = (0+3)/9 = 1/3
      \
    $
    \
    Naive Bayes:
    \
    $
      P(y=+|x=[T,T]) #sym.prop 4/7 dot 7/12 dot 7/12 = 49/144
      \
      P(y=-|x=[T,T]) #sym.prop 3/7 dot 1/9 dot 1/3 = 1/63
      \
      49/144 >> 1/63
    $
    \
  ]
][
  #enum(numbering: "(a)")[
    Class Prior for the CTG.csv
    - Class 1  :   0.18
    - Class 2  :   0.27
    - Class 3  :   0.02
    - Class 4  :   0.04
    - Class 5  :   0.03
    - Class 6  :   0.16
    - Class 7  :   0.12
    - Class 8  :   0.05
    - Class 9  :   0.03
    - Class 10 :   0.09
  ][
    Class Prior for Yale Faces
    - Class [0,15] :  0.7143
  ]
]
== Question 2

#enum(numbering: "(a)")[
  Pre-processing done on the data
  - removing header and 2nd row
  - Binary encoding using median
  - Splitting
    - Dataset was then spilt in two parts
      - folds
        - a fold was decided for testing dataset
        - everything else become training dataset
][
  Metrics
  - Validation Accuracy : 86%
  - #table(
      columns: (auto,auto,auto),
      inset: 9pt,
      gutter: 10,
      align: center,
      table.header( table.cell( colspan: 3, [Confusion Matrix])),
      [489],[28],[39],
      [6],[74],[11],
      [1],[16],[45],
    )
]
== Question 3

#enum(numbering: "(a)")[
  Pre-processing done on the data
  - Everything that was mentioned in the assignment
    - encoding filename and using them as labels
    - Splitting
      - Dataset was then spilt in two parts
        - folds
          - a fold was decided for testing dataset
          - everything else become training dataset
        - both the folds had proportional number of each classes
][
  Metrics
  - Validation Accuracy : 79%
  
  - #table(
      columns: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto),
      inset: 9pt,
      gutter: 8,
      align: center,
      table.header( table.cell( colspan: 14, [Confusion Matrix])),
      [3],[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],
      [1],[1],[0],[0],[0],[0],[0],[1],[0],[0],[0],[0],[0],[0],
      [0],[0],[3],[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],
      [0],[0],[0],[3],[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],
      [1],[0],[0],[0],[2],[0],[0],[0],[0],[0],[0],[0],[0],[0],
      [0],[0],[0],[0],[0],[1],[0],[1],[0],[0],[1],[0],[0],[0],
      [0],[0],[0],[0],[0],[0],[2],[0],[0],[0],[0],[0],[0],[1],
      [0],[0],[0],[0],[0],[0],[0],[2],[0],[0],[1],[0],[0],[0],
      [0],[0],[0],[0],[0],[0],[0],[0],[3],[0],[0],[0],[0],[0],
      [0],[0],[0],[0],[0],[0],[0],[0],[0],[3],[0],[0],[0],[0],
      [0],[0],[0],[1],[0],[0],[0],[0],[0],[0],[2],[0],[0],[0],
      [0],[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],[3],[0],[0],
      [0],[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],[0],[3],[0],
      [0],[0],[0],[0],[0],[1],[0],[0],[0],[0],[0],[0],[0],[2],
    )
]