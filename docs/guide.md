User guide
==========

This guide's goal is to give you, as the user of Genium code generation tool, an overview
which language features Genium offers and how to use them. It also gives you clues where
you need to add your own implementation to the generated code. For a complete syntax
description of LimeIDL please refer to the [LimeIDL description](lime_idl.md).

Overview
--------

Genium generates a C++ API with language bindings for Java and Swift. For C++ it will
generate declarations only. These need to be implemented by you to provide application logic.
Java and Swift bindings are completely generated and forward all calls to C++.

Crossing the language boundary
------------------------------

When building a Swift or Java app, the entry point for the program will be in Java/Swift.
Calls then can be made from Java/Swift into C++ code. Java/Swift can call static or
non-static member functions. Calling into Java/Swift from C++ is only possible on objects
passed from Java/Swift to C++ first.

**Note:** In Java the native library needs to be loaded manually before any call to C++ is
possible.

Classes
-------

Classes are generated as an abstract class in C++ and as wrapper classes containing all the
conversion and glue code in Java/Swift. These classes have their logic always on C++ side.
New instances can only be created if it is the return value of a function and it is up to
the users C++ implementation which subclass is returned. When the function is called from
Java/Swift the instance will be automatically wrapped.

**Note:** There is no pointer equality on Java and Swift side for the same wrapped C++ object.

Structs
-------

Similar to a `class` but considered a value type. It is generated as `struct` in Swift and C++
and as `class` in Java. Structs are passed by value and since they are value types, all methods
are const. Structs have by default constructors generated in all languages.

**Note:** Although in Java everything is a reference type, modifications on a struct are
not reflected in C++ unless it is passed to C++ explicitly as a parameter or similar. If
changes need to be propagated a class with properties should be used.

Interfaces
----------

An interface is generated as interface/protocol in Java/Swift. For C++ the same abstract
class and glue is generated as it would be for classes. Unlike classes, interfaces can also be
implemented in Java/Swift allowing to use platform logic.
When an instance implementing the interface/protocol is passed to C++, a proxy
object is instantiated. For the receiver of said object it is transparent whether the
implementation is in Java/Swift or C++.
Although the same wrapper objects as for classes are generated, allowing to implement the
interface also in C++, the main use case is to use services provided by the target platform,
e.g. positioning, notifications etc.

**Note** It is safe to do comparison on the `std::shared_ptr` in C++ to check if it's the same
Java/Swift object as passed before. This is not true if C++ doesn't hold a shared pointer
anymore and the proxy is released.

**Note** Holding `std::shared_ptr` of the proxy object in C++ will extend the lifetime of the
object in Java/Swift.

**Note** Interfaces cannot have static methods since Genium cannot know in which language
these should be implemented.

Constructors
------------

Constructors are special methods for structs and classes which return a new instance of that type.
Constructors are generated as static method declarations in C++ and can do initialization,
validation and return errors. In Java/Swift these are generated as constructors/initializers to
provide native feel.

**Note:** Having custom constructors on structs disables generation of the default ones in Java/Swift.

**Note:** Constructors are not supported for interfaces.

**Note:** Method overloading generally works for constructors. One notable exception is that a pair
of constructors overloaded on an Array or Map parameter (i.e. having signatures that differ only in
array/map element types) will generate uncompilable code in Java (Swift and C++ will still compile).

Nullable type references
------------------------

You can append a `?` to a type reference, i.e. the usage of a type, to mark it as nullable. In
generated Swift code this property controls whether the type is "optional" or not, therefore
enforcing nullability at compile time. For Java generated code the nullability is expressed through
a @Nullable annotation, enabling compile time enforcing when used with Kotlin language. For C++
generated code for Interfaces the nullability is expressed as a documentation comment.

**Note:** Java annotations are only generated if these are specified via command line parameter.

**Note:** The C++ generated code will use `optional` to express nullability for non-Interface types.
Which implementation is used depends on the compiler version: Genium uses `std::optional` if available,
but falls back to a custom implementation of it otherwise. This behavior can be overwritten with defines,
see generated `Optional.h` header.

Documentation comments
----------------------

Comments can be formatted in [Markdown](https://spec.commonmark.org/0.28/) and links to other
types can be added in the form `[package.Interface.method]`. For properties the syntax
`[PropertyName.set]` and `[PropertyName.get]` can be used to refer to setters/getters
explicitly. Without suffix the reference will link to the getter in languages which have
getters and setters.


Annotations
-----------

### Language annotations @Cpp, @Swift, @Java

Language annotations allow to set attributes specific to a generated language. All of them support
setting a custom name for the annotated element which will be used for generation.

#### `@Cpp(ExternalName=..., ExternalType=...)`

`@ExternalType` and `@ExternalName` can be used to skip generating C++ code but only generate
Java/Swift and glue code. This is useful when exposing already existing C++ APIs.
For external structs which fields have getters and setters instead of direct field access,
`@ExternalGetter` and `@ExternalSetter` can be used to declare those.

### `@Equatable`

Classes and structs marked like this are equal comparable. For structs comparison and hash functions
are auto-generated. For classes only the declaration is generated which needs to be implemented in C++
or otherwise results in linking errors.

**Note:** All fields in structs marked as `@Equatable` need to be of simple type or be marked as
`@Equatable` or `@PointerEquatable` themselves.

### `@PointerEquatable`

Classes marked like this are equal comparable by comparing the instances raw pointer in C++.
Interfaces marked as `@PointerEquatable` also support hashing.
