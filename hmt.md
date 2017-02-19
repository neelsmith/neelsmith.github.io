---
layout: page
title: Modelling Homer Mulitext editions
---

## The core library

The `hmt-textmodel` library models the semantic content of digital editions of the Homer Multitext project.  It can parse archival text in XML following HMT project conventions, and provides a variety of high-level abstractions for manipulating the analysis of the project's editions.  It depends on [libraries implementing CITE architecture models](../cite), and on [libraries enforcing coherent encoding of ancient Greek](../greek).

The `hmt-textmodel` library can be used both to validate and enforce correct encoding of material in the HMT archive, and to explore and analyze the archive's contents.

Source:  <https://github.com/homermultitext/hmt-textmodel>


## Exploring HMT content

`hmt-twiddle` is a Scala build environment for exploring the HMT archive using [utwiddle](https://github.com/neelsmith/utwiddle), a domain-specific language for working with citable scholarly resources.

Source:  <https://github.com/homermultitext/hmt-twiddle>
