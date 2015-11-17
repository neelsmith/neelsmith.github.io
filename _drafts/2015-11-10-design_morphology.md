---
title: "Designing a Greek morphological parser in 2015"
layout: post
tags:
 - morphology

---

I've begun work this fall on a system for parsing ancient Greek morphologically.  The decisions I'm forced to make in designing and implementing the system have already led me to think much more carefully about morphology as a linguistic system, as well as about how to work with morphological phenomena computationally.  I plan to elaborate on my experience in a series of posts here, and am beginning by making explicit my approach to two essential questions:

1. How does a system for parsing Greek morphology fit into a larger environment of digital scholarship?
1. How do we understand the relation of digital texts and tools for studying digital texts to a historical language like Greek?


## Planning a parser for a digital scholarly environment


In the 1980s when I first worked on the `morpheus` parser for Greek  with Joshua Kosman, I assumed (without ever articulating my assumption) that we needed a standalone program that could take a list of strings and output a list of strings expressing a morphological analysis.  This was several years before there would be a public internet, and in a 1980s UNIX environment, passing along (somewhat) structured string data seemed like a natural approach to "morphological analysis."

In 2015, we need to take account of the very different digital environment for today's networked scholarly enterprise.

Greek is a closed production.  Citable texts will be source.  (Use it in a Greek comp course?)

We also need to imagine a future where that graph is not expressed in terms of any of today's technologies.



## Digital tools for historical languages


I had never heard the term "corpus linguistics" when I began work on `morpheus`.

Lexicon must be tailored to the corpus, or selection of texts.

Rule set must be, too.







.wq
