#import "@preview/fontawesome:0.4.0": *
#import "@preview/modernpro-coverletter:0.0.4": *


#let Position = "Software Engineer"
#let Company = "Macquarie Group"
#let CompanyFull = "Macquarie Group"
#let CompanyAdd = "Philadelphia, PA"
#let hiring = "Hiring Manager,"

#show: coverletter.with(
  font-type: "PT Serif",
  name: [Satwik Shresth],
  address: [],
  contacts: (
    (text: [satwik.shresth\@drexel.edu], link: "mailto:satwik.shresth@drexel.edu"),
    (text: [(+1) 267 836-3920]),
    (text: [linkedin.com/in/satwik-shresth], link: "https://www.linkedin.com/in/satwik-shresth"),
    (text: [github.com/satwikShresth], link: "https://www.github.com/satwikShresth"),
  ),
  recipient: (
    start-title: [#hiring],
    cl-title: [],
    date: [],
    department: [Recruiting],
    institution: [#CompanyFull],
    address: [],
    postcode: [],
  ),
)

#set par(first-line-indent: 0em)
#set text(weight: "regular", hyphenate: false, size: 10pt)

#par(justify: true, first-line-indent: 2em)[
  I am writing to express my interest in the #Position at #Company. My introduction to programming was unconventional—growing up, computers were not a part of my environment and were often seen as a distraction.
]
So initially, I pursued Electrical Engineering at Drexel, focusing on a path that seemed secure and familiar. However, once I discovered programming and the broader world of information technology, everything changed. I quickly became passionate about coding and technology, teaching myself various languages and tools.

Since then, I've had the opportunity to work at a robotics company and a high-frequency trading (HFT) firm, gaining valuable experience in both co-ops.

#par(first-line-indent: 0em)[Highlights of my recent work at the HFT Firm]

- *Developed a C++ tool* to parse and record metrics from billions of daily transactions efficiently.
  - Designed an internal file format reader to tail multiple files to pre-process and validate the data.
  - Parsed the validated data into an internal message format, then used a *Python* tool to convert the formatted message to JSON for *Elasticsearch*.

- *Developed a Python Kafka client* with concurrency features, using a native C library to process over 500 million messages in under five minutes.
  - This tool reduced the security team's wait time by 3 hours by collecting specific message IDs independently, avoiding dependency on our faster but more restrictive C++ client.
  - This Kafka client was designed as a flexible template, allowing the security team to customize it for their needs

- *Refactored a Python error detection tool* to enhance its logging capabilities and publish errors to *Elasticsearch*, enabling detailed error analysis and visualization through *Grafana* for improved monitoring and troubleshooting.

- *Designed and implemented a Python proxy server* to transform raw error data from *Grafana* into well-formatted reports with permanent links and correct queries for snapshot views.
 - These reports are sent to a messaging application, streamlining error communication and enhancing visibility into error details.

- *Wrote Docker and GitLab CI/CD scripts* to automate the deployment of applications on a *Kubernetes* cluster, and set up a robust continuous integration pipeline with automated testing for each commit, ensuring consistent quality and reliability in deployments.

- *Developed Bash scripts* for managing development environments and tools like *Conda*, *Pip*, and *NPM*, which streamlined setup and reduced time spent on debugging environment issues, abstracting complexities for the team.

These projects have improved my technical skills and provided valuable insights into working in high-pressure environments. Additionally, as a teaching assistant at Drexel, I have enjoyed mentoring peers and sharing knowledge. In my free time, I learn new programming languages like *Go* and develop websites.

Currently, I am developing a platform for user data submission and display using *Python*, *FastAPI*, *TypeScript*, and *React.js*, featuring real-time query and auto-complete functionality. I designed a *SQLite* database using *SQLAlchemy* for efficient data handling and used *BeautifulSoup* to scrape and format data from Drexel archives for improved auto-complete suggestions.

Additionally, I am creating a machine learning model to rate companies and positions based on review data. This involves extracting, cleaning, and formatting data to train the model for providing insightful ratings.

I am excited about the opportunity to bring my skills and enthusiasm to #Company and believe my experience aligns well with the #Position. I look forward to potentially joining your team.

Thank you for considering my application.
