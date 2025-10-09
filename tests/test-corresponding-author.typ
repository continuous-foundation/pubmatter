#import "../pubmatter.typ"

#let fm-block = (fm) => {
  box(inset: 10pt, width: 100%, fill: luma(95%), stroke: 1pt + luma(200), [
  #set text(size: 7pt)
  #fm.authors
])
}

#set page(width: 6in, height: auto, margin: 0.5in)

= Test 1: Author with corresponding: true

#let fm1 = pubmatter.load((
  authors: (
    (name: "Alice Smith", email: "alice@example.com"),
    (name: "Bob Jones", email: "bob@example.com", corresponding: true),
    (name: "Carol Davis", email: "carol@example.com"),
  ),
))
#fm-block(fm1)

#let corresp = pubmatter.get-corresponding-author(fm1)
#pubmatter.show-authors(fm1)
#pubmatter.show-affiliations(fm1)
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

#fm-block(fm2)

#let corresp2 = pubmatter.get-corresponding-author(fm2)
#pubmatter.show-authors(fm2)
#pubmatter.show-affiliations(fm2)
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
#fm-block(fm3)

#let corresp3 = pubmatter.get-corresponding-author(fm3)

#pubmatter.show-authors(fm3)
#pubmatter.show-affiliations(fm3)
*Corresponding Author:* #corresp3.name (#corresp3.email)


#v(10pt)

= Test 4: No authors with email

#let fm4 = pubmatter.load((
  authors: (
    (name: "Alice Smith"),
    (name: "Bob Jones"),
  ),
))
#fm-block(fm4)

#let corresp4 = pubmatter.get-corresponding-author(fm4)
#pubmatter.show-authors(fm4)
#pubmatter.show-affiliations(fm4)
*Corresponding Author:* #if corresp4 == none { [None found] } else { corresp4.name }


#v(10pt)

= Test 5: Empty authors list

#let fm5 = pubmatter.load((
  authors: (),
))
#fm-block(fm5)
#let corresp5 = pubmatter.get-corresponding-author(fm5)
#pubmatter.show-authors(fm5)
#pubmatter.show-affiliations(fm5)
*Corresponding Author:* #if corresp5 == none { [None found] } else { corresp5.name }

