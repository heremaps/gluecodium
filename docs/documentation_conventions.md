Documentation conventions for the generated code
================================================

This document discusses the transformations applied to documentation comments in the generated code
and the conventions governing these transformations.

C++ documentation comments
--------------------------

### General conventions
* Doxygen markup is added to the generated documentation comments.
* Each documentation comment is enclosed in `/**` and `*/` "brackets".
* Each line of a multi-line comment is prefixed with `*`.
* The text for the documentation comment is taken verbatim from its IDL definition, with some
  exceptions outlined below.

### Method comment
Method comment is collated from, in that order:
* Documentation comment for the method itself, taken verbatim.
* Documentation comments for all method arguments (if present), each prefixed with `\param`, name of
  the argument and (if applicable) `@NotNull` tag.
* Documentation comment for the method return value (if present), prefixed with `\return` and (if
  applicable) `@NotNull` tag.
* Name of the error enum type (if present), prefixed with `\retval`.

### Deprecation message
Deprecation message is added with `\deprecated` Doxygen tag.

Java documentation comments
---------------------------

### General conventions
* JavaDoc markup is added to the generated documentation comments.
* Each documentation comment is enclosed in `/**` and `*/` "brackets".
* Each line of a multi-line comment is prefixed with `*`.
* The text for the documentation comment is taken verbatim from its IDL definition, with some
  exceptions outlined below.

### Method comment
Method comment is collated from, in that order:
* Documentation comment for the method itself, taken verbatim.
* Documentation comments for all method arguments (if present), each prefixed with `@param` and the
  name of the argument.
* Documentation comment for the method return value (if present), prefixed with `@return`.
* Name of the exception type (if present), prefixed with `@throws` tag.

### Deprecation message
* Deprecation message is added with `@deprecated` JavaDoc tag.
* `@Deprecated` annotation is also added to the elements with a deprecation message.

Swift documentation comments
----------------------------

### General conventions
* Markdown markup is added to the generated documentation comments.
* Each line of a multi-line comment is prefixed with `///`.
* The text for the documentation comment is taken verbatim from its IDL definition, with some
  exceptions outlined below.
* An inline code block which is exactly `null` is replaced by `nil`.

### Method comment
Method comment is collated from, in that order:
* Documentation comment for the method itself, taken verbatim.
* Documentation comments for all method arguments (if present), each prefixed with `- Parameter` and
  the name of the argument.
* Documentation comment for the method return value (if present), prefixed with `- Returns`.
* Name of the error type (if present), prefixed with `- Throws` tag.

### Deprecation message
Deprecation message is added as `@available(*, deprecated, message)` attribute.
