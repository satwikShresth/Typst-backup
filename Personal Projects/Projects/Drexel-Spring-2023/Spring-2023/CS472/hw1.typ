#import "/template.typ": project
#import "@preview/gviz:0.1.0": *

#show raw.where(lang: "dot-render"): it => render-image(it.text)
#show: project.with(
  title: "CS 472 - Homework 01",
  author: "Satwik Shresth",
  date: "April 12, 2024",
)
#set enum(body-indent: 1em,indent: 1em)

== Question 1 <question1>
\
*\#\#\# START STATE:* I am hungry! Objective: I want to get a cheap cheesesteak for lunch
and be able to eat it before my next class. Where am I now? Lets get started - Go to
(1)

#enum()[ //1
  My location is at the Drexel Computer Science Building, where should I eat?
  #enum(numbering: "a.")[
    My favorite lunch truck is a 20 min walk away
  ][
    There is a good truck that is a 5 min walk away
  ][
    There are also others that are acceptable within a 5-minute walk
  ]
][ //2
  Identify target lunch truck, when is my next class?
  #enum(numbering: "a.")[
    If next class > 1 hour, then walk to favorite lunch truck (1a), then goto (3)
  ][
    Otherwise, walk to closer lunch truck (1b), then go to (3)
  ][
    Exception condition:
    #enum(numbering: "i.")[
      Next class < 15 min? Go to TARGET-STATE-B (Go to class hungry)
    ][
      Otherwise, if I am at my favorite truck from (1a), go to the truck at (1b), otherwise pick another truck from (1c) and walk there. Now go to (3).
    ][
      All the truck posed some issue? Go to TARGET-STATE-B (Go to class hungry)
    ]
  ]
][ //3
  Arrive at lunch truck location
  #enum(numbering: "a.")[
    Is truck there? If so go to (4)
  ][
    Exception condition:
    #enum(numbering: "i.")[
      Truck is not there? go to (2c)
    ]
  ]
][ //4
  Food truck's operation status 
  #enum(numbering: "a.")[
    Is truck open? If so go to (5)
  ][
    Exception condition:
    #enum(numbering: "i.")[
      Is truck closed? If so go to (2c)
    ]
  ]
][
  I check if the food truck is sanitary and holds proper licence and permits
  #enum(numbering: "a.")[
    All the people inside the truck are wearing apron and covered their hair
  ][
     If all the licences are visible and not expired  goto (6.)
  ][
    Exception condition:
    #enum(numbering: "i.")[
      The Truck is not sanitary ? go to (2.)
    ][
       Licences are expired, goto (2.)
    ]
  ]
][
  Time to order food from the menu
  #enum(numbering: "a.")[
    Wait in queue if required and decide the dish you want to order
  ][
    Order your cheesesteak
  ][
    Confirm the order and total cost, then go to (7)
  ][
    Exception condition:
    #enum(numbering: "i.")[
      If time for wait queue > time left before next clas TARGET-STATE-B (Go to class hungry)
    ][
      Issue with you current order then go to (2c)
    ]
  ]
][
  Pay for food and collect receipt
  #enum(numbering: "a.")[
    Provide an acceptable mode of payment
  ][
    Recive a receipt and confirmation of the correct transaction, go to (8.)
  ][
    Exception condition:
    #enum(numbering: "i.")[
      No acceptable mode of payment availabe? go to (2c)
    ][
      If total fund you have < cost of cheesesteak, go to TARGET-STATE-B (Go to class hungry)
    ]
  ]
][
  Order has been passed on to the cook
  #enum(numbering: "a.")[
    Wait for the order to be prepared
  ][
    Pickup the order once called
  ][
    Collect your food and go to (9)
  ][
    Exception condition:
    #enum(numbering: "i.")[
      Something is wrong with the order, request for refund and goto (2b)
    ][
      Cook ran out of ingredients, request for refund and goto (2b)
    ][
      You waited for more than 10 mins for your order ? ask for refund and go to (2c)
    ]
  ]
][
  Order recived time, for lunch
  #enum(numbering: "a.")[
    Verify the contents of your food
  ][
    Have your meal and go to TARGET-STATE-A (I had a great cheesesteak lunch)
  ][
    Exception condition:
    #enum(numbering: "i.")[
      Contents are missing form your order, go to (8d)
    ][
      Time left before class < 5mins, secure food and go to TARGET-STATE-B (Go to class hungry)
    ]
  ]
]

*\#\#\# TARGET STATE:* I sit down at my next class
#enum(numbering: "a.")[
    I had a great cheesesteak lunch
  ][
    I am still hungry
]
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \
// \

== Question 2 <question2>
\
Graph representing states involved during software update
\ nodes -> states
\ edges -> state transitions

```dot-render
digraph software_update_protocol {
  rankdir=TB;
  ratio="fill";
  
  node [shape=box, fontname="Helvetica", fontsize=15];
  edge [fontname="Helvetica", fontsize=14];
  
  CheckUpdates [label="Check for Updates"];
  UpdatesAvailable [label="Updates Available"];
  DownloadUpdates [label="Download Updates"];
  NoUpdates [label="No Updates"];
  NoInternet [label="No Internet"];
  WaitRetry [label="Wait and Retry"];
  DownloadComplete [label="Download Complete"];
  PrepareInstall [label="Prepare Installation"];
  InstallUpdates [label="Install Updates"];
  Cleanup [label="Cleanup"]
  Retry [label="Retry ?"]
  RestartRequired [label="Restart Required?"];
  Reboot [label="Reboot"];
  InstallationComplete [label="Installation Complete"];
  ExitSuccess [label="Successfully Exited"];
  ExitFail [label="Exit due to Failure"];

  CheckUpdates -> UpdatesAvailable;
  UpdatesAvailable -> NoUpdates [label="No"];
  UpdatesAvailable -> DownloadUpdates [label="Yes"];
  DownloadUpdates -> DownloadComplete;
  DownloadComplete -> PrepareInstall;
  DownloadUpdates -> WaitRetry [label="Fail/Stall"];
  WaitRetry -> DownloadUpdates;
  PrepareInstall -> InstallUpdates;
  InstallUpdates -> RestartRequired [label="Succesful"];
  InstallUpdates -> Cleanup [label="Error"];
  Cleanup -> Retry;
  Retry -> PrepareInstall [label="Yes"];
  Retry -> ExitFail [label="No"];
  RestartRequired -> Reboot [label="Yes"];
  RestartRequired -> InstallationComplete [label="No"];
  Reboot -> InstallationComplete;
  InstallationComplete -> ExitSuccess;
  NoUpdates -> ExitSuccess [style=dotted];
  CheckUpdates -> NoInternet [style=dotted];
  NoInternet -> WaitRetry [style=dotted];
}
```