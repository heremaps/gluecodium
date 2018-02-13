# API Transpiler Release Notes

## 1.2.3
- Bug fixes:
  + Fixed circular dependency compilation issues for C++

## 1.2.2
- Bug fixes:
  + Fixed compilation error for arrays in Swift generated code (APIGEN-1151)

## 1.2.1
- Bug fixes:
  + Removed validation against multiple output parameters (APIGEN-1138)

## 1.2.0
- Features:
  + Add validation against multiple output parameters. No support for this feature is planned.
  + Add validation against unions. No support for this feature is planned.
  + Add support for Interface Inheritance for C++ Base API generator
  + Add support for comments for all generators (Base API, Android, Swift)

## 1.1.1
- Bug fixes:
  + Android fields of structs declared within interfaces cannot be instantiated (APIGEN-1069)
  + Swift struct that contain interfaces will cause premature memory release (APIGEN-1038)

## 1.1.0
- Features:
  + Add support for Struct Inheritance to iOS generators
  + Add support for Default values to iOS generators

## 1.0.0
Bumping version to mark ES4 feature completeness

## 0.15.0
- Features:
  + Add support for Errors to iOS generators
- Behavior changes:
  + Changed namespace of EnumHash class from "here" to "hf"

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
  + Generated cpp APIs are IVI code-style compliant

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
  + Generate virtual destructor in C++ (APIGEN-584)
  + Throw Transpiler exception for malformed .fdepl (APIGEN-645)
- Features:
  + Implement struct inheritance for C++ generator (APIGEN-587)
  + Adds inheritance from NativeBase to non-POD, non-factory classes (APIGEN-195)
  + Adds instance support to java generator (APIGEN-592)
  + Add support for structs as function parameters (APIGEN-267)
  + Add support for referencing Map<> types in C++ (APIGEN-591)
  + Enable mapping of non-inline Arrays for Cpp (APIGEN-533)
  + Implement unions for C++ generator (APIGEN-581)
  + Remove Xtend dependency
- Bugs:
  + Bugfix for order of 'get_pointer' helper in CBridge
  + Fix for template generating struct internal constructor (APIGEN-267)
  + Bugfix - Remove stub prefix and change to cpp (APIGEN-253)
  + Fix cpp type mapper instance referencing (APIGEN-614)
  + Fix handling of xxxRef in cBridge (APIGEN-267)

## 0.0.4
- Bug fixes and performance improvement

## 0.0.3
- Bug fixes and performance improvement

## 0.0.2
- Bug fixes and performance improvement

## 0.0.1
- First release
