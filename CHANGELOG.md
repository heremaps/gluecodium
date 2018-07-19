# Genium project Release Notes

## Unreleased
- Breaking changes:
  + Generated functions returning optional "String?" in Swift are now returning a non-optional
    "String" instead.
  + Function parameters of "instance" types in generated Swift code are now using optional types.

## 3.3.1
- Bug fixes:
  + Fixed integer constants in Java to be generated with "L" suffix when needed.

## 3.3.0
- Features:
  + Added generation of simple constants in C++, Java, and Swift. Supported types for constants are:
    Boolean, string, enumeration, and all numeric types.

## 3.2.0
- Breaking changes:
  + Exceptions are now error-enum specific and are generated as nested classes (nested on the same
    level as the corresponding error-enums).
- Bug fixes:
  + Fixed runtime crash in case of non-unique error-enum names inside the same package.

## 3.1.3
- Bug fixes:
  + Fixed handling of Java constants to generate those as "public".

## 3.1.2
- Bug fixes:
  + Fixed package names with "_" underscore in Java/JNI.

## 3.1.1
- Features:
  + Added generation of is_error_code_enum<> type trait for error enums in C++. This way they can be
    passed to std::error_code() constructor directly, without any additional static casts.

## 3.1.0
- Features:
  + Added FDEPL properties "ExternalGetter" and "ExternalSetter" for enabling the usage of accessor
    methods as a JNI/CBridge data source for struct fields of a struct marked with "ExternalType".
  + Added FDEPL property "ExternalName" for "renaming" struct types marked with "ExternalType" in
    C++, i.e. allowing the C++ name to differ from what is specified in the FIDL file.

## 3.0.1
- Bug fixes:
  + Fixed name collisions in Swift generated code.

## 3.0.0
- Breaking changes:
  + Renamed Transpiler to Genium.
- Features:
  + Added FDEPL property "ExternalType" for marking struct types as "external" in C++ and providing
    a path to a pre-existing C++ header file for that struct type.

## 2.2.1
- Bug fixes:
  + Fixed missing HERE license for artifactory publish

## 2.2.0
- Features:
  + Added FDEPL flag "NotNull" for marking struct fields as optional/non-optional in Swift or
    annotating them with @NonNull annotation in Java.

## 2.1.0
- Features:
  + Added FDEPL flag "Internal" for marking classes, methods and fields as "internal" in Swift or
    package-private in Java.
- Bug fixes:
  + Fixed compilation issues for Maps with Enums as keys in iOS generator when a non-default value
    is specified for "C++ internal namespace" command line parameter.

## 2.0.0
- Features:
  + Add support for Maps for iOS generator
  + Add support for Maps for Android generator

## 1.5.3
- Bug fixes:
  + Fixed Parcelable deserialization for structs and arrays.

## 1.5.2
- Breaking changes:
  + Names for getter functions for Boolean attributes are now named with "is" instead of "get".
- Bug fixes:
  + Fixed JNI local references leak for struct fields of String type.

## 1.5.1
- Bug fixes:
  + Fixed JNI type conversion for foreign packages.

## 1.5.0
- Breaking changes:
  + Use std::error_code for error codes
  + Renaming navigation.BaseApiSpec to TranspilerExtensions which should be imported with:
    import "classpath:/TranspilerExtensions.fdepl"
    instead of:
    import "classpath:/franca/spec/BaseApiSpec.fdepl"

## 1.4.0
- Breaking changes:
  + Use uint32_t as ErrorCode
  + EnumHash moved to ::transpiler namespace
- Features:
  + Add support for Interface Inheritance for iOS generator

## 1.3.0
- Breaking changes:
  + Instances in Swift structures made optional
- Features:
  + Add support for Interface Inheritance for Android generator
  + Add support for caching in Transpiler
  + Add support for Parcelable structs

## 1.2.3
- Bug fixes:
  + Fixed circular dependency compilation issues for C++

## 1.2.2
- Bug fixes:
  + Fixed compilation error for arrays in Swift generated code

## 1.2.1
- Bug fixes:
  + Removed validation against multiple output parameters

## 1.2.0
- Features:
  + Add validation against multiple output parameters. No support for this feature is planned.
  + Add validation against unions. No support for this feature is planned.
  + Add support for Interface Inheritance for C++ Base API generator
  + Add support for comments for all generators (Base API, Android, Swift)

## 1.1.1
- Bug fixes:
  + Android fields of structs declared within interfaces cannot be instantiated
  + Swift struct that contain interfaces will cause premature memory release

## 1.1.0
- Features:
  + Add support for Struct Inheritance to iOS generators
  + Add support for Default values to iOS generators

## 1.0.0
Bumping version to 1.0.0 to mark Q4 2017 feature completeness

## 0.15.0
- Features:
  + Add support for Errors to iOS generators

## 0.14.0
- Features:
  + Add support for Default values to C++ Base API generators
  + Add support for Default values to Java generators

## 0.13.0
- Features:
  + Add support for Struct Inheritance to Java generators
  + Add support for Errors to Java generators

## 0.12.0
- Features:
  + Add support for Listeners to Swift generators
  + Add support for Errors to C++ Base API generators

## 0.11.0
- Features:
  + Add support for Arrays to Android generators

## 0.0.10
- Features:
  + Add support for Arrays to iOS generators
  + Add support for 'isInterface' flag in the fdepl files.

## 0.0.9
- Features:
  + Add support for Enums to Android generators
  + Add support for Listeners to Android generators
  + Add support for Attributes to iOS generators

## 0.0.8
- Features:
  + Add support for Attributes to Android generators
  + Add support for Enums to iOS generators
  + Add support for TypeDefs to Android generators
  + Add support for TypeDefs to iOS generators
  + Add support for Listeners to base Api generators

## 0.0.7
- Features:
  + Add support for Instances to iOS generators
  + Add support for Instances to Android generators
  + Add support for Attributes to base Api generators

## 0.0.6
- Features:
  + Add support for Plain Data Structures to iOS generators
  + Add support for Instances to base Api generators

## 0.0.5
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
- Bug fixes and performance improvement

## 0.0.3
- Bug fixes and performance improvement

## 0.0.2
- Bug fixes and performance improvement

## 0.0.1
- First release
