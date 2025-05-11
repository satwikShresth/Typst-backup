#let pro-letter(

  // sender information - all fields are optional, only use what you need
  sender: (
    name: none,
    company: none,
    street: none,
    city: none,
    state: none,
    zip: none,
    phone: none,
    email: none,
  ),

  // recipient information - all fields are optional, only use what you need
  recipient: (
    name: none,
    company: none,
    position: none,
    street: none,
    city: none,
    state: none,
    zip: none,
    phone: none,
    email: none,
  ),

  // date of letter (optional)
  date: none,

  // subject line of letter (optional)
  subject: none,

  // salutation line (optional)
  salutation: "Dear Kelly,",

  // closing line (required)
  closing: "Sincerely,",

  // signer line (required)
  signer: none,

  // attachments line at bottom of letter (optional)
  attachments: none,

  // set to true if you want a notary public acknowledgement page
  notary-page: false,

  // text settings
  font: "Libertinus Serif",
  size: 11pt,
  weight: "light",
  strong-delta: 300,
  lang: "en",

  // page settings
  paper: "us-letter",
  margin: 1in,

  // and finally the content
  body) = {

  // --------------------------------
  // | Setup layout, style, options |
  // --------------------------------

  set page(
    paper: paper,
    margin: margin,
    footer: align(right, context(counter(page).display("1 of 1", both: true))),
  )

  set par(
    justify: true,
  )

  set text(
    font: font,
    size: size,
    weight: weight,
    fallback: false,
    alternates: false,
    lang: lang,
  )

  set strong(
    delta: strong-delta,
  )

  // -------/att-------------
  // | Helper functions |
  // --------------------

  // Helper for our space between elements
  let vspace = { v(0.5em) }

  // Helper for baseline underlines
  let blul(length) = box(line(length: length, stroke: 0.5pt))

  // Helper to make sure address has all the fields we'll reference
  let normlize-address(address) = {
    (
      name: address.at("name", default: none),
      position: address.at("position", default: none),
      company: address.at("company", default: none),
      street: address.at("street", default: none),
      city: address.at("city", default: none),
      state: address.at("state", default: none),
      zip: address.at("zip", default: none),
      phone: address.at("phone", default: none),
      email: address.at("email", default: none),
    )
  }

  // A function to render an address block.
  let show-address(address: (:)) = {
    // Extract parameters with default none values to handle missing elements.
    let a = normlize-address(address)

    // Render the address, line by line, only including non-none elements.
    if a.name != none { a.name + "\n" }
    if a.position != none { a.position + "\n" }
    if a.company != none { a.company + "\n" }
    if a.street != none { a.street + "\n" }
    if a.city != none and a.state != none and a.zip != none {
        a.city + ", " + a.state + " " + a.zip + "\n"
    } else if a.city != none and a.state != none {
        a.city + ", " + a.state + "\n"
    } else if a.city != none and a.zip != none {
        a.city + " " + a.zip + "\n"
    } else if a.city != none {
        a.city + "\n"
    } else if a.state != none {
        a.state + "\n"
    } else if a.zip != none {
        a.zip + "\n"
    }
    if a.phone != none or a.email !=none { v(-0.4em)}
    if a.phone != none { link("tel:"+a.phone, a.phone) + "\n" }
    if a.email != none { link("mailto:" + a.email, a.email) + "\n" }
    vspace
  }

  // Top matter
  align(right)[
    #show-address(address: sender)
  ]
  if date != none { [#date #vspace] }
  show-address(address: recipient)

  // Main body
  if salutation != none { [#salutation #vspace] }
  [#body #vspace]
  [Sincerely,#vspace]
  [#signer #linebreak()]
  [BSc Computer Science #linebreak()]

  // --------------------------
  // | Notary acknowledgement |
  // --------------------------

  }
}
