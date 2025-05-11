#import "/template_new.typ": *
#show: project.with(
  title: "CS 435 - Homework 2",
  author: "Satwik Shresth",
  date: "Feb 16, 2025",
)



= Section 1: Image Patches

=== Part a
#figure(
  caption: [3 Random 16x16 image patches of the grace hopper image],
)[
  #grid(
  columns: (auto,auto,auto),
  rows: (auto,auto),
  gutter: 3pt,
  image("q1_patch.png",width: 75%),
  ) 
]

=== Part b

Fixed size patches have limitations as descriptors because they are sensitive to changes in scale, rotation, pose, and illumination.

For instance, if an object grows or rotates, the semantic content may be split across different patches or altered entirely as seen when even a slight head turn changes the appearance of Grace Hopper's glasses. 

While normalization can help with uniform lighting changes, it falls short under complex lighting conditions. The fixed 16x16 grid also have inconsistent partitioning of the same feature across images.

= Section 2: Gaussian Filter

=== Part a
$

G(x,y) = (1/(2 pi σ^2))exp(-(x² + y²)/(2σ²))\

"We can rewrite this as:"\

G(x,y) = [(1/√(2 π σ²))exp(-x²/(2σ²))] × [(1/√(2 π σ²))exp(-y²/(2σ²))]\
= G(x) × G(y)

$
This shows that the 2D Gaussian is separable into the product of two 1D Gaussians. Due to the associative property of convolution:

$ (f * G)(x,y) = f * [G(x) × G(y)] = (f * G(x)) * G(y) $

The variance of the 1D kernels remains σ², the same as the 2D kernel. This separability property significantly reduces computational complexity from O(n²) to O(2n) for an n×n kernel.

=== Part b

#figure(
  caption: [Gaussian-filtered Image of grace hopper],
)[
  #grid(
  columns: (auto,auto,auto),
  rows: (auto,auto),
  gutter: 3pt,
  image("q2_gaussian.png",width: 58%),
  ) 
]
Gaussian filtering smooths the image by replacing each pixel with a weighted average of its neighbors, effectively reducing noise and high-frequency details while preserving the overall structure of the image.

=== Part c


$
I_x (x,y) ≈ 1/2 ​ (I(x+1,y)−I(x−1,y))\

I_y (x,y) ≈ 1/2 ​ (I(x,y+1)−I(x,y-1))\
$

Derivation for $k_x (1×3 "Kernel")$
$
I_x (x,y)=(I∗k_x)(x,y) 
$
Assume the kernel $k_x$ has support at positions 
−1,0, and 1 along the x-axis:

$
k_x ​ =[ k_x (−1) ​ k_x (0) ​k_x (1) ]
$
If we define the convolution (in a correlation-like fashion) as:

$
(I∗k_x)(x,y)=I(x+1,y)k_x(−1)+I(x−0,y)k_x(0)+I(x−1,y)k_x ​(1)
$

To match the finite difference:

$
I_x (x,y) ≈ 1/2 ​ (I(x+1,y)−I(x−1,y))\
$
- Coefficient for $I(x+1,y): k_x (-1) = 1/2$
- Coefficient for $I(x,y): k_x (0) = 0$
- Coefficient for $I(x-1,y): k_x (1) = -1/2$

Thus the kernel is:

$ k_x = mat(1/2, 0, -1/2) $


Derivation for $k_y (3×1 "Kernel")$
$
I_y (x,y)=(I∗k_y)(x,y) 
$
Assume the kernel $k_x$ has support at positions 
−1,0, and 1 along the y-axis:

$
k_y = mat(k_y (−1);  k_y (0); ​k_y (1) )
$
If we define the convolution (in a correlation-like fashion) as:

$
(I∗k_y)(x,y)= I(x,y+1) k_y (−1)+I(x,y)k_y (0)+I(x,y-1)k_y (1)
$

To match the finite difference:

$
I_x (x,y) ≈ 1/2 ​ (I(x+1,y)−I(x−1,y))\
$
- Coefficient for $I(x,y+1): k_y (-1) = 1/2$
- Coefficient for $I(x,y): k_y (0) = 0$
- Coefficient for $I(x,y-1): k_y (1) = -1/2$

$x$ derivatives are : $k_x = mat(-1/2, 0, 1/2)  $\

$y$ derivatives are : $k_y = mat(-1/2; 0; 1/2)  $

=== Part d
#v(15pt)
  #grid(
  columns: (auto,auto,auto),
  rows: (auto,auto),
  gutter: 3pt,
  figure(
    caption: [Image of grace hopper after edge detection]
  )[
    #image("q3_edge.png",width: 80%)
  ],
  figure(
    caption: [ Gaussian-filtered image of grace hopper after edge detection]
  )[
    #image("q3_edge_gaussian.png",width: 80%)
  ]
)

The edge detection on the original image shows finer details but also includes more noise and texture artifacts.
On the other hand image Gaussian-filtered image has cleaner and more prominent edges by reducing high frequency noise before edge detection as it helps isolate the most significant edges.