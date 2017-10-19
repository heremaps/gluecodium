# API Transpiler Release Notes

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
