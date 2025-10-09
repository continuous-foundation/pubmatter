#import "../pubmatter.typ"

// Test with equal contributors
#let fm = pubmatter.load((
  title: "Test Equal Contributors",
  authors: (
    (
      name: "Alice Smith",
      email: "alice@example.com",
      equal-contributor: true,
      affiliations: ((name: "University A", index: 1),),
    ),
    (
      name: "Bob Jones",
      email: "bob@example.com",
      equal-contributor: true,
      affiliations: ((name: "University B", index: 2), (name: "Research Institute C", index: 3)),
    ),
    (
      name: "Carol Davis",
      email: "carol@example.com",
      affiliations: ((name: "University A", index: 1),),
    ),
  ),
))

#set page(width: 6in, height: 4in, margin: 0.5in)
#pubmatter.show-title(fm)
#pubmatter.show-authors(fm)
#pubmatter.show-affiliations(fm)

#pagebreak()

= Test with show-equal-contributor: false

#pubmatter.show-authors(show-equal-contributor: false, fm)
#pubmatter.show-affiliations(show-equal-contributor: false, fm)

