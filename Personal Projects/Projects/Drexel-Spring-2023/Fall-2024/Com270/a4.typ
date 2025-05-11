#import "/template.typ": project
#import "@preview/plotst:0.2.0": bar_chart, plot,axis

#show: project.with(
  title: "COM 270 - Assignment 4",
  author: "Satwik Shresth",
  date: "November 17, 2024",
)

#set enum(body-indent: 2em,indent: 1em)
#set box(radius:1pt,stroke: 1pt,inset: 5pt)
#set text(size: 10pt)

#v(15pt)
#figure(
  caption: [COVID-19 Vaccination Rates],
)[
  #table(
    columns: (69pt, auto, auto),
    inset: 7pt,
    align: horizon,
    table.header(
      [State],
      [At least One Dose (%)],
      [Fully Vaccinated (%)],
    ),
    [Delaware], [88%], [74%],
    [Maryland], [92%], [80%],
    [New Jersey], [93%], [77%],
    [New York], [92%], [79%],
    [Pennsylvania], [88%], [71%]
  )
  #v(-8pt)
  #h(139pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://usafacts.org/visualizations/covid-vaccine-tracker-states/")[
        #underline[
          USA Facts: Vaccine Tracker
        ]
      ]
    ]
  )
]
  
#v(6pt)

The table above (_Table 1_) presents the COVID-19 vaccination rates for selected states as of October 19, 2024.
Notably, Maryland, New Jersey and New York have vaccination rates exceeding 92% for at least one dose, with full vaccination rates at 77+%.
Delaware and Pennsylvania also show high vaccination uptake, with over 88% having received at least one dose and full vaccination rates of more than 71%.
The slightly lower second-dose vaccination rate in Pennsylvania may stem from its large rural population, where limited healthcare access and longer travel distances hinder follow-up vaccinations. Regardless, These figures indicate a strong commitment to vaccination efforts across these states, contributing to public health and safety.

#v(5pt)

#figure(
  caption: [Bar Chart Depicting Age-Wise COVID-19 Vaccination Rates],
)[
  #image("chart.svg")
  #v(-23pt)
  #h(298pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://usafacts.org/visualizations/covid-vaccine-tracker-states/")[
        #underline[
          USA Facts: Vaccine Tracker
        ]
      ]
    ]
  )
]