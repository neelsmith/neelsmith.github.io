---
title: Morphology
layout: post
tags:
 - morphology
---

My fall project.

Greek morphology is hard. Modifications to endings, beginning (augment), middle (augment with compound verbs), rich morphological system means 1K + forms possible from a single stem like λυ-.  Phonological changes.

Accent system is the killer.  It can be  significant in morphological parsing (e.g., distinguish masc.nom.s of article from neut.no/ac.sg. of relative pronoun)

So not readily reversible as I discovered in 1980s.

Solution: analysis by synthesis.  Extended at Perseus and miraculously made to work.

Outline: given a string to analyze

1. collect candidate IDs
2. forward-generate form for ID
3. compare result of #2 to submitted form

In 2015, additional requirements:

1. fit into scholarly environment with canonical IDs to share on internet
2. account for rigorously corpus-lingustic perspective


So lets model like this:

1. receive a CTS URN and submit a token from it
2. return an analysis including:
    - URN for the lexical entity
    - URN for the form



Separation of concerns within that outline.

Step 2 is what I want to focus on.

We can subdivide this, much as 1980s morpheus did:

1. strip accents
2. collect candidate anlayses for accent-free form
3. generate accented version
4. compare generated result with submitted string


Somewhere note prerequisites:  rigorously defined normalization of Greek.
