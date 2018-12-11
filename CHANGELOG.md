# Genium project Release Notes

## 3.17.0
- Release date: 2018-12-11
- Features:
  + Listener callbacks that throw exceptions/errors are now fully supported in Java/Swift.
  + "NotNull" FDEPL property can now be applied to attributes and method parameters.

## 3.16.1
- Release date: 2018-12-05
- Bug fixes:
  + Fixed arrays of enum values in Swift so that they don't produce undefined behavior anymore.
  + Fixed compilation issues for arrays of enums in Swift when the enum is marked as "ExternalType".

## 3.16.0
- Release date: 2018-11-29
- Features:
  + Returning values from Swift or Java callbacks when these are called from C++ now works for all
    types. It also works for callbacks that are Swift properties.
  + Method parameters and return values with instance type can now be marked with "NotNull" FDEPL
    property. This marks them as optional/non-optional in Swift or annotates them with @NonNull
    annotation in Java.
- Bug fixes:
  + Fixed documentation comments handling for Java interfaces and Swift protocols.
  + Fixed several Cpp-Swift-Cpp object round-trip segfault issues.
  + Naming a parameter-less method "release" does not produce un-compilable Swift code anymore.

## 3.15.0
- Release date: 2018-11-16
- Features:
  + Added @NonNull annotation to generated Java methods returning a struct (only works with Android
    flavor of Java generated code).
  + Returning instances from Java callbacks when these are called from C++ now works.
- Bug fixes:
  + Fixed an issue with passing "nil" as a value for Swift instances.

## 3.14.2
- Release date: 2018-11-12
- Bug fixes:
  + Fixed an issue with returning instances from Swift callbacks when these are called from C++.

## 3.14.1
- Release date: 2018-11-08
- Bug fixes:
  + Fixed handling of structs being passed as parameters to Swift listener callbacks.

## 3.14.0
- Release date: 2018-11-08
- Breaking changes:
  + Removed support for Struct ihneritance.
  + Boolean Swift properties now have their names prefixed with "is", in conformance with Swift API
    design guidelines.
  + Swift functions returning structs are now returning them as non-optional.
- Features:
  + Added "Immutable" property support for C++.
- Bug fixes:
  + Fixed Java method overloads to avoid adding suffixes if only one List<> overload is present (the
    suffixes are still added if there are several List<> overloads).
  + Fixed Java method overloads to add suffixes if there is an ambiguity caused by two or more Map<>
    overloads.
- Removed:
  + Deprecated camel-case command line parameters were removed.

## 3.13.0
- Release date: 2018-10-25
- Features:
  + Added FDEPL property "Immutable" for structs for generating structs that cannot be modified
    after creation. This property is supported for Java and Swift.
- Bug fixes:
  + Fixed behavior of default constructors for C++ structs that could leave some fields
    uninitialized in some cases.

## 3.12.0
- Release date: 2018-10-18
- Breaking changes:
  + Generated Swift code now fully supports Swift 4.2. It is not compatible with Swift 4.1 anymore.
- Features:
  + "Equatable" FDEPL property for structs is now fully supported in Swift.
  + C++ structs are now generated with convenience constructors.
- Bug fixes:
  + Fixed array fields handling for "Equatable" structs in Swift.
  + Fixed a threading issue for calling back into Java from C++ code.

## 3.11.1
- Release date: 2018-10-10
- Bug fixes:
  + Fixed incorrect handling of "--copyright-header" command line parameter.

## 3.11.0
- Release date: 2018-10-10
- Features:
  + Added "-stdout" command line parameter. This parameter enables echoing of the generated code
    into std::out console output.
- Deprecated:
  + "-nostdout" command line parameter is deprecated. It will be removed in a future release. The
    behavior of not echoing generated code into std::out is the default behavior now.
  + Camel-case command line parameters were renamed to shorter names without camel-case. The old
    names are deprecated. The old names will be removed in a future release.
- Removed:
  + "-listGenerators" command line parameter was removed. All available generators are listed in the
    help message for "generator" parameter. Use "-help" to view the help message for all Genium
    command line parameters.

## 3.10.0
- Release date: 2018-10-08
- Features:
  + Added FDEPL property "Equatable" for structs for generating the equality support infrastructure
    in C++ and Java (Swift is only partially supported).
- Bug fixes:
  + Fixed an issue where a Swift-implemented object was not castable to its original type after a
    Swift-Cpp-Swift round-trip in some cases.
  + Fixed an issue where a Java-implemented object was not castable to its original type after a
    Java-Cpp-Java round-trip in all cases.

## 3.9.0
- Release date: 2018-09-06
- Features:
  + Added support for "ExternalType" and "ExternalName" FDEPL properties for interfaces. Added
    support for "ExternalGetter" and "ExternalSetter" FDEPL properties for attributes in such
    interfaces.
- Bug fixes:
  + Fixed handling of nested namespaces in C++.

## 3.8.0
- Release date: 2018-08-20
- Breaking changes:
  + Moved "External*" FDEPL properties from "GeniumExtensions" FDEPL specification into a dedicated
    FDEPL specification "ExternalTypes".
  + Fixed instance-type attributes in Swift to be generated as properties with an optional type.
- Features:
  + Added FDEPL property "ObjcInterface" for enabling bridging generated Swift code with
    Objective-C code. For interfaces marked as such their corresponding Swift classes (and
    protocols) are generated with @objcMembers annotation (@objc for protocols), enabling the usage
    of these types and their members from Objective-C.

## 3.7.0
- Release date: 2018-08-13
- Breaking changes:
  + Getter methods for attributes are generated as "const" in C++ now.

## 3.6.0
- Release date: 2018-08-09
- Breaking changes:
  + Type names for structs and enumerations marked with "ExternalType", as well as the names for
    their child elements (fields and enumerators, respectively) are now used verbatim in generated
    C++ and conversion code.
- Features:
  + The *Genium* class can be instantiated directly now and serves as a high-level entry point for
    usage as a library.

## 3.5.0
- Release date: 2018-07-24
- Features:
  + Added support for "ExternalType" and "ExternalName" FDEPL properties for enumerations.

## 3.4.0
- Release date: 2018-07-19
- Breaking changes:
  + Generated functions returning optional "String?" in Swift are now returning a non-optional
    "String" instead.
  + Function parameters of "instance" types in generated Swift code are now using optional types.

## 3.3.1
- Release date: 2018-05-23
- Bug fixes:
  + Fixed integer constants in Java to be generated with "L" suffix when needed.

## 3.3.0
- Release date: 2018-05-23
- Features:
  + Added generation of simple constants in C++, Java, and Swift. Supported types for constants are:
    Boolean, string, enumeration, and all numeric types.

## 3.2.0
- Release date: 2018-05-18
- Breaking changes:
  + Exceptions are now error-enum specific and are generated as nested classes (nested on the same
    level as the corresponding error-enums).
- Bug fixes:
  + Fixed runtime crash in case of non-unique error-enum names inside the same package.

## 3.1.3
- Release date: 2018-05-07
- Bug fixes:
  + Fixed handling of Java constants to generate those as "public".

## 3.1.2
- Release date: 2018-05-02
- Bug fixes:
  + Fixed package names with "_" underscore in Java/JNI.

## 3.1.1
- Release date: 2018-04-25
- Features:
  + Added generation of is_error_code_enum<> type trait for error enums in C++. This way they can be
    passed to std::error_code() constructor directly, without any additional static casts.

## 3.1.0
- Release date: 2018-04-25
- Features:
  + Added FDEPL properties "ExternalGetter" and "ExternalSetter" for enabling the usage of accessor
    methods as a JNI/CBridge data source for struct fields of a struct marked with "ExternalType".
  + Added FDEPL property "ExternalName" for "renaming" struct types marked with "ExternalType" in
    C++, i.e. allowing the C++ name to differ from what is specified in the FIDL file.

## 3.0.1
- Release date: 2018-04-20
- Bug fixes:
  + Fixed name collisions in Swift generated code.

## 3.0.0
- Release date: 2018-04-13
- Breaking changes:
  + Renamed Transpiler to Genium.
- Features:
  + Added FDEPL property "ExternalType" for marking struct types as "external" in C++ and providing
    a path to a pre-existing C++ header file for that struct type.

## 2.2.1
- Release date: 2018-03-29
- Bug fixes:
  + Fixed missing HERE license for artifactory publish

## 2.2.0
- Release date: 2018-03-27
- Features:
  + Added FDEPL flag "NotNull" for marking instance type fields as optional/non-optional in Swift or
    annotating them with @NonNull annotation in Java.

## 2.1.0
- Release date: 2018-03-23
- Features:
  + Added FDEPL flag "Internal" for marking classes, methods and fields as "internal" in Swift or
    package-private in Java.
- Bug fixes:
  + Fixed compilation issues for Maps with Enums as keys in iOS generator when a non-default value
    is specified for "C++ internal namespace" command line parameter.

## 2.0.0
- Release date: 2018-03-21
- Features:
  + Add support for Maps for iOS generator
  + Add support for Maps for Android generator

## 1.5.3
- Release date: 2018-03-07
- Bug fixes:
  + Fixed Parcelable deserialization for structs and arrays.

## 1.5.2
- Release date: 2018-03-05
- Breaking changes:
  + Names for getter functions for Boolean attributes are now named with "is" instead of "get".
- Bug fixes:
  + Fixed JNI local references leak for struct fields of String type.

## 1.5.1
- Release date: 2018-02-28
- Bug fixes:
  + Fixed JNI type conversion for foreign packages.

## 1.5.0
- Release date: 2018-02-27
- Breaking changes:
  + Use std::error_code for error codes
  + Renaming navigation.BaseApiSpec to TranspilerExtensions which should be imported with:
    import "classpath:/TranspilerExtensions.fdepl"
    instead of:
    import "classpath:/franca/spec/BaseApiSpec.fdepl"

## 1.4.0
- Release date: 2018-02-19
- Breaking changes:
  + Use uint32_t as ErrorCode
  + EnumHash moved to ::transpiler namespace
- Features:
  + Add support for Interface Inheritance for iOS generator

## 1.3.0
- Release date: 2018-02-14
- Breaking changes:
  + Instances in Swift structures made optional
- Features:
  + Add support for Interface Inheritance for Android generator
  + Add support for caching in Transpiler
  + Add support for Parcelable structs

## 1.2.3
- Release date: 2018-02-13
- Bug fixes:
  + Fixed circular dependency compilation issues for C++

## 1.2.2
- Release date: 2018-01-26
- Bug fixes:
  + Fixed compilation error for arrays in Swift generated code

## 1.2.1
- Release date: 2018-01-25
- Bug fixes:
  + Removed validation against multiple output parameters

## 1.2.0
- Release date: 2018-01-24
- Features:
  + Add validation against multiple output parameters. No support for this feature is planned.
  + Add validation against unions. No support for this feature is planned.
  + Add support for Interface Inheritance for C++ Base API generator
  + Add support for comments for all generators (Base API, Android, Swift)

## 1.1.1
- Release date: 2018-01-15
- Bug fixes:
  + Android fields of structs declared within interfaces cannot be instantiated
  + Swift struct that contain interfaces will cause premature memory release

## 1.1.0
- Release date: 2018-05-09
- Features:
  + Add support for Struct Inheritance to iOS generators
  + Add support for Default values to iOS generators

## 1.0.0
- Release date: 2018-05-08
Bumping version to 1.0.0 to mark Q4 2017 feature completeness

## 0.15.0
- Release date: 2017-12-18
- Features:
  + Add support for Errors to iOS generators

## 0.14.0
- Release date: 2017-12-14
- Features:
  + Add support for Default values to C++ Base API generators
  + Add support for Default values to Java generators

## 0.13.0
- Release date: 2017-12-11
- Features:
  + Add support for Struct Inheritance to Java generators
  + Add support for Errors to Java generators

## 0.12.0
- Release date: 2017-11-27
- Features:
  + Add support for Listeners to Swift generators
  + Add support for Errors to C++ Base API generators

## 0.11.0
- Release date: 2017-11-24
- Features:
  + Add support for Arrays to Android generators

## 0.0.10
- Release date: 2017-11-22
- Features:
  + Add support for Arrays to iOS generators
  + Add support for 'isInterface' flag in the fdepl files.

## 0.0.9
- Release date: 2017-11-10
- Features:
  + Add support for Enums to Android generators
  + Add support for Listeners to Android generators
  + Add support for Attributes to iOS generators

## 0.0.8
- Release date: 2017-10-19
- Features:
  + Add support for Attributes to Android generators
  + Add support for Enums to iOS generators
  + Add support for TypeDefs to Android generators
  + Add support for TypeDefs to iOS generators
  + Add support for Listeners to base Api generators

## 0.0.7
- Release date: 2017-10-10
- Features:
  + Add support for Instances to iOS generators
  + Add support for Instances to Android generators
  + Add support for Attributes to base Api generators

## 0.0.6
- Release date: 2017-09-22
- Features:
  + Add support for Plain Data Structures to iOS generators
  + Add support for Instances to base Api generators

## 0.0.5
- Release date: 2017-09-18
- Behavior changes:
  + Change BaseApiGeneratorSuite name to "cpp"
  + Remove 'Stub' suffix from generated base_api classes
  + Generate virtual destructor in C++
  + Throw Transpiler exception for malformed .fdepl
- Features:
  + Implement struct inheritance for C++ generator
  + Adds inheritance from NativeBase to non-POD, non-factory classes
  + Adds instance support to java generator
  + Add support for structs as function parameters
  + Add support for referencing Map<> types in C++
  + Enable mapping of non-inline Arrays for Cpp
  + Implement unions for C++ generator
  + Remove Xtend dependency
- Bugs:
  + Bugfix for order of 'get_pointer' helper in CBridge
  + Fix for template generating struct internal constructor
  + Bugfix - Remove stub prefix and change to cpp
  + Fix cpp type mapper instance referencing
  + Fix handling of xxxRef in cBridge

## 0.0.4
- Release date: 2017-08-29
- Bug fixes and performance improvement

## 0.0.3
- Release date: 2017-07-03
- First release
