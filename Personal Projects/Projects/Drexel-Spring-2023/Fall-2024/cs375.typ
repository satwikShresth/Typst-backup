#import "./Com270/template.typ": project
#show: project.with(
  title: "CS 375 - Individual Reflection",
  author: "Satwik Shresth",
  date: "December 9, 2024",
)

#set enum(body-indent: 1em,indent: 1em)
#set text(size: 11pt)


#enum(numbering: "1)",spacing: 13pt)[
  === What do you think went well regarding the overall process of you and your group working on the final project?
  
  - Docker Compose Setup
    - No one had to deal with "it's not working on my machine"
    - Database setup, migrations and seeding was very smooth
    - Testing each other's code via branch switching was very easy as we can just include `--build` to rebuild the container reflecting the latest changes
    - Deployment was painless - just `docker compose up` and everything works
][
  === What do you think could’ve been improved about the overall process of working on the final project?
  
  - A little more communication between the five of us would have been better
][
  === What was the most difficult part of the project for you, and what made it difficult?
  
  - The trickiest part was handling data from different APIs and normalizing it for the front-end
  - Problem:
    - One API needed a key and the other did not 
    - Both the endpoints had their own special way of querying and returned unique key-value pairs
  - Solution
    - I built a base Service class and each db source got their own derived Service class
    - Both classes fetched, normalized and returned data, abstracting their complexity and provide uniformity
    - Both had same methods so we could get the correct data from the correct source without actually hard-coding specific scenarios
][
  === Do you think your project’s scope was appropriate for the time frame (e.g. not too few or too many requirements)? If not, what would you have wanted to change about your proposal/contract?
  
  - I think it was good, we did not feel overly burdened or that we don't have anything to work on
][
  === Are you personally impressed by/happy with the project you made? Why or why not?
  
  - Personally, I think I have pushed my limits while making this project
    - I am not a web dev, this is my first time learning JavaScript 
    - It is surprisingly easy language to learn
    - I am very happy with the knowledge and skills I picked up throughout this quarter
][
  === Do you have any feedback about things you’d like to see from first half of the course to better prepare students for the final project, or during the second half of the course to better support groups while they’re working on their projects?
  
  My perspective on improving the course:
  
  - My case for including Docker in the course:
    - During our final presentations, I noticed one of the teams struggling with local dev deployment trying to restart three different components. It looked messy compared to what we do for development startup i.e. `docker compose up --watch`, and everything is up and running
    - I think adding a basic Docker guide to the course would be super helpful.
    - Not necessarily deep diving into it, but just enough to show students how to write their own Docker configuration files.
  
  - Final projects should cap group size at 3 members because:
    - Work contribution becomes unclear and harder to track
    - Some members take a backseat while others handle most work
    
  - While our current project contract outlines overall responsibilities, having detailed task breakdowns per student would be better.
    - Decoupled features which do not depend on each other and can be integrated with the rest of the application later
    - For example:
      - Member 1: handle authentication:
        - Login/Signup pages with fetch requests and other js features
        - Login/Signup endpoints, database interactions
        - Auth middleware for protected endpoints
      - Member 2: handle 1 of the outside db interaction:
        - Create the page to display the data fetched from the outside API
        - create endpoint which fetch outside data and index it to the db
][
  === Do you have anything else you’d like to share?
  
  - The final presentations were actually fun.
  - Sure, maybe the "best project" votes lean towards slick styling and smooth talking, but it gives everyone a voice and makes the whole event more engaging and fun.

]