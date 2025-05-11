#import "/template.typ": project
#show: project.with(
  title: "CS 383 - Homework 01",
  author: "Satwik Shresth",
  date: "April 17, 2024",
)

#set enum(body-indent: 1em,indent: 1em)
== Question 1 <question1>

#let entropy(log_base,numerator,denominator) = return [$- #numerator/#denominator log_#log_base #numerator/#denominator $]


#enum()[
  Acknowledge teach of the following by typing your name after each of the following statements:
  #enum(numbering: "(a)")[
    While you can use online resources, you may not copy them. *(Satwik Shresth)*
  ][
    You cannot place any photos in your report unless explicitly asked for. That includes screenshots. *(Satwik Shresth)*
  ][
    You cannot place any code snippets in your report. *(Satwik Shresth)* 
  ][
    You cannot use any ML frameworks in your code, accept for some purposes explicitly mentioned .  *(Satwik Shresth)*
  ][
    While you may work in Jupyter notebook, or the like, you must, export your code as a python file for submission (and check that it works). *(Satwik Shresth)*
  ]
  \
][
  
  Entropy of a system can be calculated using:
  $ H(P(v_1)), ..., P(v_K))) = sum_(i=1)^k (-P(v_2)log_k P(v_i)) $
  
  - Total observations: 10
  - Matrix X is Observable data
  - Matrix Y is Associated label
  
  #enum(numbering: "(a)")[
    Assumtions: f1 can only have {0,1,2}
    
    - For 0: 
    
      - Number of observations: 3 
      - Class label: [1,1,1]
      #let e0 = 0
      $ E_0 =  #entropy(2,3,3) #entropy(2,0,3) \ \  = #e0  $
    
    - For 1: 
    
      - Number of observations: 5 
      - Class label: [1,1,0,0,0] 
      #let e1 = calc.round(((-2/5) * calc.log(base: 2, 2/5)) + ((-3/5) * calc.log(base:2,3/5)),digits: 3)
      $ E_1 = #entropy(2,2,5) #entropy(2,3,5) \ \ = #e1 $
      
    - For 2: 
    
      - Number of observations: 2 
      - Class label: [0,0] 
      #let e2 = 0
      $ E_2 = #entropy(2,0,2) #entropy(2,2,2) \ \ = #e2 $
    \

    Average weighted entropy for Feature 1:
    $ 
      EE_1 = 3/10 (#e0) + 5/10 (#e1) + 2/10 (#e2) \ \
      = 1/2 ( #e1) \ \
      = #{ e1/2 }
    $
  ][
    Assumtions: f2 can only have {0,1}
    - For 0: 
    
      - Number of observations: 5 
      - Class label: [1,1,0,0,0] 
      #let e0 = calc.round(((-2/5) * calc.log(base: 2, 2/5)) + ((-3/5) * calc.log(base:2,3/5)),digits: 3)
      $ E_0 = #entropy(2,2,5) #entropy(2,3,5) \ \= #e0 $
    
    - For 1: 
    
      - Number of observations: 5 
      - Class label: [1,1,1,0,0]
      #let e1 = e0
      $ E_1 = #entropy(2,3,5) #entropy(2,2,5) \ \ = #e1 $ 

    Average weighted entropy for Feature 2:
    $ 
      EE_2 = 5/10 (#e0) + 5/10 (#e1) \ \
      = #{
        let computed_e0 = e0 / 2
        [ #computed_e0 + #computed_e0 \ \ = #e0]
      } 
    $
    \
  ][
    Feature 2 is more discriminating and provides better class seperation as the entropy value is higher.
    
    #let matr(..columns) = math.mat(delim: "[",..array.zip(..columns))
    #let val = (
      (0,1), (0,0), (1,1),
      (0,0), (1,1), (1,0),
      (1,0), (1,1), (2,0), (2,1)
    )
  ][
    $
    "Principal components of X:"
      mat(
        delim: "[",
        -0.9806;
         0.1961;
      )
      mat(
        delim: "[",
         -0.1961;
        -0.9806;
      )
    $
  ][
    In terms of conventional 2D Cartesian Coordinate system:
    - The first first principal compoent axis :
      - x axis: 11.31 degrees
      - y axis: 78.69 degrees 
    - The second first principal compoent axis :
      - x axis: -78.69
      - y axis: 168.69
  ][
    $
      "New" X :
      mat(
        delim: "[",
        7.845;
        9.806; 
        -1.961;
        9.806;
        -1.961;
        5.551;
        5.551;
        -1.961;
        -9.805;
        -1.176;
      )
    $
  ]
]
\
== Question 2 <question2>
#figure(
  image("./Figure_1.png"),
)