---
title: "Working with canonically citable texts at scale"
layout: post
tags:
 - cts
 - cite
 - spark
 - hcmid
 - hmt

---

I've been reading a lot about [Apache Spark](http://spark.apache.org/) recently, and am intrigued with its potential to open up distributed computing to a wider audience.  How many methods for literary analysis of large corpora might benefit from distributed processing and storage?

The CITE architecture project defines [an abstract model for citable texts](http://cite-architecture.github.io/ctsurn/ohco2/) (the OHCO2 model).  Thanks to this abstraction, in my work with the HC MID club and Homer Multitext project, I routinely generate multiple representations of texts from a single source, secure in the knowledge that they preserve all the OHCO2 properties of the original.
(Typically, I start from XML editions as sources for generating tabular and directed graph representations using the quick and dirty [`cite` library](http://cite-architecture.github.io/cite/).)  Since CTS URNs provide a notation for citing passages of text in the OHCO2 model, they can define keys in a relational model, nodes in a graph, or identifers to retrieve content (e.g., using the [Canonical Text Service protocol](http://cite-architecture.github.io/cts/), or in some kind of CTS URN-aware linked data service).

It's comforting to realize that the tables and directed graphs I already work with could be imported into a variety of data sources supported by Spark.

.wq
