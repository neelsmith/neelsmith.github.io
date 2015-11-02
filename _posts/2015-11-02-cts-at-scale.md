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

It's comforting to realize that the tables and directed graphs I already work with could be imported into various data sources supported by Spark.  I've previously written CTS implementations relying on both SQL and SPARQL data sources.  With Spark, the same environment that provides SQL querying could also be used for graph queries and machine learning.  Isn't the prospect of running a PageRank measurement on a network of Iliadic passages and scholia to the *Iliad* irresitible?  Well, maybe that's just my personal predilection, but how easily could you address your favorite text analysis problem in Spark?  And with support for R and python APIs, in addition to the native JVM APIs, many digital humanists may already have preferred code libraries they could continue to use.

In the past, I've used XML, relational and directed graph representations of citable texts in distinct environments depending on how I needed to manipulate the texts.  With Spark's abstraction of the Resilient Distributed Dataset (RDD), we could apply any of these conceptual to a corpus of canonically citable texts within the infrastructure provided by Spark alone.
