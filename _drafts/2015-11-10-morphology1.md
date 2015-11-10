---
title: Morphology
layout: post
tags:
 - morphology
---

My fall project.

Greek morphology is hard. Modifications to endings, beginning (augment), middle (augment with compound verbs), rich morphological system means 1K + forms possible from a single stem like λυ-.  Phonological changes.

Accent system is the killer.  It can be  significant in morphological parsing (e.g., distinguish masc.nom.s of article from neut.no/ac.sg. of relative pronoun)

So not readily reversible as I discovered in 1980s. when that was only model for NL morphology processing

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



## Separation of concerns within that outline.

Focus first on computationally challenging
Step 2.

We can subdivide this, much as 1980s morpheus did:

1. strip accents
2. collect candidate anlayses for accent-free form
3. add accent to candidates
4. compare generated result with submitted string


Note prerequisites:  rigorously defined normalization of Greek. Make cross reference to another blog post.

Step 2 **is** well suited to a two-way model using FST.

Step 3 is trivial enough.

So we'll do

    luw -> 1spia of LUW

Then go to λύω

And compare strings in specified noramlization form.

## FST

Pair a set of stems with a set of inflectional rules.
(Doing little tutorial series on how to do that.)

So we can identify a particular set of stems and particular set of rules for a given
corpus.  Hooray for design goal 2.  Both can work in terms of URNs.  Hooray.

##  Result of design

Can work in terms of URNs.

Built for specific corpus.  We win.



## Advantages

FST is fast.  FST is declarative.  Resulting transducer is a complete graph of possibile paths for a given set of stems and inflecational patterns.
