LIME IDL loader
===============

This document describes the general internal structure of LIME IDL loader module of Gluecodium project.

Decoupling
----------
LIME IDL loader module is decoupled from most of the Gluecodium code. It uses the LIME model tree classes from the "LIME
runtime" module, but it is not "aware" of the rest of the code (i.e. generators). The main `Gluecodim` class discovers
the loader through Java's innate
[ServiceLoader mechanism](https://docs.oracle.com/javase/8/docs/api/java/util/ServiceLoader.html). The loader implements
a single-function interface `LimeModelLoader`. The main class calls this single function, `loadModel()`, passing the
lists of source file and getting the `LimeModel` as a result.

LimeModel class
---------------

`LimeModel` class contains all model-data obtained from the loader:
* a name-to-element "[reference map](reference_resolution.md)", that is used in the resolution of late-bound references,
as well as of documentation references, and of nesting relationships.
* a list of individual model trees, each corresponding to a model element declared in the top scope of an IDL file.
* a list of auxiliary model tree. No code is generated for auxiliary elements themselves, but they still can be referred
to by the "normal" elements.
* a map of element-to-file names, used exclusively for error reporting.

File parsing
------------

There is no manually-written code for parsing LIME IDL files. Instead, the parser is generated at compile time by [ANTLR
parser-generator library](https://www.antlr.org/about.html), based on the grammar definition for LIME IDL language
(check the "*.g4" files for grisly EBNF details). The grammar of LIME is inspired by Kotlin (mostly) and Swift (a bit).
But it is significantly simpler than either of those, as LIME IDL only contains definitions (`class Foo {}`), but not
statements (`String bar = Foo.doStuff()`).

The output of the (auto-generated) LIME parser is an abstract syntax tree (AST) in ANTLR in-memory format. The AST is
"walked" by an (also auto-generated) tree-walker visitor, that invokes the methods of `AntlrLimeModelBuilder` class
corresponding to each model element. The AST is walked "down" first (from root to leaves), setting up the context where
needed, and then "up", creating LIME model elements on the way.

Any documentation comments encountered by this process are treated as plain string at first. They are parsed separately
by a similar, if smaller, process with `AntlrLimedocBuilder` class.

Syntax errors
-------------

Parsing errors are thrown as `ParseCancellationException`. There is no code that catches and handles those, letting them
propagate to the top and abort the execution, as most parsing errors are unrecoverable.

Import statements are not represented as model elements, so they need to be validated early. Ambiguous imports (i.e.
those ending with the same name) are considered unrecoverable and thus are handled similarly to parsing errors.

Unresolved imports (i.e. those with no corresponding element found in the tree) are validated at the end the parsing
process. Similarly to later stages of model tree validations, these are reported to the log.
