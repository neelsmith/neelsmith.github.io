---
layout: post
title: A simple text-interchange format
tags:
 - cts

---


[OHCO2](http://cite-architecture.github.io/ohco2/) is an abstract model for citable texts.  It views texts as a set of citable nodes with four distinct properties:

- each node belongs to a citation hierarchy
- each node belongs to a bibliographic hierarchy
- nodes are ordered within a given version
- the textual content of nodes may have simple text or any richer text structure

The value of this abstract model is knowing that any representation of a text  capturing these four properties is demonstrably equivalent under OHCO2.  In the Homer Multitext project, for example, we use the [cite manager utility](http://cite-architecture.github.io/citemgr/) to convert XML source documents to tabular formats and to directed graphs expressed in RDF, and choose whichever representation is most convenient for a given purpose.

The tabular form, with each row representing a leaf node of the OHCO2 text, is simple to read, well suited to many kinds of textual analysis, and would be especially easy to exchange outside the project.  For a handy convention, I would propose ordering five columns as follows:

1. text node urn
2. previous node sequence number
2. text node sequence number
4. following node sequence number
5. text content


The URN of a leaf node fully identifies the position of a leaf node in both the  the passage citation hierarchy and the bibliographic hierarchy.  Three columns give a sequence number in the tabular file for the node, its predecessor, and its successor. The first node in a text will have no predecessor, so the sequence number of its predecessor will be empty (null); similarly, the last node in a text will have successor, and the sequence number of its successor will be empty.  Strictly speaking, the sequence number alone would be sufficient, be we have found it to be very useful in processing to have previous/following numbers at hand, and they are trivial to generate


The last column with the node's text content can be any format you like: well-formed XML fragment, Markdown, or plain text, for example.

Here's an example of a node from an XML edition of an English translation of the *Iliad*, using "#" for a column delimiter.


    Urn#PrevIndex#SequenceIndex#NextIndex#TextContent
    urn:cts:greekLit:tlg0012.tlg001.hmt01:10.4#3#4#5#Sweet sleep did not hold him, as he pondered many things in his mind.
