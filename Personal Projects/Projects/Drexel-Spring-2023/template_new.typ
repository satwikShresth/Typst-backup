#let project(title: "", author: (), date: none, body) = {
  set document(author: author, title: title)
  set page(
    //margin: ( top:1in, bottom:0.75in, left:1.25in, right:1in ),
    margin: (left: 18mm, right: 18mm, top: 15mm, bottom: 15mm),
    numbering: "1",
    number-align: start,
  )
  set text(size: 12pt,font: "Times New Roman", lang: "en")
  align()[
    #title
    #v(0.5em, weak: true)
    #author
    #v(0.5em, weak: true)
    #date
  ]

  align(center)[
    #v(1em, weak: true)
  ]

  set par(justify: true)
  set enum(body-indent: 1em,indent: 1em)
  set math.mat(delim: "[")

  body
}