Documentation conventions for the generated code
================================================

This document discusses the transformations applied to documentation comments in the generated code
and the conventions governing these transformations.

Franca (FIDL) comments
----------------------

### Transient comments
Comments prefixed with `//` in the FIDL files are meant to explain the FIDL declarations themselves,
not the resulting generated code. These comments are transient, i.e. they are discarded at code
generation.

### Documentation comments
Comments included between `<** @description:` and `**>` markup are documentation comments and are
fully reflected in the generated code. Markdown can be used for formatting. Some transformations are
applied to these documentation comments. Most transformations just add documentation comments markup
appropriate for the target language, as described below.

### Deprecation messages
Comments included between `<** @deprecated:` and `**>` markup (can be combined with `@description`
in a single `<** ... **>` block) are deprecation messages and are fully reflected as such in the
generated code. Same transformations are applied to these messages as to documentation comments (see
below).

C++ documentation comments
--------------------------

### General conventions
* Doxygen markup is added to the generated documentation comments.
* Each documentation comment is enclosed in `/**` and `*/` "brackets".
* Each line of a multi-line comment is prefixed with `*`.
* The text for the documentation comment is taken verbatim from its FIDL definition, with some
  exceptions outlined below.

### Method comment
Method comment is collated from, in that order:
* Documentation comment for the method itself, taken verbatim.
* Documentation comments for all method arguments (if present), each prefixed with `\param`, name of
  the argument and (if applicable) `@NotNull` tag.
* Documentation comment for the method return value (if present), prefixed with `\return` and (if
  applicable) `@NotNull` tag.
* Name of the error enum type (if present), prefixed with `\retval`.

### Attribute comment
* Method comments for attribute accessors have their first character in lowercase.
* Method comment for attribute getter method is prefixed with `Gets `.
* Method comment for attribute setter method is prefixed with `Sets `.

### Deprecation message
Deprecation message is added with `\deprecated` Doxygen tag.

Java documentation comments
---------------------------

### General conventions
* JavaDoc markup is added to the generated documentation comments.
* Each documentation comment is enclosed in `/**` and `*/` "brackets".
* Each line of a multi-line comment is prefixed with `*`.
* The text for the documentation comment is taken verbatim from its FIDL definition, with some
  exceptions outlined below.

### Method comment
Method comment is collated from, in that order:
* Documentation comment for the method itself, taken verbatim.
* Documentation comments for all method arguments (if present), each prefixed with `@param` and the
  name of the argument.
* Documentation comment for the method return value (if present), prefixed with `@return`.
* Name of the exception type (if present), prefixed with `@throws` tag.

### Attribute comment
* Method comments for attribute accessors have their first character in lowercase.
* Method comment for attribute getter method is prefixed with `Gets `.
* Method comment for attribute setter method is prefixed with `Sets `.

### Deprecation message
* Deprecation message is added with `@deprecated` JavaDoc tag.
* `@Deprecated` annotation is also added to the elements with a deprecation message.

Swift documentation comments
----------------------------

### General conventions
* Markdown markup is added to the generated documentation comments.
* Each line of a multi-line comment is prefixed with `///`.
* The text for the documentation comment is taken verbatim from its FIDL definition, with some
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
