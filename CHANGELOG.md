# Gluecodium project Release Notes

## Unreleased
### Features:
  * Allow renaming JNI_OnLoad via define.
### Bug fixes:
  * Fixed Swift compilation issue for lambdas with parameters of class or interface types.

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
  * Renamed Genium to Gluecodium.

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
  * Genium options can now be loaded from file with "-options" command line parameter.

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
  * Added a command line parameter to specify package for Genium-internal classes (e.g. NativeBase).

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
    help message for "generator" parameter. Use "-help" to view the help message for all Genium
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
  * Moved "External*" FDEPL properties from "GeniumExtensions" FDEPL specification into a dedicated
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
  * The *Genium* class can be instantiated directly now and serves as a high-level entry point for
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
  * Renamed Transpiler to Genium.

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
