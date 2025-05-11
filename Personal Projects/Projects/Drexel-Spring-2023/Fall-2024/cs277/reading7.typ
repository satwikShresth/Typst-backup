#import "/template.typ": project
#import "@preview/syntree:0.2.0": tree,syntree
#import "@preview/gviz:0.1.0": *

#show raw.where(lang: "dot-render"): it => render-image(it.text)

#show: project.with(
  title: "CS 277 - Reading 6",
  author: "Satwik Shresth",
  date: "November 4, 2024",
)

#set enum(body-indent: 2em,indent: 1em)
#set box(radius:1pt,stroke: 1pt,inset: 5pt)
#set text(size: 10pt)

#enum(spacing: 2em)[
    
  #enum(numbering: "a)",spacing: 5em)[
    Call Stack:
    
    - Call 1: B() at position 1 ('(')
      - Line (2): \*nextTerminal == '(' => true
      - Line (3): nextTerminal++ (now at position 2)
      - Line (4): firstB = B()  // Call 2
    
        - Call 2: B() at position 2 ('(')
          - Line (2): \*nextTerminal == '(' => true
          - Line (3): nextTerminal++ (now at position 3)
          - Line (4): firstB = B()  // Call 3
    
            - Call 3: B() at position 3 (')')
              - Line (2): \*nextTerminal == '(' => false
              - Line (12): Return makeNode1('B', makeNode0('e'))  // epsilon production
              - Returns to Call 2
    
        - Call 2
          - Line (5): firstB != FAILED && \*nextTerminal == ')' => true
          - Line (6): nextTerminal++ (now at position 4)
          - Line (7): secondB = B()  // Call 4
    
            - Call 4: B() at position 4 (')')
              - Line (2): \*nextTerminal == '(' => false
              - Line (12): Return makeNode1('B', makeNode0('e'))  // epsilon production
              - Returns to Call 2
    
        - Call 2
          - Line (10): Return makeNode4(...) (success)
          - Returns to Call 1
    
    - Call 1
      - Line (5): firstB != FAILED && \*nextTerminal == ')' => true
      - Line (6): nextTerminal++ (now at position 5)
      - Line (7): secondB = B()  // Call 5
    
        - Call 5: B() at position 5 ('ENDM')
          - Line (2): \*nextTerminal == '(' => false
          - Line (12): Return makeNode1('B', makeNode0('e'))  // epsilon production
          - Returns to Call 1
    
    - Call 1
      - Line (10): Return makeNode4(...) (success)
      \
      \
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
   Call Stack:
   
   - Call 1: B() at position 1 ('(')
    - Line (2): \*nextTerminal == '(' => true
    - Line (3): nextTerminal++ (position 2)
    - Line (4): firstB = B()  // Call 2
    
        - Call 2: B() at position 2 ('(')
          - Line (2): \*nextTerminal == '(' => true
          - Line (3): nextTerminal++ (position 3)
          - Line (4): firstB = B()  // Call 3
    
            - Call 3: B() at position 3 (')')
              - Line (2): \*nextTerminal == '(' => false
              - Line (12): Return makeNode1('B', makeNode0('e'))  // epsilon production
              - Returns to Call 2
    
        - Call 2
          - Line (5): firstB != FAILED && \*nextTerminal == ')' => true
          - Line (6): nextTerminal++ (position 4)
          - Line (7): secondB = B()  // Call 4
    
            - Call 4: B() at position 4 ('(')
              - Line (2): \*nextTerminal == '(' => true
              - Line (3): nextTerminal++ (position 5)
              - Line (4): firstB = B()  // Call 5
    
                - Call 5: B() at position 5 (')')
                  - Line (2): \*nextTerminal == '(' => false
                  - Line (12): Return makeNode1('B', makeNode0('e'))  // epsilon production
                  - Returns to Call 4
    
            - Call 4
              - Line (5): firstB != FAILED && \*nextTerminal == ')' => true
              - Line (6): nextTerminal++ (position 6)
              - Line (7): secondB = B()  // Call 6
    
                - Call 6: B() at position 6 (')')
                  - Line (2): \*nextTerminal == '(' => false
                  - Line (12): Return makeNode1('B', makeNode0('e'))  // epsilon production
                  - Returns to Call 4
    
            - Call 4
              - Line (10): Return makeNode4(...) (success)
              - Returns to Call 2
    
        - Call 2
          - Line (10): Return makeNode4(...) (success)
          - Returns to Call 1
    
    - Call 1
      - Line (5): firstB != FAILED && \*nextTerminal == ')' => true
      - Line (6): nextTerminal++ (position 7)
      - Line (7): secondB = B()  // Call 7
    
        - Call 7: B() at position 7 ('ENDM')
          - Line (2): \*nextTerminal == '(' => false
          - Line (12): Return makeNode1('B', makeNode0('e'))  // epsilon production
          - Returns to Call 1
          \
  ][
    Call Stack:
    
    - Call 1: B() at position 1 ('(')
      - Line (2): \*nextTerminal == '(' => true
      - Line (3): nextTerminal++ (position 2)
      - Line (4): firstB = B()  // Call 2
    
        - Call 2: B() at position 2 (')')
          - Line (2): \*nextTerminal == '(' => false
          - Line (12): Return makeNode1('B', makeNode0('e'))  // epsilon production
          - Returns to Call 1
    
    - Back to Call 1
      - Line (5): firstB != FAILED && \*nextTerminal == ')' => true
      - Line (6): nextTerminal++ (position 3)
      - Line (7): secondB = B()
    
        - Call 3: B() at position 3 (')')
          - Line (2): \*nextTerminal == '(' => false
          - Line (12): Return makeNode1('B', makeNode0('e'))  // epsilon production
          - Returns to Call 1
    
  ]
][
  ```c
  TREE Number() {
      TREE digitNode, numberNode, currentNode, tempNode;
      digitNode = Digit();
      if (digitNode == FAILED)
          return FAILED;
      
      currentNode = makeNode1('N', digitNode);
      
      while (1) {
          tempNode = Digit();
          if (tempNode == FAILED)
              break; 
          
          numberNode = makeNode1('N', tempNode);
          
          digitNode->rightSibling = numberNode->leftmostChild;
          currentNode = makeNode1('N', currentNode->leftmostChild);
          
          digitNode = numberNode->leftmostChild;
      }
      return currentNode;
  }
  
  TREE Digit() {
      char c = *nextTerminal;
      if (c >= '0' && c <= '9') {
          nextTerminal++; 
          return makeNode1('D', makeNode0(c));
      } else {
          return FAILED;
      }
  }
  
  ```
]