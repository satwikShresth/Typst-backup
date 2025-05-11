#import "/template.typ": project
#import "@preview/syntree:0.2.0": tree,syntree
#import "@preview/gviz:0.1.0": *

#show raw.where(lang: "dot-render"): it => render-image(it.text)

#show: project.with(
  title: "CS 277 - Reading 6",
  author: "Satwik Shresth",
  date: "November 4, 2024",
)

#set enum(body-indent: 2em,indent: 1em)
#set box(radius:1pt,stroke: 1pt,inset: 5pt)
#set text(size: 12pt)

#enum(spacing: 2em)[
  #table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: horizon,
    table.header(
      [], [*$L<S>$*], [*$L<L>$*],
    ),
    [Round 4:],
    [
      w c w c w c s ;\
      w c w c { }\
      w c { s ; }\
      w c s ; w c s ;\
      w c s ; { }\
      { w c s ; }\
      { { } }\
      { s ; s ; }\
      { s ; w c s ; }\
      { s ; { } }\
    ],
    [
      w c w c s ;\
      w c w c { }\
      { s ; }\
      s ; w c w c s ;\
      s ; w c { s ; }\
      s ; { w c s ; }\
      s ; { s ; s ; }\
      s ; { s ; w c s ; }\
      s ; { s ; { } }\
      s ; s ; w c s ;\
      s ; s ; { }\
      s ; s ; { s ; }\
    ]
  ) 
][
  #enum(numbering: "a)",spacing: 5em)[
    w c w c s ;
    #{
      $
        tree(<S>,w,c,tree(<S>,w,c,tree(<S>,s,";"),
          )
        )
      $
    }
  ][
    { s ; }
    #{
      $
        tree(<S>,"{",
          tree(<L>,
            tree(<L>,
              tree(epsilon)
            ),
            tree(<S>,s,";"),
          ),"}")
      $
    }
    \
  ][
    { s ; w c s ; }
    #{
      $
        tree(<S>,"{",
          tree(<L>,
            tree(<L>,
              tree(epsilon)
            ),
            tree(<S>,s,";"),
          ),
          tree(<S>,w,c,
            tree(<S>,s,";")
          ),
          "}"
        )
      $
    }
  ]
][
  
  #enum(numbering: "a)",spacing: 5em)[
    (1+2)/3
    ```
                                    <E>
                                     |
                                    <T>
                                   / |  \
                                <T>  /  <F>
                                 |       |
                                <F>     <N>
                              /  |  \    |
                             (  <E>  )  <D>
                                 |       |
                                <E>      3
                              /  |  \
                            <E>  +  <T>
                             |       |
                            <T>     <F>
                             |       |
                            <F>     <N>
                             |       |
                            <N>     <D>
                             |       |
                            <D>      2
                             |
                             1
    ```
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
    1x2-3
```
          <E>
           |
        --------
       /    |   \
      <E>   -   <T>
       |         |
      <T>       <F>
     / | \       |
  <T>  *  <F>   <N>
   |       |     |
  <F>     <N>   <D>
   |       |     |
  <N>     <D>    3
   |       |
  <D>      2
   |
   1

```
  ][
    (1+2) x (3+4)
```
                                   <E>
                                    |
                                   <T>
                                    |
                               -----------
                              /     |     \
                             <T>    *     <F>
                              |            |
                             <F>          <F>
                              |            |
                            -----       -------
                           /  |  \     /   |   \
                          (  <E>  )   (   <E>   )
                            / | \        / | \
                          <E> + <T>    <E> + <T>
                           |     |      |     |
                          <T>   <F>    <T>   <F>
                           |     |      |     |
                          <F>   <N>    <F>   <N>
                           |     |      |     |
                          <N>   <D>    <N>   <D>
                           |     |      |     |
                          <D>    2     <D>    4
                           |            |
                           1            3
```
\
\
\
\

  ]
][
  1. <\E> → <\E> + <\T> | <\E> - <\T> | <\T>
  2. <\T> → <\T> $*$ <\F> | <\T> / <\F> | <\F>
  3. <\F> → <\P> | <\P> ^ <\F>
  4. <\P> → ( <\E> ) | <\N>
  5. <\N> → <\N> <\D> | <\D>
  6. <\D> → 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

 - By using right-recursion in the production for exponentiation:
    - The production <\F> → <\P> ^ <\F> places the recursive call to <\F> on the right side enforcing right-associativity.
][
  Induction on the length of the string ∣s∣.
  
  Base Case: 
  - Production 3: $⟨S⟩ → ϵ$
    - String s=ϵ
    - Number of x's in s: 0
    - 0 is even
  
  Induction Hypothesis:

 Assume that for any strings s′ ∈ L(<\S>), derived from <S>, the number of x's in $s'$ is even

Inductive Step:

- Production 1:
  - <\S> $-> x$ <\S> $x$
    - Let $s′ L( <S> )$ with an even number of x's (by induction hypothesis)
    - Dervie s:
      - $s = x s' x$
    - Number fo x's in $s$:
      - Number of x's in s = Numer of x's in $s' +2$
  Since number of x's in $s'$ is even, adding 2 will keep it even
  
  Therefore, s has an even number of x's 
  
- Using Production 2:
  - $ s= y y s′$
    - Let $s′ L( <S> )$ with an even number of x's (by induction hypothesis)
    - Dervie s:
      - $s = y y s'$
  - Number of x's:
    - Number of x's in $s =$ Number of x's in $s'$
  - Since $s'$ has an even number of x's, $s$ also has an even number of x's

By structural induction, we've shown that:

If any string $s' in L("<S>")$ has an even number of x's, then strings derived using productions 1 and 2 also have an even number of x's.
]
