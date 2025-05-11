#import "/template.typ": project
#import "@preview/gviz:0.1.0": *
#show raw.where(lang: "dot-render"): it => render-image(it.text)

#show: project.with(
  title: "CS 383 - Homework 05",
  author: "Satwik Shresth",
  date: "May 14, 2024",
)
// (a) What is the sample entropy for the class label overall, H(Y ) from this training data (using
// log base 2) (3pts)?
// (b) What are the weighed average entropies for branching on variables x1 and x2 (6pts)?
// (c) Draw the decision tree that would be learned by the ID3 algorithm without pruning from
// this training data. If your arrive at a scenario where you have to put a leaf node, but the
// classes of the data don’t all agree, put the probabilities of each class on that leaf node.
// You may use software to draw this or draw it by hand. But either way the figure should
// be embedded in your PDF submission. (6pts)
== Question 1 <question1>
#enum()[
  Training examples for an unknown target function $(x_1,x_2)-> y:$
  $
    #table(
      columns: (auto, auto,auto,auto),
      inset: 6pt,
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
    Sample entropy for the class overall
    - Counts:
      - + : 12
      - - : 9
      - total : 21
    \
    - $p(+)= 12/21$
    - $p(-) = 9/21$
    \
    - Entropy of $H(Y)$ 
    $ 
      H(Y) = -(12/21 log_2(12/21) + 9/21 log_2(9/21))
      \
      = -(0.571 log_2(0.571) + 0.429 log_2(0.429))
      \
      = 0.984
    $
  ][
    Weighted average entropies for branching on variable $x_1 "and" x_2$
    \
    - Branching on $x_1$
      - $x_1 = T$
        - + : 7
        - - : 1
        - total : 8
        - $H(Y|x_1 = T) = -(7/8 log_2(7/8) + 1/8 log_2(1/8))=.544$
        
      - $x_1 = F$
        - + : 5
        - - : 8
        - total : 13
        - $H(Y|x_1 = F) = -(5/13 log_2(5/13) + 8/13 log_2(8/13)) = .961$
    Weighted average entropy for $x_1:$
    $ H(Y|x_1) = 8/21 H(Y|x_1 = T) + 13/21 H(Y|x_1 = F) = .803 $
    
    - Branching on $x_2$
      - $x_2 = T$
        - + : 7
        - - : 3
        - total : 10
        - $H(Y|x_2 = T) = -(7/10 log_2(7/10) + 3/10 log_2(3/10)) = .882$
        
      - $x_2 = F$
        - + : 5
        - - : 6
        - total : 11
        - $H(Y|x_2 = F) = -(5/11 log_2(5/11) + 8/11 log_2(8/11)) = .851$
    Weighted average entropy for $x_2:$
    $ H(Y|x_2) = 10/21 H(Y|x_2 = T) + 11/21 H(Y|x_2 = F) = 0.866 $
    \
  ][
    Gain(S,$x_1$) = 0.984 - .803 = .181
    \
    Gain(S,$x_2$) = 0.984 - .866 = .118
    \
    ```dot-render
    digraph software_update_protocol {
      rankdir=TB;
      ratio="fill";
      
      node [shape=circle, fontname="Helvetica", fontsize=11];
      
      x1 [label="x1"];
      x1_F [label="x2"];
      x1_T [label="x2"];
      x1_T_T [label="+"];
      x1_T_F [label="Y"];
      x1_T_F_p [label="87.5%"]
      x1_T_F_m [label="12.5%"]
      x1_F_T [label="Y"];
      x1_F_T_p [label="70%"];
      x1_F_T_m [label="30%"];
      x1_F_F [label="Y"];
      x1_F_F_p [label="45%"];
      x1_F_F_m [label="55%"];
      
      x1 -> x1_T [label="T"];
      x1 -> x1_F [label="F"];
      x1_T -> x1_T_T [label="T"];
      x1_T -> x1_T_F [label="F"];
      x1_T_F -> x1_T_F_p [label="+"];
      x1_T_F -> x1_T_F_m [label="-"];
      x1_F -> x1_F_T [label="T"];
      x1_F_T -> x1_F_T_p [label="+"];
      x1_F_T -> x1_F_T_m [label="-"];
      x1_F -> x1_F_F [label="F"];
      x1_F_F -> x1_F_F_p [label="+"];
      x1_F_F -> x1_F_F_m [label="-"];
    }
    ```
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
  - Validation Accuracy : 92%
  - #table(
      columns: (auto,auto,auto),
      inset: 6pt,
      gutter: 1,
      align: center,
      table.header( table.cell( colspan: 3, [Confusion Matrix])),
      [531],[14],[11],
      [2],[82],[7],
      [7],[13],[42],
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
  - Validation Accuracy : 67%
  
  - #table(
      columns: (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,auto),
      inset: 6pt,
      gutter: 1,
      align: center,
      table.header( table.cell( colspan: 14, [Confusion Matrix])),
      [2 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[1 ],[0 ],[0 ],[0 ],[0],
      [0 ],[2 ],[0 ],[0 ],[1 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0],
      [0 ],[0 ],[3 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0],
      [0 ],[0 ],[0 ],[1 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[1 ],[1 ],[0],
      [0 ],[0 ],[0 ],[0 ],[2 ],[1 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0],
      [0 ],[0 ],[1 ],[0 ],[0 ],[1 ],[1 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0],
      [0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[3 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0],
      [0 ],[0 ],[0 ],[1 ],[0 ],[0 ],[0 ],[1 ],[0 ],[0 ],[0 ],[0 ],[1 ],[0],
      [0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[3 ],[0 ],[0 ],[0 ],[0 ],[0],
      [0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[1 ],[2 ],[0 ],[0 ],[0 ],[0],
      [0 ],[0 ],[0 ],[0 ],[0 ],[1 ],[0 ],[0 ],[0 ],[0 ],[2 ],[0 ],[0 ],[0],
      [0 ],[0 ],[0 ],[1 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[2 ],[0 ],[0],
      [0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[3 ],[0],
      [0 ],[2 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[0 ],[1],
    )
]