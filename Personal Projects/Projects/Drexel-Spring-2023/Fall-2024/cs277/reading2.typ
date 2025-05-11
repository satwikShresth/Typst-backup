#import "/template.typ": project
#show: project.with(
  title: "CS 277 - Reading 2",
  author: "Satwik Shresth",
  date: "October 11, 2024",
)

#set enum(body-indent: 1em,indent: 1em)
#set box(radius:1pt,stroke: 1pt,inset: 5pt)
#set text(size: 12pt)
#enum()[
  $ sum_(i=1)^(n) i^2 = (n(n+1)(2n+1))/6 $

  #box()[Base Case: n = 1]
  $ 
    1^2 =^? (1(1+1)(2 dot 1 + 1))/6 \
    1 =^? (1(2)(3))/6 \
    1 = 1 \
  $

  #box()[ Hypothesis: $ 1 <= n < k$] \
  Show (n = k)
  
  $ 
    sum_(i=1)^(k) i^2 = (k(k+1)(2k+1))/6 \
    1^2 + ... + (k-1)^2 + k^2 = (k(k+1)(2k+1))/6 \
  $
  
  for (n = k-1)
  $ 
    sum_(i=1)^(k-1) i^2 = 1^2+ ... + (k-1)^2 =^? ((k-1)(k)(2k-1))/6 \
    1^2+ ... + (k-1)^2 =^? ((k-1)(k)(2k-1))/6 \
    1^2+ ... + (k-1)^2 + k^2 =^? ((k-1)(k)(2k-1))/6 + k^2 \
    1^2+ ... + (k-1)^2 + k^2 =^? (( k^2 - k ) (2k-1))/6 + k^2\
    1^2+ ... + (k-1)^2 + k^2 =^? (2k^3 - 3k^2 + k)/6 + k^2 \
    1^2+ ... + (k-1)^2 + k^2 =^? (2k^3 - 3k^2 + k + 6k^2)/6 \
    1^2+ ... + (k-1)^2 + k^2 =^? (2k^3 + 3k^2 + k )/6 \
    1^2+ ... + (k-1)^2 + k^2 = (k(k+1)(2k+1))/6 \
  $

  Therefore by induction: #box()[ $ 1 <= n < k $]
  \
  \
  \
  \
][
  $
    t_n = (n(n+1))/2 \
    sum_(j=1)^n = (n(n+1)(n+2))/6
  $

  #box()[Base Case: n = 1]
  $ 
    (n(n+1))/2 =^? (n(n+1)(n+2))/6 \
    (1(1+1))/2 =^? (1(1+1)(1+2))/6 \
    1 = 1 \
  $

  #box()[ Hypothesis: $ 1 <= n < k$] \
  Show (n = k)
  
  $ 
    sum_(j=1)^(k) t_j = (k(k+1)(2k+1))/6 \
    1^2 + ... + t_(k-1) + t_k = (k(k+1)(k+2))/6 \
    1^2 + ... + t_(k-1) + t_k = ((k^2+k)(k+2))/6 \
    1^2 + ... + t_(k-1) + t_k = (k^3+ 3k^2 + 2k)/6 \
  $
  
  for (n = k-1)
  $ 
    sum_(j=1)^(t_k-1) i^2 = 1^2+ ... + t_k-1 =^? ((k-1)(k)(k+1))/6 \
    (1(1+1))/2 + ... + t_(k-1) =^? ((k-1)(k)(k+1))/6 \
    1+ ... + t_(k-1) + t_k =^? ((k^2-1)(k))/6 + t_k \
    1+ ... + t_(k-1) + t_k =^? (k^3-k)/6 + t_k \
    1+ ... + t_(k-1) + t_k =^? (k^3-k)/6 + (k(k+1))/2 \
    1+ ... + t_(k-1) + t_k =^? (k^3-k)/6 + (k^2+k)/2 \
    1+ ... + t_(k-1) + t_k =^? (k^3-k + 3k^2 + 3k)/6\
    1+ ... + t_(k-1) + t_k =^? (k^3 + 3k^2 + 2k)/6\
  $

  Therefore by induction: #box()[ $ 1 <= n < k $]
\
\
][
  Recursive Definition of UNIX File System Directory/File Structures
  - Basis Rules:

    - File: A file is a basic entity containing data and cannot contain other files or directories.
    - Empty Directory: An empty directory is a directory that contains no files or subdirectories.
    
  - Inductive Rules:

    - Adding a File to a Directory:
      - If $D$ is a directory and $F$ is a file, then adding $F$ to $D$ forms a new directory $D'$.
    - Adding a Subdirectory to a Directory:
      - If $D$ is a directory and $D_1$ is a directory (not an ancestor of $D$), then adding $D_1$ to $D$ forms a new directory $D'$.
    - Combining Files and Directories:
      - If $D$ is a directory, F is a file, and $D$₁ is a directory (not an ancestor of $D$), then adding both F and $D_1$ to $D$ forms a new directory $D$'.
      
  By repeatedly applying these rules, we can construct any possible directory/file structure in the UNIX file system.
][
  #enum(numbering:"a)")[
    ( ( ) ( ( ) )
    
    - Profile Analysis:
      - Positions and profiles:
        - ( → 1
        - ( → 2
        - ) → 1
        - ( → 2
        - ( → 3
        - ) → 2
        - ) → 1
    - Conclusion: Ends with a profile of 1 (does not return to 0).
    - Result: Not profile-balanced.
  ][
    ( ) ( ) ) ( ( )
    
    - Profile Analysis:
      - Positions and profiles:
        - ( → 1
        - ) → 0
        - ( → 1
        - ) → 0
        - ) → -1 (goes negative)
    - Conclusion: Profile goes negative.
    - Result: Not profile-balanced.
    \
    \
    \
    \
    \
    \
    \
    \
  ][
    ( ( ( ) ( ) ) ( ) ( ) )
    
    - Profile Analysis: Profiles remain non-negative and end at 0.
    - Conclusion: Profile-balanced.
    - Demonstration using Recursive Definition:
    
      - Basis: The empty string ε is balanced.
        - Step 1: ( ) is balanced (basis rule).
        - Step 2: ( ) ( ) is balanced:
          - Using the inductive rule: if x and y are balanced ( ( ) and ( ) ), then xy is balanced.
        - Step 3: ( ( ) ( ) ) is balanced:
          - Let x = ( ) ( ), which is balanced.
          - Then (x) is balanced by the inductive rule.
        - Step 4: () is balanced (basis rule).
        - Step 5: The entire string ( ( ( ) ( ) ) ( ) ( ) ) is balanced:
          - Let x = ( ( ) ( ) ) (from Step 3) and y = () (from Step 4).
          - Then (x)y is balanced by the inductive rule.
        - Enclose the result in parentheses to form ( (x)y ), which is balanced.
  ][
    ( ( ) ( ( ) ( ( ) ) ) )
    
    - Profile Analysis:
      - Profiles remain non-negative and end at 0.
    - Conclusion: Profile-balanced.
    - Demonstration using Recursive Definition:
    
    - Basis: The empty string ε is balanced.
      - Step 1: ( ) is balanced (basis rule).
      - Step 2: ( ( ) ( ) ) is balanced:
        - Let x = ( ) (from Step 1).
        - Then (x) is balanced by the inductive rule.
        - Let y = ( ( ) ), which can be shown balanced similarly.
        - Then (x)y is balanced.
    - Step 3: ( ( ) ( ( ) ) ) is balanced:
        - Let x = ( ) and y = ( ( ) ( ) ) (from Step 2).
        - Then (x) y is balanced by the inductive rule.
    - Step 4: The entire string ( ( ) ( ( ) ( ( ) ) ) ) is balanced:
        - Let x = ( ) and y = ( ( ) ( ( ) ) ) (from Step 3).
        - Then (x)y is balanced by the inductive rule.
    Enclose in parentheses to form ( ( x ) y ), which is balanced.
  ]
]
