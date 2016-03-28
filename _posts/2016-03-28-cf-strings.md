---
layout: post
title: "Comparing Unicode strings with listutils 1.1.0"
tags:
 - listutils
---

Yesterday, [I pushed two gists](http://neelsmith.github.io/2016/03/27/gists/) that use the `listutils`  package to compare strings.  Since a Unicode string can by definition be considered a sequence of Unicode code points, I've added direct support for comparing Unicode strings with version 1.1.0 of `listutils`.  Instead of supplying two lists of objects, give the `ListDiff` class two Unicode strings.  It creates a list of Unicode code points from each String.  The resulting comparisons (including SCS and LCS) are lists of Strings, where each String is one code point long.


I've updated the gists to use this new version of `listutils`, and the result is pleasantly concise.

For [lcs.groovy](https://gist.github.com/neelsmith/393dbe8a56e5eb1bd1c6), the complete computation is

    ListDiff ldiff = new ListDiff(args[0],args[1])
    println ldiff.lcs.join("")

For [scs.groovy](https://gist.github.com/neelsmith/7fc5ae04ae58bcf3ac8a), the parallel lines are

    ListDiff ldiff = new ListDiff(args[0],args[1])
    println ldiff.lcs.join("")

If you favor still more conciseness over legibility, of course you could combine either of those into a single line in groovy, e.g.,

    println new ListDiff("listutils package v 1.1" ,   "listutils version 1.1").scs.join("")

will print

    listutils package version 1.1

`listutils` works on whatever you give it.  If you want any form of Unicode normalization, apply it before passing the string to `ListDiff`.
