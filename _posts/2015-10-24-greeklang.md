---
title: "1.0.0 release of greeklang foundational libraries"
layout: post
tags:
 - greeklang

---

I have organized the `greeklang` project into three sections managed as gradle subprojects:

- foundational libraries for working with Greek orthography and phonology
- a system for parsing Greek morphologically
- a library for working with epic hexameter


In the spirit of "release early, release often," I've released version  **1.0.0** of the foundational libraries today.  The [greeklang web site][gl] has pages for each subproject with links to

- specifications automatically tested using [concordion](http://concordion.org/), and
- API docs for the JVM implementations of the specifications

as well as information including maven identifiers for the compiled code.

The source code and the specification documents are identified with independent version numbers.  Both code libraries and documentation packages use [semantic versioning](http://semver.org/) conventions, and the text of the specification identifies what version of the specification documents what version of the code.


[gl]: http://neelsmith.github.io/greeklang/
