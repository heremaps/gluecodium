# Gluecodium project Release Notes

## Unreleased
### Bug fixes:
  * Updated Dart generator to generate `void` function return type explicitly.

## 9.1.0
Release date: 2021-05-31
### Features:
  * Dart generated code now supports automatic finalization (clean-up of underlying C++ objects).
### Bug fixes:
  * Fixed issues caused by ALIAS libraries in CMake toolchain.
### Deprecated:
  * `release()` method on classes and interfaces in Dart is now deprecated and does nothing.

## 9.0.1
Release date: 2021-05-28
### Features:
  * Generated Dart code now supports null safety.
### Breaking changes:
  * Generated Dart code now requires minimum Dart version 2.12.0.
  * In Dart, factory constructor `fromLambdas()` that is generated for interfaces was renamed into a nameless factory
    constructor. Its signature was changed from using named "required" parameters to using positional parameters.

## 8.13.5
Release date: 2021-05-27
### Bug fixes:
  * Fixed remaining Dart warnings from "dart analyze" static analysis tool.

## 8.13.4
Release date: 2021-05-21
### Bug fixes:
  * Fixed another batch of Dart warnings from "dart analyze" static analysis tool.

## 8.13.3
Release date: 2021-05-12
### Bug fixes:
  * Fixed more Dart warnings from "dart analyze" static analysis tool.

## 8.13.2
Release date: 2021-05-10
### Bug fixes:
  * Fixed missing includes for types referenced through type aliases in Dart FFI.
  * Fixed missing imports for collections of "external" types in Swift.
  * Fixed missing imports for constants in Dart.
  * Added missing Dart overloads validation for functions/constructors of structs.
  * Fixed some Dart warnings from "dart analyze" static analysis tool.

## 8.13.1
Release date: 2021-04-28
### Bug fixes:
  * Fixed Dart runtime issue when passing a child class of an interface from C++ to Dart and then back to C++.

## 8.13.0
Release date: 2021-04-27
### Implementation:
  * Added support for `@Optimized` attribute on type references of `List<>` type. This is an experimental feature.
### Bug fixes:
  * Fixed compilation issues for all languages when a nested class/interface is declared in an outer class/interface
    and the outer type has an inheritance parent.

## 8.12.2
Release date: 2021-04-22
### Bug fixes:
  * Fixed Java compilation issue for Android API level 21.

## 8.12.1
Release date: 2021-04-19
### Bug fixes:
  * Fixed Dart compilation issue for `@PositionalDefaults` structs with fields of List/Map/Set types.

## 8.12.0
Release date: 2021-04-15
### Features:
  * Added `@EnableIf("Tag1", "Tag2"...)` attribute for enabling elements based on presence of user-defined custom tags.

## 8.11.1
Release date: 2021-03-31
### Bug fixes:
  * Reduced boilerplate code for functions returning `void` in Swift.

## 8.11.0
Release date: 2021-03-30
### Features:
  * Added support for static functions and properties in interfaces.
### Bug fixes:
  * Fixed missing "root namespace" for forward declarations in C++.

## 8.10.0
Release date: 2021-03-22
### Features:
  * Added support for nesting exception type declarations inside a struct declaration in IDL.

## 8.9.10
Release date: 2021-03-16
### Bug fixes:
  * For documentation comments of functions in Dart added forced line breaks between subsections to improve readability.

## 8.9.9
Release date: 2021-03-16
### Bug fixes:
  * Fixed name resolution for single constructors in Dart.

## 8.9.8
Release date: 2021-03-15
### Bug fixes:
  * Suppressed documentation for C handle in Swift.

## 8.9.7
Release date: 2021-03-11
### Features:
  * CMake toolchain now removes `COMMON` source set files when they are not needed.
### Removed:
  * Obsolete CMake toolchain APIs were removed.

## 8.9.6
Release date: 2021-03-05
### Bug fixes:
  * Fixed Swift compilation issue for overriding initializers in child classes.

## 8.9.5
Release date: 2021-03-03
### Features:
  * Added `@Java(PositionalDefaults)` attribute for structs. This attribute marks a struct to have an imitation of a
    constructor with optional positional parameters in Java (only if the struct has any fields with default values).

## 8.9.4
### Bug fixes:
  * Struct default constructor in C++ is no longer erroneously omitted if one of the fields is a
    collection of immutable elements.

## 8.9.3
Release date: 2021-02-24
### Bug fixes:
  * Fixed processing of documentation links to method overloads when one of the paramers refers to a nested type.
  * Fixed DoxyGen comment generation for links to method overloads with nullable parameters in C++.

## 8.9.2
Release date: 2021-02-17
### Bug fixes:
  * Fixed output directory deduction in CMake toolchain.

## 8.9.1
Release date: 2021-02-16
### Bug fixes:
  * Fixed compilation issues for modularized Swift builds.

## 8.9.0
Release date: 2021-02-15
### Bug fixes:
  * Suppressed documentation for equality operator and hash function overloads in Swift.
  * Fixed run-time issues when passing lambdas, sets, or nullable lists from Swift to C++.
### Removed:
  * Deprecated IDL attribute `@Swift(ObjC)` was removed.
  * Removed "-mergemanifest" command line option. Android manifest merger should be performed with external tools
    instead (e.g. using Gradle).

## 8.8.0
Release date: 2021-01-27
### Features:
  * Added `@Skip("Tag1", "Tag2"...)` attribute for skipping elements based on presence of user-defined custom tags.
  * Added support for "positional" enumerator references.
### Bug fixes:
  * Added validation against applying `@Java(Skip)`, `@Swift(Skip)`, and `@Dart(Skip)` attributes to enumerators
    (i.e. to items of an enumeration).

## 8.7.1
Release date: 2021-01-18
### Bug fixes:
  * Fixed referential equality in Dart for objects being sent from Dart to C++ and then back.
  * Fixed `Hashable` protocol conformance for Swift classes that are not marked as `@Equatable`.
  * Fixed Dart issue with properties of the parent class being incorrectly propagated to the child class.

## 8.7.0
Release date: 2021-01-11
### Features:
  * Added `@Dart(PositionalDefaults)` attribute for structs. This attribute marks a struct to have a constructor with
    optional positional parameters in Dart (only if the struct has at least one field with a default value).
### Bug fixes:
  * `@Deprecated` attribute specified on a property in IDL is now propagated to that property's accessors (but only if
    they lack their own attribute of this type).
  * Fixed missing `NativeBase` inheritance for inner classes in Java.
### Removed:
  * "Stubs" mode of Java generator was removed.

## 8.6.8
Release date: 2020-12-16
### Bug fixes:
  * Fixed compilation issue with `Locale` type in C++ for Windows builds.
  * Fixed compilation issue for `Map<>` and `Set<>` types in Swift.

## 8.6.7
Release date: 2020-12-14
### Bug fixes:
  * Fixed support for specifying distinct "export" macro name in C++ for "modularized" builds.

## 8.6.6
Release date: 2020-12-10
### Features:
  * Added support for specifying a distinct "export" macro name for "common" sources in C++.

## 8.6.5
Release date: 2020-12-08
### Bug fixes:
  * Fixed compilation issue for collections of nullable types in Swift.
  * Fixed validation false positive for constructor overloads.
  * Fixed documentation comment reference resolution for functions in Dart.

## 8.6.4
Release date: 2020-11-26
### Bug fixes:
  * Fixed compilation issue for generic types in Dart.

## 8.6.3
Release date: 2020-11-25
### Bug fixes:
  * Fixed compilation issue for Swift function overloads with `@Swift(Name)` platform names.
  * Fixed compilation issues for "external" interfaces in Dart.

## 8.6.2
Release date: 2020-11-19
### Bug fixes:
  * Fixed flaky crash in Dart for callbacks being sent from Dart to C++ and then back.
  * Fixed compilation error for nullable Locale fields in Java.
  * Fixed runtime error for throwing methods with class/interface parameters in Java.

## 8.6.1
Release date: 2020-11-18
### Bug fixes:
  * Fixed crash caused by "recursive" IDL struct declarations.
  * Fixed compilation issue in C++ related to type declarations nested inside structs.

## 8.6.0
Release date: 2020-11-04
### Features:
  * Added support for nesting enumeration type declarations inside a struct declaration in IDL.
### Deprecated:
  * `@Swift(ObjC)` IDL attribute is now deprecated. `@Swift(Attribute="objc")` or `@Swift(Attribute="objcMembers")`
    should be used instead.

## 8.5.0
Release date: 2020-10-29
### Features:
  * Added support for free-form attributes in C++, Java, Swift, and Dart.
### Bug fixes:
  * Fixed support for no-message `@Deprecated` attribute in Swift.

## 8.4.6
Release date: 2020-10-26
### Bug fixes:
  * Enabled validation against applying `Skip` attributes to struct fields.
  * Fixed an issue when empty documentation comment was generated in C++ instead of no documentation comment.
  * Updated HTML formatting of generated JavaDoc to be more consistent.
  * Fixed Java and C++ compilation issues for struct fields of `Locale` type.

## 8.4.5
Release date: 2020-10-08
### Bug fixes:
  * Added validation against applying `Skip` attributes to struct fields.
  * Fixed handling of Swift flags in CMake helpers.

## 8.4.4
Release date: 2020-10-07
### Features:
  * Added support for web links in documentation comments. Reference web links, inline web links, and automatic web
    links are supported per Markdown specification.

## 8.4.3
Release date: 2020-10-05
### Bug fixes:
  * Fixed more Dart compilation issues related to items skipped with `@Dart(Skip)`.

## 8.4.2
Release date: 2020-10-05
### Bug fixes:
  * Fixed Dart compilation issue related to items skipped with `@Dart(Skip)`.

## 8.4.1
Release date: 2020-09-30
### Bug fixes:
  * Fixed JNI compilation issue for unity builds.

## 8.4.0
Release date: 2020-09-25
### Features:
  * Added support for `@exclude` tag in documentation comments. This tag is converted into a language-appropriate
    "exclude from the documentation" tag in the generated code.
  * Added support for `@Cpp(Ref)` attribute on functions and properties.
### Bug fixes:
  * Fixed Swift compilation issue for enumerations with one or more enumerators marked as `@Deprecated`.

## 8.3.1
Release date: 2020-09-17
### Features:
  * Introduced "testable" mode for the Dart generator (`-stubs` command-line parameter). This mode exposes an additional
    `$class` property from each generated class, allowing for injection of mock class objects.

## 8.3.0
Release date: 2020-09-14
### Features
  * Added support for nesting struct, class, or interface type declarations inside a struct declaration in IDL.
### Bug fixes:
  * Fixed Swift and Dart compilation issues for collections of `Locale` type elements.
  * Fixed Swift compilation issue for interface declarations nested inside classes.

## 8.2.3
Release date: 2020-09-09
### Bug fixes:
  * Fixed Java compilation issue with extraneous includes for `@Java(Skip)` on functions and properties in an interface.

## 8.2.2
Release date: 2020-09-09
### Features
  * Added customizable additional error message in Dart for when FFI function lookup fails.
### Bug fixes:
  * Fixed generator failures for `@Deprecated` attribute without a message (C++, Dart).
  * Fixed compilation issues for `@Java(Skip)`, `@Swift(Skip)`, and `@Dart(Skip)` on functions and properties in an interface.
  * Fixed compilation issue for cross-package inheritance of interfaces in Java.

## 8.2.1
Release date: 2020-08-26
### Bug fixes:
  * Fixed Java compilation issue for Date type conversion.

## 8.2.0
Release date: 2020-08-25
### Features
  * Added `@Swift(Weak)` attributes for marking properties as `weak` in Swift.
### Bug fixes:
  * Fixed Java compilation issue for class constructors with a single `Long` or `ULong` parameter.
  * Fixed compilation issue in Dart caused by `@Dart(Default)` constructors.

## 8.1.1
Release date: 2020-08-13
### Features
  * Updated method stubs generated "stubs" mode of Java generator to unconditionally throw `RuntimeException`.
### Bug fixes:
  * Fixed several memory leaks in Swift.

## 8.1.0
Release date: 2020-08-11
### Features:
  * Introduced "stubs" mode for the Java generator (`-stubs` command-line parameter). This mode replaces
    "native" methods in generated Java code with stubs (i.e. empty implementation) and removes
    "final" qualifier from classes and fields. This mode makes code generated for classes and structs
    fully mockable in unit tests.
### Bug fixes:
  * Fixed runtime issue for external type converters in Java.
### Deprecated:
  * Java code for the deprecated `@Java(Builder)` IDL attribute is now generated with a deprecation message of its own.

## 8.0.2
Release date: 2020-08-04
### Features:
  * Added support for platform-specific inline tags in `@Deprecated` deprecation messages.
### Bug fixes:
  * Fixed potential name clashes for external types in Java and Dart.
  * Equality support code is no longer generated for "external" types in Java, Swift, and Dart.

## 8.0.1
Release date: 2020-07-29
### Bug fixes:
  * Fixed linking issue in Java.

## 8.0.0
Release date: 2020-07-28
### Features:
  * Introduced "external descriptors", new IDL syntax for declaring "external" types. This syntax
    replaces `@Cpp(External*)` group of IDL attributes.
  * Added support for "external" structs and enums in Java, Swift, and Dart.
  * Structs marked as `@Immutable` in IDL are now marked as `@immutable` in Dart generated code as
    well.
### Deprecated:
  * `@Java(Builder)` IDL attribute is now deprecated. It still works the same way as before but
    its use is discouraged.

## 7.1.6
Release date: 2020-07-09
### Bug fixes:
  * Updated the workaround for Flutter hot restart issue in Dart.

## 7.1.5
Release date: 2020-07-07
### Bug fixes:
  * Fixed compilation issue in C++ caused by redundant "const" modifiers on methods.

## 7.1.4
Release date: 2020-07-06
### Features:
  * Slightly improved logging for unhandled exceptions when calling Java code from C++.
### Bug fixes:
  * Improved includes resolution logic in C++, resulting in minor corrections to both some missing
    and some extraneous includes.
  * Fixed dependency sorting logic for thrown types in C++.
  * Fixed runtime error for nested classes in Dart.

## 7.1.3
Release date: 2020-06-16
### Bug fixes:
  * Fixed compilation issue for interfaces containing a lambda declaration in Java.

## 7.1.2
Release date: 2020-06-16
### Bug fixes:
  * Fixed compilation issue for cross-package inheritance from an interface in Java.

## 7.1.1
Release date: 2020-06-11
### Bug fixes:
  * Fixed resolution of doc comment links to lambdas in C++ and Swift.

## 7.1.0
Release date: 2020-06-10
### Features:
  * Added support for system Locale type in Java/Swift/Dart.
### Bug fixes:
  * Fixed resolution of doc comment links to method parameters of overloaded methods in Dart.
  * Fixed links resolution and character escaping for deprecation messages in Dart.
  * Fixed runtime issue with stale cache entries in Dart.
  * Fixed runtime issue with error handling in calling Dart code from C++.
  * Added a workaround for a Flutter hot restart issue in Dart.

## 7.0.5
Release date: 2020-06-04
### Bug fixes:
  * Fixed runtime issue with stale cache references in Java.

## 7.0.4
Release date: 2020-06-02
### Bug fixes:
  * Fixed runtime issue in Dart for modularized builds.

## 7.0.3
Release date: 2020-05-28
### Bug fixes:
  * Fixed compilation issue for methods returning a nullable string in Java.
  * Fixed general compilation issue in Dart for modularized builds.

## 7.0.2
Release date: 2020-05-27
### Bug fixes:
  * Fixed a runtime issue in Java and Dart for platform-side objects that implement multiple
    generated interfaces at once.

## 7.0.1
Release date: 2020-05-26
### Bug fixes:
  * Fixed Dart support for `@constructor` doc comment on structs.
  * Fixed compilation issue for internal static properties in Dart.

## 7.0.0
Release date: 2020-05-19
### Features:
  * Added referential integrity for classes and interfaces in generated platform code. Meaning, when
    the same C++ object is passed twice to platform (Java/Swift/Dart) side, it is now guaranteed to
    be the same object on platform side as well.
  * Relaxed restrictions on `@Equatable` structs in IDL. Such structs now can contain fields of
    any class or interface types (not just those that are `@Equatable` themselves).
  * Added support for arbitrary exception payload when calling a throwing Dart method from C++.
  * Added doc comments for `release()` methods in Dart generated code.
  * Added `@nodoc` to internal elements in Dart generated code.
### Deprecated:
  * `@PointerEquatable` IDL attribute is now deprecated. It still works the same way as before but
    its use is discouraged. Referential integrity on platform side makes this attribute redundant.

## 6.6.6
Release date: 2020-05-13
### Features:
  * Improved doc comments in generated Dart code to be more compliant with Dart documentation
    guidelines.
### Bug fixes:
  * Fixed `hashCode` implementation for `@Equatable` structs with collection type fields in Dart.

## 6.6.5
Release date: 2020-05-11
### Features:
  * Added fallback compatibility with older CMake versions in CMake helpers.
### Bug fixes:
  * Fixed static initialization issue for Swift modularized builds.
  * Fixed handling of `\` backslash in IDL doc comments to support Markdown escaped characters.
  * Fixed Dart crash on isolate shutdown.
  * Fixed Windows build issue with command line length in CMake helpers.

## 6.6.4
Release date: 2020-05-06
### Bug fixes:
  * Fixed excessive logging in Dart generated code.

## 6.6.3
Release date: 2020-05-06
### Bug fixes:
  * Fixed linking issue for Swift modularized builds.
  * Fixed synchronization issues for Gradle parallel builds in CMake helpers.

## 6.6.2
Release date: 2020-05-04
### Bug fixes:
  * Fixed missing documentation comments on parameters marked with `@Cpp(CString)`.
  * Fixed handling of nested lists in IDL doc comments.
  * Reduced the number of compiler warnings for JNI generated code even further.

## 6.6.1
Release date: 2020-04-27
### Bug fixes:
  * Fixed C++ build issue in CMake helpers.
  * Fixed Swift issue in CMake helpers.
  * Fixed Windows build issue with Gradle.
  * Reduced the number of compiler warnings for JNI generated code.

## 6.6.0
Release date: 2020-04-22
### Features:
  * Added support for `Skip` platform-specific attribute in IDL (e.g. `@Java(Skip)`, `@Swift(Skip)`,
    or `@Dart(Skip)`). Elements marked with this attribute will be omitted in that platform's
    generated code. This attribute is not supported for C++.
  * Added support for creating an interface implementation directly from a set of lambdas in Dart.
  * Added `-werror` command line parameter to support elevating specific validation warnings to
    errors. Current supported warning types are `DocLinks` and `DartOverloads`.
  * Added support for `@Equatable` attribute on interface declarations in IDL.
  * Added support for `@Cached` attribute on read-only property declarations in IDL.
### Bug fixes:
  * Fixed Windows build issue in CMake helpers.
  * Fixed Java memory issue in CMake helpers.

## 6.5.0
Release date: 2020-04-16
### Features:
  * Added support for `@Cpp(CString)` IDL attribute that marks a function parameter of `String` type
    to accept `const char*` in C++ generated code.
  * Added support for including method signature when adding a documentation reference link in IDL.
  * Added validation warnings for method overloads in Dart generator.
### Bug fixes:
  * Fixed Dart conversion issue for enumerations with mixed explicit and implicit values.

## 6.4.9
Release date: 2020-04-07
### Features:
  * Added support for configuring name-joining infix for Dart naming rules.
### Bug fixes:
  * Fixed reference resolution for Dart documentation comments.

## 6.4.8
Release date: 2020-04-06
### Features:
  * Added support for configuring the path to Dart native shared library at runtime.
### Bug fixes:
  * Fixed compilation issue in Dart for structs with a mix of internal fields with and without
    default values.

## 6.4.7
Release date: 2020-04-02
### Bug fixes:
  * Fixed validation for parameter types in IDL declarations of lambdas.
  * Fixed Dart runtime issue for cross-platform handles.

## 6.4.6
Release date: 2020-04-02
### Bug fixes:
  * Fixed compilation issue in Dart for internal constructors.
  * Fixed validation for return types in IDL declarations of lambdas.
  * Fixed compilation issue in Dart for collection type references in lambdas.

## 6.4.5
Release date: 2020-04-01
### Bug fixes:
  * Fixed compilation issue in Dart for internal classes.

## 6.4.4
Release date: 2020-04-01
### Bug fixes:
  * Fixed compilation issue in Dart for internal lambdas.

## 6.4.3
Release date: 2020-04-01
### Bug fixes:
  * Fixed compilation issue in Dart for inherited properties with class type reference.

## 6.4.2
Release date: 2020-04-01
### Bug fixes:
  * Fixed version number.

## 6.4.1
Release date: 2020-03-31
### Bug fixes:
  * Fixed compilation issue in Swift for collection types in modularized builds.

## 6.4.0
Release date: 2020-03-31
### Bug fixes:
  * Documentation links to elements declared in "auxiliary" IDL sources are now resolved correctly
    in the generated C++, Java, and Swift code.
  * Internal implementation classes for Lambda interfaces in Java are now marked with `@exclude`
    JavaDoc tag.
  * Fixed compilation issue in Dart for collection types in modularized builds.
### Breaking changes:
  * Added validation against name clashes between property declarations in IDL files.

## 6.3.7
Release date: 2020-03-30
### Bug fixes:
  * Fixed compilation issue in Dart for structs with methods.

## 6.3.6
Release date: 2020-03-27
### Features:
  * Added support for cross-thread calling of Dart code in C++.
### Bug fixes:
  * Fixed compilation issue in Dart for @Equatable structs with internal fields.

## 6.3.5
Release date: 2020-03-20
### Features:
  * Added support for explicitly specifying "default" (nameless) constructors for Dart.
  * Added support for emulating package structure for Dart.

## 6.3.4
Release date: 2020-03-18
### Bug fixes:
  * Fixed issue in CMake helpers related to Swift+Dart fused builds.

## 6.3.3
Release date: 2020-03-17
### Features:
  * Updated C++ struct constructors to use move semantics to avoid unnecessary copying.
  * Added support for structured documentation comments on lambda type declaration in IDL.
### Bug fixes:
  * Fixed C++ compilation issue for when "-intnamespace" command line parameter is not specified.
  * Fixed more issues in CMake helpers related to modularization.
  * Fixed Dart compilation issues related to modularization.

## 6.3.2
Release date: 2020-03-10
### Bug fixes:
  * Fixed Swift compilation issue for "-swiftinternalprefix" modularization helper.
  * Fixed issues in CMake helpers related to modularization.

## 6.3.1
Release date: 2020-03-02
### Bug fixes:
  * Fixed CBridge compilation issues for "-swiftinternalprefix" modularization helper.

## 6.3.0
Release date: 2020-02-28
### Features:
  * Added "-swiftinternalprefix" optional command line parameter, to help resolve name clashes in
    case of modularized Swift builds.
### Bug fixes:
  * Fixed two compilation issues for Dart FFI bindings.
  * Fixed several small issues in CMake helpers.

## 6.2.1
Release date: 2020-02-21
### Features:
  * Structs marked as `@Serializable` in IDL now conform to `Codable` protocol in Swift.
  * Added support for specifying multiple platform names in a single inline tag in documentation
    comments (e.g. `foo {@Cpp @Java bar}`).

## 6.2.0
Release date: 2020-02-20
### Features:
  * Experimental support for generating Dart bindings.
### Bug fixes:
  * Moved BuiltinOptionals.swift into correct source set.
  * Fixed redundant empty lines in C++ headers for enums and structs.

## 6.1.0
Release date: 2020-01-21
### Features:
  * Allow renaming JNI_OnLoad via define.
  * Enable CMake modules for use of Gluecodium in multiple targets.
### Bug fixes:
  * Fixed Swift compilation issue for lambdas with parameters of class or interface types.
  * Fixed compilation issue for Optional.h header on Windows.

## 6.0.1
Release date: 2020-01-16
### Bug fixes:
  * Fixed Swift compilation issue for constructor comments of structs with multiline field comments.

## 6.0.0
Release date: 2020-01-06
### Features:
  * Added "auxiliary sources" option to support IDL sources that are loaded into the model but are
    not generated from.

## 5.8.7
Release date: 2019-12-16
### Bug fixes:
  * Fixed possible name clashes for array types in Swift.

## 5.8.6
Release date: 2019-12-04
### Bug fixes:
  * Added missing nullability annotations for lambdas in Java.

## 5.8.5
Release date: 2019-12-03
### Bug fixes:
  * Fixed Swift compilation issue for lambdas nested inside interfaces.

## 5.8.4
Release date: 2019-11-28
### Bug fixes:
  * Fixed Swift compilation issue for lambdas with `@Swift(Name)`.

## 5.8.3
Release date: 2019-11-26
### Bug fixes:
  * Fixed C++ compilation issue for `@Equatable` structs with `@Cpp(Accessors)` attribute.

## 5.8.2
Release date: 2019-11-21
### Bug fixes:
  * Fixed C++ compilation issue for `@Equatable` structs with `Date` type fields.
  * Fixed Java compilation issue for interfaces with same name in different packages.
### Breaking changes:
  * Removed "stdout" command line option.

## 5.8.1
Release date: 2019-11-13
### Bug fixes:
  * Gluecodium Gradle plugin now properly stops the build when Gluecodium code generation fails.
  * Fixed C++ compilation issue where type declarations were not ordered correctly if an
    std::function<> typedef (lambda) was one of the types.

## 5.8.0
Release date: 2019-11-11
### Features:
  * Added validation against broken import statements in LimeIDL.
  * Added support for `@Swift(Extension)` attribute for type collections (`types`) in LimeIDL.
  * Any type can now be used as an error value type in an IDL exception declaration.
  * Added support for `@Java(FunctionName)` attribute for lambdas in LimeIDL.
  * Added Gluecodium Gradle plugin.

## 5.7.0
Release date: 2019-10-25
### Features:
  * Added validation against broken documentation references.
  * Set type fields are now supported in @Serializable structs.
  * Characters '@', '{', '}', and '\' can now be used in documentation comments, by being "escaped"
    with an additional backslash (i.e. '\@', '\{', '\}', and '\\' respectively).

### Improvements:
  * Updated JNI generated code to use smaller header files. This would improve re-build times of
    the generated Java/JNI code in case of small incremental changes to IDL files.

### Bug fixes:
  * Fixed a compilation issue with nested types and circular includes in C++.
  * Fixed compilation issues with lambdas in Swift.

### Breaking changes:
  * Some types used in C++ signatures are now only forward-declared and are not #included anymore.
    They now have to be explicitly #included when used in manually written C++ code.

## 5.6.0
Release date: 2019-10-09
### Features:
  * Added support for lambda types in LimeIDL. Lambdas are generated as std::function<> in C++, as
    functional interfaces in Java, and as closures in Swift.
  * Added support for initializing constants and fields of Map<> type.

### Bug fixes:
  * Allow Unicode white-space characters in LimeIDL.

### Breaking changes:
  * Renamed Gluecodium to Gluecodium.

## 5.5.0
Release date: 2019-09-23
### Features:
  * Classes and interfaces can now be defined nested within other classes or interfaces in LimeIDL.
  * Added support for initializing constants and fields of List<> and Set<> types.

## 5.4.3
Release date: 2019-09-17
### Bug fixes:
  * Allow `const&` return values for external C++ types.

## 5.4.2
Release date: 2019-09-17
### Bug fixes:
  * Fixed missing include for external classes in C++.
  * Fixed external type checks for method overloads in C++.

## 5.4.1
Release date: 2019-09-13
### Bug fixes:
  * Added validation against ambiguous type references.

## 5.4.0
Release date: 2019-09-10
### Features:
  * Added support for `@Cpp(Accessors)` attribute for structs.

### Bug fixes:
  * Fixed C++ linking issue where Hash functions were not properly exported.
  * Fixed Swift compilation issue for lists of nullable elements.

### Breaking changes:
  * The comment header warning "Automatically generated, do not change..." is no longer generated
    automatically. If needed it can be manually added at the end of the copyright header.
  * Java exceptions are now named after LimeIDL exceptions by appending "Exception" suffix to the
    IDL name. The suffix can be adjusted with custom naming rules.
  * Swift errors are now named after LimeIDL exceptions by appending "Error" suffix to the IDL name.
    The suffix can be adjusted with custom naming rules.

## 5.3.0
Release date: 2019-09-03
### Features:
  * Subclasses are now passed as their actual type from C++ to Java/Swift.
  * Added compile-time validation for "external" types in C++.
  * Added support for `open` visibility modifier in LimeIDL.
  * Gluecodium options can now be loaded from file with "-options" command line parameter.

### Breaking changes:
  * Classes can now only inherit from other classes in LimeIDL if the "parent" class has `open`
    visibility modifier.
  * Classes are now generated with `final` qualifier in Java by default (unless marked as `open` in
    LimeIDL definition).

## 5.2.2
Release date: 2019-08-20
### Bug fixes:
  * Fixed Java compilation for top-level enumerations and structs.

## 5.2.1
Release date: 2019-08-16
### Bug fixes:
  * Fixed Swift compilation for top-level exceptions.
  * Fixed Java and C++ compilation for top-level enumerations.

## 5.2.0
Release date: 2019-08-15
### Features:
  * Structured documentation comments for are now supported for function and property definitions.
  * Auto-generated struct constructors can now be documented.
  * Generate documentation for Java builders.
  * Platform-specific documentation comments are now supported.

### Bug fixes:
  * Links to members from documentation comments of function parameters, return type, and throws
    clause now work correctly in C++, Java, and Swift.
  * Type aliases to exception types now work correctly in C++, Java, and Swift.
  * Multiple "external" type definitions pointing to the same C++ type now compile correctly.

## 5.1.0
Release date: 2019-08-07
### Features:
  * Structs, enumerations, exceptions and type aliases can now be declared at file level in LimeIDL.
  * `{ get set }` declaration is now optional for properties in LimeIDL.
  * Java builders now enforce setting of all uninitialized fields by builder chaining.

### Bug fixes:
  * `std::hash` is now also used for typedefs to primitive types.
  * Fixed compilation for immutable equatable structs.
  * Imports now work correctly for enumerator references in LimeIDL.
  * Fixed Swift compilation for nested generic types (e.g. List<List<Int>>, etc.).
  * Exception type documentation is now properly reflected in the generated code.

### Breaking changes:
  * Java builders fix the order of setting mandatory fields to the order in which they are defined.

## 5.0.0
Release date: 2019-07-31
### Features:
  * New input language: LimeIDL. See [LimeIDL documentation](docs/lime_idl.md) for details.
  * Hash functions are generated for all Equatable and PointerEquatable types in C++.
  * Added support for Equatable and PointerEquatable types in sets and map keys.
### Bug fixes:
  * Fixed Swift 5 compilation warning.
### Breaking changes:
  * Franca FIDL/FDEPL input is no longer supported. See [LimeIDL documentation](docs/lime_idl.md)
  for the migration guide.
  * Generated Swift code requires Swift 5.
  * EnumHash is renamed to hash in C++.

## 4.9.1
Release date: 2019-07-24
### Bug fixes:
  * Fixed validation for members of internal structs.

## 4.9.0
Release date: 2019-07-22
### Features:
  * Added LimeIDL generator to support migration to the new LimeIDL input language.

### Bug fixes:
  * Fixed documentation generation for getters in Java.

## 4.8.0
Release date: 2019-07-18
### Features:
  * Deprecation messages are now supported for most elements.
  * Documentation references to `null` value are now replaced with `nil` in Swift.
  * Constants of struct types are now supported.
  * Allow referencing getters/setters explicitly in comment links.
  * Improved method documentation generation.
  * String, byte[] are now marked @NonNull consistently in Java.

### Bug fixes:
  * C++ default struct constructor zeros all non-defaulted elements now.
  * Fix comment processing for setters.

### Breaking changes:
  * Struct constructors that initialize "internal" fields are now also "internal" (Java, Swift).

## 4.7.1
Release date: 2019-07-01
### Bug fixes:
  * Fixed compilation issues for Swift argument labels in protocols and structs.

## 4.7.0
Release date: 2019-06-26
### Features:
  * Platform-specific names are now supported for most elements.

## 4.6.1
Release date: 2019-06-21
### Bug fixes:
  * Fixed compilation issue for Return for types without default constructor.

## 4.6.0
Release date: 2019-06-19
### Features:
  * Custom name rules are now supported for Java and Swift.
  * Java `@NonNull` and `@Nullable` annotations are now configurable.

### Bug fixes:
  * Fixed compilation issue for empty defaulted C++ struct members.
  * Fixed default values for struct fields with typedef type.

### Breaking changes:
  * Default constructor for a C++ struct is not generated if it has immutable non-defaulted fields.
  * Android generator does not create `@NonNull` and `@Nullable` annotations by default anymore,
    to get old behaviour pass command line options:
    `-javanonnullannotation android.support.annotation.NonNull
    -javanullableannotation android.support.annotation.Nullable`

## 4.5.0
Release date: 2019-06-12
### Features:
  * Custom name rules are now supported for C++.

## 4.4.2
Release date: 2019-06-11
### Bug fixes:
  * Fixed compilation issue for Java interface with `Internal=true` and `IsInterface=true`

## 4.4.1
Release date: 2019-06-06
### Features:
  * Members of internal structs are marked internal automatically

### Bug fixes:
  * Fixed compilation issue for Java when no EnumSet was generated

## 4.4.0
Release date: 2019-06-04
### Features:
  * Added support for equality and pointer equality comparisons for classes
  * Added hash support for all equatable types for Swift and Java
  * Added Set type support.

### Bug fixes:
  * Nullable boolean properties now have 'is' prefix consistently

## 4.3.1
Release date: 2019-05-23
### Features:
  * Added support for explicit "empty" default value for struct-type fields in structs.

## 4.3.0
Release date: 2019-05-21
### Bug fixes:
  * Constructors of generated exception types in Java are now public.

### Features:
  * Added support for structs with constants.
  * Added explicit support for Builder pattern in Java.
  * Added support for explicit "null" default value for nullable fields in structs.
  * Added support for explicit "empty" default value for collection fields in structs.

### Breaking changes:
  * Builder pattern is no longer automatically generated for all structs in Java. It has to be
    enabled explicitly for individual structs now.
  * Default constructors are no longer automatically generated for structs in Java unless explicit
    defaults were specified for all fields.

## 4.2.0
Release date: 2019-05-14
### Features:
  * Java comments are generated as JavaDoc HTML and links to classes and members are supported now.
  * Links to members in Swift and C++ comments are now supported.
  * Added support for structs with methods.
  * Added support for custom constructors for structs.

## 4.1.0
Release date: 2019-05-06
### Bug fixes:
  * Fixed runtime issues caused by empty ByteBuffer in Swift.
  * Fixed compilation issues caused by nullable ByteBuffer fields in Swift and Java.
  * Common indentation of comments is stripped to preserve markdown indentation properly.
  * Passing `null` to @NonNull String or ByteBuffer in Java now causes a NullPointerException.

### Features:
  * Added built-in Date type.

## 4.0.2
Release date: 2019-04-17
### Features:
  * Added a command line parameter to specify package for Gluecodium-internal classes (e.g. NativeBase).

## 4.0.1
Release date: 2019-04-16
### Bug fixes:
  * Fixed compilation issues caused by deep nesting of immutable structs.

## 4.0.0
Release date: 2019-04-11
### Breaking changes:
  * Replaced `std::shared_ptr` with `optional` for Nullable types.

### Bug fixes:
  * Whitespace (including line breaks) is now preserved in the documentation comments.
  * Fixed compilation issues caused by arrays of immutable structs.
  * Fixed compilation issues caused by "external" types that are C++ templates.
  * C++ internal namespace is now used as path for helper includes.
  * Gradle dependencies are locked now.

### Features:
  * Added support for multiple includes for "External" types.

## 3.21.1
Release date: 2019-03-04
### Bug fixes:
  * Fixed an issue where headers containing only typedefs were not generated for C++
  * Fixed default initialization of ByteBuffer fields for structs in Java.
  * Fixed JNI type conversion for UInt8 and UInt16 types.

## 3.21.0
Release date: 2019-02-26
### Breaking changes:
  * Instance-type fields, parameters and attributes are now non-nullable by default.
  * "NotNull" FDEPL property was removed as it is now the default behavior for all types.

### Features:
  * Added support for explicitly exporting library symbols.

### Bug fixes:
  * Fixed crash regarding UInt8 and UInt16 conversions on Android

## 3.20.3
Release date: 2019-02-21
### Bug fixes:
  * Fixed compilation issues for nullable Int32 struct fields in JNI.
  * Fixed compilation issues for nullable unsigned integer struct fields in JNI.
  * Fixed generated equality operator implementation for nullable struct fields in C++.
  * Fixed compilation issues for immutable structs that are used inside other container types.
  * Fixed leaking JNI local references.

## 3.20.2
Release date: 2019-02-12
### Bug fixes:
  * Fixed generation of documentation comments for constructors in Java and Swift.
  * Updated JNI generated code to correctly throw OutOfMemoryError when appropriate.
  * Fixed several issues with typedefs to Arrays and Maps in Swift.

## 3.20.1
Release date: 2019-02-11
### Bug fixes:
  * Fixed Swift compilation error for arrays nested multiple layers deep in arrays.
  * Fixed crashes in Swift when holding static variables pointing to proxy objects.
  * Fixed JNI crashes when mixing C++ and Java threads.

## 3.20.0
Release date: 2019-02-01
### Features:
  * Added generation of custom `std::error_category` for C++ error codes.
  * Swift enumerations now conform to CaseIterable protocol.
  * Added "InternalSetter" FDEPL property for attributes.
  * Added "Nullable" property support.

### Bug fixes:
  * Fixed potential memory leak while returning Swift proxies.
  * Fixed the default value of String type Struct fields in Java to be an empty string.
  * Fixed JNI warnings about "removing non-JNI local reference".

## 3.19.4
Release date: 2019-01-15
### Bug fixes:
  * Fixed constructor validation to not to disallow constructors overriding for child classes.

## 3.19.3
Release date: 2019-01-15
### Bug fixes:
  * Fixed run-time issues for throwing constructors in Java.
  * Added validation against signature clashes between different constructors of the same class.

## 3.19.2
Release date: 2019-01-11
### Bug fixes:
  * Fixed compilation issues for constructors of child classes in Swift.
  * Fixed compilation issues for constructors with Array parameters in Swift.

## 3.19.1
Release date: 2019-01-09
### Bug fixes:
  * Fixed compilation issues for constructors with parameters in Swift.
  * Fixed compilation issues for throwing constructors in Swift and Java.

## 3.19.0
Release date: 2019-01-08
### Breaking changes:
  * FIDL types UInt8 and UInt16 are now generated as Short and Integer in Java.

### Features:
  * Added "Constructor" FDEPL property that marks methods for being generated as
    constructors/initializers in Java/Swift.
  * Added "Static" FDEPL property support for attributes.

## 3.18.0
Release date: 2018-12-18
### Features:
  * "NaN" and "Infinity" can now be used as struct field FDEPL default values.

### Bug fixes:
  * Fixed Java crashes caused by JNI local reference table overflow.

## 3.17.0
Release date: 2018-12-11
### Features:
  * Listener callbacks that throw exceptions/errors are now fully supported in Java/Swift.
  * "NotNull" FDEPL property can now be applied to attributes and method parameters.

## 3.16.1
Release date: 2018-12-05
### Bug fixes:
  * Fixed arrays of enum values in Swift so that they don't produce undefined behavior anymore.
  * Fixed compilation issues for arrays of enums in Swift when the enum is marked as "ExternalType".

## 3.16.0
Release date: 2018-11-29
### Features:
  * Returning values from Swift or Java callbacks when these are called from C++ now works for all
    types. It also works for callbacks that are Swift properties.
  * Method parameters and return values with instance type can now be marked with "NotNull" FDEPL
    property. This marks them as optional/non-optional in Swift or annotates them with @NonNull
    annotation in Java.

### Bug fixes:
  * Fixed documentation comments handling for Java interfaces and Swift protocols.
  * Fixed several Cpp-Swift-Cpp object round-trip segfault issues.
  * Naming a parameter-less method "release" does not produce un-compilable Swift code anymore.

## 3.15.0
Release date: 2018-11-16
### Features:
  * Added @NonNull annotation to generated Java methods returning a struct (only works with Android
    flavor of Java generated code).
  * Returning instances from Java callbacks when these are called from C++ now works.

### Bug fixes:
  * Fixed an issue with passing "nil" as a value for Swift instances.

## 3.14.2
Release date: 2018-11-12
### Bug fixes:
  * Fixed an issue with returning instances from Swift callbacks when these are called from C++.

## 3.14.1
Release date: 2018-11-08
### Bug fixes:
  * Fixed handling of structs being passed as parameters to Swift listener callbacks.

## 3.14.0
Release date: 2018-11-08
### Breaking changes:
  * Removed support for Struct ihneritance.
  * Boolean Swift properties now have their names prefixed with "is", in conformance with Swift API
    design guidelines.
  * Swift functions returning structs are now returning them as non-optional.

### Features:
  * Added "Immutable" property support for C++.

### Bug fixes:
  * Fixed Java method overloads to avoid adding suffixes if only one List<> overload is present (the
    suffixes are still added if there are several List<> overloads).
  * Fixed Java method overloads to add suffixes if there is an ambiguity caused by two or more Map<>
    overloads.

### Removed:
  * Deprecated camel-case command line parameters were removed.

## 3.13.0
Release date: 2018-10-25
### Features:
  * Added FDEPL property "Immutable" for structs for generating structs that cannot be modified
    after creation. This property is supported for Java and Swift.

### Bug fixes:
  * Fixed behavior of default constructors for C++ structs that could leave some fields
    uninitialized in some cases.

## 3.12.0
Release date: 2018-10-18
### Breaking changes:
  * Generated Swift code now fully supports Swift 4.2. It is not compatible with Swift 4.1 anymore.

### Features:
  * "Equatable" FDEPL property for structs is now fully supported in Swift.
  * C++ structs are now generated with convenience constructors.

### Bug fixes:
  * Fixed array fields handling for "Equatable" structs in Swift.
  * Fixed a threading issue for calling back into Java from C++ code.

## 3.11.1
Release date: 2018-10-10
### Bug fixes:
  * Fixed incorrect handling of "--copyright-header" command line parameter.

## 3.11.0
Release date: 2018-10-10
### Features:
  * Added "-stdout" command line parameter. This parameter enables echoing of the generated code
    into std::out console output.

### Deprecated:
  * "-nostdout" command line parameter is deprecated. It will be removed in a future release. The
    behavior of not echoing generated code into std::out is the default behavior now.
  * Camel-case command line parameters were renamed to shorter names without camel-case. The old
    names are deprecated. The old names will be removed in a future release.

### Removed:
  * "-listGenerators" command line parameter was removed. All available generators are listed in the
    help message for "generator" parameter. Use "-help" to view the help message for all Gluecodium
    command line parameters.

## 3.10.0
Release date: 2018-10-08
### Features:
  * Added FDEPL property "Equatable" for structs for generating the equality support infrastructure
    in C++ and Java (Swift is only partially supported).

### Bug fixes:
  * Fixed an issue where a Swift-implemented object was not castable to its original type after a
    Swift-Cpp-Swift round-trip in some cases.
  * Fixed an issue where a Java-implemented object was not castable to its original type after a
    Java-Cpp-Java round-trip in all cases.

## 3.9.0
Release date: 2018-09-06
### Features:
  * Added support for "ExternalType" and "ExternalName" FDEPL properties for interfaces. Added
    support for "ExternalGetter" and "ExternalSetter" FDEPL properties for attributes in such
    interfaces.

### Bug fixes:
  * Fixed handling of nested namespaces in C++.

## 3.8.0
Release date: 2018-08-20
### Breaking changes:
  * Moved "External*" FDEPL properties from "GluecodiumExtensions" FDEPL specification into a dedicated
    FDEPL specification "ExternalTypes".
  * Fixed instance-type attributes in Swift to be generated as properties with an optional type.

### Features:
  * Added FDEPL property "ObjcInterface" for enabling bridging generated Swift code with
    Objective-C code. For interfaces marked as such their corresponding Swift classes (and
    protocols) are generated with @objcMembers annotation (@objc for protocols), enabling the usage
    of these types and their members from Objective-C.

## 3.7.0
Release date: 2018-08-13
### Breaking changes:
  * Getter methods for attributes are generated as "const" in C++ now.

## 3.6.0
Release date: 2018-08-09
### Breaking changes:
  * Type names for structs and enumerations marked with "ExternalType", as well as the names for
    their child elements (fields and enumerators, respectively) are now used verbatim in generated
    C++ and conversion code.

### Features:
  * The *Gluecodium* class can be instantiated directly now and serves as a high-level entry point for
  * The *Gluecodium* class can be instantiated directly now and serves as a high-level entry point for
    usage as a library.

## 3.5.0
Release date: 2018-07-24
### Features:
  * Added support for "ExternalType" and "ExternalName" FDEPL properties for enumerations.

## 3.4.0
Release date: 2018-07-19
### Breaking changes:
  * Generated functions returning optional "String?" in Swift are now returning a non-optional
    "String" instead.
  * Function parameters of "instance" types in generated Swift code are now using optional types.

## 3.3.1
Release date: 2018-05-23
### Bug fixes:
  * Fixed integer constants in Java to be generated with "L" suffix when needed.

## 3.3.0
Release date: 2018-05-23
### Features:
  * Added generation of simple constants in C++, Java, and Swift. Supported types for constants are:
    Boolean, string, enumeration, and all numeric types.

## 3.2.0
Release date: 2018-05-18
### Breaking changes:
  * Exceptions are now error-enum specific and are generated as nested classes (nested on the same
    level as the corresponding error-enums).

### Bug fixes:
  * Fixed runtime crash in case of non-unique error-enum names inside the same package.

## 3.1.3
Release date: 2018-05-07
### Bug fixes:
  * Fixed handling of Java constants to generate those as "public".

## 3.1.2
Release date: 2018-05-02
### Bug fixes:
  * Fixed package names with "_" underscore in Java/JNI.

## 3.1.1
Release date: 2018-04-25
### Features:
  * Added generation of is_error_code_enum<> type trait for error enums in C++. This way they can be
    passed to std::error_code() constructor directly, without any additional static casts.

## 3.1.0
Release date: 2018-04-25
### Features:
  * Added FDEPL properties "ExternalGetter" and "ExternalSetter" for enabling the usage of accessor
    methods as a JNI/CBridge data source for struct fields of a struct marked with "ExternalType".
  * Added FDEPL property "ExternalName" for "renaming" struct types marked with "ExternalType" in
    C++, i.e. allowing the C++ name to differ from what is specified in the FIDL file.

## 3.0.1
Release date: 2018-04-20
### Bug fixes:
  * Fixed name collisions in Swift generated code.

## 3.0.0
Release date: 2018-04-13
### Breaking changes:
  * Renamed Transpiler to Gluecodium.

### Features:
  * Added FDEPL property "ExternalType" for marking struct types as "external" in C++ and providing
    a path to a pre-existing C++ header file for that struct type.

## 2.2.1
Release date: 2018-03-29
### Bug fixes:
  * Fixed missing HERE license for artifactory publish

## 2.2.0
Release date: 2018-03-27
### Features:
  * Added FDEPL flag "NotNull" for marking instance type fields as optional/non-optional in Swift or
    annotating them with @NonNull annotation in Java.

## 2.1.0
Release date: 2018-03-23
### Features:
  * Added FDEPL flag "Internal" for marking classes, methods and fields as "internal" in Swift or
    package-private in Java.

### Bug fixes:
  * Fixed compilation issues for Maps with Enums as keys in iOS generator when a non-default value
    is specified for "C++ internal namespace" command line parameter.

## 2.0.0
Release date: 2018-03-21
### Features:
  * Add support for Maps for iOS generator
  * Add support for Maps for Android generator

## 1.5.3
Release date: 2018-03-07
### Bug fixes:
  * Fixed Parcelable deserialization for structs and arrays.

## 1.5.2
Release date: 2018-03-05
### Breaking changes:
  * Names for getter functions for Boolean attributes are now named with "is" instead of "get".

### Bug fixes:
  * Fixed JNI local references leak for struct fields of String type.

## 1.5.1
Release date: 2018-02-28
### Bug fixes:
  * Fixed JNI type conversion for foreign packages.

## 1.5.0
Release date: 2018-02-27
### Breaking changes:
  * Use std::error_code for error codes
  * Renaming navigation.BaseApiSpec to TranspilerExtensions which should be imported with:
    import "classpath:/TranspilerExtensions.fdepl"
    instead of:
    import "classpath:/franca/spec/BaseApiSpec.fdepl"

## 1.4.0
Release date: 2018-02-19
### Breaking changes:
  * Use uint32_t as ErrorCode
  * EnumHash moved to ::transpiler namespace

### Features:
  * Add support for Interface Inheritance for iOS generator

## 1.3.0
Release date: 2018-02-14
### Breaking changes:
  * Instances in Swift structures made optional

### Features:
  * Add support for Interface Inheritance for Android generator
  * Add support for caching in Transpiler
  * Add support for Parcelable structs

## 1.2.3
Release date: 2018-02-13
### Bug fixes:
  * Fixed circular dependency compilation issues for C++

## 1.2.2
Release date: 2018-01-26
### Bug fixes:
  * Fixed compilation error for arrays in Swift generated code

## 1.2.1
Release date: 2018-01-25
### Bug fixes:
  * Removed validation against multiple output parameters

## 1.2.0
Release date: 2018-01-24
### Features:
  * Add validation against multiple output parameters. No support for this feature is planned.
  * Add validation against unions. No support for this feature is planned.
  * Add support for Interface Inheritance for C++ Base API generator
  * Add support for comments for all generators (Base API, Android, Swift)

## 1.1.1
Release date: 2018-01-15
### Bug fixes:
  * Android fields of structs declared within interfaces cannot be instantiated
  * Swift struct that contain interfaces will cause premature memory release

## 1.1.0
Release date: 2018-05-09
### Features:
  * Add support for Struct Inheritance to iOS generators
  * Add support for Default values to iOS generators

## 1.0.0
Release date: 2018-05-08
Bumping version to 1.0.0 to mark Q4 2017 feature completeness

## 0.15.0
Release date: 2017-12-18
### Features:
  * Add support for Errors to iOS generators

## 0.14.0
Release date: 2017-12-14
### Features:
  * Add support for Default values to C++ Base API generators
  * Add support for Default values to Java generators

## 0.13.0
Release date: 2017-12-11
### Features:
  * Add support for Struct Inheritance to Java generators
  * Add support for Errors to Java generators

## 0.12.0
Release date: 2017-11-27
### Features:
  * Add support for Listeners to Swift generators
  * Add support for Errors to C++ Base API generators

## 0.11.0
Release date: 2017-11-24
### Features:
  * Add support for Arrays to Android generators

## 0.0.10
Release date: 2017-11-22
### Features:
  * Add support for Arrays to iOS generators
  * Add support for 'isInterface' flag in the fdepl files.

## 0.0.9
Release date: 2017-11-10
### Features:
  * Add support for Enums to Android generators
  * Add support for Listeners to Android generators
  * Add support for Attributes to iOS generators

## 0.0.8
Release date: 2017-10-19
### Features:
  * Add support for Attributes to Android generators
  * Add support for Enums to iOS generators
  * Add support for TypeDefs to Android generators
  * Add support for TypeDefs to iOS generators
  * Add support for Listeners to base Api generators

## 0.0.7
Release date: 2017-10-10
### Features:
  * Add support for Instances to iOS generators
  * Add support for Instances to Android generators
  * Add support for Attributes to base Api generators

## 0.0.6
Release date: 2017-09-22
### Features:
  * Add support for Plain Data Structures to iOS generators
  * Add support for Instances to base Api generators

## 0.0.5
Release date: 2017-09-18
### Behavior changes:
  * Change BaseApiGeneratorSuite name to "cpp"
  * Remove 'Stub' suffix from generated base_api classes
  * Generate virtual destructor in C++
  * Throw Transpiler exception for malformed .fdepl

### Features:
  * Implement struct inheritance for C++ generator
  * Adds inheritance from NativeBase to non-POD, non-factory classes
  * Adds instance support to java generator
  * Add support for structs as function parameters
  * Add support for referencing Map<> types in C++
  * Enable mapping of non-inline Arrays for Cpp
  * Implement unions for C++ generator
  * Remove Xtend dependency

### Bugs:
  * Bugfix for order of 'get_pointer' helper in CBridge
  * Fix for template generating struct internal constructor
  * Bugfix - Remove stub prefix and change to cpp
  * Fix cpp type mapper instance referencing
  * Fix handling of xxxRef in cBridge

## 0.0.4
Release date: 2017-08-29
### Bug fixes and performance improvement

## 0.0.3
Release date: 2017-07-03
### First release
