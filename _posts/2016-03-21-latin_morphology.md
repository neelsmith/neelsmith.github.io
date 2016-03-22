---
layout: post
title: "Specifications and prerequisites for a system for parsing Latin morphology"
tags:
 - morphology
 - latinmorph
---

For most of this academic year, I've been working on a system for parsing Greek morphology.  The mutual interaction of movable accents and morphology means that traditional approaches to parsing natural languages don't apply to ancient Greek.  In fact, no published algorithm that I have seen for analyzing natural language morphology succeeds with Greek.  Oops!

Latin poses no such problems, which is probaby one reason why there are already multiple working Latin parsers.  From my work on Greek morphology, however, I've realized that there is still room for a different kind of Latin parsing system, and that it may even be a relatively straightforward task to build such a system.  When I need a break from the challenges of Greek morphology, therefore, I plan to dabble with building a Latin parsing system, and will document those efforts in [tagged blog posts](http://neelsmith.github.io/tags/latinmorph/).

To begin with, then, what specifications would justify the effort of building yet another system for working with Latin morphology?


## Requirements

My goal is not to build an end-user application for working with Latin morphology. Instead, I want to design a morphological parsing library that can be used for any kind of morphologically aware research- or pedagogical application working with Latin texts.  I've become persuaded of the value of four requirements that I haven't found in other Latin morphological parsers.

**1. A corpus-linguistic perspective**.  A morphological library should not really offer a Latin parser:  it should offer a system for *building* Latin parsers, tailored to a specific set of texts.  It should be straightforward to compile a new parser with a specific set of inflectional rules and a specific lexicon of morphological stems for a given set of texts.

**2. Citable analyses**.  A parser should analyze valid Latin morphological tokens, represented as strings, but its analysis should be a structure including a citable *lexical entity*, and a citable *form*, both identified by stable URNs.  In addition, since the parsing system works internally with a colleciton of inflectional rules and a lexicon of morphological stems, these should also be citable by URN, in order to indicate precisely what combination of stem and inflection lead to the analysis of lexical entity and form.  The structure for a single analysis therefore includes four URNs: the lexical entity, the form, the morphological stem, and the inflectional rule.

**3. Abstraction of how an orthographic system is implemented**. The problem of how Latin is written (including questions like the use of upper and lower case, or representation of vowels and semivowels as `i` and `j` or `u` and `v`, for example) should be clearly distinguished from morphological parsing:  orthography is a separate concern from morphology.  It should be possible to define specific Latin parsers for specific text corpora expressed in specific orthographic systems.

**4. Composition of new parsers from simple tabular data sources**.  A flexible system for building Latin parsers dynamically should work from simple, easily managed data sources.  It should be possible to compile inflectional patterns and morphological stem data from delimited text files in a simple tabular format, so that for a Latin scholar the task of writing a new parser can be reduced to filling out or modifying tabular data forms.




## System infrastructure

In subsequent posts in this series, I plan to discuss how I implement a parsing system satisfying the preceding requirements.  I intend to develop the system in the same kind of environment I've used for parsing Greek, so if you'd like to play along at home, here is a full list of the technical prerequisites:


- for an automated build system, gradle (<http://gradle.org/>)
- gradle in turn requires java (I plan to build on java 7)
- the Stuttgart FST tools (SFST), a tool kit for working with the most widely used technology for morphological parsers, finite state transducers (<http://www.cis.uni-muenchen.de/~schmid/tools/SFST/>)
- for compiling finite state transducers with SFST, *nix `make`


These prerequisites are all readily available in open source implementations.  Because the SFST tools are easily installed from debian packages, I tend to work on morphological parsing in debian-based Linux systems (such as Ubuntu, or Elementary OS), but you can replicate this parsing work on any operating system when these prerequisites are installed.
