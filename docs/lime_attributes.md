LIME IDL attributes
======================

Most LIME IDL elements can be prefixed by attributes:
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

General attributes
------------------

* **@Immutable**: marks a struct type as immutable.
* **@Equatable**: marks a struct type, a class, or an interface as equatable.
* **@Serializable**: marks a struct type as serializable.
* **@Deprecated(**\[**Message** **=**\] **"**_DeprecationMessage_**"**__)__: marks an element as
deprecated, takes a string literal value as a deprecation message. Platform-specific inline tags are supported for
deprecation messages (see `Platform-specific comments` below for syntax).
* **@Cached**: marks a property to be cached on platform side (i.e. read from C++ only once on first
access and cached in Java/Kotlin/Swift/Dart afterwards). Currently, only supported for read-only properties.
* **@Internal**\[**(**__PlatformTag__**)**\]: marks an element to have "internal" visibility. Additionally, platform
tag(s) ("Java", "Kotlin", "Swift", or "Dart") could be specified. This will make the internal visibility apply on the selected
platform(s). This attribute does not have any effect in Kotlin.
> **Important:** the behavior of `@Internal` tag for Dart is different from that for Java/Swift. In Dart, the types
> annotated as `@Internal` do have "internal" visibility. However, functions, properties, constructors and field
> constructors are not generated. These elements are skipped like in the case of `@Skip` attribute.
>
> **Note:** in order to achieve the same behavior for the mentioned elements in Dart, one could rename them via `@Dart`
> annotation. Please refer to Dart's specific section for more information.
* **@Overloaded**: marks a lambda element to behave as if it were overloaded (i.e. as if there is another lambda with
the same parameter and return types). This can be used in scenarios of multiple separate generation runs with disjoint
LIME model trees.
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
case-insensitive. There are three predefined tags that do not need to be specified explicitly: "Java", "Kotlin", "Swift", "Dart",
and "Cpp". They mark the element to be skipped in the generated code for the corresponding language. Please note that
only `const` and `field constructor` can be skipped in C++.
* **@EnableIf(**\[**Tag** **=**\] **"**_CustomTag_**"**__)__ or **@EnableIf(**__CustomTag__**)**: marks an element to be
enabled only if a custom tag with that name was defined through command-line parameters. If the tag is not present, the
element is skipped (not generated). Custom tags are case-insensitive.
* **@AfterConstruction(**_"someFunction(this, someConstructorArg)"_**)** - can be used only with constructors of classes.
It specifies a function that should be called after the constructor call finishes and the object is properly created and cached.
It is required when `this` object needs to be passed to some platform method during construction. The function call inside
`@AfterConstructed()` annotation can use any of parameters of the constructor in any order. In order to refer to this/self
object `this` keyword should be used in LIME file.
To understand the purpose of the usage let's consider the following situation:
  * we have a constructor, which takes an interface: `constructor(someInterface: SomeInterface)`
  * we want to call a method of the interface from the constructor with the newly created object: `someInterface.doSomething(this)`
  * if the call is performed from C++ factory function implemented by the user of the generated code, then at the moment
of call the platform object (Java, Kotlin, Swift, Dart) is not properly constructed and cached
  * to avoid such problematic situations and breaking the cache/leaking objects `@AfterConstruction()` should be used --
all the work related to using interfaces or derived classes that may require passing the object back to the platform code from constructor should be done inside
the function specified via `@AfterConstruction()`

Java-specific attributes
------------------------

**@Java**: marks an element with Java-specific behaviors:

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
default value. Please note that combining this attribute with `@Internal` fields is not supported. The positional
defaults constructors will be generated with a `@Deprecated` annotation, if _DeprecationMessage_ is specified.
* **Public** or **Internal**: marks an element to have the corresponding visibility in Java, disregarding any "global"
visibility attributes the element might have.

Kotlin-specific attributes
------------------------

**@Kotlin**: marks an element with Kotlin-specific behaviors:

* \[**Name** **=**\] **"**_ElementName_**"**: marks an element to have a distinct name in Kotlin.
  This is the default specification for this attribute.
* **FunctionName** **=** **"**_FunctionName_**"**: marks a lambda type to have a specific function
  name in the generated functional interface in Kotlin (instead of a default name).
* **Skip** \[**=** **"**_CustomTag_**"** \]: marks an element to be skipped (not generated) in Kotlin. Can be applied to
  any element except for enumerators. Optionally, if custom tag is specified, the element is only skipped if that tag
  was defined (see `@Skip` above).
* **EnableIf** **=** **"**_CustomTag_**"**: marks an element to be enabled in Kotlin only if a custom tag with that
  name was defined through command-line parameters. If the tag is not present, the element is skipped (not generated).
* **Attribute** **=** **"**_Annotation_**"**: marks an element to be marked with the given annotation in Kotlin
  generated code. _Annotation_ does not need to be prepended with `@`. _Annotation_ can contain parameters, e.g.
  `@Kotlin(Attribute="Deprecated(\"It's deprecated.\")")`. If some of the parameters are string literals, their enclosing
  quotes need to be backslash-escaped, as in the example.
* **PositionalDefaults** \[**=** **"**_DeprecationMessage_**"** \]: marks a struct to have additional constructors
  simulating optional positional parameters in Kotlin. Can only be applied to a struct that has at least one field with a
  default value. Please note that combining this attribute with `@Internal` fields is not supported. The positional
  defaults constructors will be generated with a `@Deprecated` annotation, if _DeprecationMessage_ is specified.
* **Public** or **Internal**: marks an element to have the corresponding visibility in Kotlin, disregarding any "global"
  visibility attributes the element might have.

Swift-specific attributes
-------------------------

**@Swift**: marks an element with Swift-specific behaviors:

* \[**Name** **=**\] **"**_ElementName_**"**: marks an element to have a distinct name in Swift.
This is the default specification for this attribute.
* **Label** **=** **"**_LabelName_**"**: marks a parameter of a function or a constructor to have a distinct argument
label in Swift.
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
* **OptionSet**: marks an enumeration to be generated in Swift as a `struct` implementing the `OptionSet` protocol.
Additionally, for each enum `MyEnum` marked as such, any usage of `Set<MyEnum>` will be replaced by `MyEnum` itself in
Swift, per the `OptionSet` usage pattern.
* **Public** or **Internal**: marks an element to have the corresponding visibility in Swift, disregarding any "global"
visibility attributes the element might have.

Dart-specific attributes
------------------------

**@Dart**: marks an element with Dart-specific behaviors:

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
> **Important:** if the constructor used for the default value is non-const, then the generated constructor will use
> optional value to prevent compilation error. However, this implies certain limitation for default values of nullable
> types, which do not provide const constructor (i.a. Blob type or custom structures that are not annotated as `@Immutable`).
>
> If the field is nullable and its type does not provide const constructor then the only default value that is accepted
> can be null. If any other value is used then the generator will raise validation error.
* **Attribute** **=** **"**_Annotation_**"**: marks an element to be marked with the given annotation in Dart
generated code. _Annotation_ does not need to be prepended with `@`. _Annotation_ can contain parameters, e.g.
`@Dart(Attribute="Deprecated(\"It's deprecated.\")")`. If some of the parameters are string literals, their enclosing
quotes need to be backslash-escaped, as in the example.
* **Public** or **Internal**: marks an element to have the corresponding visibility in Dart, disregarding any "global"
visibility attributes the element might have.

> **Note:** in order to ensure the consistent behavior between Java/Swift/Dart in terms of internal functions,
> constructors and field constructors renaming of elements in Dart could be used.
>
> @Internal("Java", "Swift")\
> @Dart("_withDefaults")\
> field constructor(some_field, another_field)
>
> The presented syntax ensures, that the field constructor is internal in Java/Swift. It is private in Dart, because its
> name starts with underscore.

C++-specific attributes
-----------------------

**@Cpp**: marks an element with C++-specific behaviors:

* \[**Name** **=**\] **"**_ElementName_**"**: marks an element to have a distinct name in C++.
This is the default specification for this attribute.
* **Const**: marks a function with a `const` qualifier in C++ generated code.
* **Noexcept**: marks a function with a `noexcept` qualifier in C++ generated code. Can be applied to functions and properties.
* **Accessors**: marks a struct to have accessor functions generated for fields and to generate
struct fields as "private" in C++ generated code. Intended for use with `@Immutable` attribute.
* **Ref**: marks a function or a property to return their value by const reference in C++
generated code (instead of default "by value"). Can be applied to functions and properties in
classes or structs. Currently not supported inside interfaces.
* **Attribute** **=** **"**_Attribute_**"**: marks an element to be marked with the given attribute in C++
generated code. _Attribute_ does not need to be enclosed in `[[]]`. _Attribute_ can contain parameters, e.g.
`@Cpp(Attribute="deprecated(\"It's deprecated.\")")`. If some of the parameters are string literals, their enclosing
quotes need to be backslash-escaped, as in the example.
* **Type** **=** **"**_TypeName_**"**: marks a `Date`, `Duration`, or `String` type reference to use an alternative type
in C++ generated code. For example, `@Cpp(Type="std::chrono::steady_clock::time_point") Date` will use monotonic clock
time point type, instead of the system clock time point type which is used by default.
* **ToString**: marks an enumeration to have a helper `to_string()` function generated, mapping the enum to string.
* **Skip** \[**=** **"**_CustomTag_**"** \]: marks an element to be skipped (not generated) in C++. Can be applied to
`field constuctor` or `const` elements only. Optionally, if custom tag is specified, the element is only skipped if
that tag was defined (see `@Skip` above).
* **EnableIf** **=** **"**_CustomTag_**"**: marks an element to be enabled in C++ only if a custom tag with that
name was defined through command-line parameters. Can be applied to a `field constuctor` element only. If the tag is
not present, the element is skipped (not generated).

Skip/enable attributes precedence
---------------------------------

When multiple `@Skip` and/or `@EnableIf` attributes are specified for the element, the following rules are applied to
resolve them:
* If there are several attributes of the same kind, they are combined using "or" logic: i.e. when there are multiple
`@Skip` attributes, the element is skipped if any of the "skip" conditions is satisfied; when there are multiple
`@EnableIf` attributes, the element is enabled if any of the "enable" conditions is satisfied.
* If there are simultaneously both `@Skip` and `@EnableIf` attributes, `@Skip` attribute take precedence: i.e. the
element is present if and only if `@EnableIf` condition is true and `@Skip` condition if false; otherwise the element is
skipped.
