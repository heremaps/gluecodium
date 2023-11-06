LimeIDL documentation
=====================

Overview
--------

This document describes the input language for Gluecodium: LimeIDL.

### What is LimeIDL?

LimeIDL is the input language for Gluecodium. The name is a stylized abbreviation. "LIME"
stands for "**L**anguage-**I**ndependent **M**od**E**l", the internal language-independent model tree that
serves as an intermediate step between the input language (e.g. LimeIDL) and the output
language (e.g. C++, Java, Swift, Dart). "IDL" is an industry-standard abbreviation for "Interface
Definition Language". This describes any Gluecodium input language perfectly, as its input languages are
defining programming interfaces (as opposed to defining executable code, like output languages do).

LimeIDL syntax is inspired by the modern programming languages like Kotlin and Swift. The design
intent is to have an input language that is compact (i.e. not verbose) and is easy to read and
write in. The intent is also for the language to be flexible enough to be extended in the future
without losing these qualities.

LimeIDL syntax
--------------

### Example

Start with [examples](../examples/README.md).

For more advanced lime examples check [functional tests](https://github.com/heremaps/gluecodium/tree/master/functional-tests/functional/input/lime).

Also [cmake tests](https://github.com/heremaps/gluecodium/tree/master/cmake/tests/unit) demonstrate how to use CMake scripts for more complex scenarios when you need multiple modules which interact with each other.

### General remarks on syntax

#### Notation

The sections below use the following notation to describe the LimeIDL syntax:
* text in **bold** is verbatim, i.e. these are keywords and special characters exactly as they
appear in the language.
* text in *italic* is a placeholder, usually for a user-defined name, or some other user-defined
sequence (in which case it will be explained in detail each time).
* `(` and `)` enclose a set of alternatives, with each alternative separated by a `|` symbol.
* `[` and `]` enclose a sequence that is optional, i.e. can be omitted.

#### Identifiers

LimeIDL supports two kinds of identifiers (names): simple identifiers and escaped identifiers.

Most of the identifiers are simple ones. They should follow common rules for identifiers:
* can contain only Latin letters, digits, and underscores `_`.
* cannot start with a digit.

Escaped identifies are enclosed in '`' backticks. Escaped identifiers support the whole range of
Unicode characters. The only characters that are not allowed are line breaks and backticks.

**Note:** non-alphanumeric characters for elements whose names are reflected in file names (e.g.
package names or names of classes, interfaces, structs, etc.) might lead to unexpected compilation
issues in the generated code, depending on the file system and/or operating system.

**Note:** Unicode characters in C++ identifiers are supported by C++ standard, but the actual support
might vary per compiler implementation.

#### Line breaks

Most declarations are allowed to have an arbitrary (zero or more) number of line breaks between any
parts of the declaration. Two notable exceptions are:
* Each file-level declaration must have at least one line break at the end of the declaration. This
also means there must always be a trailing line break at the end of the file.
* Attributes (see `Attributes` below) are not allowed to have any line breaks between `@` and the
attribute name that follows.

### File-level declarations

There are three kinds of file-level declarations: package, import, and element declaration. The
following element types can be placed at the top level: `class`, `interface`, `struct`,
`enum`, `exception`, `typealias`, `lambda`. All other declarations can only be placed as child elements to
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

#### Classes and interfaces

* Syntax: (**class** | **interface**) *ElementName*\[**:** *ParentName*\] **{**
*child-elements-declarations...* **}**
* Example: `class SomeImportantProcessor { ... }`
* Example: `interface ProcessorDelegate: GenericDelegate { ... }`
* Description: declares a container-type language element:
  * **class** corresponds to a class declaration in the output languages.
  * **interface** corresponds to an interface (protocol) declaration in the output languages.
* Classes and interfaces can be free-standing elements at file level or can be placed in another
class, interface, or struct.

#### Inheritance

Classes and interfaces support inheritance (optionally, see *ParentName* in the syntax above).
There are some restrictions on inheritance:
* an interface cannot inherit from a class.
* a class can only inherit from another ("parent") class if the parent class has an `open` modifier, e.g.
`open class MyClass`.
* multiple inheritance is supported with limitations (see `Multiple inheritance` below).

Contrary to the usual practice encountered in programming languages, in LimeIDL it is not necessary
to (re)declare functions and properties of parent class/interface in the child class. An IDL
declaration describes an API and parent's functions and properties are already part of child's API
due to inheritance. Gluecodium generators will also generate all necessary code for the child class
automatically.

#### Multiple inheritance

Classes and interfaces can inherit from several types at once, although with limitations. Multiple parent types can be
declared as a comma-separated list of type names (in place of just a single *ParentName* in the inheritance syntax). The
following limitations apply:
* "diamond" inheritance (i.e. two parent types inheriting from the same grand-parent type) is not supported.
* first parent can be either class or interface, as in single inheritance; each additional parent can only be an
interface of a special kind, declared as `narrow interface`.
* a `narrow interface` can also be the first parent, if needed, in place of a regular interface.
* unlike a regular interface, a `narrow interface` does not always preserve type information on crossing the
language boundary; specifically, if an object is upcast from the child type to the parent `narrow interface` type,
and then sent across the language boundary (in any direction), it loses the child type and cannot be downcast back to
it at the destination.
* if such upcast object is sent back again across the language boundary, the type information may or may not be
recoverable. See `Referential equality` at the end of this document for advanced details.

Apart from the limitations listed above, multiple inheritance works in the same way as single inheritance.

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
* Can be a free-standing element at file level or can be placed in: class, interface, struct.
* Description: declares a struct type (data type):
  * a struct can have any number of fields, but at least one field is required.
  * a struct field can have a default value associated with it (optionally). For more details on
  values and literals see `Values and Literals` below. A field of a nullable type (i.e. with a `?` suffix) implicitly
  has a default value of `null`, unless explicitly defined otherwise.
  * in addition to fields, a struct can have member functions, constructors, constants, and other types declared
  inside it.

#### Enumeration

* Syntax: **enum** *EnumName* **{** *enumerators-list* **}**
* where *enumerators-list* is a comma-separated list of enumerators, each enumerator declared as
*EnumeratorName* \[**=** *EnumeratorValue*\]
* Example: `enum Mode { SLOW, FAST, CHEAP }`
* Can be a free-standing element at file level or can be placed in: class, interface, struct.
* Description: declares an enumeration type:
  * an enumeration can have any number of enumerators, but at least one enumerator is required.
  * an enumerator can have a value associated with it (optionally). The value can be either an integer or another
  enumerator from the same enumeration (also known as "enumerator alias"). For more details on values and literals see
  `Values and Literals` below.

#### Exception

* Syntax: **exception** *ExceptionName*__(__*ErrorTypeName*__)__
* Example: `exception SomethingWrong(ErrorType)`
* Can be a free-standing element at file level or can be placed in: class, interface, struct.
* Description: declares an exception (error) type:
  * an exception has an error-value type associated with it.
  * an exception type cannot be used as a regular type, it can only be used in a `throws` clause of
    a function (see `Function` and `Constructor` above).

#### Type alias

* Syntax: **typealias** *AliasName* **=** *AliasType*
* Example: `typealias Timestamp = Date`
* Can be a free-standing element at file level or can be placed in: class, interface, struct
* Description: declares a type alias (typedef).

#### Lambda

* Syntax: **lambda** *LambdaName* **=** *AliasType* **=** __(__*parameter-list*__)__ **->** *ReturnType*
* Example: `lambda TimestampCallback = (Date) -> Void`
* Can be a free-standing element at file level or can be placed in: class, interface, struct.
* Description: declares a lambda type (a functional reference). Unlike the functions, specifying a
return type for a lambda is required. For declaring lambdas with no return type, `Void` type should
be used (like in the example above). When clarity is needed, it is possible to use lambda syntax with named
parameters, for example: `lambda TimestampCallback = (currentDate: Date) -> Void`

### Child element declarations

Child element declarations can only be placed inside the declaration of another element (class, interface, or struct).

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
  * a function can be declared as throwing an exception (optionally, also see `Exception` above).
  * a function can be declared as `static` (optionally), meaning it's not a member function, but a
  class function (type function).

#### Constructor

* Syntax: **constructor** *FunctionName*__(__*parameter-list*__)__ \[**throws** *ExceptionName*\]
* where *parameter-list* is a comma-separated list of parameters, each parameter declared as
*ParameterName*: *ParameterType*
* Example: `constructor create(options: Options?) throws SomethingWrongException`
* Can be placed in: class, struct
* Description: declares a constructor (Java, Swift, Dart) or a factory function (C++) in the parent type:
  * a constructor declaration includes a name, which translates into a name of the factory function
  in C++. Other output languages have normal "nameless" constructors generated in the public API.
  * a constructor can have any number of parameters (zero or more).
  * a constructor can be declared as throwing an exception (optionally, also see `Exception` above).

#### Field Constructor

* Syntax: **field constructor** __(__\[*field-list*\]__)__
* where *field-list* is a comma-separated list of field names
* Example: `field constructor(latitude, longitude)`
* Can be placed in: struct
* Description: declares a field-based constructor in the struct type:
  * a field constructor can have any number of parameters (zero or more), corresponding to the fields of the struct.
  * the order of field constructor parameters can be arbitrary; it can differ from the order in which the fields
  themselves are declared in the struct.
  * each field constructor declaration must include all uninitialized fields of the struct (i.e. fields which do not
  have a default value specified for them); initialized fields could be included or excluded arbitrarily.

#### Property

* Syntax: \[**static**\] **property** *PropertyName*__:__ *PropertyType*
\[**{** **get** \[**set**\] **}**\]
* Example: `static property secretDelegate: ProcessorDelegate? { get set }`
* Can be placed in: class, interface
* Description: declares a property in the parent type:
  * a property can be declared as `static` (optionally), meaning it's not a member property, but a
  class property (type property).
  * a property declaration corresponds to a property in the output language if it does have such a
  concept (Swift, Dart) or to a pair of accessor methods (or just one getter method for a readonly
  property) if there is no "property" concept (C++, Java).

#### Constant

* Syntax: **const** *ConstantName*__:__ *ConstantType* **=** *ValueLiteral*
* Example: `const DefaultOptions: Options = {true, 42, {}}`
* Can be placed in: class, struct
* Description: declares a constant in the parent type. For more details on values and literals see
`Values and Literals` below.

#### External descriptor

* Syntax: **external** **{** *descriptors-list* **}**
* where *descriptors-list* is a newline-separated list of one or more descriptors, each declared as
*PlatformTag* *ValueName* **"**_Value_**"**
* Example: `external { cpp include "other/MoreTypes.h" }`
* Can be placed in: class, interface, struct, enum. If present, it must be the first child element.
* Can be used as a trailing declaration for: field, property getter, property setter.
* Description: describes "external" behavior for the element. "External type" is a type that does
not use generated code for the specified output language, but uses a pre-existing type instead
(manually written, from a system library, or from a third-party library). Platform tags and value
names are case-insensitive. Please refer to [external_types.md](external_types.md) for detailed explanation.

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
* **Date**: date type (containing both a calendar date, and a clock timestamp). Default C++ type is
`std::chrono::system_clock::timepoint`, can be changed through `@Cpp(Type)` attribute (see `Attributes` below).
* **Duration**: duration type. Default C++ type is `std::chrono::seconds`, can be changed through `@Cpp(Type)` attribute
(see `Attributes` below).
* **Locale**: locale type (containing ISO codes for region, language, and script; and/or BCP 47 language tag).

Container types:
* **List<Type>**: list/array container type, e.g. `List<String>`
* **Set<Type>**: set container type, e.g. `Set<String>`
* **Map<KeyType, ValueType>**: map container type, e.g. `Map<String, Blob>`

**Note**: Since the `Locale` type is based on ISO-compliant identifiers (as described above), any platform-specific
properties of `Locale` type (e.g. `calendarIdentifier` for Swift) are not preserved on language boundary transition.

**Note**: When converting `Locale` from C++ representation to a platform type, the BCP 47 language tag takes precedence.
I.e. if the tag is present, the ISO codes are ignored during conversion; if the tag is absent, the ISO codes are used.

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

Integer decimal literals are supported, e.g. `10`, `-42`. Floating-point literals are supported, both with and without
the exponent, e.g. `3.14`, `1.41e-2`. The specific type of the literal is determined from the declaration of the field
or the constant where the literal is used.

An integer decimal literal followed by a time unit suffix (e.g. `500ms`) is recognized as a `Duration` type literal.
Supported time unit suffixes are `d`, `h`, `min`, `s`, `ms`, `us`, and `ns`.

Binary, octal, or hexadecimal integer literals are currently not supported.

#### String literals

String literals are enclosed in quotes `"`, e.g. `"hello"`. Unicode characters are supported. Also,
a limited set of escaped characters is currently supported: `\\`, `\"`, `\n`, `\r`, `\t`.

A string literal can be used to initialize a `Date` value. In this case it has to conform to ISO 8601 standard: e.g.
`"2022-02-04T11:15:17+02:00"`, or `"2022-02-04T09:15:17Z"` for a UTC value.

A string literal can also be used to initialize a `Locale` value. In this case it has to conform to BCP 47 standard:
e.g. `"en-US"`, `"nan-Hant-TW"`, etc.

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
* Description: initializes a `List<>`, a `Set<>`, or a `Blob` with the given values. `[]` initializes an empty list or
set.

#### Map initializer

* Syntax: **[** \[*list-of-pairs*\] **]**
* where *list-of-pairs* is a comma-separated list of *key*__:__ *value* pairs
* Example: `const FieldNames: Map<Int, String> = [1: "name", 42: "address"]`
* Description: initializes a `Map<>` with the given key-value pairs. `[]` initializes an empty map.

#### Constant reference

There are two subtypes of constant references:
* *Enumerator*: initializes an enumeration-type constant or field with the given enumerator value, e.g. `Mode.FAST`. 
An enumerators can also be referenced by its raw value, e.g. `Mode(0)`.
* *Named constant*: initializes a constant or field of any type with the named constant of matching type (see 
`Constant` above).

### Attributes

Most elements can be prefixed by attributes:
* Syntax: __@__*AttributeName*\[__(__*list-of-attribute-specs*__)__\]
* where *list-of-attribute-specs* is a comma-separated list of specifications, each optionally with
a value: *PropertySpecName* \[**=** *PropertySpecValue*\]
* Example: `fun process(mode: Mode, @Swift(Label = "_") input: String): GenericResult`
* Description: each attributes defines some additional behavior for the element, most often some
behavior specific to a single output language.
  * an element can be prefixed by any number of attributes.
  * an attribute can have any number of specifications associated with it (optionally).
  * an attribute can have a "default" specification that can have its name omitted and specified
    only by value instead, e.g. `@Deprecated("DeprecationMessage")`.

For detailed information on supported attributes and their behavior please refer to 
[lime_attributes.md](lime_attributes.md).
 
### Comments

There are two kinds of comments in LimeIDL: local comments and documentation comments. Local
comments are transient: they are meant as comments to the LimeIDL text itself, but not the elements
that it declared, and thus these are discarded without affecting the generated code in any way.
Documentation comments, on the other hand, are meant to document the declared elements and thus are
preserved in the generated code.

#### Local comments

* Syntax: __#__*text*
* Example: `# Copyright (C) 2016-2019 HERE Europe B.V.`
* Description: defines a single-line local comment. All text after the `#` symbol until the end of
the line is taken as the comment text.

#### Documentation comments

For detailed information on documentation comments please refer to [lime_markdown.md](lime_markdown.md).

Advanced concepts
-----------------

### Referential equality

Objects crossing the language boundary is a core concept of bindings generated by Gluecodium. The general behavior of
such transitions is the same for Java, Swift, and Dart. For simplification, these are collectively called "Platform
languages" or just "Platform" below.

An important property of languages boundary transitions is conservation of referential equality: is the object equal to
itself by reference (or by pointer in C++) when sent across this boundary twice? There are two distinct sub-cases:
* "send twice": the object is sent twice in the same direction between languages, and then two copies of the object are
compared in the destination language.
* "round trip": the object is sent between languages in one direction, then back again to the source language, and the
copy is compared to the original object in the source language.

The short answer is "_yes_": Gluecodium-generated bindings do conserve referential equality in any direction of
transition for both sub-cases. There are, however, some partial exceptions for `narrow interface` types.

#### Narrow interfaces

"Narrow interfaces" are special kind of interfaces used for multiple inheritance (see `Multiple inheritance` above).
They do have some partial exceptions from the usual conservation of referential equality. Notably, these exceptions
apply as long as the object crosses the language boundary as a "narrow interface". It does not matter if the "narrow
interface" was its second parent originally, or its first parent, or there's even no inheritance involved at all - the
exceptions still apply.

Here's how conservation of referential equality works for "narrow interfaces", per sub-case:
* "send twice": works normally, i.e. referential equality is fully conserved.
* "round trip": depends on the direction of the trip, i.e. whether the source language is C++ or not:
  * from Platform to C++ and back: works normally.
  * from C++ to Platform and back: _does not work_, i.e. referential equality is not conserved.
