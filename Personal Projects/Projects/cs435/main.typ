#import "/template.typ": *
#show: project.with(
  title: "CS 435 - Homework 3",
  author: "Satwik Shresth",
  date: "Mar 2, 2025",
)



= Section 1: RANSAC

+ Fitting a Line
  + To fit a line in 2D, we need 2 points.
  + Given an outlier ratio of \( e = 0.1 \), the probability of selecting an inlier is \( 1-e = 0.9 \). For a sample of 2 points, the probability that both points are inliers is: $ (0.9)^2 = 0.81 $
    Thus, the probability that at least one point is an outlier is: $ 1 - 0.81 = 0.19 \ = 19% $
  + To achieve a 95% chance of getting at least one sample that is all inliers, we use the formula:
    $ 
      1 - (0.19)^N gt.eq 0.95 \
      => (0.19)^N lt.eq 0.05\
      N gt.eq log(0.05)/log(0.19) 
      N gt.eq 1.81
    $
    We need at least 2 trails
    
+ Fitting Transformation
  + A 2x2 matrix will have 4 degrees of freedom. Each point correspondence provides 2 independent equations needing 2 correspondences to determine the matrix
  + we can write out the 2 x 2 matrix M as a vector
    $
      v =mat(m_11; m_12; m_21; m_22)
    $
    given data point $x_i = (x_"i1",x_"i2") "and" y = (y_"i1",y_"i2")$ $y = M x$
    - $y_"i1" = m_11 x_"i1" + m_12 x_"i2"$
    - $y_"i2" = m_21 x_"i1" + m_22 x_"i2"$
  
    $ 
      mat(
       x_"i1", x_"i2", 0, 0;
       0, 0, x_"i1", x_"i2";
      )
      mat(m_11; m_12; m_21; m_22)
      = 
      mat(y_"i1";y_"i2")
    $
  
    $
      A = mat(
        x_11,x_12,0,0;
        0,0, x_11,x_12;
        x_21,x_22,0,0;
        0,0, x_21,x_22;
        dots.v,dots.v,dots.v,dots.v;
        x_"N1",x_"N2",0,0;
        0,0, x_"N1",x_"N2";
      )
      B = mat(
        y_11;
        y_12;
        y_21;
        y_22;
        dots.v;
        y_"N1";
        y_"N2";
      )
    $
  + Calculating matrix M and vector t
    $ M =
      mat(
        2.4098, -1.0164;
        -3.0696, 0.9433;
      ) \
      t = mat(-1.8715, -3.0514)
    $\
  + Transformations fit
    #figure(
      caption: [Transformation fit]
    )[
      #image("transform_fit.png",width: 53%)
    ]\
  + In an affine transformation of the form
    $
     y = M x+t
    $
     the point x is first mapped by the linear transformation M and then shifted by the translation vector t.
     
     The affine model captures the main geometric transformation between the red and green sets. But does not perfectly overlap with every green point.
  + Matrix H
    - Case 0
      $
        mat(
          -5.84619486 × 10^(-1), -9.38188546 × 10^(-4), 7.85709946 × 10^(-2);
          -1.48861804 × 10^(-3), -3.61934740 × 10^(-1), 4.27826653 × 10^(-1);
          -2.62615121 × 10^(-5), -2.09196954 × 10^(-5), -5.81387269 × 10^(-1)
        )
      $
    
    - Case 1
      $
        mat(
          -3.68911272 × 10^(-1), -8.92258703 × 10^(-4), 3.93043451 × 10^(-1);
          -2.75059835 × 10^(-5), -5.96020476 × 10^(-1), 2.41643577 × 10^(-2);
          -2.17658971 × 10^(-7), -1.34347784 × 10^(-5), -5.94639553 × 10^(-1)
        )
      $
    
    - Case 2
      $
        mat(
          -2.53193239 × 10^(-1), -3.99057800 × 10^(-3), 5.69038181 × 10^(-1);
          -5.45228988 × 10^(-3), -2.53238879 × 10^(-1), 6.28011972 × 10^(-1);
          -1.21872179 × 10^(-4), -1.08513265 × 10^(-4), -3.91808736 × 10^(-1)
        )
      $
    
    - Case 3
      $
        mat(
          -9.40352105 × 10^(-15), -5.77350269 × 10^(-1), -1.57767346 × 10^(-13);
          -5.77350269 × 10^(-1), -2.12566444 × 10^(-16), -4.26828726 × 10^(-14);
          5.30095175 × 10^(-17), -8.05904129 × 10^(-18), -5.77350269 × 10^(-1)
        )
      $
    
    - Case 4
      $
        mat(
          -7.91063985 × 10^(-3), 9.64072572 × 10^(-16), 6.01208628 × 10^(-1);
          -5.92256424 × 10^(-15), -7.91063985 × 10^(-3), 7.98974624 × 10^(-1);
          -1.39862650 × 10^(-16), 6.06115253 × 10^(-17), 7.91063985 × 10^(-3)
        )
      $
    
    - Case 5
      $
        mat(
          -1.38048111 × 10^(-1), -2.19005570 × 10^(-1), 6.17163607 × 10^(-1);
          -2.20297434 × 10^(-1), -1.36451811 × 10^(-1), 6.05518007 × 10^(-1);
          -7.60197607 × 10^(-5), -4.81267788 × 10^(-5), -3.43927668 × 10^(-1)
        )
      $
    
    - Case 6
      $
        mat(
          -1.34941272 × 10^(-1), -7.96016480 × 10^(-3), 1.11241055 × 10^(-2);
          1.37954817 × 10^(-2), -1.51370758 × 10^(-1), -9.63220032 × 10^(-1);
          5.34941898 × 10^(-5), 1.11646326 × 10^(-5), -1.75235524 × 10^(-1)
        )
      $
    
    - Case 7
      $
        mat(
          -1.44485744 × 10^(-1), 8.35368093 × 10^(-3), -7.39389853 × 10^(-1);
          8.19996491 × 10^(-3), -1.69535496 × 10^(-1), -6.11590373 × 10^(-1);
          7.82502801 × 10^(-5), -1.85804532 × 10^(-5), -1.71768495 × 10^(-1)
        )
      $
  + 
    #grid(
    columns: (auto,auto,auto),
    rows: (auto,auto),
    gutter: 3pt,
    figure(
      caption: [Case 1]
    )[
      #image("case_1.png",width: 110%)
    ],
    figure(
      caption: [Case 2]
    )[
      #image("case_2.png",width: 110%)
    ],
    figure(
      caption: [Case 3]
    )[
      #image("case_2.png",width: 110%)
    ],
    figure(
      caption: [Case 4]
    )[
      #image("case_4.png",width: 110%)
    ],
    figure(
      caption: [Case 5]
    )[
      #image("case_5.png",width: 110%)
    ],
    figure(
      caption: [Case 6]
    )[
      #image("case_6.png",width: 110%)
    ],
    figure(
      caption: [Case 7]
    )[
      #image("case_7.png",width: 110%)
    ],
    figure(
      caption: [Case 8]
    )[
      #image("case_8.png",width: 110%)
    ],
    
  )
  + The homography matrix H maps each original point (red) to a new position (blue) by converting the point into homogeneous coordinates, applying H, and then normalizing back to 2D capturing rotation, scaling, translation, and perspective distortion. 
    
    In the visualizations, the blue points generally align with the green target points, which confirms that the projective transformation modeled by H is working as expected.
#pagebreak()

= Section 2: Fashion-MNIST Classification

== Model Architecture & Hyperparameters 

=== Convolutional Layers:
- Layer 1: nn.Conv2d(1, 32, kernel_size=3, padding=1)
  - Takes the 1‑channel (28×28) input and produces 32 feature maps.
- Layer 2: nn.Conv2d(32, 64, kernel_size=3, padding=1)
  - Further processes the features to output 64 maps.

=== Pooling & Dropout:
- Max Pooling: nn.MaxPool3d(2,2) halves the spatial dimensions from 28×28 to 14×14.
- Dropout: nn.Dropout(0.25) is used to help reduce overfitting.

=== Fully Connected Layers:
- First FC: nn.Linear(64 * 14 * 14, 128)
  - Flattens the pooled features and reduces them to 128 neurons.
- Output FC: nn.Linear(128, 10)
  - Produces 10 class scores corresponding to Fashion‑MNIST labels.
    
=== Optimizer & Training:
- Optimizer: Adam with a learning rate of 1e‑3 and weight decay (L2 regularization) of 1e‑4.
- Batch Size: 64
- Epochs: 10

=== Loss Tracking:
- The training function has been updated to record both training and validation losses each epoch.
- A matplotlib plot visualizes these trends, aiding in hyperparameter tuning.

=== Accuracy:
  - Validation Set: 92.66 %
  - Test Set: 92.22 %