#import "/template.typ": project

#show: project.with(
  title: "CS 361 - Homework 04",
  author: "Satwik Shresth",
  date: "May 02, 2024",
)

#set enum(body-indent: 1em,indent: 1em)


== Question 1 <question1>
\
$
#table(
  columns: (auto, auto,auto,auto,auto,auto),
  inset: 7pt,
  gutter: 1,
  align: center,
  [Array Size],[    Merge],[ TMerge 2],[ TMerge 4],[TMerge 16],[TMerge 32 ],
  [         1],[        0],[        0],[        0],[        0],[        0 ],
  [         2],[        2],[      482],[        0],[        0],[        0 ],
  [         4],[        0],[      237],[      666],[        0],[        0 ],
  [         8],[        0],[      216],[      588],[        0],[        0 ],
  [        16],[        2],[      115],[      353],[     1598],[        2 ],
  [        32],[        3],[      120],[      210],[     1891],[     3294 ],
  [        64],[       12],[      147],[      248],[     1818],[     2834 ],
  [       128],[       33],[      169],[      279],[     3505],[     3622 ],
  [       256],[       46],[      182],[      209],[     1737],[     2886 ],
  [       512],[       90],[      214],[      259],[     1307],[     3342 ],
  [      1024],[      212],[      228],[      314],[     1464],[     6631 ],
  [      2048],[      444],[      366],[      459],[     1820],[     5897 ],
  [      4096],[      871],[      613],[      623],[     1671],[     4387 ],
  [      8192],[     2042],[     1164],[      826],[     2589],[     5142 ],
  [     16384],[     4024],[     2305],[     1468],[     3003],[     5165 ],
  [     32768],[     9340],[     5629],[     3118],[     3761],[     7121 ],
  [     65536],[    18412],[    10583],[     6312],[     4482],[     7477 ],
  [    131072],[    45862],[    25191],[    12836],[     8263],[     8836 ],
  [    262144],[    80733],[    44568],[    26852],[    17185],[    16568 ],
  [    524288],[   165984],[    87502],[    55730],[    28548],[    30609 ],
  [   1048576],[   366123],[   194344],[   114116],[    58111],[    55808 ],
)
$
\
== Question 2-4 <question2-4>
\
2. Did threading improve the speed of sorting? If yes, where do you think the advantage came from? If no, what do you think could have caused this?
  - Yes the threading did improve the speed of sorting but
    - it only true if $"array_size" > 256 * (1+"number_of_threads")$
    - if $"array_size" <= 256 * (1+"number_of_threads")$ it is highly likely that it going to be slow
  - It is fast because for each depth there is $2^("depth")$ nodes where normal merge sort algorithm is going to sort and merge sequentially, while threaded merge sort can sort and merge it in parallel making it many folds faster than normal merge sort
  - Since all these range do not overlap we don't even need a mutex lock
  - It got slow because of the overhead for starting new threads, also partly CPU memory caching could be augmenting the issue
3. What was the most difficult part of coding this assignment?
  - The most difficult part was understanding merge sort as an algorithm and why is it the best algorithm for multi-threading
  - At first I tried creating a threads-safe queue which is first filled with all the information of partition then as we the threads go about merging it, it keeps adding the new bigger range to merge but then I realized we are already doing it using recursion in the normal merge sort
  - In the end I decided that if I know the branching factor, then I can control the maximum use of threads and there wont be a need to control scheduling of range since it already taken care by recursion
4. What was the easiest part of coding this assignment?
  - Coding the optimal solution :)
