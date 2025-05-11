#import "/template.typ": *
#show: project.with(
  title: "CS 478 - Personal Reflection",
  author: "Satwik Shresth",
  date: "Mar 17, 2025",
)

#set enum(body-indent: 1em, indent: 1em, spacing: .8em)
#set text(size: 12pt)
#v(7pt)

= Personal Reflection

+ What do you think went well regarding the overall process of you and your group working on the final project?

  - I chose to work individually, which wasn't ideal. Having at least one teammate would've been better.
  - Working alone gave me flexibility to make radical pivots throughout the project.

+ What do you think could've been improved about the overall process of working on the final project?

  - A more efficient frontend project structure was needed.
  - Using LLM code for CSS and initial structure was my biggest mistake. LLMs are only good for isolated solutions, not large projects.
    
+ What was the most difficult part of the project for you, and what made it difficult?

  - State management was challenging due to my lack of prior experience with similar concepts.
  - Frontend state management is complex, with state maintained in multiple places:
    #enum(numbering: "a)")[
      React Query Cache (Backend state)
    ][
      React Store (React state)
      - This includes all the sub-components
    ][
      Query String (Browser state)
    ]
      
  Before revealing the fourth state, here's the dependency relationship:
  
  #figure(
    caption: [3 States solution]
  )[
    #image("1.png", width: 70%)
  ]

  This configuration created an infinite loop. Despite instructing the router not to reload the document, I was confused when it still looped.

  The reason: React is highly reactive and perceives values as modified even when they're unchanged. Updating identical values still triggers useEffect callbacks.

  #figure(
    caption: [4 States solution]
  )[
    #image("2.png", width: 70%)
  ]

  I found the solution in the Tanstack Router documentation. React DOM recognizes user navigation between pages, which helped me implement this approach rather than simply checking for value changes, which would be less elegant solution.
  
+ Do you think your project's scope was appropriate for the time frame?
  - Both yes and no. I completed more work than would be reasonable for an assignment, motivated by creating portfolio pieces for job hunting.
  - I should have been more selective about features given my goal of a production-grade website.

+ Are you personally impressed by/happy with the project you made?
  - Very satisfied with my progress on a website I'd been planning for a year.
  - Especially happy with the OCR integration that made form filling easier than my original autocomplete concept.

+ Do you have any feedback about things you'd like to see from first half of the course to better prepare students for the final project, or during the second half of the course to better support groups while they're working on their projects?

  - I believe this course is excellent, and students who approach it with a genuine desire to learn will acquire numerous valuable skills.
  - The first part covers important concepts well.
  - I'd suggest adding React Hook Explained videos as required viewing.
  - In web development, expectations should extend beyond classroom concepts.

+ Do you have anything else you'd like to share?
  - About helpful resources:
    - I often needed to check the course website for help with deployment, but finding specific information was challenging.
    - A comprehensive course website with handpicked resources and clear navigation would be invaluable, even though creating one would require significant effort.
    
  - About asking effective questions:
    - I struggle with knowing what information to include when asking technical questions.
    - GitHub's issue system with templates would be beneficial for this class since students often ask questions with minimal context.
    - These templates could guide students on what information instructors need to properly address their issues.
    
  - About final presentations and project variety:
    - Most projects (including mine) featured similar components: forms, tables, and cards, with some using maps.
    - I believe this similarity stems from the steep learning curve of reactive frameworks, unlike previous web development class where there was more room for exploration.
    - React is a complex system that cannot be fully explored in just a few weeks.
    
  - My suggestions for future projects:
    - A comprehensive starter template would help students focus on creative aspects rather than setup, including:
      - Pre-configured routing framework (Tanstack, React Router v7, or Next.js) with developer tools
      - Authentication system with email, username, and password functionality
      - Basic CRUD operations for item management and user settings
      - Pre-built form with validation examples
      - Working examples of React store and context implementation
      - Docker-compose files with watch functionality and deployment configuration
      - Clear API documentation with inline guides
    - Since homework ultimately leads students toward building these components anyway, providing a starting point would allow for more innovation and less frustration