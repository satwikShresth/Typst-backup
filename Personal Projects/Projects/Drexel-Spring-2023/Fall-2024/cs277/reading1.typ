#import "/template.typ": project
#show: project.with(
  title: "CS 277 - Reading 1",
  author: "Satwik Shresth",
  date: "October 6, 2024",
)

#set enum(body-indent: 1em,indent: 1em)
#set text(size: 11pt)
#enum()[
There are infinitely many functions are in the set $Theta(n)$
  #enum(numbering: "a.")[
    - $ f(n) = 3n+2 $
    - $ g(n) = -n+2 $
    - $ h(n) = n $
  ][
*    Formal Definition:    *
    for any positive constants $c_1,c_2 "and" k$ such that $ 0 <= c_1 dot g(n) <= f(n) <= c_2 dot g(n) $ for all n $>=$ k

    To prove $ f(n) in Theta(g(n)) $
    - Identify the functions $f(n) "and" g(n)$
    - find constant $c_1,c_2 "and" n_0$ to satisfy the inequality
    - establish the inequalities and if constants exists, its proved 
    $
      0 <= c_1 dot g(n) <= f(n) <= c_2 dot g(n) 
    $
    since $c_1, c_2  "for" n >= n_0 "exists" $ Hence, proved

    To prove $ f(n) in.not Theta(g(n)) $

    - We will assume $f(n) in Theta(g(n))$
    - find constant $c_1,c_2 "and" n_0$ to satisfy the inequality
    - show contradition, by showing that no such constant can exist because the inequalities cannot be satisfied, disproving the bound
    \
  ]
][
  #enum(numbering: "a.")[
  $
    "To prove" 6n+5 in Theta(n)\
    "Lower bound" Omega(n^2)\
    "for " n >= 1\
    c_1 = 6\
    
    6n + 5 >= 6n\
    6n + 5 >= c_1 dot n\

    "Hence Proved:"  6n+5 in Omega(n) forall n >= 1\
    \
    "Upper bound" O(n^2)\
    "for " n >= 1\
    c_2 = 11\
    
    6n + 5 <= 6n + 5n\
    6n + 5 <= 11n\
    6n + 5 <= c_2 dot n\
    
    "Hence Proved:"  6n+5 in O(n) forall n >= 1\
  $
  - Since we have proved that $6n+5 in Omega(n) "and" 6n + 5 in O(n)$ we can conclude that it is $ "Hence Proved:" 6n+5 in Theta(n) $
  ][
  $
    "To prove" 3n^2+7n+25 in Theta(n^2)\
    "Lower bound" Omega(n^2)\
    "for " n >= 1\
    c_1 = 3\
    
    3n^2+7n+25 >= 3n^2\
    3n^2+7n+25 >= c_1 dot n^2\

    
    "Hence Proved:" 3n^2+7n+25 in Omega(n^2) forall n >= 1\
    \
    "Upper bound" O(n^2)\
    "for " n >= 1\
    c_2 = 35\
    
    3n^2+7n+25 <= 3n^2 + 7n^2 + 25n^2 \
    3n^2+7n+25 <= 35n^2 \
    3n^2+7n+25 <= c_2 dot n^2\
    
    "Hence Proved:"  3n^2+7n+25 in O(n^2) forall n >= 1\
  $
  - Since we have proved that $3n^2+7n+25 in Omega(n^2) "and" 3n^2+7n+25 in O(n^2)$ we can conclude that it is $3n^2+7n+25 in Theta(n^2) $
  ][
  $
    "To prove" 5n^2+12n+17 in Theta(n)\
    "Lower bound" Omega(n)\
    "for " n >= 1\
    c_1 = 5\
    
    5n^2+12n+17 >= 5n\
    5n^2+12n+17 >= c_1 dot n\

    
    "Hence Proved:" 5n^2+12n+17 in Omega(n) forall n >= 1\
    \
    "Upper bound" O(n)\
    "for " n > 0\
    
    5n^2+12n+17 <= c_2 dot n\
    5n+12+17/n <= c_2 \
\
    5n "can reach close to" infinity\
    12 "is a constant"\
    17/n "can reach close to" 0\   
  \
    "Hence Proved:"  5n^2+12n+17 in.not O(n) forall n >= 1\
  $
  - Since we have proved that $5n^2+12n+17 in Omega(n) " but " 5n^2+12n+17 in.not O(n)$ we can conclude that $5n^2+12n+17 in.not Theta(n) $
  ]
  \
][
  #enum(numbering: "a.")[
   $
    "Ratios"\
    f(n) in o(g(n)) eq.triple lim_(n->infinity) f(n)/g(n) = 0\
    f(n) in omega(g(n)) eq.triple lim_(n->infinity) f(n)/g(n) = infinity\
    f(n) in Theta(g(n)) eq.triple lim_(n->infinity) f(n)/g(n) = k, k eq.not 0\
    \
    "a." O(g(n)) = Theta(g(n)) union o(g(n))\
  $
    $f(n) in O(g(n))$ means that the function $ f(n) "is bound above by" g(n)$\
    It may or may not be tight
    
    - $f(n) = O(g(n)) "is similar to" f(n) <= g(n)$\
    - $f(n) = o(g(n)) "is similar to" f(n) < g(n)$\
    - $f(n) = Theta(g(n)) "is similar to" f(n) = g(n)$\

    We know that that $o(f(n)) subset O(f(n))$\
    So we can logically say that if 0 < $lim_(n->infinity)f(n)/g(n)$ < $infinity$ and that f(n) can be less than g(n) or equal to g(n)   
  $
    "b." Omega(g(n)) = Theta(g(n)) union omega(g(n))\
  $
    $f(n) in O(g(n))$ means that the function $ f(n) "is bound below by" g(n)$\
    It may or may not be tight
    
    - $f(n) = Omega(g(n)) "is similar to" f(n) >= g(n)$\
    - $f(n) = omega(g(n)) "is similar to" f(n) > g(n)$\
    - $f(n) = Theta(g(n)) "is similar to" f(n) = g(n)$\

    We know that that $omega(f(n)) subset Omega(f(n))$\
    So we can logically say that f(n) can be greater than g(n) or equal to g(n)\
    \
  ][
    $lim_(n->infinity) (5n)/(n^2) = infinity/infinity = 1 => 5n in Theta(n^2)$\
    The assumption that $infinity/infinity = 1$ is incorrect 
    The assumption that $lim_(n->infinity) (5n)/(n^2) = infinity/infinity$ is also incorrect 

    When we simplify $lim_(n->infinity)(5n)/(n^2) = 5/n$ here $lim_(n->infinity)5/n$ reaches 0\
    \
    Therefore the limit indicates $5n in o(n^2)$ 
  ]
  \
][
  #enum(numbering: "a.")[
    $
      18n^2+24 = omega(n)
      \
      lim_(n->infinity) (18n^2 + 24)/n \ 
      lim_(n->infinity) (18n + 24/n) = infinity
    $
    Since the limit is infinity, $18n^2+24 in omega(n)$
    \
    \
  ][
    $
      lg(n) = omega(n)
      \
      lim_(n->infinity) (lg(n))/n
    $
    - As $n -> infinity$ and we have an indeterminate form $infinity/infinity$
    - L'Hospital Rule:
    $ lim_(n->infinity) (d / (d n)lg(n) )/ ((d)/ (d n)n) $
    $ lim_(n->infinity) 1/ (n ln(2))   = 0 $\
    
    Since the limit is zero, $lg(n) in o(n)$
  ][
    $
      log_a(n) = Theta(log_b(n)) "for any positive constants a and b"\
    $

    $ 
      lim_(n->infinity)  log_a(n)/log_b(n)
    $
    - L'Hospital Rule:
    $
      "Relationship between " log_a(n) "and" log_b(n)\
      
      lim_(n->infinity) log_a(n) = 1/(n log(a))\
      
      lim_(n->infinity) log_b(n) = 1/(n log(b)\
      
      log_a(n)/log_b(n) = ( (n ln(a))/ (n ln(b)))\
      
      log_a(n)/log_b(n) = (ln(a)/ln(b))\
    $
    
    $ 
      lim_(n->infinity)  log_a(n)/log_b(n)
       = k, k eq.not 0
    $
    Since the limit is k, $log_a(n) in Theta(log_b(n))$
  ]
  \
][
  #enum(numbering: "a.")[
    - $Theta$ represents represent having equal growth rates
    - If $f(n) = Theta(g(n))$, then we can say that for any positive constants $c_1,c_2 "and" k$ such that $ 0 <= c_1 dot g(n) <= f(n) <= c_2 dot g(n) $ for all n $>=$ k
    - It closely approximating it having a tight range between $c_1 "and" c_2$
    - $o$ and $omega$ bounds are upper and lower bounds that loosely describes functions runtime.
    - $f(n) in o(g(n))$ means that $f(n)$ strictly grows slower than $g(n)$
      - via limits we can see $lim(n->infinity) f(n)/g(n) = 0$
    - $f(n) in omega(g(n))$ means that $f(n)$ strictly grows faster than $g(n)$ 
      - via limits we can see $lim(n->infinity) f(n)/g(n) = infinity$
  ][
    - $O$ and $Omega$ are Loose bounds
    - Big-O provide upper bound on $f(n)$
      - It means in $f(n) in O(g(n))$, $f(n)$ does not grow faster than a constant multiple $c_0$ of $g(n)$
    - Big-Omega provide lower bound on $f(n)$
      - It means in $f(n) in Omega(g(n))$, $f(n)$ does not grow slower than a constant multiple $c_0$ of $g(n)$
    - Since again both $O$ and $Omega$ bounds are one sided constraints without have a strict another\ constant to bound it 
  ]
]