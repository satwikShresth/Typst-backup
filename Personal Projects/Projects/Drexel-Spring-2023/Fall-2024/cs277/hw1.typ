#import "/template.typ": project
#import "@preview/syntree:0.2.0": tree
#import "@preview/gviz:0.1.0": *

#show raw.where(lang: "dot-render"): it => render-image(it.text)

#show: project.with(
  title: "CS 277 - Homework 1",
  author: "Satwik Shresth",
  date: "October 27, 2024",
)

#set enum(body-indent: 2em,indent: 1em)
#set box(radius:1pt,stroke: 1pt,inset: 5pt)
#set text(size: 12pt)

#enum(spacing: 2em)[
  CLRS Proves
  #enum(numbering: "a)",spacing: 2em)[
    $"Proof that" 17n^3 + 4n^2 cos n + 7n + 12 in O(n^3)$
    
    $"______________________________________________________________"$
    
    for all $n >=n_0$
    
    $0<=17n^3+4n^2 cos n + 7n + 12 <= c dot n^3$
    
    Since $-1 <= cos n <= 1$
    
    we have $-4n^2 <= 4n^2 cos n < 4n^2$

    for $n>=1,$
    
    $ 17n^3 + 4n^2+7n+12 <= 17n^3 + 4n^3 + 7n^3 + 12n^3 = 40n^2$

    So now we have $c=40 "and" n_0=1,$
    
    We have $17n^3+4n^2 cos n +7n + 12 <= 40n^3$

    Therefore, $17n^3+4n^2 cos n+7n+12 in O(n^3)$
  ][
    $"Proof that" 42n^2+18n-121 in Theta(n^2)$
    
    $"__________________________________________________"$

    $c_0 n^2 <= f(n) <= c_1n^2 "for all" n>=n_0$
    
    $"__________________________________________________"$

    Upper Bound $(O(g(n)))$
    
    For $n >= 1$
    
    $f(n) = 42n^2+18n-121 $
    
    $f(n) <=42n^2+18n^2 $

    So, $f(n) >= c_1n^2 "with" c_1 = 60$
    
    $"__________________________________________________"$
    
    Lower Bound $Omega(g(n))$
    
    For $n >= n_0$
    
    $
      f(n) = 42n^2+18n-121 \
      
      n^2(42+ 18/n - 121/n^2)
    $
    \

    For Large $n, 18/n "and" 121/n^2 "become very small"$

    $ 42 + 18/n + 121/n^2 approx 42 $

    For $n>= 11, 121/n^2 <= 1 ("since" n^2 >= 121)$

    $ 42 + 18/n - 121/n^2 >= 42 + 18/n - 1 >= 41 $

    Therefore

    $ f(n) = n^2 ( 42 + 18/n + 121/n^2) >= 41 n^2 $

    So, $ c_0 = 41 "and" c_1 = 60 $
  ][
    $"Proof that" 27n^2 sqrt(n)  + 12n^2 + 3n + 7 in Theta(n^2)$

    $
      g(n) = n^2 \
      f(n) = 27n^2sqrt(n)+12n^2+3n+7 \
      27n^2 dot n^(1/2) + 12n^2 + 3n + 7 \
      27n^(5/2) + 12n^2 + 3n +7
    $

    To establish $f(n) in Theta(g(n))$ we need to prove
    $ c_0 g(n) <= f(n) <= c_1 g(n) "for" n>=n_0 $
    
    $"__________________________________________________"$
    
    Upper bound $(O(g(n)))$

    $ 
      f(n) = n^2( 27n^(1/2) + 12 + 3/n + 7/n^2 )\

      f(n)/g(n) =  27n^(1/2) + 12 + 3/n + 7/n^2 \
    $

    As $n -> infinity$
    - $27 n^(1/2) -> infinity$
    - $3/n -> 0$ 
    - $7/(n^2) -> 0$
    
    Therefore:

    $ lim_(n->infinity) f(n)/g(n) = infinity $

    Since the limit is reaching infinity, there are no $c_1$ present that satisfy
    $ f(n) <= c_1 dot n^2 $
    
    we can say that
    $ f(n) in.not O(n^2) $

    Therefore we can comfortably say that \
    $ 27n^2 sqrt(n)  + 12n^2 + 3n + 7 in.not Theta(n^2) $
  ]
][
  #enum(numbering: "a)",spacing: 3em)[
    $"Prove" 3n^2 + 5 in.not Theta(n^3)$

    $
      lim_(n->infinity) (3n^2 + 5)/(n^3)\
      = 3/n + 5/n^3
    $
    As $n -> infinity $
    - $3/n -> 0$
    - $5/n^3 -> 0$

    Therefore:
    $
      lim_(n->infinity) = 3/n + 5/n^3 = 0
    $
    Therefore we can conclude that $3n^2 + 5 in o(n^3)$

    And due to the same reason $3n^2 + 5 in.not Theta(n^3)$
  ][
    $"Prove" 5n^3 lg(n)+ 7n^2 + 57 in omega(n^3)$
    $
      lim_(n->infinity) (5n^3 lg(n)+ 7n^2 + 57)/(n^3)\
      = 5 lg(n) + 7/n + 57/n^3
    $
    
    As $n -> infinity $
    - $lg(n) -> infinity$
    - $7/n -> 0$
    - $57/n^3 -> 0$
    Therefore:
    $
      lim_(n->infinity)
      = 5 lg(n) + 7/n + 57/n^3
      = infinity
    $
    Therefore we can conclude that
    $5n^3 lg(n)+ 7n^2 + 57 in omega(n^3)$
  ]
][
  #enum(numbering: "a)",spacing: 3em)[
    Prove $ Sigma_(i=1)^(m) 1/(i(i+1)) = m/(m+1)$

    #box()[Base Case: $m = 1$]
    
    $ Sigma_(i=1)^(m) 1/(i(i+1)) =^? m/(m+1) $
    
    $ 1/(1 dot (1 + 1)) =^? 1/(1+1) $
    $ 1/2 = 1/2 $

    LHS $=$ RHS
    \
    \
    \
    \
    \
    #box()[ Inductive Hypothesis: $m = k$]
    
    $ 
      Sigma_(i=1)^(k) 1/(i(i+1)) = k/(k+1)\
      1/(1 dot (1+1)) + ... + 1/(k dot (k+1)) = k/(k+1)
    $
    
    #box()[ Inductive Step: $m = k+1$]
    
    $ 
      Sigma_(i=1)^(k) 1/(i(i+1)) =^? (k+1)/((k+1)+1)\

      1/(1 dot (1+1)) + ... + 1/(k dot (k+1)) + 1/((k+1) dot 
      
      ((k+1)+1)) =^?
      
      (k+1)/(k+2)\


       k/(k+1) + 1/((k+1) dot ((k+1)+1)) =^? (k+1)/(k+2)\
       k/(k+1) =^? (k+1)/(k+2) - 1/((k+1) dot (k+2))\
       k/(k+1) =^? ((k+1)^2 - 1)/((k+1) dot (k+2))\
       k/(k+1) =^? (((k+1) + 1) dot ((k+1) - 1) )/((k+1) dot (k+2))\
       k/(k+1) =^? ((k+2) dot k )/((k+1) dot (k+2))\
       k/(k+1) = k/(k+1)\
    $
    By Mathematical induction, we can conclude for all integer $m >= 1$:
    
    $ sum_(i=1)^(m) 1/(i(i+1)) = m/(m+1) $
  ][
    Prove $Sigma_(i=1)^(m) 4i-1= m(2m+1)$
    
    #box()[Base Case: $m = 1$]
    $ Sigma_(i=1)^(m) 4i-1= m(2m+1) $
    
    $ (4 dot 1)-1= 1((2 dot 1 )+1) $
    $ 3 = 3 $

    LHS $=$ RHS
    
    \
    \
    \
    
    #box()[ Inductive Hypothesis: $m = k$]

    $
      Sigma_(i=1)^(m) 4i-1= m(2m+1)\
      
      ( 4 dot 1 )-1 + ... + (4k- 1) =^? k( (2 dot k) + 1 )
    
    $


    #box()[ Inductive step : $m = k+1$]

    $
      Sigma_(i=1)^(k+1) 4i-1= (k+1)(2(k+1)+1)\
      
      ( 4 dot 1 )-1 + ... + (4k -1) + (4(k+1) - 1) 
      =^? 
      (k+1)(2k+2+1)
      \

      
      k( (2 dot k) - 1) + (4k+4 - 1) 
      =^? 
      (2k^2+3k) + (2k+3)
      \

      
      k( (2 dot k) - 1)
      =^? 
      (2k^2 + 5k + 3)
      - (4k - 3)
      \
      
      2k^2 - k
      =^? 
      (2k^2 + 5k + 3)
      -
      (4k+3)
      \

      
      2k^2 - k
      = 
      2k^2 - k
    $
    
    By Mathematical induction, we can conclude for all integer $m >= 1$:
    
    $ sum_(i=1)^(m) 4i-1= m(2m+1) $
    
  ]
][
    $
      "Prove"
      space overline(A_1 union A_2 union ... union A_n) 
      = 
      overline(A_1) sect overline(A_2) sect .... sect overline(A_n)
    $

    
    #box()[Base Case: $n = 2$]

    $ overline(A_1 union A_2) = overline(A_1) sect overline(A_2) $

    #box()[ Inductive Hypothesis: $n = k$,$k>=2$]

    $ 
    space overline(A_1 union A_2 union ... union A_k) 
    =^? 
    overline(A_1) sect overline(A_2) sect .... sect overline(A_k)
    $
    
    #box()[ Inductive step: $n = k+1$]

    $ 
    space overline(A_1 union A_2 union ... union A_k union A_(k+1)) 
    =^? 
    overline(A_1) sect overline(A_2) sect .... sect overline(A_(k+1))\
    
    overline((A_1 sect A_2 sect .... sect A_k) sect A_(k+1))\

    
     overline((A_1 sect A_2 sect .... sect A_k)) union overline(A_(k+1))\
     
     (overline(A_1) union overline(A_2) union .... union overline(A_k)) union overline(A_(k+1))
    $

    Hence Proved
    $
      space overline(A_1 union A_2 union ... union A_n) 
      = 
      overline(A_1) sect overline(A_2) sect .... sect overline(A_n)
    $
    \
    \
    \
    \
][
    1. function pow(x: integer, e: integer) : integer
    2.  $ gt.tri "returns" x^e, "given" "integers" x "and" e, e >= 0$
    3. $r ← 1$
    4. $b ← x$
    5. $y ← e$
    6. $"while" y > 0 "do"$
    7. $space space "if" y%2 = 1 "then"$
    8. $space space space space space space r ←r ×b$
    9. $space space y ←y ÷2$
    10. $space space b ←b ×b$
    $"            return" r$

    #enum(numbering: "a)", spacing: 3em)[
      #box()[Base Case: $e = 0$]
      
      - $r = 1$
      - $b = x$
      - $y = e$
  
      $ 
        1 * b^0 =^? 1 * x^0 
        1 * 1 = 1 * 1
        
      $
  
      LHS $=$ RHS
      
      #box()[ Inductive Hypothesis: $e = k$,$k>=0$]
      
      $ 
        r dot b^y = x^k  
      $
  
      
      #box()[ Inductive Step: $e = 2k+1, 2k$]\
      
      Case 1: $e$ is Odd
  
      let $e = 2k+1 "for some integer" k>=0$
      - Before the loop the invariant holds $r*b^y = x^e$
  
      $
        r_("new") * b_("new")^(y_("new")) = (r * b) * (b *b)^k \
        = r * b * b^(2k)\
        = r * b^(2k+1)
      $
      since $ y -> e $
      and $ e = 2k+1 $
  
      The invariant holds true after iteration
      \
      \
      \
      \
      \
      \
      \
      \
      
      Case 2: $e$ is even
      
      let $e = 2k "for some integer" k>=0$
      - Before the loop the invariant holds $r*b^y = x^e$
  
      $
        r_("new") * b_("new")^(y_("new")) = r * (b * b)^k \
        = r * b^(2k)\
        = r * b^(2k)
      $
      since $ y -> e $
      and $ e = 2k $
  
      The invariant holds true after iteration
    ][
     Conclude that the Function Returns $x^e$:
     
     - The loop ends when $y <= 0$ 
     - At termination, $y = 0$

     At line 6, the invariant holds true for:
     $ r * b^y = x^e $
     when e = 0
     
      - $r = 1$
      - $b = x$
      - $y = e = 0$

      The function will return 1

      $
        r * b^0 =^? x^0 \
        
        r = 1
      $
      So we can conclude the function returns x^e since we know that the invariant holds true for the all $e >= 0$
    ]
][
   Consider the set S:
    1. $a in S$
    2. $x in S => bb x bb in S$ 
  #enum(numbering: "a)",spacing: 2em)[
    #box()[Base Case:]
    - $a in S$
    - length of $a$ is 1, which is odd

    #box()[Inductive Step:]
    - Given: $x in S$ is a string of odd length
    - $ bb x bb in S$
      - length of $bb = 2$
      - length of $x = "odd"$
      - Total length: 2 + odd + 2 = (odd + 4)
      - Since adding an even number 4 to an odd number results in a odd number, the total length is odd
  ][
    show that string in $S$ are of the form $b^i a b^i in {0,2,4,6,8,...}$
    
    #box()[Base Case: $i=0$]
    - Initial Element:
      - $a in S$
      - This corresponds to $b^0 a b^0$ (since $b^0 =$ empty string)

    for $i = 0$:
      - $b^0 a b^0 = a$
      - $a in S$
      - $i = 0 in {0,2,4,6,...}$
      
    #box()[Inductive Hypothesis:]
    if $x in S$, then $bb x bb in S$

    we assume Assume that for some $ i in {0,2,4,6,...}, x in S "is of the form" b^i a b^i$
    
    #box()[Inductive Step:]
    - Apply Production Rule:
      - From x = $b^i a b^i in S$
        - $bb x bb = bb b^i a b^i bb$
        - $bb b^i = b^(i+2)$
      - Resulting string:
        - $b^(i+2) a b^(i+2)$

    Update i:
    - $i_("new") = i+2$
    - Since $i$ was in ${0,2,4,6,...}, i_("new") "is also in "{0,2,4,6,...}$
  ]
][
  $ <E> space : space <E> + <T> | <T>$
  
  $ <T> space : space <T> * <F> | <F>$
  
  $ <F> space : space ! <F> | <P>$
  
  $ <P> space : space ( <E> ) | "true" | "false" | <V>$
  
  $ <V> space : space A | B | C | ... | Z$ 
  
]