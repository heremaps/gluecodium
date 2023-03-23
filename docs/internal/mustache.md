Mustache templates in Gluecodium
================================

This document describes the general interaction of Gluecodium code and its Mustache templates.

Template context
----------------

In Mustache templates, any template expression (either "value" `{{fooBar}}` or "section" 
`{{#fooBar}}...{{/fooBar}}`), operates on a "current context". The context object is represented by
`{{this}}` template value, but it can be omitted most of the time (also see "Fallthrough" below).

The context is treated as a key-value dictionary with String keys. Usually it is a Kotlin object with
some properties (e.g. an element of a LIME in-memory syntax tree), or an actual Kotlin key-value
`Map<>`. From the Mustache perspective these two are indistinguishable: `{{foo}}` will either read
a `this.foo` property, or a `this["foo"]` value. This happens behind the scenes automatically.

The starting, or "root", context is whatever object has been passed to the `renderTemplate()` call
from the Kotlin code. Each `{{#fooBar}}` section opening tag switches context to a new object.
`{{/fooBar}}` section closing tag reverts the context to a previous state. This is sometimes referred
to as "context nesting" in the documentation.

Fallthrough
-----------

If the `{{foo}}` value is not found (or is `null`) in the current context, the template engine will
execute "fallthrough". It will try to find the value with the same key in the outer (previous)
context. The fallthrough will be repeated recursively, if needed, up to and including the root context.

Most of the time, this logic has a positive impact, allowing to access the values from the outer
context implicitly, when needed. However, there are some cases when this leads to subtle bugs.
There is on particular case that happens in Gluecodium templates in a few places.

Consider: both current context and the outer context have the same Kotlin property
(e.g. `LimeClass.parent`), and the value of this property in the current context is `null`. This
causes a silent fallthrough to the outer context, which is unintended. To circumvent this issue,
the current context need to be referred to explicitly with `{{this}}` keyword
(e.g. `{{this.parent}}`). The explicit syntax disables the fallthrough logic completely.

The other, less error-prone, but still confusing, case is "shadowing". Again, both current context
and the outer context have the same Kotlin property (e.g. `LimeNamedElement.attributes`), which is
a collection, and the current context has this value empty. An empty collection _does not_ trigger
fallthrough, thus making the outer value inaccessible with implicit syntax. The workaround here is
to store the outer value using `{{#set}}` syntax before entering the inner context
(e.g. `{{#set outerAttributes=attributes}}{{#innerElement}}...`).

Falsity
-------

For the purpose of `{{#if}}`/`{{#unless}}` section the following values are considered "false":
`false`, `0`, `null`, `""`, empty collection, or a missing value. Most notably, this is very different
from the values that trigger the fallthrough behaviour (which are only `null` and a missing value).

Additional Mustache syntax
--------------------------

Gluecodium uses Trimou library for parsing and rendering Mustache templates. This library provides
some additional syntax on top of the code Mustache syntax already. On top of that, Gluecodium enables
several more advanced Trimou features that are disabled by default; as well as adding several custom
syntax features. The list of all these additional features can be seen in "TemplateEngine.kt".
