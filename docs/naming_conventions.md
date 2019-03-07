Naming conventions for the generated code
=========================================

This document discusses the transformations applied to entity names in the generated code and the
naming conventions governing these transformations.

Franca (FIDL) names
-------------------

### Entity names
Entity names supplied in the FIDL definitions are used as a source for the entity names in the
generated code. Both snake_case and camelCase naming conventions are recognized in the FIDL
definitions (both conventions with both lowercase and UPPERCASE variations).

### Method selectors
Overloaded methods in FIDL definitions require arbitrary "selector" suffixes, in the form of
`methodName:selectorName`. The selector never affects the generated code (for one corner-case
exception see "Java names" section below).

### Circumventing Franca reserved words
Franca IDL has some reserved words that are not reserved in target languages (e.g. "update"). Using
these words as identifiers in a FIDL files results in validation failures during code generation. To
get around this limitation, the first letter of the word should be capitalized (e.g. "Update"). Due
to naming conventions being applied for target languages, this change does not affect the generated
code at all, but it allows the validation step to pass normally.

C++ names
---------

### General naming conventions
* Type names are in UpperCamelCase.
* Method and variable names are in lower_snake_case.
* Constant and enumerator names are in UPPER_SNAKE_CASE.

### Attribute names
* Attribute getter names are prefixed with `get_`, unless it's a Boolean attribute.
* Boolean attribute getter names are prefixed with `is_`.
* Attribute setter names are prefixed with `set_`.

Java names
----------

### General naming conventions
* Type names are in UpperCamelCase.
* Method and variable names are in lowerCamelCase.
* Constant and enumerator names are in UPPER_SNAKE_CASE.

### Attribute names
* Attribute getter names are prefixed with `get`, unless it's a Boolean attribute.
* Boolean attribute getter names are prefixed with `is`.
* Attribute setter names are prefixed with `set`.

### Method overloads ambiguity resolution
Arrays and Maps defined in FIDL definition are generated as List<> and Map<> generics in Java
respectively. Since Java language applies type erasure to its generics, declaring two method
overloads that differ only in the parameters of the generic (e.g. element type of the array) leads
to a compile-time error. Therefore Genium applies additional naming logic when generating such
ambiguous method overloads. The ambiguity is resolved by appending the "selector" from the FIDL
definition to the generated method name.

Swift names
-----------

### General naming conventions
* Type names are in UpperCamelCase.
* Method and variable names are in lowerCamelCase.
* Constant and enumerator names are in lowerCamelCase.

### Attribute names
Attributes are generated as properties in Swift:
* Property names have no prefix, unless it's a Boolean attribute.
* Boolean property names are prefixed with `is`.
