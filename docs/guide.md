User guide
==========

This guide's goal is to give an overview which language features Gluecodium offers and how to use them. It also gives
hints on where to add manually written implementation to the generated code. For a complete syntax
description of LimeIDL please refer to the [LimeIDL description](lime_idl.md).

Overview
--------

Gluecodium generates a C++ API with language bindings for Java, Swift, or Dart. For C++ it will
generate declarations only. These need to be implemented manually to provide application logic.
Java, Swift, and Dart bindings are completely generated and forward all calls to C++.

Crossing the language boundary
------------------------------

When building a mobile app, the entry point for the program will be in Java/Swift/Dart (referred
further as "platform code"). Calls then can be made from platform code into C++ code. Platform code
can call static or non-static member functions. Calling into platform code from C++ is only possible
on objects passed from platform code to C++ first.

**Note:** Both in Java and in Dart the native library needs to be loaded manually before any call to C++ is possible.

Classes
-------

Classes are generated as an abstract class in C++ and as wrapper classes containing all the
conversion and bindings code in platform code. These classes have all of their logic on C++ side.
New instances can only be created if it is the return value of a function, and it is up to
the manual C++ implementation which subclass is returned. When the function is called from
platform code the instance will be automatically wrapped.

Structs
-------

Mostly similar to a `class`, with three key differences:
* a `struct` is considered a value type, so it is passed across any language boundaries by copy.
* type inheritance is not supported for structs (a technical limitation imposed by Swift language).
* in additional to any capabilities a `class` has, a `struct` can have data fields.

A `struct` is generated as `struct` in Swift and C++ and as `class` in Java and Dart. Structs have by default
constructors generated in all languages.

**Note:** Although in Java and Dart everything is a reference type, a struct is still a copy, so any modifications on a
struct are not propagated to the "original", unless passed across the language boundary explicitly as a parameter or
similar. If change-propagating behavior is desired, a class with properties can be used instead.

Interfaces
----------

An interface is generated as interface/protocol/abstract-class in Java/Swift/Dart. For C++ the same abstract
class and bindings is generated as it would be for classes. Unlike classes, interfaces can also be
implemented in platform code allowing to use platform logic.

When an instance implementing the interface is passed to C++, a proxy object is instantiated. For the receiver of said
object it is transparent whether the implementation is in platform code or C++. Although the same wrapper objects as for
classes are generated, allowing to implement the interface also in C++, the main use case is to use services provided by
the target platform, e.g. positioning, notifications, threading, etc.

**Note** It is safe to do comparison on the `std::shared_ptr` in C++ to check if it's the same
platform object as passed before. This is not true if C++ doesn't hold a shared pointer
anymore and the proxy is released.

**Note** Holding `std::shared_ptr` of the proxy object in C++ will extend the lifetime of the
object on platform side.

Constructors
------------

Constructors are special methods for structs and classes which return a new instance of that type.
Constructors are generated as static method declarations in C++ and can do initialization and/or
validation, as well as return error states. In platform code these are generated as constructors/initializers to
provide native feel.

**Note:** Having custom constructors on structs disables generation of the default ones in platform code.

**Note:** Method overloading generally works for constructors. One notable exception is that a pair
of constructors overloaded on an collection type parameter (i.e. having signatures that differ only in
collection element types) will generate uncompilable code in Java (other languages will still compile).

Nullable type references
------------------------

You can append a `?` to a type reference, i.e. the usage of a type, to mark it as nullable. In
generated Swift and Dart code this property controls whether the type is "optional"/"nullable" or not, therefore
enforcing nullability at compile time. For Java generated code the nullability is expressed through
a `@Nullable` annotation, enabling compile time enforcing when used with Kotlin language. For C++
generated code for classes and interfaces the nullability is expressed as a documentation comment.

**Note:** Java annotations are only generated if these are specified via command line parameter.

**Note:** The C++ generated code will use `std::optional` to express nullability for types other than class or
interface.

Documentation comments
----------------------

Comments can be formatted in [Markdown](https://spec.commonmark.org/0.28/) and links to other
types can be added in the form `[package.Interface.method]`.

For properties the syntax `[PropertyName.set]` and `[PropertyName.get]` can be used to refer to setters/getters
explicitly. Without the suffix, the reference will link to the getter in languages which have
getters and setters.


Annotations
-----------

### Language annotations: @Cpp, @Swift, @Java, @Dart

Language annotations allow setting attributes specific to a generated language. All of them support
setting a custom name for the annotated element which will be used for generation.

### `@Equatable`

Classes and structs marked like this are equal-comparable. For structs, comparison and hash functions
are auto-generated. For classes, only the declaration is generated, which needs to be implemented in C++
or otherwise results in linking errors.

Exception types
---------------

Exception types defined in the IDL correspond to different types or concepts in the generated code,
depending on the target language.

### C++

C++ generated code does not use C++ exceptions concept, mostly to support projects that decide to
disable those for their C++ code. Instead, for functions that have an error type declared, both
return type and error type are wrapped into a custom union-like class `Return<Value, Error>`. This
is done even if the return type is `void`.

There is, however, a slightly different behavior is the error type is an enumeration (for historical
reasons):
* the enumeration type is replaced with `std::error_code` whenever it is used as an error type.
* conversion functions are generated to support implicit conversion from the enum type to `std::error_code`.
* if return type is `void`, `Return<Value, Error>` is replaced by just `std::error_code`.

### Java, Dart

LimeIDL exception types are represented as platform exceptions in Java/Dart generated code. The generated
exception class has a field `error` that carries the value of the error type. There are no
additional conventions, the generated exceptions behave like regular Java/Dart exceptions.

### Swift

LimeIDL exception types are represented throwable types in Swift generated code. This is
accomplished by generating a Swift `extension` for the error type that adds compliance to `Error`
protocol. Moreover, a type alias with the error name pointing to the real error type is generated,
but this is for convenience only and does not affect the functionality in any way.
