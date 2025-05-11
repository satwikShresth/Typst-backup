#let project(title: "", author: (), date: none, body) = {
  set document(author: author, title: title)
  set page(
    //margin: ( top:1in, bottom:0.75in, left:1.25in, right:1in ),
    margin: (left: 18mm, right: 18mm, top: 15mm, bottom: 15mm),
    numbering: "1",
    number-align: start,
  )
  set text(font: "Times New Roman", lang: "en")
  // Title row.
  align(center)[
    #block(text(weight: 600, 2em, title))
    #v(1em, weak: true)
    #date
  ]

// Title row.
  align(center)[
    #block(text(weight: 500, 1.5em, author))
    #v(1em, weak: true)
  ]

  // Main body.
  set par(justify: true)
  set enum(body-indent: 1em,indent: 1em)
  set math.mat(delim: "[")

  body
}