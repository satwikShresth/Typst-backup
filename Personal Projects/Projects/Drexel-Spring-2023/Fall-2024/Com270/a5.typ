#import "./template.typ": project

#show: project.with(
  title: "COM 270 - Writing Assignment 2",
  author: "Satwik Shresth",
  date: "November 24, 2024",
)

#set enum(body-indent: 2em,indent: 1em)
#set box(radius:1pt,stroke: 1pt,inset: 5pt)
#set text(size: 10pt)

#v(7pt)


== Introduction

DragonKart is an innovative, student-centric grocery service tailored for students living on Drexel's University City Campus. Many students, particularly out-of-state and international students, face significant challenges accessing affordable groceries. Lack of transportation, unfamiliarity with local stores, and the high costs of existing delivery services are just a few of the many issues that contribute to their problems. These challenges often lead to limited food options, higher expenses, and added stress.

With DragonKart, we aim to alleviate these pain points by offering a weekly online ordering system and convenience of on-campus delivery. We will provide affordable access to a wide array of grocery items typically found in major retailers such as Walmart and Target.

== Background
#v(2pt)

As an international student who moved to the U.S. for education, I have experienced the unique challenges of adapting to a new environment, including accessing affordable groceries. This issue was particularly challenging for me, as without a personal vehicle my mobility was limited, making it very difficult to reach large supermarkets with competitive pricing and diverse product selections. 

#v(4pt)
#figure(
  caption: [Pie chart depicting student on campus owning personal vehicle],
)[
  #image("chart-2.svg")
  #v(-6pt)
  #h(139pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://sustainability.temple.edu/sites/sustainability/files/reports/transportation-reports/2019%20Transportation%20Survey%20Report.pdf")[
        #underline[
          Temple University Transportation Survey 2019
        ]
        #v(2pt)
      ]
    ]
  )
]
#v(0pt)

As shown in _Figure 1_, 91.2% of students on Temple University's campus did not have access to a personal vehicle. While the exact figure for Drexel might differ, it is reasonable to assume a similar trend.

Relying on public transportation while carrying heavy groceries is impractical due to limited storage, decreased mobility, and increased risk of injury, often forcing multiple trips to meet household needs. Ride-sharing services like Uber, as an alternative. are costly (\$15–\$30 per trip) and unreliable, with instances of driver cancellations after spotting groceries. 

#set text(size: 9pt)
#v(4pt)
#figure(
  caption: [Comparison of Grocery Delivery Services],
)[
  #table(
    columns: (auto, auto, auto,85pt,auto,auto),
    inset: 5pt,
    align: horizon,
    table.header(
      [Service],
      [In-Store Price],
      [Markup (Avg.)],
      [Delivery Fee],
      [Other Fees],
      [Notes]
    ),
    [Instacart], [High], [15%-50%],[\$3.99-\$9.99],[Service fees (~5%), tips],[Markup varies by store],
    [Amazon Fresh], [High], [None],[Free for orders over \$100+,\ \$6.95-\$9.95\ otherwise],[\$139/year,\ service fees + tips],[Best for bulk shopping; limited cost efficiency for smaller orders.],
    [Walmart+], [Competitive], [None],[\$7.95-\$9.95\ (Free for members)],[\$98/year,\ service fees + tips],[Free delivery for orders over \$35; limited availability in some areas.],
    [DragonKart], [Competitive], [None],[Free],[\$80/year],[On-campus delivery or pickup],
  )
  #v(-8pt)
  #h(139pt)
]
  
#set text(size: 10pt)

The table above (Table 1) highlights DragonKart's distinct advantages over other grocery delivery services. Unlike Instacart, which adds significant markups (15%-50%) and fees, DragonKart ensures students pay only store prices with no extra delivery charges. While Amazon Fresh and Walmart+ cater to bulk shoppers, their delivery fees and memberships may not suit students seeking flexible, low-cost options.

DragonKart’s \$80 yearly fee is predictable and cost-effective for frequent users, providing free delivery or pickup from nearby grocery stores. This eliminates the challenges of public transportation or costly ride-sharing while offering convenient, on-campus access to groceries.

Aligned with Drexel’s goals to enhance student life and sustainability, DragonKart reduces carbon emissions through consolidated deliveries and ensures affordable, accessible options for all students, fostering a greener and more student-friendly campus.

== Plan
#v(2pt)

Our proposed grocery service will operate through a website integrated with Drexel's existing student portal for seamless access. Students can create personalized grocery lists from a curated catalog that includes a wide range of products, including fresh produce, international food items, and essential household items.

The system will be open for orders throughout the week, allowing students to select their needed items at their convenience. Once the ordering window closes each week, we will consolidate the orders and purchase the items in bulk from partnered wholesalers. By buying in bulk, we can secure better prices, passing the savings directly to students.

The bulk orders will be transported to our on-campus storefront, strategically located in a university-approved space such as a vacant retail area or a section of the student center. Students can pick up their groceries during university working hours.

For added convenience, we will offer optional dorm delivery for a nominal fee, employing part-time student workers and creating job opportunities on campus. Additionally, we will provide an expedited service for urgent needs, ensuring students can access essential items promptly for an extra charge.

In terms of logistics, we will utilize university-approved vehicles for the transportation of goods, adhering to all insurance and liability requirements. We will ensure compliance with all relevant laws and university policies, including those related to retail operations, food safety, and employment.

#set text(size: 10pt)
#v(5pt)
#figure(
  caption: [Budget],
)[
  #table(
    columns: (auto, auto, auto),
    inset: 6pt,
    align: horizon,
    table.header(
      [Category],
      [Item],
      [Annual Estimates],
    ),
    [Startup Costs], [ Website Development and Maintenance ], [\$20,000],
    [], [Equipment (Shelves, Refrigeration, etc.)], [\$7,500],
    [], [Marketing and Branding], [\$2,000],
    [Operating Expenses], [Weekly Bulk Purchases], [\$250,000],
    [], [Part-Time Wages for Student Workers], [\$20,000],
    [], [Rent for Campus Space], [\$12,000],
    [], [Utilities (Electricity, Internet, etc.)], [\$6,000],
    [], [Transportation Costs (Fuel, Maintenance)], [\$1,200],
    [Projected Revenues], [Sales Revenue], [\$300,000],
    [], [Subscription Fees], [\$8,000],
    [], [Dorm Delivery Fees], [\$5,000],
  )
  #v(-8pt)
  #h(139pt)
]
#set text(size: 10pt)


We have developed a detailed budget (_Table 2_) that includes startup costs, operating expenses, and projected revenues. We expect to have 100 active subscribers who spend an average of \$250 every month. With our estimates, we also expect the number of users to increase by 10% every year. If we are correct, the service can become self-sustaining within the first academic year.

== Conclusion
#v(2pt)

In summary, establishing a student-centric grocery service on Drexel's University City Campus will significantly enhance the student experience by providing convenient, affordable access to a wide range of grocery items. This proposal addresses a critical need among students lacking transportation or familiarity with local stores. By acting on this proposal, the university will demonstrate its commitment to student well-being and innovation. We urge the administration to consider this proposal favorably and look forward to the opportunity to discuss it further.