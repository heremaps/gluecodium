Struct constructors
===================

This documents various types of constructors that can be defined for structs in LIME IDL.

Implicit constructors
---------------------

When no constructors are explicitly defined for a LIME IDL struct, Gluecodium still adds some constructors to the
generated code. Each such struct would have at least the constructor that provides values to all uninitialized fields 
(i.e. fields which do not have a default value specified in the LIME definition). The order of constructor parameters
corresponds to the order of field definitions.

For example,
```
struct MyStruct {
    text: String
    isMultiline: Boolean = true
}
```
will have a `MyStruct(text)` constructor generated in all output languages.

In addition, if the struct is marked as `@Immutable`, an all-fields constructor will be generated too. For example,
```
@Immutable
struct MyStruct {
    text: String
    isMultiline: Boolean = true
}
```
will have both `MyStruct(text)` and `MyStruct(text, isMultiline)` constructors generated.

Unlike the regular generated functions, implicit constructors in API languages are _not_ backed by any C++ logic. They
initialize the fields in native code only.

Implicit constructors are sufficient for most use cases. When the API semantics require a different set of constructors,
or when constructors need to have logic beyond just field initialization, explicit constructor definitions could be used
instead, as outlined in the following sections.

As the names suggest, adding any kind of explicit constructor to the struct definition disables the generation of 
implicit constructors.

Field constructors
------------------

A LIME IDL struct can have any number of `field constructor(...)` definitions, where `...` is a comma-separated list of
field names. This list can be empty. The order of the field names in this list can be arbitrary; it can differ from the
order in which the fields themselves are defined in the struct.

Each field constructor definition _must_ include all uninitialized fields of the struct; initialized fields could be
included or excluded arbitrarily.

For example,
```
@Immutable
struct MyStruct {
    text: String
    isMultiline: Boolean = true
    field constructor(text)
    field constructor(text, isMultiline)
}
```
would exactly reproduce the implicit constructors from the previous example.

Similarly to the implicit constructors above, field constructors in API languages are _not_ backed by any C++ logic.
They initialize the fields in native code only.

Custom constructors
-------------------

A LIME IDL struct can have any number of "custom constructor" definitions. Unlike the field-based implicit and explicit
constructors described above, the custom constructors are not "native" and are more similar to regular functions: in a
sense that they are backed by manually written logic in a (static) C++ function. On the API side they still look like
perfectly normal constructors though. The full syntax is:
**constructor** *FunctionName*__(__*parameter-list*__)__ \[**throws** *ExceptionName*\]

Custom constructors definitions require an explicit name. While not visible on the API side, this name is needed for the
static function in the C++ generated code. It also might be needed for Dart constructors "overloading" (see 
`Dart specifics` section below).

For example,
```
struct MyStruct {
    text: String
    isMultiline: Boolean = true
    constructor fromText(input: String)
}
```
would generate a `static MyStruct from_text(std::string)` function in C++, as well as `MyStruct(String)` constructors
in all other output languages. A manual C++ implementation of `from_text()` could, for example, derive the value for
`isMultiline` field based on presence of line break characters in the input string, while assigning the input itself to
the `text` field.

Swift specifics
---------------

For Swift, the implicit struct constructors are generated with parameter default values for fields that do have such
values in the LIME definition. By default, this syntax is not used for the explicit `field constructor` definitions. To
enable parameter defaults there as well, the field constructor can be annotated with `@Swift(ParameterDefaults)`.

If any fields in the LIME struct are marked as `@Deprecated`, and the struct has no explicit constructors, Gluecodium
will try to generate one additional implicit constructor in Swift. The additional constructor omits all the deprecated
fields from its parameter list. For this to succeed, all deprecated fields need to have default values defined.

Dart specifics
--------------

Dart language does not support any kind of function overloading. This applies to constructors as well. Nevertheless,
multiple constructors per type are supported in Dart, with the syntax of "named constructors".

Considering this, if multiple explicit constructors are defined for a single struct in LIME IDL, they have to be given
distinct Dart names, for the generated code to be compilable. Similar to the regular functions, a `@Dart("fooBar")`
attribute would give an explicit constructor `fooBar` name. Also, up to one explicit constructor can be marked with
`@Dart(Default)`, making it the single nameless constructor for the struct in Dart.

For example,
```
struct MyStruct {
    text: String
    isMultiline: Boolean = true
    @Dart(Default)
    field constructor(text, isMultiline)
    @Dart("smartFromText")
    constructor fromText(input: String)
}
```
would generate the following two constructors in Dart:
```dart
MyStruct(String text, bool isMultiline)
MyStruct.smartFromText(String input)
```
