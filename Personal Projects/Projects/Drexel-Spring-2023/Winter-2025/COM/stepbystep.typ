#import "/template_new.typ": project
#import "@preview/codelst:2.0.0": *

#show: project.with(
  title: "Com 310 - Project #2",
  author: "Satwik Shresth",
  date: "Fedbruary 10, 2025",
)

#set enum(body-indent: 1em,indent: 1em,spacing: .8em)
#set text(size: 10pt)
#set par(justify: true)
#v(2pt)

= Step-by-Step Guide To Hosting Your First Website

Welcome to this step-by-step guide on hosting your own website using a Virtual Private Network. In this guide you will learn to manage every aspect of your site, from choosing a reliable hosting provider to setting up domain names.

This guide will walk you through each stage carefully, helping you understand the ins and outs of hosting. Whether you are launching a personal blog or a full scale business site, these steps will give you all the necessary information to host your first website online.

#set heading(numbering: "1.")
= Purchase a Domain Name

Purchase is technically a misnomer as domains are rented through Domain Name Registrars (DNRs).
Porkbun is strongly recommended for its affordability, reputation, and user friendly interface.

#figure(
  caption: [Understanding URL],
)[
#image("url.png",width: 34%)
  #v(-9pt)
  #h(254pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://findtodaysnotes.wordpress.com/internet-terminologies-related-to-internet-protocol-domain-name/")[
        #underline[
            "Terminologies related to Internet"
        ]
      ]
    ]
  )
]

== Domain Selection Tips
- Single-word domains (e.g., bread.com) are typically taken
- Avoid "premium" domains that cost thousands to rent
- Consider less popular Top Level Domains (TLDs) like .info for cost savings

_Be aware that some DNRs might request SSN verification for fraud prevention. If you encounter SSN requests, switch to a different registrar._

= Rent a Server

Your website will be hosted on a shared server instance. This means sharing computational resources with other users. 

In this guide we will be using Digital Ocean as our Virtual Private Server (VPS) provider.

== Server Configuration Steps
#grid(
  columns: (1fr),
  gutter: 1em,
  [
    === Location Selection
    Choose a server location closest to you:
    - Choose the closest Region from your location
    - New York is recommended for Philadelphia residents
  ],
  [
    === Operating System
    - Select Debian (latest version 12)
  ],
  [
    === Server Specifications
    - Choose "Shared CPU" 
    - For "CPU Options" Choose the most economical option for this guide
  ],
  [
    === Authentication Method
    - SSH key method is recommended
    - Follow this guide to setup the ssh key #link("https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/")[#underline[How to Add SSH Keys New or Existing Droplets]]
  ]
)

#figure(
  caption: [Server Configuration],
)[
  #image("ss.png",width: 58%)
  #h(155pt)
]

= Network Configuration and Domain Management

#figure(
  caption: [How DNS is resolved ?],
)[
#image("dns.png",width: 53%)
  #v(-9pt)
  #h(155pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://medium.com/@soulaimaneyh/discover-what-behind-typing-google-com-into-your-browser-and-pressing-enter-detailed-60bf2679470b")[
        #underline[
            "How DNS is resolved?"
        ]
      ]
    ]
  )
]


== Understanding IP Addresses and DNS
When setting up your server, you will encounter two fundamental networking concepts:
#block(
  inset: (left: 1em),
  fill: luma(240),
  [
    - IP addresses : Numerical identifiers that computers use to find each other on the internet.
    - Domain names : Human readable addresses that map to these IP addresses. 
  ]
)

== Domain Name Configuration
Digital Ocean provides reliable nameserver services that you can use by updating your domain's settings at your registrar with:

#block(
  inset: (left: 1em),
  fill: luma(240),
  [
    - ns1.digitalocean.com
    - ns2.digitalocean.com
    - ns3.digitalocean.com
  ]
)

Note: Here is a step by step guide to change nameservers on #link("https://kb.porkbun.com/article/22-how-to-change-nameservers")[#underline[Porkbun]] 

= Configuring DNS Records

== Understanding DNS Records and IP Addressing

DNS records create the connection between your domain name and your server's IP addresses. You will need to configure these through Digital Ocean network console. Most of the options will be auto filled for you.
Each record serves a specific purpose in directing traffic to your server.

#table(
  columns: (5em, 8em, 16em, auto),
  inset: 4pt,
  align: left,
  [*Record Type*], [*Host*], [*Value*], [*Purpose*],
  [`A`], [Leave blank], [Your IPv4], [Maps your domain to your server's IPv4 address, allowing IPv4 users to reach your site],
  [`AAAA`], [Leave blank], [Your IPv6], [Maps your domain to your server's IPv6 address, enabling IPv6 connectivity],
  [`CNAME`], [`www`], [Your domain], [Ensures www.yourdomain.com redirects to yourdomain.com],
  [`TXT`], [`_dmarc`], [`v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s`], [Email security policy that helps prevent email spoofing],
  [`TXT`], [`*._domainkey`], [`v=DKIM1; p=`], [Additional email authentication configuration],
  [`TXT`], [Your domain], [`v=spf1 -all`], [Specifies that your domain doesn't send email]
)

= Setting up your server

The moment your server becomes accessible on the internet, it becomes a potential target for automated scanning and attacks. Therefore, our first steps focus on securing the server while establishing proper access methods. Begin by connecting to your server using SSH:

```bash
ssh root@_IP_   # Replace _IP_ with your server's IPv4 address
```

Upon your first connection, you'll be prompted to change the root password that was emailed to you. Choose a strong password and store it securely.

Your next crucial step is updating the system's security packages. In Debian, this is accomplished with:

```bash
apt update && apt upgrade
```

This command first updates the package list (apt update) and then upgrades all installed packages to their latest versions (apt upgrade), ensuring you have the most recent security patches.

= Setting up a firewall


#figure(
  caption: [Firewall],
)[
#image("firewall.png",width: 63%)
  #v(-9pt)
  #h(254pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://www.wallarm.com/what/the-concept-of-a-firewall")[
        #underline[
            "The concept of firewall"
        ]
      ]
    ]
  )
]


== The Challenge of Server Security

When your server connects to the internet, it becomes part of a vast network where millions of automated programs constantly scan for vulnerable systems. Think of your server as a house with many doors (ports), each potentially leading to different rooms (services). Just as you wouldn't want to leave every door of your house unlocked and open to the street, you shouldn't leave all your server's ports exposed to the internet.


== Accessing the Creation Interface
Begin by navigating to the control panel's *Create* menu, located in the upper-right corner. From here, select *Cloud Firewalls* to initiate the creation process. You'll be presented with a form where you'll enter your firewall's name in the designated *Name* field.

#block(
  inset: (left: 1em),
  fill: luma(240),
  [
    - Upon creation, the system automatically configures four default rules. These rules establish a baseline security structure while maintaining essential functionality.

    - After establishing your rules, proceed to the *Apply to Droplets* field to specify which Droplets require protection. You can:
      - Search for Droplets by name, IP address, or resource tag
      - Leave the field empty for later assignment
]
)

Complete the setup by clicking *Create Firewall* after configuring your rules and selecting your Droplets.
Post creation management occurs through the *Firewalls* tab in the *Networking* section of the control panel.

#figure(
  caption: [Create Options],
)[
#image("create.png",width: 81%)
  #v(-9pt)
  #h(254pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://docs.digitalocean.com/products/networking/firewalls/how-to/create/")[
        #underline[
            "Create Firewall"
        ]
      ]
    ]
  )
]


= Setting Up Your Web Server

We will use Caddy, a modern web server that excels at serving static content and provides automatic HTTPS encryption.

== Installing and Configuring Caddy

First, we will install Caddy following their official installation instructions.

Copy and paste the following commands in your terminal

#block(
  inset: (left: 1em),
  fill: luma(240),
  [
    ```bash
    sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
    sudo apt update
    sudo apt install caddy
    ```
])
After installation, verify that Caddy is running as a system service:

#block(
  inset: (left: 1em),
  fill: luma(240),
  [
```bash
systemctl status caddy
```])

You should see "active (running)" in the output. To test the default configuration:

#block(
  inset: (left: 1em),
  fill: luma(240),
  [
```bash
curl localhost:80
```
])

This should display Caddy's default page from `/usr/share/caddy/index.html`.

=== Organizing Your Website Files

For security and organization, we will store your website files in a dedicated directory under `/srv`. This location follows Linux filesystem hierarchy conventions and provides a clean separation between system and website files.

Create your site's directory and set appropriate permissions:

#block(
  inset: (left: 1em),
  fill: luma(240),
  [
    ```bash
    # Create the directory (replace DOMAIN with your actual domain)
    sudo mkdir /srv/DOMAIN
    # Set ownership to your root account
    sudo chown root:root /srv/DOMAIN
    ```
])

This configuration ensures that:
- Your website files are in a standard location
- The web server can read but not modify your files
- Your home directory can remain private

=== Configuring Caddy
#figure(
  caption: [Caddy Behavior],
)[
#image("caddy.png",width: 45%)
  #v(-9pt)
  #h(254pt)
  #text(
    size: 9pt,
    [
      Source: #link("https://bradleyjkemp.dev/post/simple-a/b-testing-with-caddy-and-plausible-analytics/")[
        #underline[
            "Simple A/B testing with Caddy"
        ]
      ]
    ]
  )
]

Caddy's configuration lives in `/etc/caddy/Caddyfile`. The Caddyfile uses a straightforward syntax to specify how your website should be served. Here's how to configure it:

#block(
  inset: (left: 1em),
  fill: luma(240),
  [
    ```bash
    sudo vim /etc/caddy/Caddyfile
    ```
])

Update the configuration to serve your domain:

#block(
  inset: (left: 1em),
  fill: luma(240),
  [
  ```
  DOMAIN, www.DOMAIN {
      # Set the path to your website files
      root * /srv/DOMAIN
  
      # Enable static file serving
      file_server
  
      # Configure request logging
      log {
          output file /var/log/caddy/DOMAIN.log
      }
  }
  ```
])

After making changes, reload Caddy:

#block(
  inset: (left: 1em),
  fill: luma(240),
  [
  ```bash
  sudo systemctl reload caddy
  ```
])

If you encounter errors, you can:
1. Check the status: `systemctl status caddy.service`
2. Auto-format the Caddyfile: `sudo caddy fmt --overwrite`
3. Perform a full restart if needed:
#block(
  inset: (left: 1em),
  fill: luma(240),
  [
    ```bash
    sudo systemctl stop caddy
    sudo systemctl start caddy
    ```
  ])

Try curling your domain name. You will need to either pass the -L flag or add https:// before the domain, because Caddy will redirect all HTTP requests to HTTPS, and curl doesn’t follow redirects and uses HTTP by default.

If the curl command works, you should see your site files. Now try visiting your domain in a browser. You should see the same files. You should also see them if you visit the www version of your domain.

Congratulations — you are now hosting a site on the public internet.
