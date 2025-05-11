#import "/template.typ": project
#show: project.with(
  title: "CS 383 - Homework 04",
  author: "Satwik Shresth",
  date: "May 10, 2024",
)

== Question 1 <question1>
#enum()[
  Class Prior for the spambase.data
  #let total = 4601
  #let zeros = 2788
  #let ones = total - zeros
  #let c0 = calc.round(zeros/total,digits:3)
  #let c1 = calc.round(ones/total,digits: 3)
  \
  Total Occurances = 4601
  \
  Occurances of 0 = #zeros 
  \
  Occurances of 1 = #ones 
  \
  \
  - Class 0 : $  #zeros/#total = c0  $
  \
  - Class 1 : $ #ones/#total = c1 $
][
Requested Classification Statistics 
- Training Accuracy: 90.51%
- Validation Accuracy: 88.98%
- Validation Precision: 0.84
- Validation Recall: 0.88
- Validation F-Measure Score: 0.86
]


