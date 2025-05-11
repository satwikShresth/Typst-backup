#import "/template_new.typ": project
#show: project.with(
  title: "Com 310 - Project #4",
  author: "Satwik Shresth",
  date: "March 8, 2025",
)

#set enum(body-indent: 1em,indent: 1em,spacing: .8em)
#set text(size: 12pt)
#v(0pt)

== Project Proposal: Open Mario
#v(-4pt)
== Overview

Open Mario is an innovative information sharing platform designed specifically for the Drexel students. This centralized database enables students to access and contribute to a growing repository of course reviews, academic notes, schedules, salary information, co-op experiences, and interview insights transforming individual student experiences into collective knowledge that benefits all.

== Purpose

Open Mario addresses three key challenges for Drexel students:

-  limited course visibility before registration
- difficulty finding suitable co-op opportunities
- salary expectation uncertainty 
 
By facilitating peer-to-peer knowledge sharing, the platform helps students make more informed decisions about their academic paths and co-op selections while providing valuable salary insights. This collaborative approach not only improves individual decision making..


== Market Demand

The demand for Open Mario is clearly demonstrated by the significant student engagement with existing informal solutions such as Reddit discussions and Discord communities, despite their inherent limitations of fragmented information and unstructured data.

Our platform directly addresses these shortcomings by providing a centralized repository with organized, verified content specifically tailored to Drexel University's distinctive Co-op program and academic structure. 

#v(2pt)
  #grid(
  columns: (auto,auto,auto),
  rows: (auto,auto),
  gutter: 3pt,
  figure(
    caption: "Popular r/Drexel post with 17k views"
  )[
    #image("reddit.png",width: 97%)
  ],
  
  figure(
    caption: [220+ Salary contributions]
  )[
    #image("salary.png",width: 99%)
  ]
)

#pagebreak()

== Introduction

Drexel University's Co-op program offers students invaluable real-world experience, yet this opportunity comes with significant challenges. The lack of transparency around co-op salaries, interview processes, and student experiences creates disadvantages for students making important academic and career decisions. 

Currently, students navigate this landscape with severely limited resources to evaluate fair compensation, prepare effectively for interviews, or gain meaningful insights into potential roles, companies, courses, or instructors. While Drexel’s career services provide aggregated salary data, the lack of detailed, company-specific salary information limits students' ability to make fully informed decisions about compensation and career opportunities.

Research indicates that pay transparency policies, particularly those offering cross-firm salary information, significantly empower job seekers by guiding them toward higher-paying employers. Such transparency often leads to increased negotiation power, higher salaries, better employee motivation, and overall productivity improvements (Cullen, 2023). 

This proposal introduces "Open Mario", an open-source platform dedicated to disrupting this status quo by enabling anonymous information sharing. The platform transforms isolated experiences into collective wisdom, ensuring each generation of Drexel students benefits from those who came before.

This document outlines the platform's targeted audience, key features, market analysis, challenge assessment and metrics for success.

#figure(
  caption: [Mock Design of the website]
)[
  #image("mockup.png",width: 73%)
]

== Audience
#v(-.3em)
=== Primary Audience
The platform is primarily designed to serve:
- *Drexel Students:* Undergraduate and graduate students across all disciplines

=== Secondary Audience
Secondary users who may benefit from the platform include:
- *Drexel Community*
  - Faculty seeking to understand student experiences
  - Academic advisors guiding students through program selection
  - Administration interested in student satisfaction and outcomes

== Purpose

Open Mario serves as a comprehensive information sharing ecosystem designed to:

- *Enhance Academic Decision Making:* Provide students with peer insights about courses, professors, and workloads before registration
- *Improve Co-op Outcomes:* Offer transparent salary data, interview experiences, and company reviews to empower students in their co-op search
- *Build Community Knowledge:* Develop a sustainable, student-driven knowledge base that evolves with changing academic and industry landscapes
- *Promote Transparency:* Foster an environment where open sharing of experiences benefits the entire Drexel community

== Key Features
#v(5pt)

#grid(
columns: (1fr, 1fr),
gutter: 1em,
[
== Smart Data Collection
- AI-Powered OCR
  - Extract data from offer letter screenshots
  - Handle multiple offers in an image
- Comprehensive Collection
  - Salary, position details, company info
- Anonymized Profiles
  - Privacy-protected student information
],
[
== Advanced Organization
- Multi-dimensional Classification
  - Hierarchical tagging system
- Intelligent Search
  - Queries using natural language
- Data Visualization
  - Interactive dashboards and trend analytics
])
/*
#v(15pt)
  #grid(
  columns: (auto,auto),
  rows: (auto,auto),
  gutter: 0pt,
  figure(
    caption: [220+ Salary contribution]
  )[
    #image("offer_many.png",width: 100%)
  ],
  figure(
    caption: [Processed images converted to draft]
  )[
    #image("draft.png",width: 100%)
  ]
)

*/

#v(7pt)
#figure(
  caption: [Image to text conversion]
)[
  #image("image_to_text.png",width: 115%,height: 14%)
]
#v(7pt)

#grid(
columns: (1fr, 1fr),
gutter: 1em,
[
== Academic Planning
- Course Scheduling
  - Automatic term planning around co-ops
- Plan of Study
  - Visual timeline of entire degree path
- Skills Mapping
  - Course to career relevance scoring
],
[
== Career Development
- Company Research
  - Detailed profiles and trend analysis
- Research Positions
  - Specialized academic opportunity database
- Career Trajectories
  - Visualization of potential career paths
])
#v(5pt)

#grid(
columns: (1fr, 1fr),
gutter: 1em,
[
== Community Knowledge
- Interview Experiences
  - Insights into hiring processes
- Position Reviews
  - Feedback from past co-op students
- Resume Examples
  - Anonymous successful applications
],
[
== Privacy & Personalization
- Robust Data Security
  - Multi-layered identity protection
- Custom Dashboards
  - User-specific interface preferences
- ML Recommendations
  - Tailored suggestions based on profile
]
)



== Market Analysis

#v(-3pt)
=== Current Landscape

The demand for Open Mario is supported by clear evidence:
- A popular Reddit thread with approximately 230 salary submissions and 17,000+ views shows significant student engagement
- Lack of any dedicated platform for students to share academic and career-related information
- Limited publicly available data for position-specific details and fair compensation comparisons
- Existing unofficial rating systems that don't integrate course reviews with workload information

#v(2pt)
#figure(
  caption: [240+ Reddit queries for co-op interviews]
)[ #image("reddit_.png",width: 90%)]
#v(2pt)

=== Competition Analysis
#v(1em)
#table(
  columns: (auto, auto, auto, auto),
  align: left,
  [*Platform*], [*Strengths*], [*Limitations*], [*Technical Differentiators*],
  [Reddit r/Drexel],
  [
    - Community-driven
    - Organic content
  ],
  [ 
  - Unstructured data
  - Difficult to search
  - Limited time frame for replies
  ],
  [
    - No persistent data structure
    - Limited by Reddit's system constraints
    - Needs user login
  ],
  [Shared Spreadsheet],
  [- Direct student information],
  [
    - Fragmented
    - Incomplete
    - Manually maintained
  ],
  [ 
  - No automation,\ data validation, \ or advanced data \ analysis capabilities
  ],
  [Discord Servers],
  [
    - Real-time discussion
    - Community moderation
  ], 
  [
    - Difficult to search past data
    - Not ideal to use for data collection
  ], 
  [
    - Limited capabilities \ for structured data 
    - Lack of permanent knowledge storage
  ]
)

#pagebreak()

== Unique Selling Points
#table(
  columns: (103pt, auto, auto),
  inset: 9pt,
  align: center,
  [*Unique Feature*], [*Description*], [*Technical Implementation*],
  [Student-Specific], [Tailored to the co-op program structure and student needs], [Custom categorization system with student-specific relationship models],
  [Document Recognition], [Automated information extraction from offers ], [Multi-stage system with preparation, recognition, verification workflows],
  [Open-Source Model], [Community contribution approach encourages continuous improvement], [Public code repository with integration systems, documentation, and contributor guidelines],
  [Comprehensive Information], [Goes beyond salary to include reviews, experiences, and academic materials], [Flexible data models with expandable structures and version control],
  [Personalized Suggestions], [Custom co-op suggestions based on individual profiles], [Hybrid recommendation system combining multiple approaches for balanced suggestions]
)


#heading(level: 2)[Challenge Assessment]

#table(
  columns: (auto, auto),
  inset: 6pt,
  stroke: none ,
  [*Challenge*], [*Solutions*],
  [*Critical mass of data*\
  Platform requires substantial initial data to demonstrate value], 
  [- Pre-seed with existing data sources
   - Implement contributor rewards
   - Create a data pipeline using a scraper],
  [*Knowledge continuity*\
  Higher user traffic creates maintenance challenges], 
  [
    - Maintain detailed documentation
    - Open-source the project
    - Keep the codebase easy to maintain
  ],
  [*Privacy concerns*\
  Contributors' identity should remain confidential], 
  [
    - Use strong encryption methods
    - No login-based authentication
  ],
  
  [*Document security*\
  Uploaded documents can contain sensitive information], 
  [
    - Automate PII detection/redaction
    - Process documents client-side
  ],
  [*Performance at scale*\
  Growing data volume impacts system responsiveness], 
  [
    - Design for horizontal scaling
    - Optimize search indexing
   ],
   
  [*Accessibility*\
  Users with diverse devices and accessibility needs], 
  [
    - Apply responsive design principles
    - Follow accessibility standards
    - Test with diverse user groups
 ],
  [*Code quality*\
  Rotating contributors risk technical debt accumulation], 
  [
    - Establish automated End-to-End testing
    - Document architectural decisions
  ]
)
#v(2pt)
#figure(
  caption: [OpenAPI Endpoint Documentation]
)[ #image("openapi.png",width: 86%)]
#v(2pt)

#heading(level: 2)[Success Metrics]

The platform's success will be measured through focused metrics that prioritize meaningful impact over scale:

#table(
  columns: (1fr, 2fr),
  inset: 8pt,
  stroke: none,
  align: (left, left),
  [*Metric Category*], [*Key Indicators*],
  [*User Impact*], 
  [
    - Improved decision confidence in course selection
    - Enhanced negotiation outcomes for co-op positions
    - Time saved in researching opportunities
  ],
  [*Community Value*], 
  [
    - Increase in quality of knowledge sharing between students
   - Cross-program information accessibility
   - Sustained community contribution
  ],
  [*Implementation Threshold*], 
  [
   - Small-scale utility validates the investment
   - Quality of impact is prioritized over quantity of users]
)

#heading(level: 2)[Conclusion]

Open Mario addresses a critical information gap in Drexel students' experience through its innovative, community-driven approach. By combining collaborative knowledge sharing with technical innovation, the platform enhances students' decision-making processes regarding courses, co-ops, and career planning.

The platform's strength lies in its focused value proposition: providing meaningful impact for students navigating their educational and professional journeys. Success will not be measured solely by widespread adoption, but rather by the substantive benefits delivered to its users. Even if a small number of students experience improved outcomes, Open Mario will have fulfilled its purpose and justified the investment.

#heading(level: 2)[References]

+ #link("http://www.nber.org/papers/w3106")[#underline[Cullen, Z. B. (2023), Is Pay Transparency Good?, National Bureau of Economic Research]]
+ #link("https://github.com/satwikShresth/OpenMario")[#underline[Github: OpenMario Repository]]
+ #link("https://docs.google.com/spreadsheets/d/1_gYXFEFspAQjt7NSUqkUUhw05WG2SpHGHexMjgvAs8E/edit?usp=sharing")[#underline[Google Sheet: Anonymous Co-op Salary Sheet]]
+ #link("https://tesseract.projectnaptha.com/")[#underline[OCR: Tesseract.js OCR Tool]]
+ #link("https://drexel.qualtrics.com/jfe/form/SV_8CvuFJepHkb12Rg")[#underline[Qualtrics Form: Anonymous Co-op Form]]
+ #link("https://www.reddit.com/r/Drexel/comments/195bo0d/anonymous_coop_salary")[#underline[Reddit: Anonymous Co-op Salary Discussion]]

#let checkbox(checked: false) = {
  if checked {
    [#box(
      width: 12pt,
      height: 12pt,
      stroke: black,
      radius: 2pt,
      align(center+horizon)[✓]
    )]
  } else {
    [#box(
      width: 12pt, 
      height: 12pt,
      stroke: black,
      radius: 2pt
    )]
  }
}
== Appendix A: Development Roadmap

=== Phase 1: Core Platform (Month 1)
#checkbox(checked: true) Advanced form submission with OCR and autocomplete functionality \
#checkbox(checked: true) Secure database design and implementation \
#checkbox(checked: true) Table sharing capability with unique links \
#checkbox(checked: true) Comprehensive search and filtering capabilities \
#checkbox(checked: true) Data scraping integration from relevant sources \
#checkbox(checked: true) Initial user interface design and testing \
#checkbox(checked: true) Enhanced search with multiple parameters \
#checkbox() Alpha release for limited user testing and feedback \

=== Phase 2: Advanced Features (Months 2-3)
#checkbox() Company and position review functionality \
#checkbox() Interview experience sharing module \
#checkbox() Data visualization for salary comparisons \
#checkbox() Resume upload and profile integration feature \
#checkbox() Beta release with expanded user access \

=== Phase 3: Intelligence Layer (Months 4-6)
#checkbox() Machine learning recommendation system \
#checkbox() Advanced analytics dashboard \
#checkbox() API development for data researchers \
#checkbox() Integration with other student resources \
#checkbox() AI-powered course scheduling assistant \
#checkbox() Performance optimization and scaling \
#checkbox() Full public release \