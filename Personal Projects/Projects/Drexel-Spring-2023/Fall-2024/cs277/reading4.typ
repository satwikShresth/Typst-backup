#import "/template.typ": project
#import "@preview/syntree:0.2.0": tree
#import "@preview/gviz:0.1.0": *

#show raw.where(lang: "dot-render"): it => render-image(it.text)

#show: project.with(
  title: "CS 277 - Reading 4",
  author: "Satwik Shresth",
  date: "October 27, 2024",
)

#set enum(body-indent: 2em,indent: 1em)
#set box(radius:1pt,stroke: 1pt,inset: 5pt)
#set text(size: 12pt)

#let Digit = "Digit" 
#let Number = "Number" 
#let Expression = "Expression" 
#let Identifier = "Identifier" 
#let UC = "Upper_Case_Letter"
#let LC = "Lower_Case_Letter"
#let Alpha = "Alphabet"
#let RC = "Rest_Character"
#let FC = "First_Character"
#let Rest = "Rest"


#enum()[
  Expression Trees
  #enum(numbering: "a)",spacing: 5em)[
    $ (x + 2) dot (x - y +4) $
    #{
      $
        tree(*,
          tree(+,x,1),
          tree(+,
            tree(-,x,y),
            4
          )
        )
      $
    }
  ][
    $ 1+2+3+4+5+6 $
    #{
      $
        tree(+,
          tree(+,
            tree(+,
              tree(+,
                tree(+,
                  1,
                2),
              3),
            4),
          5),
        6)
      $
    }
  ][
    $ 9 dot 8 + 7 dot 6 + 5$
    #{
      $
        tree(+,
          tree(+,
            tree(*,9,8),
            tree(*,7,6)
          ),
        5)
      $
    }
  ][
    $ 2^3^2 dot 5 -8 $
    #{
      $
        tree(-,
          tree(*,
            tree("^",2,tree("^",3,2)),
            5),
        8)
      $
    }
  ]
  \
][
  Preorder Expressions
  #enum(numbering: "a)",spacing: 1em)[
    $ * space + space x space 1 space + space - space x space y space 4$
  ][
    $ + space + space + space + space + space 1 space 2 space 3 space 4 space 5 space 6$
  ][
    $ + space + space * space 9 space 8 space * space 7 space 6 space 5$
  ][
    $ - space x space "^" space 2 space "^" space 3 space 2 space 5 space 8$
  ]
  \
][
  Postorder Expressions
  #enum(numbering: "a)",spacing: 1em)[
    $ x space 1 space + space x space y space - space 4 space + space x$
  ][
    $ 1 space 2 space + space 3 space + space 4 space + space 5 space + space 6 space +$
  ][
    $ 9 space 8 space * space 7 space 6 space * space + space 5 space +$
  ][
    $ 2 space 3 space 2 space "^" space "^" space 5 space * space 8 space -$
  ]
  \
][
  Grammer for C Identifiers\
  
  $<Identifier> space : space <FC> <Rest> | <FC>$
  
  $<FC> space : space <Alpha> | "__"$
  
  $<Rest> space : space <RC> | <Rest> <RC>$

  $<RC> space : space <Alpha> | "__" | <Digit>$
  
  $<Alpha> space : space <LC> | <UC>$
  
  $<LC> space : space a | b | c | ... | z$
  
  $<UC> space : space A | B | C | ... | Z$
  
  $<Digit> space : space 0 | 1 | 2 | ... | 9$
  \
  \
  \
  \
  \
  \
  \
  \
  \
][
  
  $ <Expression> space : space ( <Expression> )$
  
  $ "                      " | space <Expression> + <Expression>$

  $ "                      " | space <Expression> space – space <Expression>$
  
  $ "                      " | space <Expression> * <Expression>$
  
  $ "                      " | space <Expression> \/ <Expression>$
  
  $ "                      " | space <Number>$
  
  $ "                      " | space <"Identifier">$
  
  $ <Number> space : space <Digit> | <Number> <Digit>$
  
  $ <Digit> space : space 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9$
  
]