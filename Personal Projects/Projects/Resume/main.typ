#import "@preview/basic-resume:0.2.8": *

#let name = "Satwik Shresth"
#let phone = ""
#let location = ""
#let email = "satwikshresth@google.com"
#let github = "github.com/satwikShresth"
#let linkedin = "linkedin.com/in/satwik-shresth"
#let personal-site = "satwik.dev"
#let accent-color= "#26428b"
#let font= "Times New Roman"
#let paper= "us-letter"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: accent-color,
  font: font,
  paper: paper,
  author-position: center,
  personal-info-position: center,
)
#set text(10.2pt)
/*
 * Lines that start with == are formatted into section headings
 * You can use the specific formatting functions if needed
 * The following formatting functions are listed below
 * #edu(dates: "", degree: "", gpa: "", institution: "", location: "", consistent: false)
 * #work(company: "", dates: "", location: "", title: "")
 * #project(dates: "", name: "", role: "", url: "")
 * #certificates(name: "", issuer: "", url: "", date: "")
 * #extracurriculars(activity: "", dates: "")
 * There are also the following generic functions that don't apply any formatting
 * #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
 * #generic-one-by-two(left: "", right: "") 
 */

== Education

#edu(
  institution: "Drexel University",
  location: "Philadelphia, PA",
  dates: dates-helper(start-date: "Jan 2021", end-date: "June 2025"),
  degree: "Bachelor's of Science, Computer Science",
  // Uncomment the line below if you want edu formatting to be consistent with everything else
   consistent: true
)
- Cumulative GPA: *3.83/4.0* | Dean's List, A.J Drexel Merit Scholarship, 
- Relevant Coursework: Advanced Web Development, Concurrent Programming, Database Systems, Discrete Math, Linear Algebra, Machine Learning, Multivariable Calculus, Network Programming, Software Architecture

== Work Experience
#work(
  title: "Software Engineer Co-op",
  location: "Bala Cynwyd, PA",
  company: "Susquehanna International Group",
  dates: dates-helper(start-date: "September 2023", end-date: "March 2024"),
)
- Built a *C++* protocol metrics publisher that tails multiple files to process *5.8 billion* messages everyday
- Developed a concurrent *Python* Kafka consumer to process *500+ million* messages in 5 minutes, increasing speed by *9x*
- Developed a *FastAPI* proxy to integrate Grafana with an internal messaging platform via *RESTful API*
- Designed *CI/CD pipeline* for *Kubernetes* deployment and automated testing for projects on GitLab

#work(
  title: "Software Engineer Co-op",
  location: "Moorestown, NJ",
  company: "OPEX Corporation",
  dates: dates-helper(start-date: "September 2022", end-date: "March 2023"),
)
- Engineered async Windows IPC solution for *C++* applications, reducing latency by *80%*
- Developed *Python* tool integrating *15,000 pages* of *Doxygen* documentation into *C++* robot application
- Conducted end-to-end testing and integration of warehouse robotic systems to enhance operational reliability and uptime
#work(
  title: "Teaching Assistant",
  location: "Philadelphia, PA",
  company: "Drexel University",
  dates: dates-helper(start-date: "September 2022", end-date: "March 2025"),
)
- Mentored over *150 students* during weekly labs and tutoring hours, helping them grasp complex concepts
- Developed #link("https://github.com/satwikShresth/grader")[#text()[grading tool]] with *Python* and *JavaScript* to automate assignment compilation, reducing grading time by *80%*
- Created extensible *Python* plugin architecture enabling custom compilation workflows and automated assessment tools

== Projects
#project(
  name: "OpenMario",
  role: "",
  url: "openmario.com",
  dates: [*Stack*: Docker, Node.js, React.js, TanStack Query, Meilisearch, Postgres, Python] 
)
- *Open-source* platform for Drexel students to search job listings, courses, and professor ratings in one place
- Scraped and transformed *50K+ webpages* of raw data into a structured schema optimized for cross-reference features
- Implemented *millisecond-latency* search using *MeiliSearch* with zero user data storage for privacy and performance
- Achieved early product validation with *100+ weekly active users* and *220+ wage submissions* without marketing

#project(
  name: "Inspiration",
  role: "",
  url: "gitlab.cci.drexel.edu/inspiration",
  dates: [*Stack*: Docker, React, TanStack, S3, Celery, Redis, Postgres, Python, Playwright] 
)
- Led *5-student team* to build privacy-focused plagiarism detection system designed to replace MOSS at Drexel University
- Implemented *Celery* work-queues to balance workload, delivering results *10x faster* with improving user experience
- Developed *Rust extensions* for Python, speeding up computation-heavy algorithms by *2x*
- Designed self-managed *S3 infrastructure* for granular permissions and optimized streaming reducing backend load
- Designed graph-like relational database schema optimized for interactive visualizations

#project(
  name: "Shelved",
  role: "",
  url: "shelved.satwik.dev",
  dates:  [*Stack*: Docker, Node.js, Knex.js, Postgres, JavaScript, EJS]
)
- Led a team of *4* to design, implement and self-host a full-scale books and media tracking website using just JavaScript
- Built custom authentication with *JWTs*, secure password hashing, and anti-bot measures to ensure platform security
- Integrated multiple APIs, normalizing data to support social features like sharing, following, review and ratings
- Developed *LRU caching* that reduced API-dependent page load times by *65%* and improved overall site responsiveness

== Skills
- *Programming Languages*: C, C++, Go, Haskell, Java, JavaScript, Python, SQL, TypeScript
- *Frameworks*: Express, React.js, Redux, Next.js, TanStack, FastAPI, Svelte, SQLAlchemy, NumPy, Redux, Tanstack Query, Zod
- *Tools*: Docker, Kubernetes, Git, CI/CD (GitLab, Jenkins), Elasticsearch, Kafka, Redis, Postgres, Nginx, Vim, S3, Playwright

//#TODO: TA, at least link python tool you used in Github. Could use another bullet if possible
//#TODO: Shelved. Make bullet longer or combine bullets include that its a team project. NA if removing for spaxce
//#TODO: Library. Either replace with portfolio website or make bullets longer and flashier
//#TODO: Programming Languages:: Make alphabetic and add github actions
//#TODO: DONE: Openmario - add # of users and # of submissions achieved with free marketing + fact that its opensource
//#todo: if there's still whitespace at bottom after making all these edits, increase font size
//#TODO:DONE: replace Library OR Shelved with satwik.dev website. They look like the same thing to a non-tech recruiter
//TODO: add more fluff to Opex
//TODO:DONE : MOST IMPORTANT  - add senior design under experiences