---
title: "Inheritance in code: the rich get richer"
layout: post
tags:
 - xml
 - groovy
 - greeklang

---

Because the `GreekNode` class of the `greeklang` [foundational libraries](http://neelsmith.github.io/greeklang/basics/) extends the `XmlNode` class in the [groovy XML utilities](http://neelsmith.github.io/groovyXmlUtils/) package, you can now use the `toXml` method on `GreekNode`s just as you would on an `XmlNode`.  A neat interaction results from three previously implemented features, two in the parent class and one in the `GreekString` class that `GreekNode`s depend on:

1. `XmlNode` guarantees the XML equivalence of the XML String created by `toXml` to its parsed source
2. `XmlNode` guarantees that the String output of `extractText` is identical for XML equivalent nodes
2. `GreekString` guarantees a uniform underlying representation that allows comparison of `GreekString` objects no matter how they were constructed

Watch what happens when we combine these.  First, let's make a new `GreekString` derived from the collected text of XML source in ASCII:

    String asciiSource = """
    <p n="1">ABG</p>
    """
    GreekNode asciiNode = new GreekNode(asciiSource)
    GreekString gs1 = new GreekString(asciiNode.collectText())


Then, let's do the same thing with a source in Unicode Greek:

    String unicodeSrc = """
    <p n="1">ΑΒΓ</p>
    """
    GreekNode unicodeNode = new GreekNode(unicodeSrc, true)
    GreekString gs2 = new GreekString(unicodeNode.collectText(), true)


Now the punchline:  the two `GreekString`s evaluate as equivalent.

    assert gs1 == gs2

What seems to me just a little bit like magic is not that a handful of lines is enough to compare differently formatted XML with different representations in their text nodes:  it's that we never resorted to munging Strings or transcoding Greek.  No regular expressions anywhere!  Conceptually, we're working at a high level:  here's an XML node with text content in Greek;  let's therefore make a Greek String from its contents; and of course we can compare Greek Strings.  The final `assert gs1 == gs2` feels as satisfying as the QED of a Euclidean proof.
