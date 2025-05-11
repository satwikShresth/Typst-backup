#import "/template_new.typ": *
#show: project.with(
  title: "CS 478 - Proposal",
  author: "Satwik Shresth",
  date: "January 29, 2025",
)

#set enum(body-indent: 1em,indent: 1em,spacing: .8em)
#set text(size: 10pt)
#v(3pt)


= Problem Statement

Drexel Students gang up on reddit to ask coop salary, sometimes run survey campaign

- Existing solution is a no code Qualtrics form with almost no validation
- Data is sometimes incorrect or difficult to query because of spelling mistake and other issues
- Salary information alone is not useful

= Solution

- Svelte/React Application
- Express Backend
- Robust validation
- Datagrid with query capabilites

= Current Progress

== Frontend Implementation
- Data Grid:
  - Sortable functionality
  - Styled components
  - Form with minimal validation
  - Autocomplete field integration
  - Notifications from Shadcn
  - Strongly typed fields for data integrity

== Backend Development
- Database schema design
- Data scraping for autocomplete functionality
- Zod validation implementation
- Object endpoints for:
  - Form data acceptance
  - Autocomplete query handling

= Project Goals (5-Week Timeline)

== Authentication
- Implementation using Drexel email verification:
  - No permanent email storage
  - 24-hour token generation
  - Verified review system with visual indicators
  - Contribution tracking

== Enhanced Data Grid
- Advanced querying capabilities:
  - Company-specific filters
  - Salary level categorization (Graduate/Undergraduate)
  - Rating system integration
- Interactive features:
  - Company profile page on row click
  - Anonymous review system
  - Verified contribution editing
#pagebreak()

== Improved Forms
- Enhanced validation:
  - Client-side error checking
  - Real-time feedback
  - Stronger data verification
- Reduced Fields
  - There are some fields that can be reduced
  - Use of offer page HTML to automatically fill the form fields

== Backend
- Complete rewrite (its prompted code initially generate for front-end testing)

== New Features
=== 3-Day Fire Page
Special feature for the critical period between co-op offer receipt and ranking deadline:
- Offer HTML page upload functionality
- Automated data extraction
- Real-time offer tracking grid
- Public visibility of acceptance/rejection data

= Overarching Goals

== Data Migration
- Complete port of existing data from Google Sheets
- Implementation of new data collection system
- Structured data validation and verification

== System Architecture
- Open-source implementation
- Security-first approach
- No storage of sensitive information
- Sustainable data collection methods
- Add rating from scraped data
