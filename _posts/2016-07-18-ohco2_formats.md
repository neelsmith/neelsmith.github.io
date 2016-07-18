---
layout: post
title: "Choosing a format for OHCO2 texts"
tags:
 - cts

---

>**One-sentence summary**: use simple delimited-text formats to exchange corpora of citable texts.

The abstract model of citable texts as an *Ordered Hierarchy of Citation Objects* (the [OHCO2 model](http://cite-architecture.github.io/ohco2/)) has been invaluable  within the Homer Multitext project over the past decade.  Depending on what we want to accomplish, we transform our texts to different representations (table, tree, generic directed graph) that verifiably fully preserve the semantics of OHCO2.  I'm offering a brief explanation of why we might choose one format or another when exchanging corpora of citable texts with others; it may be useful for projects trying to make similar decisions.


At the recent DH2016 conference in Kraków, I had valuable conversations about this question, especially with Thomas Köntges and Chris Blackwell. Of course the [CTS protocol](http://cite-architecture.github.io/cts/) (which was more prominent than ever in Kraków) already defines a service for retrieving passages by canonical reference, so theoretically you could start from the first citable node of a work and collect every successive node to create a complete text, but that's using an eye dropper to fill a tanker truck.  Last Monday, Thomas, Chris and I proposed a simple [delimited text format](http://neelsmith.github.io/2016/07/11/textformats/) in five columns (82XF).  As I noted in the initial proposal, 82XF includes information that could be considered redundant.  Why didn't we more rigidly follow DRY principles?

OHCO2 views a text as a set of citable nodes with the crucial properties that each node belongs to two overlapping hierarchies, a bibliographic hierarchy and a passage hierarchy, and is ordered within a single text.  In addition, OHCO2 explicitly allows the possibility of any rich formatting (XML, markdown, other) for the text content of a citable node.

The CTS URN for a node by itself expresses the position of the node within its two hierarchies. For example, the URN `urn:cts:aflibre:af.ah.hc:19420614.h1` says that the node it identifies belongs to the bibliographic hierarchy `af.ah.hc`.  Translating with the vocabulary of the specified `aflibre` namespace, we could read that from right to left as saying, "the Holy Cross edition of *Het Achterhuis* by Anne Frank".  The node is also situated in the passage hierarchy at `19420614.h1`. That is, the node is passage `h1` within the diary entry `19420614`.

If we associate that URN with its text contents, we have already expressed everything in the OHCO2 model except its sequential location in the work.  In a simple two-column representation, using `#` to separate columns, this node might appear like this:

    #URN#TextContent
    urn:cts:aflibre:af.ah.hc:19420614.h1#Zondag, 14 Juni 1942






One obvious solution then:  use an ordered list of these two-column descriptions of a node.  Two successive nodes might look like this:

    #URN#TextContent
    urn:cts:aflibre:af.ah.hc:19420614.h1#Zondag, 14 Juni 1942
    urn:cts:aflibre:af.ah.hc:19420614.p1#Vrijdag 12 Juni was ik al om 6 uur wakker en dat is heel begrijpelijk, daar ik jarig was. Maar om 6 uur mocht ik toch nog niet opstaan, dus moest ik mijn nieuwsgierigheid bedwingen tot kwart voor zeven. Toen ging het niet langer, ik ging naar de eetkamer, waar ik door Moortje (de kat) met kopjes verwelkomd werd.

and we can infer that `urn:cts:aflibre:af.ah.hc:19420614.h1` has a successor node to `urn:cts:aflibre:af.ah.hc:19420614.p1`.

While this representation is beautifully simple, the description of any given text node does not *explicitly* identify its position in the text: since that crucial OHCO2 property is provided only implicitly by its position within the ordering of individual lines, we can't fully describe an OHCO2 node in this format without parsing a sequence of nodes.  That violates our goal of explicit, declarative scholarly expression without depending on algorithmic manipulation to express an idea — in this case, the full description of an OHCO2 node.

We could fully describe an OHCO2 with four items, by adding URNs for the preceding and following nodes, like so:



    #URN#Previous#Next#TextContent
    urn:cts:aflibre:af.ah.hc:19420614.h1##urn:cts:aflibre:af.ah.hc:19420614.p1#Zondag, 14 Juni 1942
    urn:cts:aflibre:af.ah.hc:19420614.p1#urn:cts:aflibre:af.ah.hc:19420614.h1#urn:cts:aflibre:af.ah.hc:19420614.p2#Vrijdag 12 Juni was ik al om 6 uur wakker en dat is heel begrijpelijk, daar ik jarig was. Maar om 6 uur mocht ik toch nog niet opstaan, dus moest ik mijn nieuwsgierigheid bedwingen tot kwart voor zeven. Toen ging het niet langer, ik ging naar de eetkamer, waar ik door Moortje (de kat) met kopjes verwelkomd werd.

In this expression, we fully identify a node's sequential position. (The fact that `urn:cts:aflibre:af.ah.hc:19420614.h1` has no "previous" node identifier explicitly  tells us that it is the first node of the document.)  We therefore do not need to maintain any kind of document order, and could easily integrate this source in a directed graph of citable nodes.


While this four-item representation completely expresses the OHCO2 model, it still requires some work to compute a sequence of multiple nodes.  We therefore add a final, fifth item to our format:  an integer sequence number within this text.  Our final format looks like this:


    URN#Previous#Sequence#Next#Text
    urn:cts:aflibre:af.ah.hc:19420614.h1##1#urn:cts:aflibre:af.ah.hc:19420614.p1#Zondag, 14 Juni 1942
    urn:cts:aflibre:af.ah.hc:19420614.p1#urn:cts:aflibre:af.ah.hc:19420614.h1#2#urn:cts:aflibre:af.ah.hc:19420614.p2#Vrijdag 12 Juni was ik al om 6 uur wakker en dat is heel begrijpelijk, daar ik jarig was. Maar om 6 uur mocht ik toch nog niet opstaan, dus moest ik mijn nieuwsgierigheid bedwingen tot kwart voor zeven. Toen ging het niet langer, ik ging naar de eetkamer, waar ik door Moortje (de kat) met kopjes verwelkomd werd.


We can read the first line as saying, "Citable node `urn:cts:aflibre:af.ah.hc:19420614.h1` has no preceding node; its sequential number is `1`; is is followed by node `urn:cts:aflibre:af.ah.hc:19420614.p1`; and it has the text contents `Zondag, 14 Juni 1942`."

This is a very practical representation.  It could be directly imported into a database (relational or "no-sql"), or trivially converted to a directed graph relating each property to the identifying URN.  For analyses such as topic modelling that treat nodes  as independent bags of words without regard for OHCO2 ordering, extracting the URN and text content is as easy as selecting two columns from a table (e.g., in POSIX systems, `cut -f1,5 -d# EXCHANGEFILE`).  The power of its simplicity is illustrated in the fact that before the end of DH2016, Thomas had added support for this exchange format to his topic modelling system [ToPan](https://github.com/ThomasK81/ToPan) and I had added support for it to the `citemgr` library we rely on in the HomerMultitext project
(although [documentation](http://cite-architecture.github.io/citemgr/) has not yet fully caught up...)


"Data  wrangling" is an inevitable part of digital work in the humanities, but there's no reason we ever need to repeat it.  We should value both our texts and our own time too much not to share a citable text once we've cleaned it up to a usable level.  If we recognize that the OHCO2 model frees us to use any format we like for a given purpose as long as it preserves the OCHO2 properties of a text, then this delimited-text OHCO2 exchange format can give us a simple way to share large corpora of citable texts.
