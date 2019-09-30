LimeIDL design proposal
=======================

Overview
--------

This document proposes the design for the new input language for Gluecodium: LimeIDL. The document
describes the following:
* What is LimeIDL?
* Why is it needed?

When the stable version of Gluecodium with full LimeIDL support is released, this document will be
converted into LimeIDL documentation (probably by just removing the "why?" section and reducing
other explanations while focusing on syntax description).

### What is LimeIDL?

LimeIDL is the proposed new input language for Gluecodium. The name is a stylized abbreviation. "LIME"
stands for "Language-Independent ModEl", the internal language-independent syntax tree model that
serves as an intermediate step between the input language (e.g. Franca IDL, LimeIDL) and the output
language (e.g. C++, Java, Swift). "IDL" is an industry-standard abbreviation for "Interface
Definition Language". This describes any Gluecodium input language perfectly, as its input languages are
defining programming interfaces (as opposed to defining executable code, like output languages do).

LimeIDL proposed syntax is inspired by (and somewhat just borrowed from) the modern programming
languages like Kotlin and Swift. The initial version of the syntax has full feature parity with
Franca input for Gluecodium (but not with the "base" Franca IDL, as Gluecodium uses only a subset of Franca
language, with some custom extensions). The design intent is to have an input language that is
compact (i.e. not verbose) and is easy to read and write in. The intent is also for the language to
be flexible enough to be extended in the future without losing these qualities.

LimeIDL syntax
--------------

### Example

```
package com.example

import com.example.utils.GenericResult

class SomeImportantProcessor {
    constructor create(options: Options?) throws SomethingWrongException

    fun process(mode: Mode, input: String): GenericResult

    property processingTime: ProcessorHelperTypes.Timestamp { get }

    internal static property secretDelegate: ProcessorDelegate?

    enum Mode {
        SLOW,
        FAST,
        CHEAP
    }

    @Immutable
    struct Options {
        flagOption: Boolean
        uintOption: UShort
        additionalOptions: List<String> = {}
    }

    exception SomethingWrongException
}

interface ProcessorDelegate: com.example.utils.GenericDelegate {
    fun onProcessorEvent(message: String)
}

types ProcessorHelperTypes {
    typealias Timestamp = Date

    const DefaultOptions: SomeImportantProcessor.Options = {flagOption = true, uintOption = 42, {}}
}

```

### General remarks on syntax

#### Notation

The sections below use the following notation to describe the LimeIDL syntax:
* text in **bold** is verbatim, i.e. these are keywords and special characters exactly as they
appear in the language.
* text in *italic* is a placeholder, usually for a user-defined name or some other user-defined
sequence (in which case it will be explained specifically each time).
* `(` and `)` enclose a set of alternatives, with each alternative separated with `|` symbol.
* `[` and `]` enclose a sequence that is optional, i.e. can be omitted.

#### Identifiers

LimeIDL supports two kinds of identifiers (names): simple identifiers and escaped identifiers.

Most of the identifiers are simple ones. They should follow common rules for identifiers:
* can contain only Latin letters, digits and underscores `_`.
* cannot begin with a digit.

Escaped identifies are enclosed in '`' backticks. Escaped identifiers support the whole range of
Unicode characters. The only characters that are not allowed are line breaks and backticks.

**Note:** non-alphanumeric characters for elements whose names are reflected in file names (e.g.
package names or names of classes, interfaces, structs, etc.) might lead to unexpected compilation
issues in the generated code, depending on the file system and/or operating system.

**Note:** Unicode characters in C++ identifiers are supported by C++ standard but the actual support
might vary per compiler implementation.

#### Visibility

Most elements can be prefixed with a visibility prefix. Possible visibility prefixes are currently
`public`, `internal`, `open` and `open internal`. Visibility prefix is optional, an element without
such prefix is considered `public`. The visibility prefix, if present, should precede the rest of
the declaration.

* Example: `internal static property secretDelegate: ProcessorDelegate? { get set }`
* List of element kinds that can have a visibility prefix: class, interface, types, function,
constructor, property, property accessor, struct, struct field, enumeration, exception, constant,
type alias.
* List of element kinds that cannot have a visibility prefix: package, import, function parameter,
enumerator.
* `open` and `open internal` are currently only supported for classes. Both mean the class can be
inherited from (see `Inheritance` below).

#### Line breaks

Most declarations are allowed to have an arbitrary (zero or more) number of line breaks between any
parts of the declaration. Two notable exceptions are:
* Each file-level declaration must have at least one line break at the end of the declaraion. This
also means there must always be a trailing line break at the end of the file.
* Attributes (see `Attributes` below) are not allowed to have any line breaks between `@` and the
attribute name that follows.

### File-level declarations

There are three kinds of file-level declarations: package, import or element declaration. The
following element types can be placed at the top level: `class`, `interface`, `types`, `struct`,
`enum`, `exception`, `typealias`. All other declarations can only be placed as child elements to
some other element.

#### Package declaration

* Syntax: **package** *list.of.names*
* Example: `package com.example.utils`
* Description: declares the package for all top-level elements in the current file. Must be always
present in each file, exactly once per file, and should be the first declaration in the file.

#### Import declarations

* Syntax: **import** *full.element.Name*
* Example: `import com.example.utils.GenericResult`
* Description: declares the imports for the current file. Each imported element can be referred by
its simple name (e.g. `GenericResult`) instead of a full name within the scope of the current file.
There can be any number of import declarations per file. If there are any, they all should come
immediately after the package declaration.

#### Container-type elements

* Syntax: (**class** | **interface** | **types**) *ElementName*\[**:** *ParentName*\] **{**
*child-elements-declarations...* **}**
* Example: `class SomeImportantProcessor { ... }`
* Example: `interface ProcessorDelegate: GenericDelegate { ... }`
* Description: declares a container-type language element:
  * **class** corresponds to a class declaration in the output languages.
  * **interface** corresponds to an interface (protocol) declaration in the output languages.
  * **types** declares a loose collection of elements, most of which become free-standing elements
  in the output languages.
* Classes and interfaces can be free-standing elements at file level or can be placed in another
class or interface. `types` declaration can be only placed at file level.

#### Inheritance

Classes and interfaces support inheritance (optionally, see *ParentName* in the syntax above).
There are some restrictions on inheritance:
* multiple inheritance is currently not supported.
* an interface cannot inherit from a class.
* an class can only inherit from another ("parent") class if the parent class has "open" visibility
(see `Visibility` above).
* a class or an interface with "public" visibility cannot inherit from a class or an interface with
"internal" visibility (see `Visibility` above).

### Child element declarations

Child element declarations can only be placed inside the declaraion of another element (most often
some top-level element).

#### Function

* Syntax: \[**static**\] **fun** *FunctionName*__(__*parameter-list*__)__\[**:** *ReturnType*\]
\[**throws** *ExceptionName*\]
* where *parameter-list* is a comma-separated list of parameters, each parameter declared as
*ParameterName*: *ParameterType*
* Example: `fun process(mode: Mode, input: String): GenericResult throws SomethingWrongException`
* Can be placed in: class, interface, struct
* Description: declares a member function (method) in the parent type:
  * a function can have any number of parameters (zero or more).
  * a function can have a return type (optionally).
  * a function can be declared as throwing an exception (optionally, also see `Exception` below).
  * a function can be declared as `static` (optionally), meaning it's not a member function but a
  class function (type function).

#### Constructor

* Syntax: **constructor** *FunctionName*__(__*parameter-list*__)__
\[**throws** *ExceptionName*\]
* where *parameter-list* is a comma-separated list of parameters, each parameter declared as
*ParameterName*: *ParameterType*
* Example: `constructor create(options: Options?) throws SomethingWrongException`
* Can be placed in: class, struct
* Description: declares a constructor (Java, Swift) or a factory function (C++) in the parent type:
  * a constructor declaration includes a name, which translates into a name of the factory function
  in C++. Other output languages have normal "nameless" constructors generated in the public API.
  * a constructor can have any number of parameters (zero or more).
  * a constructor can be declared as throwing an exception (optionally, also see `Exception` below).

#### Property

* Syntax: \[**static**\] **property** *PropertyName*__:__ *PropertyType*
\[**{** **get** \[**set**\] **}**\]
* Example: `static property secretDelegate: ProcessorDelegate? { get set }`
* Can be placed in: class, interface
* Description: declares a property in the parent type:
  * a property can be declared as `static` (optionally), meaning it's not a member property but a
  class property (type property).
  * a property declaration corresponds to a property in the output language if it does have such
  concept (Swift) or to a pair of accessor methods (or just one getter method for a readonly
  property) if there is no "property" concept (C++, Java).

#### Struct

* Syntax: **struct** *StructName* **{** *fields-list* \[*child-elements-declarations...*\] **}**
* where *fields-list* is a newline-separated list of fields, each field declared as
*FieldName*: *FieldType* \[**=** *DefaultValue*\]
* Example:
```
struct Options {
    flagOption: Boolean
    uintOption: UShort
    additionalOptions: List<String> = {}
}
```
* Can be a free-standing element at file level or can be placed in: class, interface, types
* Description: declares a struct type (data type) in the parent type:
  * a struct can have any number of fields, but at least one field is required.
  * a struct field can have a default value associated with it (optionally). For more details on
  values and literals see `Values and Literals` below.
  * in addition to fields, a struct can have member functions, constructors, and constants declared
  inside it.

#### Enumeration

* Syntax: **enum** *EnumName* **{** *enumerators-list* **}**
* where *enumerators-list* is a comma-separated list of enumerators, each enumerator declared as
*EnumeratorName* \[**=** *EnumeratorValue*\]
* Example: `enum Mode { SLOW, FAST, CHEAP }`
* Can be a free-standing element at file level or can be placed in: class, interface, types
* Description: declares an enumeration type in the parent type:
  * an enumeration can have any number of enumerators, but at least one enumerators is required.
  * an enumerator can have a default value associated with it (optionally). Only integer values are
  currently supported. For more details on values and literals see `Values and Literals` below.

#### Exception

* Syntax: **exception** *ExceptionName*\[__(__*EnumName*__)__\]
* Example: `exception SomethingWrongException(ErrorCodeEnum)`
* Can be a free-standing element at file level or can be placed in: class, interface, types
* Description: declares an exception (error) type in the parent type:
  * an exception can have a error-code enum associated with it (optionally).

#### Constant

* Syntax: **const** *ConstantName*__:__ *ConstantType* **=** *ValueLiteral*
* Example: `const DefaultOptions: Options = {true, 42, {}}`
* Can be placed in: class, types, struct
* Description: declares a constant in the parent type. For more details on values and literals see
`Values and Literals` below.

#### Type alias

* Syntax: **typealias** *AliasName* **=** *AliasType*
* Example: `typealias Timestamp = Date`
* Can be a free-standing element at file level or can be placed in: class, interface
* Description: declares a type alias (typedef) in the parent type.

#### Lambda

* Syntax: **lambda** *LambdaName* **=** *AliasType* **=** __(__*parameter-list*__)__ **->** *ReturnType*
* Example: `lambda TimestampCallback = (Date) -> Void`
* Can be a free-standing element at file level or can be placed in: class, interface.
* Description: declares a lambda type (a functional reference). Unlike the functions, specifying a
return type for a lambda is required. For declaring lambdas with no return type, `Void` type should
be used (like in the example above).

### Type references

A type reference is a mention of a type anywhere, as opposed to a type declaration. A type reference
can refer to a built-in type or to a user-defined type. A type reference can be also (optionally)
marked as "nullable".

#### Built-in types

Basic types:
* **Boolean**
* **String**
* **Float**
* **Double**
* **Byte**: signed 8-bit integer type
* **Short**: signed 16-bit integer type
* **Int**: signed 32-bit integer type
* **Long**: signed 64-bit integer type
* **UByte**: unsigned 8-bit integer type
* **UShort**: unsigned 16-bit integer type
* **UInt**: unsigned 32-bit integer type
* **ULong**: unsigned 64-bit integer type
* **Blob**: generic binary data type
* **Date**: date type (containing both a calendar date and a clock timestamp)

Container types:
* **List<Type>**: list/array container type, e.g. `List<String>`
* **Set<Type>**: set container type, e.g. `Set<String>`
* **Map<KeyType, ValueType>**: map container type, e.g. `Map<String, Blob>`

#### User-defined types

User-defined types are types declared in the same or in another LimeIDL file. There are several ways
to refer to those:
* Short name, e.g. `LocalType`. This refers to a type declared within the same top-level element as
the reference, or to an imported type (see `Import declarations` above).
* Relative name, e.g. `LocalInterface.LocalType`. This refers to a type declared within another
top-level element in the same package, or to a type within an imported top-level type.
* Full name, e.g. `com.example.utils.OtherInterface.OtherType`. This can refer to any type declared
in the current set of LimeIDL files.

#### Nullable references

Any type reference can be marked "nullable" by appending "?" to it, e.g. `String?`. This also
applies to type references inside other type references, like container types: `List<String?>`.
Combining these two usages is also valid: `List<String?>?`.

**Note**: currently the only supported usages for nullable elements in containers are List element
type (e.g. `List<String?>`) and Map value type (e.g. `Map<Int, String?>`).

### Values and literals

Struct field default values and constant values support the following literals on the right side of
their `=` sign.

#### Numeric literals

Integer decimal literals are supported, e.g. `10`, `-42`. Floating-point literals are supported,
both with and without the exponent, e.g. `3.14`, `1.41e-2`. No suffixes are currently supported for
neither of those two literal kinds, the specific type of the literal is determined from the
declaration of the field or the constant where the literal is used.

Binary, octal or hexadecimal integer literals are currently not supported.

#### String literals

String literals are enclosed in quotes `"`, e.g. `"hello"`. Unicode characters are supported. Also,
a limited set of escaped characters is currently supported: `\\`, `\"`, `\n`, `\r`, `\t`.

#### Special literals

* `null`: "null" value for nullable types.
* `NaN`: "not a number" value for Float and Double types.
* `Infinity`: positive infinity value for Float and Double types.
* `-Infinity`: negative infinity value for Float and Double types.

#### Struct initializer

* Syntax: **{** \[*list-of-field-values*\] **}**
* where *list-of-field-values* is a comma-separated list of values, each optionally preceded by a
field name: \[*FieldName* **=**\] *FieldValue*
* Example: `const DefaultOptions: Options = {flagOption = true, uintOption = 42, {}}`
* Description: initializes a struct with the given values, the order of values corresponds to the
order of declaration of struct's fields.

#### Collection initializer

* Syntax: **[** \[*list-of-values*\] **]**
* where *list-of-values* is a comma-separated list of values
* Example: `const ValidKeys: Set<String> = ["name", "address"]`
* Description: initializes a list or a set with the given values. `[]` initializes an empty list or
set.

#### Map initializer

* Syntax: **[** \[*list-of-pairs*\] **]**
* where *list-of-pairs* is a comma-separated list of *key*__:__ *value* pairs
* Example: `const FieldNames: Map<Int, String> = [1: "name", 42: "address"]`
* Description: initializes a map with the given key-value pairs. `[]` initializes an empty map.

#### Enumerator reference

Initializes an enumeration-type constant or field with the given enumerator value, e.g. `Mode.FAST`.

### Attributes

Most elements can be prefixed by attributes:
* Syntax: __@__*AttributeName*\[__(__*list-of-attribute-properties*__)__\]
* where *list-of-attribute-properties* is a comma-separated list of properties, each optionally with
a value: *PropertyName* \[**=** *PropertyValue*\]
* Example: `fun process(mode: Mode, @Swift(Label = "_") input: String): GenericResult`
* Description: each attributes specifies some additional behavior for the element, most often some
behavior specific to a single output language.
  * an element can be prefixed by any number of attributes.
  * an attribute can have any number of properties associated with it (optionally).
  * an attribute can have a "default" property that can have its name omitted and specified only by
  value instead, e.g. `@Deprecated("DeprecationMessage")`.

Here's the list of currently supported attributes:
* **@Immutable**: marks a struct type as immutable.
* **@Equatable**: marks a struct type or a class as equatable.
* **@PointerEquatable**: marks a class as equatable by reference (pointer).
* **@Serializable**: marks a struct type as serializable.
* **@Deprecated(**\[**Message** **=**\] **"**_DeprecationMessage_**"**__)__: marks an element as
deprecated, takes a string literal value as a deprecation message.
* **@Java**: marks an element with Java-specific properties:
  * \[**Name** **=**\] **"**_ElementName_**"**: marks an element to have a distinct name in Java.
  This is the default property for this attribute.
  * **Builder**: marks a struct type to have a "builder" pattern generated in Java.
* **@Swift**: marks an element with Swift-specific properties:
  * \[**Name** **=**\] **"**_ElementName_**"**: marks an element to have a distinct name in Swift.
  This is the default property for this attribute.
  * **Label** **=** **"**_LabelName_**"**: marks a function parameter to have a distinct argument
  label in Swift.
  * **ObjC**: marks a class as Objective-C compatible in Swift.
* **@Cpp**: marks an element with C++-specific properties:
  * \[**Name** **=**\] **"**_ElementName_**"**: marks an element to have a distinct name in C++.
  This is the default property for this attribute.
  * **Const**: marks a function with a `const` qualifier in C++ generated code.
  * **Accessors**: marks a struct to have accessor functions generated for fields and to generate
  struct fields as "private" in C++ generated code. Intended for use with `@Immutable` attribute.
  * **ExternalType** **=** **"**_HeaderPaths_**"**: marks a class, interface, struct type or
  enumeration as an "external" type. This skips the generation of C++ code for this type and the
  given (pre-existing) header file(s) is used instead. `HeaderPaths` could either be a single string
  literal or a comma-separated list of strings in square brackets:
  __\[__*HeaderPath* \[**,** *HeaderPath*\]*__\]__.
  * **ExternalName** **=** **"**_FullyQualifiedName_**"**: marks a type that is already marked with
  `ExternalType` to have a distinct fully-qualified name in C++ generated code (i.e. to have a name
  that is not derived automatically from the element's name given in the declaration).
  * **ExternalGetter** **=** **"**_FunctionName_**"**,
  **ExternalSetter** **=** **"**_FunctionName_**"**: marks a field in a struct type that is already
  marked with `ExternalType` to have be accessed through given getter/setter functions instead of
  directly in C++ generated code.

### Comments

There are two kinds of comments in LimeIDL: local comments and documentation comments. Local
comments are transient: they are meant as comments to the LimeIDL text itself, but not the elements
that it declared, and thus these are discarded without affecting the generated code in any way.
Documentation comments, on the other hand, are meant to document the declared elements and thus are
preserved in the generated code (see [Documentation conventions](documentation_conventions.md) for
more details).

#### Local comments

* Syntax: __#__*text*
* Example: `# Copyright (C) 2016-2019 HERE Europe B.V.`
* Description: defines a single-line local comment. All text after the `#` symbol until the end of
the line is taken as the comment text.

#### Documentation comments, single-line

* Syntax: __//__*text*
* Example:
```
// Process the input in the given mode.
fun process(mode: Mode, input: String): GenericResult
```
* Description: defines a single-line documentation comment. All text after `//` symbols until the
end of the line is taken as the comment text.

#### Documentation comments, multi-line

* Syntax: __/\*__*multi-line-text*__\*/__
* Example:
```
/*
Process the input in the given mode.
A lot of multi-line text can be said about it.
*/
fun process(mode: Mode, input: String): GenericResult
```
* Description: defines a multi-line documentation comment. All text after between `/*` and `*/`
symbols is taken as the comment text, including the line breaks.

#### Structured documentation comments

Documentation comments also support structured comments for some elements (i.e. specifying comments
for child elements in the comment of the parent element). Structured comments can be specified in
both `//` and `/*` style comments (or even in a combination of those).

Structured comments are supported for functions. Example:
```
// Process the input in the given mode.
// A lot of multi-line text can be said about it.
// @param[mode] operational mode
// @param[input] data for processing
// @return a generic result
// @throws if something goes wrong
fun process(mode: Mode, input: String): GenericResult throws SomethingWrongException
```

Structured comments are supported for properties. Example:
```
// Time interval taken by the processing.
// @get Gets the time interval taken by the processing.
// @set Sets the time interval taken by the processing.
property processingTime: ProcessorHelperTypes.Timestamp
```

Structured comments for structs allow specifying documentation for the struct's auto-generated
constructor. Example:
```
// Stores various important options.
// @constructor Creates a nice storage for your various very important options.
struct Options {
    flagOption: Boolean
    uintOption: UShort
    additionalOptions: List<String> = []
}
```

#### Platform-specific comments

Parts of documentation comments can be varied per platform (i.e. per output language). Example:
```
// Process something{@Java , maybe}. Returns a {@Cpp generic} result
// and throws if something goes wrong{@Swift  but not on iOS}.
fun process(): GenericResult throws SomethingWrongException
```

The resulting documentation will look like this, per language:
* *C++*: `Process something. Returns a generic result and throws if something goes wrong.`
* *Java*: `Process something, maybe. Returns a result and throws if something goes wrong.`
* *Swift*: `Process something. Returns a result and throws if something goes wrong but not on iOS.`

[xtext]: https://www.eclipse.org/Xtext/
[emf]: https://www.eclipse.org/modeling/emf/
[antlr]: https://www.antlr.org/
