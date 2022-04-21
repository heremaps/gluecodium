General outline of generators
=============================

This document describes the general ideas shared by all code generators in Gluecodium project.

High-level structure
--------------------
Each generator takes the LIME model (model tree + reference map) as an input and produces a set of (in-memory) code
files as an output. Most generators (all but C++) produce two distinct sets of output code files: API files in the
"target" languages and bindings files in C/C++.

For each generator, the initial steps before the actual code generation are:
* filter the model to account for `@Skip` and `@EnableIf` generator-specific attributes.
* perform the [generator-specific validation](validation.md#generator-specific-validation).

Mustache templates
------------------
LIME model tree is transformed into the output code through application of
[Mustache templates](https://mustache.github.io/). The templates are rendered with the
[Trimou engine](http://trimou.org/) that extends the Mustache syntax on its own and also allows extending the syntax
even further with custom handlers.

Most generators (all but C++) have two distinct sets of templates: one for API files, one for bindings files. 

Name resolvers
--------------
One kind of the custom handlers for the templating engine is "name resolvers". These are responsible for transforming
LIME element names into actual names suitable for the generated code in the target language. There are more than one
name resolver per generator, even more than one per output language. Different parts of code require different
"decorations" of the same name: short name, fully qualified name, mangled name, etc. Some parts of code also need names
from other languages: e.g. bindings name for a function is different from its C++ name, but both are present in the
bindings code.

Import/include resolvers
------------------------
Another kind of resolvers, not accessible directly from templates, but still present in every generator, are
import/include resolvers. C++ code or bindings code use includes, all other languages have their own imports system.
For each generated file, the appropriate imports/includes (to be placed at the top of the file) are collected based on
the LIME definition in question and based on the types the definition refers to.

Documentation processors
------------------------
Each generator also has its own "documentation processor". LIME documentation comments use Markdown for the markup
syntax. Most target languages (except Java) support Markdown as well. However, there are slight variation in each, and
their documentation tags are different. So producing valid documentation in the target language still requires some
additional processing. Gluecodium uses [Flexmark library](https://github.com/vsch/flexmark-java) to parse and process
Markdown documentation.

Documentation processors are also responsible for resolving documentation links, i.e. converting
`[core.MyClass.NestedInterface]` from LIME names to names and syntax in the target language. See
[Reference resolution](reference_resolution.md#documentation-references) for more detail.
