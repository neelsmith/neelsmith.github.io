---
title: "1.0.1 release of greeklang foundational libraries"
layout: post
tags:
 - greeklang

---

This release fixes minor bugs in working with strings representing fractional values in Milesian notation.

Unlike the digits that can, depending on context, represent either integers or unit fractions, the unambiguous fraction characters for 1/2 and 2/3 require neither a trailing double quote nor, when the integer component of a complex Milesian string is empty, a preceding single quote.  While the library previously recognized examples like the following:

| Unicode string | Numeric value           |
|:---------------|:------------------------|
| δ"             | 4                       |
| δ'             | 1/4                     |
| δ"  δ'         | 4 1/4                   |
| δ" 𐅵 δ'       | 4 3/4 (= 4 + 1/2 + 1/4) |

it now also correctly recognizes the string `𐅵` in isolation (= 1/2).
