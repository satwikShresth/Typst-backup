#import "/template.typ": project
#import "@preview/mitex:0.2.4": *


#show: project.with(
  title: "CS 277 - Reading 8",
  author: "Satwik Shresth",
  date: "November 18, 2024",
)

#set enum(body-indent: 2em,indent: 1em)
#set box(radius:1pt,stroke: 1pt,inset: 5pt)
#set text(size: 10pt)


#enum(spacing: 2em)[

The pigeonhole principle states that if m+1 pigeons are placed into m pigeonholes, at least one pigeonhole must contain at least two pigeons. This principle was used to prove that language E has no deterministic finite automaton. In this proof, the pigeonholes represent the states of automaton 
A, and the pigeons are the states A reaches after processing sequences of zero to m zeros.

It's crucial to note that the pigeonhole principle applies only when m is finite. In cases involving infinite sets, like the infinite hotel paradox, the opposite can occur. There, an infinite hotel (infinite pigeonholes) can accommodate an infinite number of guests (pigeons), even if the number of guests exceeds the number of rooms, without assigning more than one guest per room.
][
  
  #enum(spacing: 2em,numbering: "a)")[
    $ ( a | b ) * a $
    
    $(1) "<A>" -> "a"\
     (2) "<B>" -> "b"\
     (3) "<C>" -> "<A> | <B>"\
     (4) "<D>" -> "<C> <D> |" epsilon\
     (5) "<E>" -> "<D> <A>"\
    $

  ][

    $ a * | b * | ( a b )* $

    $(1) "<A>" -> "a"\
     (2) "<B>" -> "b"\
     (3) "<C>" -> "<A> <C> |" epsilon\
     (4) "<D>" -> "<B> <D> |" epsilon\
     (5) "<E>" -> "<A> <B> <E> |" epsilon\
     (6) "<F>" -> "<C> | <D> | <E>"\
    $
    
  ][

   $ a * b * c * $ 
    $"<A>" -> "a"\
      "<B>" -> "b"\
      "<C>" -> "c"\
      "<D>" -> "<A> <D>" | epsilon\
      "<E>" -> "<B> <E>" | epsilon\
      "<F>" -> "<C> <F>" | epsilon\
      "<G>" -> "<D> <E>"\
      "<H>" -> "<G> <F>"\
    $
  ]
][
1. Regular Expressions Must Be Finite and infinite Expressions Are Not Valid

  - The expression $01 ∣ 0^2 1^2 ∣ 0^3 1^3 ∣ ... $suggests an infinite alternation of patterns.
  - Infinite constructs are not permissible in the formal definition of regular expressions.

2. The Language E Is Not Regular
  
  - E does not satisfy the pumping lemma for regular languages, indicating that it is non-regular.
  - In E, there is a strict requirement that the number of \*\*'0'\*\*s equals the number of \*\*'1'\*\*s

3. Misuse of the Union Operator
  
  - Regular languages are closed under finite union which does not extend to infinite unions.
  - This approach effectively tries to "list out" all strings in E, which is impossible within a finite regular expression.

  
][
  #enum(spacing: 2em,numbering: "a)")[
    - state 0 if it has even number of 1's
    - state 1 if it has odd number of 1's 
    #image("r8_auto_1.svg",width: 145%)
  ][
    - state 0 means previous input was not 1
    - state 1 means previous input was 1
      - the one before that was not a 1
    - state 2 means the previous input were 1's
    - state 3 means the three previous input were 1's
    #image("r8_auto_2.svg")
  ]
]