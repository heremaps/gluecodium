LIME model validation
=====================

This document describes the approach to LIME model validation in Gluecodium project.

General approach
----------------
"Validation" in the context of LIME model means checking the model tree for correctness. The purpose of validation is to
"fail fast" before the actual code generation has begun. Among other benefits, this allows to provide the error
description in the terms of LIME model, so that it could be found and fixed in the source IDL file(s).

Validation messages are output to the log. Most validation messages are "errors": no code generation follows if any
validation errors are detected. A few validation messages are "warnings": the code generation can proceed, but may
produce broken or inefficient code. Individual validation warnings could be selectively elevated to "errors" with
`-werror` command line parameter.

Imports validation
------------------
LIME IDL import statements are not represented as model elements, so they need to be validated as early as possible.
Ambiguous imports (i.e. those ending with the same name) prevent the model tree from being constructed. Therefore, they
are handled _during_ the tree construction and are considered unrecoverable parsing errors.

Unresolved imports (i.e. those with no corresponding element found in the tree) are validated immediately after the
model tree is created, still in the loader module. Similarly to later stages of model tree validations, these are
reported to the log.

Semantic validation
-------------------
Semantic validation checks the LIME model for general correctness, disregarding any generator-specific requirements.
This validation step is performed by the main `Gluecodium` class, after the model tree is loaded, but before the tree is
passed to any individual generator.

This step consists of three sub-steps:
1. Type reference validation (`LimeTypeRefsValidator` class) walks over each and every late-bound type reference and
tries to resolve it. Resolution failures are reported as validation errors.
2. Type-reference-dependent validation groups all validators that access any type references during their own validation
and thus require all type references to be resolved correctly. If step #1 fails, none of the step #2 validators are run.
3. Independent validation groups all validators that _do not_ access any type references and thus can function
regardless of step #1 results.

Generator-specific validation
-----------------------------
This type of validation, as the name suggests, checks the LIME model for correctness specific to the individual
generator. The exact set of checks varies, but each generator always has its own validation logic for function
overloads. All languages place some restrictions on function overloading, but no two sets of those restrictions are
exactly the same. Moreover, type mapping from IDL types into language types could introduce signature ambiguity where
none is apparent from the IDL definition alone.
