#import "../pubmatter.typ"

#set page(width: 6in, height: auto, margin: 0.5in)

= Test 1: Author with corresponding: true

#let fm1 = pubmatter.load((
  authors: (
    (name: "Alice Smith", email: "alice@example.com"),
    (name: "Bob Jones", email: "bob@example.com", corresponding: true),
    (name: "Carol Davis", email: "carol@example.com"),
  ),
))

#let corresp = pubmatter.get-corresponding-author(fm1)
*Corresponding Author:* #corresp.name (#corresp.email)

#v(10pt)

= Test 2: No explicit corresponding, first author with email

#let fm2 = pubmatter.load((
  authors: (
    (name: "Alice Smith", email: "alice@example.com"),
    (name: "Bob Jones", email: "bob@example.com"),
    (name: "Carol Davis"),
  ),
))

#let corresp2 = pubmatter.get-corresponding-author(fm2)
*Corresponding Author:* #corresp2.name (#corresp2.email)

#v(10pt)

= Test 3: First author has corresponding: false, second has email

#let fm3 = pubmatter.load((
  authors: (
    (name: "Alice Smith", email: "alice@example.com", corresponding: false),
    (name: "Bob Jones", email: "bob@example.com"),
    (name: "Carol Davis"),
  ),
))

#let corresp3 = pubmatter.get-corresponding-author(fm3)
*Corresponding Author:* #corresp3.name (#corresp3.email)

#v(10pt)

= Test 4: No authors with email

#let fm4 = pubmatter.load((
  authors: (
    (name: "Alice Smith"),
    (name: "Bob Jones"),
  ),
))

#let corresp4 = pubmatter.get-corresponding-author(fm4)
*Corresponding Author:* #if corresp4 == none { [None found] } else { corresp4.name }

#v(10pt)

= Test 5: Empty authors list

#let fm5 = pubmatter.load((
  authors: (),
))

#let corresp5 = pubmatter.get-corresponding-author(fm5)
*Corresponding Author:* #if corresp5 == none { [None found] } else { corresp5.name }

