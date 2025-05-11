#import "/template_new.typ": *
#show: project.with(
  title: "CS 435 - Homework 1",
  author: "Satwik Shresth",
  date: "Feb 2, 2025",
)


== Section 1
2. Rotations are not communicative
#figure(
  caption: [Rotate Y followed by X],
)[
#image("rYfX.png",width: 20%)
  #v(-17pt)
]

#v(-11pt)
#figure(
  caption: [Rotate X followed by Y],
)[
#image("rXfY.png",width: 20%)
  #v(-18pt)
]

3. Order and parameter:
  - parameter : $theta x = 0.6188, theta y = -0.7775$
  - order : rotate Y followed by X and then transpose
#v(-11pt)
#figure(
  caption: [The diagonal of a cube projected to a single point],
)[
#image("q3.png",width: 20%)
  #v(-18pt)
]
4. 
#v(-11pt)
#figure(
  caption: [Orthographic camera view of The diagonal of a cube projected to a single point],
)[
#image("q4.png",width: 30%)
  #v(-18pt)
]
#pagebreak()

== Section 2
1.
#v(-11pt)
#figure(
  caption: [Indoor image gray scale R G B and L A B],
)[
#image("s2q1.png",width: 30%)
  #v(-18pt)
]

#v(-11pt)
#figure(
  caption: [Outdoor image gray scale R G B and L A B],
)[
#image("s2q1 outdoor.png",width: 30%)
  #v(-18pt)
]

2. In LAB, L represents Luminance, which is directly affected by change in brightness. While A and B channels capture chromatic information. We can see the change in mean and std dev for images with different lightings

#figure(
  caption: [Mean and Standard Deviation of Luminance],
)[
  #table(
    columns: (6em, 5em, 4em),
    inset: 10pt,
    align: horizon,
    table.header(
      [image], [mean], [Std],
    ),
    [Indoor],[$77.386$],[$46.5$],
    [Outdoor],[$142.38$],[$51.1$]
  )
]

3.
#v(-11pt)
#figure(
  caption: [Indoor image of Rubick's cube],
)[
#image("im1.jpg",width: 20%)
]

#v(-5pt)
#figure(
  caption: [Outdoor image of Rubick's cube],
)[
#image("im2.jpg",width: 20%)
]
4. Comparing 32x32 patches of the image
#v(-5pt)
#figure(
  caption: [Comparison of patches],
)[
#image("s2qlast.png",width: 20%)
]
