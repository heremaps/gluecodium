Gluecodium project architecture
===============================

This document describes the general internal structure of Gluecodium project: its modules, and the data flows both
between the modules and inside those.

Data flow
---------

As an input, Gluecodium takes a set of input files, and a set of parameters to configure the output generation.
Currently, the only supported input format is [LIME IDL](../lime_idl.md). The parameters could be specified either as
command line parameters, or a list of parameters in a files, or through CMake parameters if
[CMake toolchain](../../cmake/README.md) is used.

A single execution of Gluecodium could produce generated code for several output languages at once, based on which
generators are specified.

The input files are loaded and parsed into an in-memory representation, Language-Independent ModEl (LIME). Individual
output language generators apply Mustache templates to the LIME model, producing the output files. Most generators
perform some kind of pre-template model traversal, collecting additional data specific to the output language (e.g.
collecting necessary "imports" or "includes" to be added at the beginning of the generated file). Generators also apply
transformations to elements names, through "name resolvers" (implementers of `NameResolver` interface). Most generators
have several name resolvers per generator.

Main class
----------

`Gluecodium.kt` class serves as an entry point for Gluecodium's execution. It parses command line options through
`OptionReader` class. It discovers available model loaders (implementers of `LimeModelLoader` interface) through Java's
ServiceLoader mechanism. The main class collects the list of input source from the options and passes it to the loader.
The loader produces a `LimeModel` as an output. The model consists of the LIME model tree, as well as some hashtables
(that are used for documentation reference parsing and error reporting).

The main class also discovers available generators (implementers of `Generator` interface) through the same
ServiceLoader mechanism. From the list of the available generators it selects a subset based on the command line
options. Each generator is initialized with generator options (part of command line options) and then it generated
output code based on the options, and the in-memory LIME model. The contents of the generated files are also in-memory.
The main class is responsible for taking this output and committing it to the file system.

LIME IDL loader
---------------

LIME IDL loader module is decoupled from the main Gluecodium code. The only point of communication between them is a
single-function interface `LimeModelLoader`, implemented by LIME IDL loader and exposed (made discoverable) though Java
Service Loader mechanism.

There is no manually-written code for parsing LIME IDL files. Instead, the parser is generated at compile time by ANTLR
parser-generator library based on the grammar definition for LIME IDL language (`LimeParser.g4`). The output of the
parser is an abstract syntax tree (AST) in ANTLR in-memory format. This syntax tree is converted to LIME model tree by
`AntlrLimeModelBuilder` class.

There's also a secondary parser for parsing LIME IDL documentation comments ("LimeDoc", `LimedocParser.g4`).
