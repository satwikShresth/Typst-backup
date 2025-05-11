#import "/template.typ": project
#show: project.with(
  title: "CS 383 - Homework 02",
  author: "Satwik Shresth",
  date: "April 25, 2024",
)

== Question 1 <question1>
\

#enum(numbering: "(a)")[
  $
    X=
    mat(
      -2;
      -5;
      -3;
      0;
      -8;
      -2;
      1;
      5;
      -1;
      6;
    )
    ,Y=
    mat(
      1;
      -4;
      1;
      3;
      11;
      5;
      0;
      -1;
      -3;
      1;
    )
  $

  To Calculate least square estimate (LSE):
  $ J = 1/N (Y - X dot w)^T dot (Y - X dot w) $
  $ d_j/d_w = 1/N (2 dot X^T dot X_w - 2 dot X^T dot Y)  = 0 $
  $ X^T dot X_w = X^T dot Y $
  $ w = (X^T dot X )^"-1" dot X^T dot Y $
    - adding bias feature to 
    $
    "new" X =  
    mat(
      1,-2;
      1,-5;
      1,-3;
      1,0;
      1,-8;
      1,-2;
      1,1;
      1,5;
      1,-1;
      1,6;
    )
     $
     - calulating weight
     $
        X^T dot X  =  mat(
          0.105,0.006;
          0.005,0.006;
        )
        \
        \
        X^T dot Y = mat(
          14;
          -79;
        )
        \
        \
        w = mat(
            delim:"[",
            1.0286;
            -0.413
          )
      $
          \
][
  $ 
    Ŷ = X dot w
    \
    \
    Ŷ = 
    mat(
       1.854;
       3.092;
       2.267;
       1.029;
       4.330;
       1.854;
       0.616;
      -1.035;
       1.441;
      -1.447;
    )
  $
  \
][
  $ "RMSE" = sqrt(1/N sum^N_"i=1" (Y_i - Ŷ_i)^2) $ 
  $ "SMAPE" = 1/N sum^N_"i=1" (|Y_i - Ŷ_i|)/(|Y_i| + |Ŷ_i|) $
  By pulging the value we get
  $ "RMSE" = 3.701 $ 
  $ "SMAPE" = 0.609 $
]
\
== Question 2 <question2>
Calculating RMSE and SMAPE from training data
- Pre-processing done on the data
  - Encoding Categorical Variables
    - Categories like yes, no, male, female ... were encoded to distinct numerical values to allow facilitate matrix operations
  - Shuffling
    - Data set was shuffled using seed value as 0
  - Splitting
    - Primary data was split in two parts
      - 0 to n-1 columns were feature
      - n column was final values to compare with
    - Dataset was then spilt in two parts
      - 2/3 for training
      - 1/3 for validation
  - Bias feature
    - Bias feature was added to the dataset 
    
- Metrics
  - Training
    - RMSE: 5757.954
    - SMAPE: 0.181
  - Validation 
    - RMSE: 6606.030
    - SMAPE: 0.183
    
== Question 3 <question3>
Calculating Mean and Standard Deviation of RMSE

- Pre-processing done on the data
  - Encoding Categorical Variables
    - Categories like yes, no, male, female ... were encoded to distinct numerical values to allow facilitate matrix operations
  - Splitting
    - Primary data was split in two parts
      - 0 to n-1 columns were feature
      - n column was final values to compare with
    - Dataset was then spilt in two parts
      - folds
        - a fold was decided for testing dataset
        - everything else become training dataset
    
- Metrics
  - For S = 3
      - Mean of RMSE: 6087.66
      - Standard Deviation of RMSE: 15.94
  - For S = 223:
      - Mean of RMSE: 5565.72
      - Standard Deviation of RMSE: 30.27
  - For S = 1338:
      - Mean of RMSE: 4197.28
      - Standard Deviation of RMSE: 0.00 