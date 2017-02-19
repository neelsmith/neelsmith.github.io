---
layout: page
title: Work on the CITE architecture
---



For information about the CITE architecture, see <http://cite-architecture.github.io/>.

The libraries listed here are written in Scala, and organized for cross-compiling for use either on the JVM or a JS engine (compiled with ScalaJS).


## Fundamental models of the CITE architecture


- `xcite`: supports semantic manipulation of scholarly references expressed in URN notation, including the semantic similarity function `~~` ("twiddle").  Source: <https://github.com/cite-architecture/xcite>.
- `ohco2`:  library for working with corpora of citable texts.  Source: <https://github.com/cite-architecture/ohco2>.
- `orca`:  library for working with citable readings of citable texts. Source: <https://github.com/cite-architecture/orca>.

## Microservices

- `scs`: Scala implementation of CITE Services, based on [finch/finagle](https://github.com/finagle/finch). Source:  <https://github.com/cite-architecture/scs>


## Higher-level abstractions for scholarly work

- `utwiddle`:  a Scala build environment for exploring `utwiddle`, a domain-specific language for working with citable scholarly resources. Source: <https://github.com/neelsmith/utwiddle>
