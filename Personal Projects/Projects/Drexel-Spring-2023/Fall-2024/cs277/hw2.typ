#import "/template.typ": project

#show: project.with(
  title: "CS 277 - Homework 2",
  author: "Satwik Shresth",
  date: "Dec 2, 2024",
)

#set enum(body-indent: 2em,indent: 1em)
#set box(radius:1pt,stroke: 1pt,inset: 5pt)
#set text(size: 10pt)


#enum(spacing: 2em)[
  Considering grammar: 
  #enum(numbering: "a)", spacing: 2em)[
    if e s;
    #enum(numbering:"(1)")[
      S
    ][
      U [ using step 2]
    ][
      'if' 'e' S [using step 5]
    ][
      'if' 'e' M [using step 1]
    ][
      'if' 'e' 's;' [using step 4]
    ]
  ][
    if e s; else s;
    #enum(numbering:"(1)")[
      S
    ][
      M [ using step 1]
    ][
      'if' 'e' M 'else' M [using step 3]
    ][
      'if' 'e' 's;' 'else' M [combining step 4 and step 3]
    ][
      'if' 'e' 's;' 'else' 's;' [combining step 4 again]
    ]
  ][
    if e if e s; else s;
    #enum(numbering:"(1)")[
      S
    ][
      U [ using step 2]
    ][
      'if' 'e' S [using step 5]
    ][
      'if' 'e' M [using step 1]
    ][
      'if' 'e' 'if' 'e' M 'else' M [using step 3]
    ][
      'if' 'e' 'if' 'e' 's;' 'else' M [using step 4]
    ][
      'if' 'e' 'if' 'e' 's;' 'else' 's;' [using step 4]
    ]
  ][
    if e if e s; else s; else s;
    #enum(numbering:"(1)")[
      S
    ][
      M [ using step 1]
    ][
      'if' 'e' M 'else' M [using step 3]
    ][
      'if' 'e' 'if' 'e' M 'else' M 'else' M [using step 3]
    ][
      'if' 'e' 'if' 'e' 's;' 'else' M 'else' M [using step 4]
    ][
      'if' 'e' 'if' 'e' 's;' 'else' 's;' 'else' M [using step 4]
    ][ 
      'if' 'e' 'if' 'e' 's;' 'else' 's;' 'else' 's;' [using step 4]
    ]
  ]
][
  Parse Tree
    #enum(numbering: "a)")[
    n-n+n
      ```
           E
         /     \
        T       R
       / \    /   \
      F   S  -     E
      |   |      /   \  
     'n'  ε     T     R    
               / \   / \  
              F   S +   E   
              |   |   /   \ 
             'n'  ε  T     R
                   /   \   |    
                  F     S  ε
                  |     |
                 'n'    ε
      ```
      \
      \
      \
      \
    ][
      n - (n+n)
      ```
                 E
               /   \
              T     R
             / \   /   \
            F   S -     R
            |   |     /   \
            n   ε    T     R
                   /   \   |
                  F     S  ε
                / | \   |
               (  E  )  ε
                /   \
               T     R
              / \   / \
             F   S +   R
             |   |    / \
             n   ε   T   R
                    / \  |
                   F   S ε
                   |   |
                   n   ε
 
      ```
    ][
      (n+n) / (n-n)
      ```
                  E
               /     \
              T       R
           /     \    |
          F       S   ε
        / | \    / \
       (  E  ) '/'  \
        /   \        \
       T     R         T
      / \    |       /   \  
     F   S   ε      F     S 
     |   |        / | \   |
     n   ε       (  E  )  ε
                  /   \
                 T     R
                / \   /  \
               F   S '-'  R
               |   |      / \
               n   ε     T   R
                        / \  |
                       F  S  ε
                       |  |
                       n  ε

      ```
    ]
    \
    \
    \
    \
    \
    \
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
  Proving T contains even number of 'a's
  
  Base Case:
    - Rule (5): $ T -> epsilon$
      - string is $epsilon$, which contains 0 'a's
      - 0 is an even number
  Inductive Hypothesis:
    - Assuming any string from T would contain even number of 'a's
  Inductive Step:
  #enum()[
     Rule(3): $T-> 'a' T 'a'$
     - Let t be any string from T
     - t contains an even number (IH)
     - string derived is 'a' t 'a'
     - Number of 'a's: 1 + number of 'a's in t + 1
      - 1 + even + 1
      - since 2 is even, even + 2 is even
    Therefore 'a' t 'a' contains even number of 'a's
  ][
    Rule(4): $T-> T 'a a'$
     - Let t be any string from T
     - t contains an even number (IH)
     - string derived is t 'aa'
     - Number of 'a's: number of 'a's in t + 2
      - even + 2
      - since 2 is even, even + 2 is even
    Therefore t 'aa' contains even number of 'a's
  ]
  Conclusion: By induction we have proved that T contains an even number of 'a's

  Proving S contains odd number of 'a's
  
  Base Case:
    - Rule (2): $ S -> 'a'$
      - string 'a' contains 1 'a'
      - 1 is odd
      - base case hols
  Inductive Hypothesis:
    - Assuming any string from S would contain odd number of 'a's
  Inductive Step:
  #enum()[
     Rule(1): $S-> S T$
     - Let s be any string from S
     - s contains an odd number (IH)
     - let t be a string from T
      - t is always even
     - combined it becomes s t 
     - Number of 'a's: 
      - (number of 'a's in s) + (number of 'a's in t)
      - odd + even 
      - since odd + even is odd
    Therefore, s t contains an odd number of 'a's
  ]
  Conclusion: By induction we have proved that S contains an odd number of 'a's
][
  #enum(numbering: "(1)")[
    $E -> E | C$
  ][
    $E -> C$
  ][
    $C -> C P$
  ][
    $C -> P$
  ][
    $P -> '(' E ')'$
  ][
    $P -> 'a'|'b'|...|'z'$
  ]
  
][
  #enum(numbering: "a)")[
    #figure(
      caption: [Regex NFA for $(a|b)c*$],
    )[
      #image("h2_q5_a.svg")
      #v(-8pt)
      #h(139pt)
    ]
  ][
    #figure(
      caption: [Regex NFA for $a|b c*$],
    )[
      #image("h2_q5_b.svg")
      #v(-8pt)
      #h(139pt)
    ]
  ][
    #figure(
      caption: [Regex NFA for $(a|b)*c$],
    )[
      #image("h2_q5_c.svg")
      #v(-8pt)
      #h(139pt)
    ]
  ]
][
  #enum(numbering: "(1)")[
    $S -> R space T$
  ][
    $R space -> 'a' space R$
  ][
    $space space space -> 'b' space R$
  ][
    $space space space -> epsilon$
  ][
    $T space -> U space V$
  ][
    $U space -> 'c'$
  ][
    $space space space -> epsilon$
  ][
    $V space -> 'd'$
  ]
  
  Sets:\
  S : { "a", "b", "c", "d" } \
  R : { "a", "b", "c", "d" } \
  T : { "c", "d" } \
  U : { "c", "d" } \ 
  V : { "d" } \

  #figure(
    caption: [Parse Table for Q6],
  )[
    #table(
      columns: (auto, auto, auto, auto, auto, auto),
      inset: 6pt,
      align: horizon,
      table.header(
        [Non-terminal],
        ['a'],
        ['b'],
        ['c'],
        ['d'],
        ['\$']
      ),
      [$S$],[(1)],[(1)],[(1)],[(1)],[],
      [$R$],[(2)],[(3)],[(4)],[(4)],[(4)],
      [$T$],[],[],[(5)],[(5)],[(5)],
      [$U$],[],[],[(6)],[(6)],[(6)],
      [$V$],[],[],[],[(8)],[],
    )
    #v(-8pt)
    #h(139pt)
  ]
  \
  \
  \
  \
  \
][
  ```c
  def A():
    if CurTok() == '[':
        NextTok()
        if L():
            if CurTok() == ']':
                NextTok()
                return true
            else:
                return false
        else:
            return false
    elif B():
        if CurTok() == 'k':
            NextTok()
            if C():
                return true
            else:
                return false
        else:
            return false
    else:
        return false

  def B():
      if CurTok() == 'x':
          NextTok()
          if CurTok() == 'j':
              NextTok()
              return B()
          else:
              return false
      elif CurTok() == 'y':
          NextTok()
          return true
      else:
          return false
  
  def L():
      if CurTok() == 'n':
          NextTok()
          while CurTok() == ',':
              NextTok()
              if CurTok() == 'n':
                  NextTok()
              else:
                  return false
          return true
      else:
          return false
  
  def C():
      if CurTok() == 'm':
          NextTok()
          return true
      elif CurTok() == 'n':
          NextTok()
          return true
      else:
          return false
  
  def Parse():
      NextTok()
      if A() and CurTok() == ENDM:
          return true
      else:
          return false
  ```
  
]