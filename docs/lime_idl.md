LimeIDL documentation
=====================

Overview
--------

This document describes the input language for Gluecodium: LimeIDL.

### What is LimeIDL?

LimeIDL is the input language for Gluecodium. The name is a stylized abbreviation. "LIME"
stands for "Language-Independent ModEl", the internal language-independent syntax tree model that
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

    exception SomethingWrongException(String)
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
* text in *italic* is a placeholder, usually for a user-defined name, or some other user-defined
sequence (in which case it will be explained specifically each time).
* `(` and `)` enclose a set of alternatives, with each alternative separated with `|` symbol.
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

#### Visibility

Most elements can be prefixed with a visibility prefix. Possible visibility prefixes are currently
`public`, `internal`, `open` and `open internal`. Visibility prefix is optional, an element without
such a prefix is considered `public`. The visibility prefix, if present, should precede the rest of
the declaration.

* Example: `internal static property secretDelegate: ProcessorDelegate? { get set }`
* List of element kinds that can have a visibility prefix: class, interface, types, function,
constructor, property, property accessor, struct, struct field, enumeration, exception, constant,
type alias, lambda.
* List of element kinds that cannot have a visibility prefix: package, import, function parameter,
enumerator.
* `open` and `open internal` are currently only supported for classes. Both mean the class can be
inherited from (see `Inheritance` below).

#### Line breaks

Most declarations are allowed to have an arbitrary (zero or more) number of line breaks between any
parts of the declaration. Two notable exceptions are:
* Each file-level declaration must have at least one line break at the end of the declaration. This
also means there must always be a trailing line break at the end of the file.
* Attributes (see `Attributes` below) are not allowed to have any line breaks between `@` and the
attribute name that follows.

### File-level declarations

There are three kinds of file-level declarations: package, import or element declaration. The
following element types can be placed at the top level: `class`, `interface`, `types`, `struct`,
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
class, interface, or struct. `types` declaration can be only placed at file level.

#### Inheritance

Classes and interfaces support inheritance (optionally, see *ParentName* in the syntax above).
There are some restrictions on inheritance:
* multiple inheritance is supported with limitations (see `Multiple inheritance` below).
* an interface cannot inherit from a class.
* a class can only inherit from another ("parent") class if the parent class has "open" visibility
(see `Visibility` above).
* a class or an interface with "public" visibility cannot inherit from a class or an interface with
"internal" visibility (see `Visibility` above).

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
recoverable. See `Referential equality` below for advanced details.

Apart from the limitations listed above, multiple inheritance functions in the same way as single inheritance.

### Child element declarations

Child element declarations can only be placed inside the declaration of another element (most often
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
  * a function can be declared as `static` (optionally), meaning it's not a member function, but a
  class function (type function).

#### Constructor

* Syntax: **constructor** *FunctionName*__(__*parameter-list*__)__
\[**throws** *ExceptionName*\]
* where *parameter-list* is a comma-separated list of parameters, each parameter declared as
*ParameterName*: *ParameterType*
* Example: `constructor create(options: Options?) throws SomethingWrongException`
* Can be placed in: class, struct
* Description: declares a constructor (Java, Swift, Dart) or a factory function (C++) in the parent type:
  * a constructor declaration includes a name, which translates into a name of the factory function
  in C++. Other output languages have normal "nameless" constructors generated in the public API.
  * a constructor can have any number of parameters (zero or more).
  * a constructor can be declared as throwing an exception (optionally, also see `Exception` below).

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
* Can be a free-standing element at file level or can be placed in: class, interface, types, struct.
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
* Can be a free-standing element at file level or can be placed in: class, interface, types, struct.
* Description: declares an enumeration type in the parent type:
  * an enumeration can have any number of enumerators, but at least one enumerator is required.
  * an enumerator can have a value associated with it (optionally). The value can be either an integer or another
  enumerator from the same enumeration (also known as "enumerator alias"). For more details on values and literals see
  `Values and Literals` below.

#### Exception

* Syntax: **exception** *ExceptionName*__(__*ErrorTypeName*__)__
* Example: `exception SomethingWrong(ErrorType)`
* Can be a free-standing element at file level or can be placed in: class, interface, types, struct.
* Description: declares an exception (error) type in the parent type:
  * an exception has an error-value type associated with it.
  * an exception type cannot be used as a regular type, it can only be used in a `throws` clause of
    a function (see `Function` and `Constructor` above).

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
names are case-insensitive. Supported platform tags:
  * **cpp**: describes "external" behavior for C++. Supported value names:
    * **include**: *mandatory value*. Specifies include path(s) for the pre-existing type. Can be
    either a single path or a comma-separated list of paths.
    * **name**: specifies a distinct C++ name (i.e. to have a name that is not derived automatically
    from the element's name declared in IDL declaration). For types the name should be fully
    qualified. This value is also supported for property accessors (within a type already marked as
    "external"). For accessors the name does not have to be fully-qualified. Please note that only
    one-to-one correspondence between IDL types and "external" C++ types is supported.
    * **getterName**, **setterName**: marks a field in a struct type that is already marked as
    external to be accessed through given getter/setter functions instead of directly in C++.
  * **java**: describes "external" behavior for Java. Currently only supported for structs and
  enums. Supported value names:
    * **name**: *mandatory value*. Specifies a full Java name for the pre-existing type (i.e.
    including package names and names of outer classes, as it would appear in an `import`
    statement).
    * **getterName**, **setterName**: marks a field in a struct type that is already marked as
    external to be accessed through given getter/setter functions instead of directly in Java.
    * **converter**: specifies a pre-existing converter class (by its full Java name). A converter
    class should have two static functions named `convertToInternal` and `convertFromInternal`,
    providing conversion between the "external" type and the generated "internal" type (which has
    package-private visibility).
  * **swift**: describes "external" behavior for Swift. Currently only supported for structs and
  enums. Supported value names:
    * **framework**: *mandatory value*. Specifies a name of a Swift framework that needs to be
    imported for the pre-existing type. The value can be an empty string `""` if the type resides
    in the current framework or in the "Foundation" framework.
    * **converter**: specifies a pre-existing converter class. A converter class should have two
    static functions named `convertToInternal` and `convertFromInternal`, providing conversion
    between the "external" type and the generated "internal" type. The argument of each conversion
    function has to be anonymous (i.e. with `_` argument label).
  * **dart**: describes "external" behavior for Dart. Currently only supported for structs and
  enums. Supported value names:
    * **importPath**: *mandatory value*. Specifies a full import path for a Dart `import` directive
    needed for the pre-existing type (i.e. either `"dart:<library_name>"` or
    `"package:<path>/<file_name>.dart"`).
    * **converter**: specifies a pre-existing converter class. A converter class should have two
    static functions named `convertToInternal` and `convertFromInternal`, providing conversion
    between the "external" type and the generated "internal" type.
    * **converterImport**: specifies a relative import path for a Dart `import` directive
    needed for the pre-existing converter class (i.e. `"<path>/<file_name>.dart"`).
* **Note:** the following features of struct types cannot be combined with "external" behavior:
custom constructors, field default values.
* **Note:** the way of specifying the name of the external type to use varies slightly between
output languages. For C++ and Java it needs to be a fully-qualified name and it is specified through
`cpp name "..."` and `java name "..."` values of the external descriptor. For Swift and Dart a
regular short name is enough, so it can be specified through `@Swift("...")` and `@Dart("...")`
attributes (or omitted if the name is the name of the type in IDL declaration).
* **Note:** due to specifics of external type naming mentioned just above, the intermediate internal
type which is generated when a converter is specified has an additional `_internal` suffix to its
name in Swift and Dart.

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
* **Locale**: locale type (containing ISO codes for region, language, and script; and/or BCP 47
language tag)

Container types:
* **List<Type>**: list/array container type, e.g. `List<String>`
* **Set<Type>**: set container type, e.g. `Set<String>`
* **Map<KeyType, ValueType>**: map container type, e.g. `Map<String, Blob>`

**Note**: Since the `Locale` type is based on ISO-compliant identifiers (as described above), any platform-specific
properties of `Locale` type (e.g. `calendarIdentifier` for Swift) are not preserved on language boundary transition.

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

Binary, octal or hexadecimal integer literals are currently not supported.

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

Here's the list of currently supported attributes:
* **@Immutable**: marks a struct type as immutable.
* **@Equatable**: marks a struct type, a class, or an interface as equatable.
* **@Serializable**: marks a struct type as serializable.
* **@Deprecated(**\[**Message** **=**\] **"**_DeprecationMessage_**"**__)__: marks an element as
deprecated, takes a string literal value as a deprecation message. Platform-specific inline tags are supported for
deprecation messages (see `Platform-specific comments` below for syntax).
* **@Cached**: marks a property to be cached on platform side (i.e. read from C++ only once on first
access and cached in Java/Swift/Dart afterwards). Currently, only supported for read-only properties.
* **@Async**: *EXPERIMENTAL* marks a function to be generated with support for asynchronous invocation. Currently,
only works in Dart. See [async.md](async.md) for details.
* **@Optimized**: *EXPERIMENTAL* marks a type reference of `List<>` type to fetch list elements from C++ to platform
side on demand instead of a creating a full platform-side copy. C++ list is generated as an
`std::vector<std::shared_ptr<>>` in this case. This attribute can be applied only to:
  * return type of a function
  * type of a read-only property
  * type of a field in an `@Immutable` struct
* **@NoCache**: *EXPERIMENTAL* marks a class or an interface to omit instance caching when crossing a language boundary.
This breaks the referential equality invariant (see `Referential equality` below), but may save resources for use cases
when a lot of small instances are sent over the language boundary repeatedly.
* **@Skip(**\[**Tag** **=**\] **"**_CustomTag_**"**__)__ or **@Skip(**__CustomTag__**)**: marks an element to be skipped
(not generated) if a custom tag with that name was defined through command-line parameters. Custom tags are
case-insensitive. There are three predefined tags that do not need to be specified explicitly: "Java", "Swift", "Dart",
and "Cpp". They mark the element to be skipped in the generated code for the corresponding language. Please note that
only `const` and `field constructor` can be skipped in C++.
* **@EnableIf(**\[**Tag** **=**\] **"**_CustomTag_**"**__)__ or **@EnableIf(**__CustomTag__**)**: marks an element to be
enabled only if a custom tag with that name was defined through command-line parameters. If the tag is not present, the
element is skipped (not generated). Custom tags are case-insensitive.
* **Internal**: marks a type declaration to have "internal" visibility, where supported: "package-private" in Java,
"internal" in Swift, and "not-exported" in Dart. This attribute has no effect in C++. 
* **@Java**: marks an element with Java-specific behaviors:
  * \[**Name** **=**\] **"**_ElementName_**"**: marks an element to have a distinct name in Java.
  This is the default specification for this attribute.
  * **FunctionName** **=** **"**_FunctionName_**"**: marks a lambda type to have a specific function
  name in the generated functional interface in Java (instead of a default name).
  * **Skip** \[**=** **"**_CustomTag_**"** \]: marks an element to be skipped (not generated) in Java. Can be applied to
  any element except for enumerators. Optionally, if custom tag is specified, the element is only skipped if that tag
  was defined (see `@Skip` above).
  * **EnableIf** **=** **"**_CustomTag_**"**: marks an element to be enabled in Java only if a custom tag with that
  name was defined through command-line parameters. If the tag is not present, the element is skipped (not generated).   
  * **Attribute** **=** **"**_Annotation_**"**: marks an element to be marked with the given annotation in Java
  generated code. _Annotation_ does not need to be prepended with `@`. _Annotation_ can contain parameters, e.g.
  `@Java(Attribute="Deprecated(\"It's deprecated.\")")`. If some of the parameters are string literals, their enclosing
  quotes need to be backslash-escaped, as in the example.
  * **PositionalDefaults** \[**=** **"**_DeprecationMessage_**"** \]: marks a struct to have additional constructors
  simulating optional positional parameters in Java. Can only be applied to a struct that has at least one field with a
  default value. Please note that combining this attribute with internal (see `Visibility` above) fields is not
  supported. The positional defaults constructors will be generated with a `@Deprecated` annotation, if
  _DeprecationMessage_ is specified.
* **@Swift**: marks an element with Swift-specific behaviors:
  * \[**Name** **=**\] **"**_ElementName_**"**: marks an element to have a distinct name in Swift.
  This is the default specification for this attribute.
  * **Label** **=** **"**_LabelName_**"**: marks a parameter of a function or a constructor to have a distinct argument
  label in Swift.
  * **Extension**: marks a type collection (`types`) to be generated as Swift extension. The primary
  use case for this is adding nested types into a pre-existing Swift type (i.e. non-generated).
  Extending a generated type is also possible, but requires usage of `Name` attribute to avoid name
  clashes on other platforms.
  * **Skip** \[**=** **"**_CustomTag_**"** \]: marks an element to be skipped (not generated) in Swift. Can be applied to
  any element except for enumerators. Optionally, if custom tag is specified, the element is only skipped if that tag
  was defined (see `@Skip` above).
  * **EnableIf** **=** **"**_CustomTag_**"**: marks an element to be enabled in Swift only if a custom tag with that
  name was defined through command-line parameters. If the tag is not present, the element is skipped (not generated).
  * **Weak**: marks a property in an interface as `weak` in Swift. Property should have a nullable type. Please note
  that `weak` properties are still represented with "strong" pointers on C++ side. Due to this limitation, if an
  interface type is used for such property, that interface can only have methods that return nullable values or `void`.
  The interface also should be marked with the same `@Swift(Weak)` attribute. Non-interface types could be used freely.
  * **Attribute** **=** **"**_Attribute_**"**: marks an element to be marked with the given attribute in Swift
  generated code. _Attribute_ does not need to be prepended with `@`. _Attribute_ can contain parameters, e.g.
  `@Swift(Attribute="available(*, deprecated, message: \"It's deprecated.\")")`. If some of the parameters are string
  literals, their enclosing quotes need to be backslash-escaped, as in the example.
  * **ParameterDefaults**: marks a "field constructor" of a struct to have field default values as parameter defaults
  in Swift, for those fields that are listed in the "filed constructor's" signature.
* **@Dart**: marks an element with Dart-specific behaviors:
  * \[**Name** **=**\] **"**_ElementName_**"**: marks an element to have a distinct name in Dart. This is the default
  specification for this attribute.
  * **FullName** **=** **"**_ElementName_**"**: marks an element to have a distinct full name in Dart. Normally full
  name is the name of the element itself, prefixed by the name of its nesting parents. But this attribute overrides this
  name concatenation. This attribute is only meaningful for nested type declarations.
  * **Default**: marks a constructor as a "default" (nameless) in Dart.
  * **Skip** \[**=** **"**_CustomTag_**"** \]: marks an element to be skipped (not generated) in Dart. Can be applied to
  any element except for enumerators. Optionally, if custom tag is specified, the element is only skipped if that tag
  was defined (see `@Skip` above).
  * **EnableIf** **=** **"**_CustomTag_**"**: marks an element to be enabled in Dart only if a custom tag with that
  name was defined through command-line parameters. If the tag is not present, the element is skipped (not generated).
  * **PositionalDefaults** \[**=** **"**_DeprecationMessage_**"** \]: marks a struct to have a constructor with optional
  positional parameters in Dart. Can only be applied to a struct that has at least one field with a default value. The
  positional defaults constructor will be generated with a `@Deprecated` annotation, if _DeprecationMessage_ is
  specified.
  * **Attribute** **=** **"**_Annotation_**"**: marks an element to be marked with the given annotation in Dart
  generated code. _Annotation_ does not need to be prepended with `@`. _Annotation_ can contain parameters, e.g.
  `@Dart(Attribute="Deprecated(\"It's deprecated.\")")`. If some of the parameters are string literals, their enclosing
  quotes need to be backslash-escaped, as in the example.
* **@Cpp**: marks an element with C++-specific behaviors:
  * \[**Name** **=**\] **"**_ElementName_**"**: marks an element to have a distinct name in C++.
  This is the default specification for this attribute.
  * **Const**: marks a function with a `const` qualifier in C++ generated code.
  * **CString**: marks a function parameter of `String` type to accept `const char*` in C++ (in
  addition to usual `std::string`). This produces one additional overload for the function.
  * **Accessors**: marks a struct to have accessor functions generated for fields and to generate
  struct fields as "private" in C++ generated code. Intended for use with `@Immutable` attribute.
  * **Ref**: marks a function or a property to return their value by const reference in C++
  generated code (instead of default "by value"). Can be applied to functions and properties in
  classes or structs. Currently not supported inside interfaces.
  * **Attribute** **=** **"**_Attribute_**"**: marks an element to be marked with the given attribute in C++
  generated code. _Attribute_ does not need to be enclosed in `[[]]`. _Attribute_ can contain parameters, e.g.
  `@Cpp(Attribute="deprecated(\"It's deprecated.\")")`. If some of the parameters are string literals, their enclosing
  quotes need to be backslash-escaped, as in the example.
  * **Type** **=** **"**_TypeName_**"**: marks a `Date` or a `Duration` type reference to use an alternative type in C++
  generated code. For example, `@Cpp(Type="std::chrono::steady_clock::time_point") Date` will use monotonic clock time
  point type, instead of the system clock time point type which is used by default.
  * **ToString**: marks an enumeration to have a helper `to_string()` function generated, mapping the enum to string.
  * **Skip** \[**=** **"**_CustomTag_**"** \]: marks an element to be skipped (not generated) in C++. Can be applied to
  `field constuctor` or `const` elements only. Optionally, if custom tag is specified, the element is only skipped if
  that tag was defined (see `@Skip` above).
  * **EnableIf** **=** **"**_CustomTag_**"**: marks an element to be enabled in C++ only if a custom tag with that
  name was defined through command-line parameters. Can be applied to a `field constuctor` element only. If the tag is
  not present, the element is skipped (not generated).
  * ~~**ExternalType** **=** **"**_HeaderPaths_**"**~~: legacy attribute, superseded by `cpp
  include` in the `External Descriptor` (see above).
  * ~~**ExternalName** **=** **"**_FullyQualifiedName_**"**~~: legacy attribute, superseded by `cpp
  name` in the `External Descriptor` (see above).
  * ~~**ExternalGetter** **=** **"**_FunctionName_**"**~~: legacy attribute, superseded by `cpp
  getterName` in the `External Descriptor` (see above).
  * ~~**ExternalSetter** **=** **"**_FunctionName_**"**~~: legacy attribute, superseded by `cpp
  setterName` in the `External Descriptor` (see above).

#### Skip/enable attributes precedence

When multiple `@Skip` and/or `@EnableIf` attributes are specified for the element, the following rules are applied to
resolve them:
* If there are several attributes of the same kind, they are combined using "or" logic: i.e. when there are multiple
`@Skip` attributes, the element is skipped if any of the "skip" conditions is satisfied; when there are multiple
`@EnableIf` attributes, the element is enabled if any of the "enable" conditions is satisfied.
* If there are simultaneously both `@Skip` and `@EnableIf` attributes, `@Skip` attribute take precedence: i.e. the
element is present if and only if `@EnableIf` condition is true and `@Skip` condition if false; otherwise the element is
skipped.

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
    // An optional flag to do something useful.
    flagOption: Boolean = false
    // A uint option to specify something more useful.
    uintOption: UShort = 1
    // Additional options to add something more.
    additionalOptions: List<String> = []
}
```

The comment after the `@constructor` tag will be used for the documentation of the constructor. The line above will be used for the documentation of the struct itself. The parameter documentation of the constructor will use the same documentation as for the fields of the struct. A default value will make it possible to omit a field from a constructor.

Structured comments for lambdas allow specifying comments for lambda parameters, even though they do not have explicit
names. Implicit positional names should be used for parameters instead: `p0`, `p1`, and so on. Example:
```
// Communicate the date and the message.
// @param[p0] the current date.
// @param[p1] the new message.
// @return whether the operation succeeded.
lambda TimestampCallback = (Date, String) -> Boolean
```

#### Formatting in documentation comments

Markdown-style formatting is supported in documentation comments. It is processed and converted to language-specific
formatting in the generated code, where appropriate (e.g. into HTML formatting in generated JavaDoc). Most commonly used
Markdown features are:
* links (see `Links` below)
* bold/italic/code test formatting
* ordered/unordered lists
* character escaping (see `Character escaping` below)

#### Links in documentation comments

Markdown-style links are supported in documentation comments. Example:
```
// Process the input in the given mode, based on [Mode]. For more details, see [example],
// [another example](https://www.example.com/details2), or <https://www.example.com/details3>.
//
// [example]: https://www.example.com/details1
fun process(mode: Mode, input: String): GenericResult
```

There are three ways to specify web links:
1. reference web link, e.g. `[example]` with `[example]: https://www.example.com/details1` listed at the end of the comment.
2. inline web link, e.g. `[another example](https://www.example.com/details2)`.
3. automatic web link, e.g. `<https://www.example.com/details3>`.

Any square-brackets link that does not resolve into a web link is treated as a link to some IDL element, e.g. `[Mode]`.
Please note that all whitespace between the square brackets is ignored during link resolution.

When referring to a function, you can also optionally mention its signature (list of parameter types, but not the return
type), e.g. `[Processor.process(Mode, String)]`. This way you can refer to a specific overload of an overloaded
function. Please not that parameter type names should be simple unqualified names, i.e.
`[Processor.process(Mode, String)]` instead of `[Processor.process(com.example.Processor.Mode, String)]`

When referring to a property element, you can also specifically refer to its getter or its setter by adding `.get` or
`.set` suffix respectively, e.g. `[Processor.secretDelegate.set]`.

#### Platform-specific comments

Parts of documentation comments can be varied per platform (i.e. per output language). Example:
```
// Process something{@Java  the Java way}. Returns a{@Cpp generic } result
// and throws if something goes wrong{@Swift  but not on iOS}.
fun process(): GenericResult throws SomethingWrongException
```

The resulting documentation will look like this, per language:
* *C++*: `Process something. Returns a generic result and throws if something goes wrong.`
* *Java*: `Process something the Java way. Returns a result and throws if something goes wrong.`
* *Swift*: `Process something. Returns a result and throws if something goes wrong but not on iOS.`
Note that one space after the `@Platform` is treated as separator, everything after that, including
spaces is considered to be part of the comment.

Supported platform tags are `@Cpp`, `@Java`, `@Swift`, and `@Dart`.

Multiple platform tags can be combined in a single `{@ }` section, if necessary:
```
// Process something{@Cpp @Java  the right way}.
```

#### Character escaping in documentation comments

Special characters `@`, `{`, `}`, `[`, `]`, and `\` can be used in documentation comments only if they are
"escaped" with an additional backslash (i.e. `\@`, `\{`, `\}`, `\[`, `\]`, and `\\` respectively).

#### Excluding an element from documentation

Documentation comments support a special `@exclude` tag. This tag is converted into a language-appropriate "exclude from
the documentation" tag in the generated code. When using this tag, it should be placed on a separate line of its own
within the IDL documentation comment.

Advanced concepts
-----------------

### Referential equality

Objects crossing the language boundary is a core concept of bindings generated by Gluecodium. The general behavior of
such transitions is the same for Java, Swift, and Dart. For simplification, these are collectively called "Platform
languages" or just "Platform" below.

An important property of languages boundary transitions is conservation of referential equality: is the object equal to
itself by reference (or by pointer in C++) when sent across this boundary twice? There are two distinct sub-cases:
* "send twice": the object is sent twice in the same between-languages direction, and then two copies of the object are
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
  * from C++ to Platform and back: does not work, i.e. referential equality is not conserved.
