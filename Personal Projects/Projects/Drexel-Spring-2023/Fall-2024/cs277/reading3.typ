#import "/template.typ": project
#show: project.with(
  title: "CS 277 - Reading 3",
  author: "Satwik Shresth",
  date: "October 20, 2024",
)

#set enum(body-indent: 1em,indent: 1em)
#set box(radius:1pt,stroke: 1pt,inset: 5pt)
#set text(size: 12pt)


#let baseCase(var,n) = return [#box()[Base Case: #var = #n]]
#let hypothesis(var,n1,n2) = return [#box()[ Inductive Hypothesis: $ #n1 <= #var < #n2$]]
 
#enum()[
    $ 
      log_2(x) := cases(
        0 "if" x = 0","1,
        max{i in ZZ | 2^i <= x} "if" x >= 1,
      ) 
    $

    Where $i$ is the greatest integer such that $2^i <= x$
  #enum(numbering: "a.")[
    #baseCase("i",0)
    $
      y =^? 2^0 \
      y = 1
    $
    $y$ is Initialized to 1 \
    
    #hypothesis("i",0,"k")
    
    show $i = k$
    $ 
      y * 2 * 2 ... n"times"  =^? 2^k \
      y * 2^(k-1)  =^? 2^k
    $

    here $y_0$ is $y * 2^(k-1)$

    Inductive Step: \
    show $i = k + 1$
    $ 
      y * 2^(k) =^? 2^(k+1) \
      y * 2^(k) =^? 2^k * 2 \
      (y * 2^k)/2 = 2^k \
      y * 2^(k-1) = 2^k \
      
    $
    Therefore by induction $y = 2^i$
  ][
    Based on the mentioned invariant $y = 2^n$

    - the loop continues while y < x and since $y = 2^i$ after the $i"th"$ iteration
    - the loop will stops when $y>=x$ which happens $2^i > x$
    - Therefore, the smallest $i$ such that $2^i >= x$ is $[lg x]$
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
][
    $ 
      S_1 = cases(
        3 in S_1
        x,y in S_1 => (x+y) in S_1
      ) 
    $
    
    #baseCase("n",1)
    $
      3 dot 1 = 3 in S_1
    $
    
    #hypothesis("i",1,"k")
    
    show $n = k$
    $
      3 dot k in S_1
    $


    Inductive Step: \
    show $n = k + 1$
    $ 
      3 dot (k+1) = 3 k+3 in S_1
    $
    By the inductive hypothesis, we know that $3k in S_1$ \
    Since, $3 in S_1$ and the closure property of $S_1$ states that if $x in S_1 "and" y in S_1$ then $x+y in S_1$
    This proves that invariant holds after one more iteration
    \
    \
][
    Prove $H >= log_2(n)$ \ \
    $n ->$ number of vertices \
    $H ->$ height
    
    #baseCase("n",1)
    $
      log_2(1) = 0
    $
    for n = 1, the height is 0 and the $H >= log_2(n)$ stands true
    
    #hypothesis("i",1,"k")
    
    show $n = k$
    $
      H >= log_2(k)
    $


    We will consider a Binary Tree $T "with" k+1 "vertices"$
    $T$ can be constructed  by taking two smaller binary trees $T_1 "and" T_2$ and a root node to connect both the tree

    Inductive Hypothesis
    - $T_1$ has $n_1$ vertices and height $H_1 >= log_2(n_1)$
    - $T_2$ has $n_2$ vertices and height $H_2 >= log_2(n_2)$

    to determine $T$'s height, $T_1$ and $T_2$
    $ H(T) = 1 + max(H_1,H_2) $

    Now, since $n_1 + n_2 = k$, and the tree has total k+1 vertices(including the root)

    $ H(T) >= 1 + log_2(n_1+n_2) = log_2(k+1) $
    showing that the height of T with k+1 vertices satisfies the condition

    
    \
    \
][
  Prove $ L = I +1 $
  $L ->$ number of leaves\
  $I ->$ number of internal nodes \
  
  #box()[Base Case: $I = 0$]\
  We know that for 1 leaf node we have 0 Internal nodes
  $L = 1 "for" I = 0$
  
  $
    L =^? I +1 \
    L = 1
  $
  #box()[ Inductive Hypothesis: $0<= I < k$]
  
  $ k =^? I_k + 1 $ holds for all binary trees with $k>=1$ leaf nodes\
  For a full binary tree with $k$ leaf nodes and $I_k$ internal nodes
  $ k = I_k + 1 $

  Inductive Step:
  Given a full binary tree with n leaves, the number fo internal nodes $I_k$ satisfies $L = I_k + 1$ \

  - remove these two leaves and turn their parent into a leaf
  - the resulting tree has n leaves and, by inductive hypothesis, satisfies $k = I_k +1$
  Tree with k+1 leaf nodes
  $
    k+1 =^? I_(k+1) + 1\
    k+1 = I_k + 1 + 1 \
    k = I_k + 1 \
  $
  - Add the two leaves back
    - our new internal node  $I_(k+1) = I_k + 1$\
    - one additional leaf, so  $k + 1$
  Hence, L = I +1 holds for n + 1 leaves
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
  Prove $V = E + 1 $\
  $V ->$ number of vertices\
  $E ->$ number of edges \

  #box()[Base Case: $h = 0$]\
  $V = 1 $\
  $E = 0 $ 
  $ V =^? E + 1 $
  $ 1 = 0 + 1 $
  
  Inductive Hypothesis:
  
  Assuming that for any m-ay tree of\
  height $h$\
  the number of vertices $V_h$\
  the number of edges $E_h$ 
  
  $ V_h = E_h +1 $

  Inductive Step:
  Considering m-ary tree of heigh $h+1$.
  This tree can be viewed as a root node with k sub-tree, each of which is an m-ary tree of height at most $h$ (where $k <= m$)
  - $i$th sub-tree $ V_(h_i) = E_(h_i) + 1 $
  for 1 <= i <= k

  - the root node adds
    - one additonal vertex
    - k additional edges conncting the root to its children
  $
    E_(h+1) = k + sum_(i=1)^k E_(h_i)
  $
  $ 
    V_(h+1) = 1 + sum_(i=1)^k V_(h_i) \
    = 1 + sum_(i=1)^k (E_(h_i) + 1) \
    = 1 + sum_(i=1)^k E_(h_i) + k
  $
  Since the number of edges $E_(h+1) = sum_(i=1)^k E_h_i + k$ \
  we can write it as $ V_(h+1) =  E_(h+1) + 1 $\
  Thus, the relation $V = E +1$ holds for an m-ary tree of height $h+1$

  By induction on the height of the tree, we have proven that for any m-ary tree
  $V = E + 1$
]