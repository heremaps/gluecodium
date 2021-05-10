import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/some_interface.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Nullable {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  String methodWithString(String input);
  bool methodWithBoolean(bool input);
  double methodWithDouble(double input);
  int methodWithInt(int input);
  Nullable_SomeStruct methodWithSomeStruct(Nullable_SomeStruct input);
  Nullable_SomeEnum methodWithSomeEnum(Nullable_SomeEnum input);
  List<String> methodWithSomeArray(List<String> input);
  List<String> methodWithInlineArray(List<String> input);
  Map<int, String> methodWithSomeMap(Map<int, String> input);
  SomeInterface methodWithInstance(SomeInterface input);
  String get stringProperty;
  set stringProperty(String value);
  bool get isBoolProperty;
  set isBoolProperty(bool value);
  double get doubleProperty;
  set doubleProperty(double value);
  int get intProperty;
  set intProperty(int value);
  Nullable_SomeStruct get structProperty;
  set structProperty(Nullable_SomeStruct value);
  Nullable_SomeEnum get enumProperty;
  set enumProperty(Nullable_SomeEnum value);
  List<String> get arrayProperty;
  set arrayProperty(List<String> value);
  List<String> get inlineArrayProperty;
  set inlineArrayProperty(List<String> value);
  Map<int, String> get mapProperty;
  set mapProperty(Map<int, String> value);
  SomeInterface get instanceProperty;
  set instanceProperty(SomeInterface value);
}
enum Nullable_SomeEnum {
    on,
    off
}
// Nullable_SomeEnum "private" section, not exported.
int smoke_Nullable_SomeEnum_toFfi(Nullable_SomeEnum value) {
  switch (value) {
  case Nullable_SomeEnum.on:
    return 0;
  break;
  case Nullable_SomeEnum.off:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Nullable_SomeEnum enum.");
  }
}
Nullable_SomeEnum smoke_Nullable_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Nullable_SomeEnum.on;
  break;
  case 1:
    return Nullable_SomeEnum.off;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Nullable_SomeEnum enum.");
  }
}
void smoke_Nullable_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_Nullable_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Nullable_SomeEnum_create_handle_nullable'));
final _smoke_Nullable_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeEnum_release_handle_nullable'));
final _smoke_Nullable_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_Nullable_SomeEnum_toFfi_nullable(Nullable_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Nullable_SomeEnum_toFfi(value);
  final result = _smoke_Nullable_SomeEnumCreateHandleNullable(_handle);
  smoke_Nullable_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
Nullable_SomeEnum smoke_Nullable_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Nullable_SomeEnumGetValueNullable(handle);
  final result = smoke_Nullable_SomeEnum_fromFfi(_handle);
  smoke_Nullable_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Nullable_SomeEnumReleaseHandleNullable(handle);
// End of Nullable_SomeEnum "private" section.
class Nullable_SomeStruct {
  String stringField;
  Nullable_SomeStruct(this.stringField);
}
// Nullable_SomeStruct "private" section, not exported.
final _smokeNullableSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_create_handle'));
final _smokeNullableSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_release_handle'));
final _smokeNullableSomestructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_get_field_stringField'));
Pointer<Void> smoke_Nullable_SomeStruct_toFfi(Nullable_SomeStruct value) {
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _result = _smokeNullableSomestructCreateHandle(_stringFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  return _result;
}
Nullable_SomeStruct smoke_Nullable_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeNullableSomestructGetFieldstringField(handle);
  try {
    return Nullable_SomeStruct(
      String_fromFfi(_stringFieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_stringFieldHandle);
  }
}
void smoke_Nullable_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeNullableSomestructReleaseHandle(handle);
// Nullable Nullable_SomeStruct
final _smoke_Nullable_SomeStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_create_handle_nullable'));
final _smoke_Nullable_SomeStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_release_handle_nullable'));
final _smoke_Nullable_SomeStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_Nullable_SomeStruct_toFfi_nullable(Nullable_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Nullable_SomeStruct_toFfi(value);
  final result = _smoke_Nullable_SomeStructCreateHandleNullable(_handle);
  smoke_Nullable_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
Nullable_SomeStruct smoke_Nullable_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Nullable_SomeStructGetValueNullable(handle);
  final result = smoke_Nullable_SomeStruct_fromFfi(_handle);
  smoke_Nullable_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Nullable_SomeStructReleaseHandleNullable(handle);
// End of Nullable_SomeStruct "private" section.
class Nullable_NullableStruct {
  String stringField;
  bool boolField;
  double doubleField;
  Nullable_SomeStruct structField;
  Nullable_SomeEnum enumField;
  List<String> arrayField;
  List<String> inlineArrayField;
  Map<int, String> mapField;
  SomeInterface instanceField;
  Nullable_NullableStruct(this.stringField, this.boolField, this.doubleField, this.structField, this.enumField, this.arrayField, this.inlineArrayField, this.mapField, this.instanceField);
}
// Nullable_NullableStruct "private" section, not exported.
final _smokeNullableNullablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_create_handle'));
final _smokeNullableNullablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_release_handle'));
final _smokeNullableNullablestructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_stringField'));
final _smokeNullableNullablestructGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_boolField'));
final _smokeNullableNullablestructGetFielddoubleField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_doubleField'));
final _smokeNullableNullablestructGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_structField'));
final _smokeNullableNullablestructGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_enumField'));
final _smokeNullableNullablestructGetFieldarrayField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_arrayField'));
final _smokeNullableNullablestructGetFieldinlineArrayField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_inlineArrayField'));
final _smokeNullableNullablestructGetFieldmapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_mapField'));
final _smokeNullableNullablestructGetFieldinstanceField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_instanceField'));
Pointer<Void> smoke_Nullable_NullableStruct_toFfi(Nullable_NullableStruct value) {
  final _stringFieldHandle = String_toFfi_nullable(value.stringField);
  final _boolFieldHandle = Boolean_toFfi_nullable(value.boolField);
  final _doubleFieldHandle = Double_toFfi_nullable(value.doubleField);
  final _structFieldHandle = smoke_Nullable_SomeStruct_toFfi_nullable(value.structField);
  final _enumFieldHandle = smoke_Nullable_SomeEnum_toFfi_nullable(value.enumField);
  final _arrayFieldHandle = foobar_ListOf_String_toFfi_nullable(value.arrayField);
  final _inlineArrayFieldHandle = foobar_ListOf_String_toFfi_nullable(value.inlineArrayField);
  final _mapFieldHandle = foobar_MapOf_Long_to_String_toFfi_nullable(value.mapField);
  final _instanceFieldHandle = smoke_SomeInterface_toFfi_nullable(value.instanceField);
  final _result = _smokeNullableNullablestructCreateHandle(_stringFieldHandle, _boolFieldHandle, _doubleFieldHandle, _structFieldHandle, _enumFieldHandle, _arrayFieldHandle, _inlineArrayFieldHandle, _mapFieldHandle, _instanceFieldHandle);
  String_releaseFfiHandle_nullable(_stringFieldHandle);
  Boolean_releaseFfiHandle_nullable(_boolFieldHandle);
  Double_releaseFfiHandle_nullable(_doubleFieldHandle);
  smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_structFieldHandle);
  smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(_enumFieldHandle);
  foobar_ListOf_String_releaseFfiHandle_nullable(_arrayFieldHandle);
  foobar_ListOf_String_releaseFfiHandle_nullable(_inlineArrayFieldHandle);
  foobar_MapOf_Long_to_String_releaseFfiHandle_nullable(_mapFieldHandle);
  smoke_SomeInterface_releaseFfiHandle_nullable(_instanceFieldHandle);
  return _result;
}
Nullable_NullableStruct smoke_Nullable_NullableStruct_fromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeNullableNullablestructGetFieldstringField(handle);
  final _boolFieldHandle = _smokeNullableNullablestructGetFieldboolField(handle);
  final _doubleFieldHandle = _smokeNullableNullablestructGetFielddoubleField(handle);
  final _structFieldHandle = _smokeNullableNullablestructGetFieldstructField(handle);
  final _enumFieldHandle = _smokeNullableNullablestructGetFieldenumField(handle);
  final _arrayFieldHandle = _smokeNullableNullablestructGetFieldarrayField(handle);
  final _inlineArrayFieldHandle = _smokeNullableNullablestructGetFieldinlineArrayField(handle);
  final _mapFieldHandle = _smokeNullableNullablestructGetFieldmapField(handle);
  final _instanceFieldHandle = _smokeNullableNullablestructGetFieldinstanceField(handle);
  try {
    return Nullable_NullableStruct(
      String_fromFfi_nullable(_stringFieldHandle),
      Boolean_fromFfi_nullable(_boolFieldHandle),
      Double_fromFfi_nullable(_doubleFieldHandle),
      smoke_Nullable_SomeStruct_fromFfi_nullable(_structFieldHandle),
      smoke_Nullable_SomeEnum_fromFfi_nullable(_enumFieldHandle),
      foobar_ListOf_String_fromFfi_nullable(_arrayFieldHandle),
      foobar_ListOf_String_fromFfi_nullable(_inlineArrayFieldHandle),
      foobar_MapOf_Long_to_String_fromFfi_nullable(_mapFieldHandle),
      smoke_SomeInterface_fromFfi_nullable(_instanceFieldHandle)
    );
  } finally {
    String_releaseFfiHandle_nullable(_stringFieldHandle);
    Boolean_releaseFfiHandle_nullable(_boolFieldHandle);
    Double_releaseFfiHandle_nullable(_doubleFieldHandle);
    smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_structFieldHandle);
    smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(_enumFieldHandle);
    foobar_ListOf_String_releaseFfiHandle_nullable(_arrayFieldHandle);
    foobar_ListOf_String_releaseFfiHandle_nullable(_inlineArrayFieldHandle);
    foobar_MapOf_Long_to_String_releaseFfiHandle_nullable(_mapFieldHandle);
    smoke_SomeInterface_releaseFfiHandle_nullable(_instanceFieldHandle);
  }
}
void smoke_Nullable_NullableStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeNullableNullablestructReleaseHandle(handle);
// Nullable Nullable_NullableStruct
final _smoke_Nullable_NullableStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_create_handle_nullable'));
final _smoke_Nullable_NullableStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_release_handle_nullable'));
final _smoke_Nullable_NullableStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_value_nullable'));
Pointer<Void> smoke_Nullable_NullableStruct_toFfi_nullable(Nullable_NullableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Nullable_NullableStruct_toFfi(value);
  final result = _smoke_Nullable_NullableStructCreateHandleNullable(_handle);
  smoke_Nullable_NullableStruct_releaseFfiHandle(_handle);
  return result;
}
Nullable_NullableStruct smoke_Nullable_NullableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Nullable_NullableStructGetValueNullable(handle);
  final result = smoke_Nullable_NullableStruct_fromFfi(_handle);
  smoke_Nullable_NullableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Nullable_NullableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Nullable_NullableStructReleaseHandleNullable(handle);
// End of Nullable_NullableStruct "private" section.
class Nullable_NullableIntsStruct {
  int int8Field;
  int int16Field;
  int int32Field;
  int int64Field;
  int uint8Field;
  int uint16Field;
  int uint32Field;
  int uint64Field;
  Nullable_NullableIntsStruct(this.int8Field, this.int16Field, this.int32Field, this.int64Field, this.uint8Field, this.uint16Field, this.uint32Field, this.uint64Field);
}
// Nullable_NullableIntsStruct "private" section, not exported.
final _smokeNullableNullableintsstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_create_handle'));
final _smokeNullableNullableintsstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_release_handle'));
final _smokeNullableNullableintsstructGetFieldint8Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_int8Field'));
final _smokeNullableNullableintsstructGetFieldint16Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_int16Field'));
final _smokeNullableNullableintsstructGetFieldint32Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_int32Field'));
final _smokeNullableNullableintsstructGetFieldint64Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_int64Field'));
final _smokeNullableNullableintsstructGetFielduint8Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_uint8Field'));
final _smokeNullableNullableintsstructGetFielduint16Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_uint16Field'));
final _smokeNullableNullableintsstructGetFielduint32Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_uint32Field'));
final _smokeNullableNullableintsstructGetFielduint64Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_uint64Field'));
Pointer<Void> smoke_Nullable_NullableIntsStruct_toFfi(Nullable_NullableIntsStruct value) {
  final _int8FieldHandle = Byte_toFfi_nullable(value.int8Field);
  final _int16FieldHandle = Short_toFfi_nullable(value.int16Field);
  final _int32FieldHandle = Int_toFfi_nullable(value.int32Field);
  final _int64FieldHandle = Long_toFfi_nullable(value.int64Field);
  final _uint8FieldHandle = UByte_toFfi_nullable(value.uint8Field);
  final _uint16FieldHandle = UShort_toFfi_nullable(value.uint16Field);
  final _uint32FieldHandle = UInt_toFfi_nullable(value.uint32Field);
  final _uint64FieldHandle = ULong_toFfi_nullable(value.uint64Field);
  final _result = _smokeNullableNullableintsstructCreateHandle(_int8FieldHandle, _int16FieldHandle, _int32FieldHandle, _int64FieldHandle, _uint8FieldHandle, _uint16FieldHandle, _uint32FieldHandle, _uint64FieldHandle);
  Byte_releaseFfiHandle_nullable(_int8FieldHandle);
  Short_releaseFfiHandle_nullable(_int16FieldHandle);
  Int_releaseFfiHandle_nullable(_int32FieldHandle);
  Long_releaseFfiHandle_nullable(_int64FieldHandle);
  UByte_releaseFfiHandle_nullable(_uint8FieldHandle);
  UShort_releaseFfiHandle_nullable(_uint16FieldHandle);
  UInt_releaseFfiHandle_nullable(_uint32FieldHandle);
  ULong_releaseFfiHandle_nullable(_uint64FieldHandle);
  return _result;
}
Nullable_NullableIntsStruct smoke_Nullable_NullableIntsStruct_fromFfi(Pointer<Void> handle) {
  final _int8FieldHandle = _smokeNullableNullableintsstructGetFieldint8Field(handle);
  final _int16FieldHandle = _smokeNullableNullableintsstructGetFieldint16Field(handle);
  final _int32FieldHandle = _smokeNullableNullableintsstructGetFieldint32Field(handle);
  final _int64FieldHandle = _smokeNullableNullableintsstructGetFieldint64Field(handle);
  final _uint8FieldHandle = _smokeNullableNullableintsstructGetFielduint8Field(handle);
  final _uint16FieldHandle = _smokeNullableNullableintsstructGetFielduint16Field(handle);
  final _uint32FieldHandle = _smokeNullableNullableintsstructGetFielduint32Field(handle);
  final _uint64FieldHandle = _smokeNullableNullableintsstructGetFielduint64Field(handle);
  try {
    return Nullable_NullableIntsStruct(
      Byte_fromFfi_nullable(_int8FieldHandle),
      Short_fromFfi_nullable(_int16FieldHandle),
      Int_fromFfi_nullable(_int32FieldHandle),
      Long_fromFfi_nullable(_int64FieldHandle),
      UByte_fromFfi_nullable(_uint8FieldHandle),
      UShort_fromFfi_nullable(_uint16FieldHandle),
      UInt_fromFfi_nullable(_uint32FieldHandle),
      ULong_fromFfi_nullable(_uint64FieldHandle)
    );
  } finally {
    Byte_releaseFfiHandle_nullable(_int8FieldHandle);
    Short_releaseFfiHandle_nullable(_int16FieldHandle);
    Int_releaseFfiHandle_nullable(_int32FieldHandle);
    Long_releaseFfiHandle_nullable(_int64FieldHandle);
    UByte_releaseFfiHandle_nullable(_uint8FieldHandle);
    UShort_releaseFfiHandle_nullable(_uint16FieldHandle);
    UInt_releaseFfiHandle_nullable(_uint32FieldHandle);
    ULong_releaseFfiHandle_nullable(_uint64FieldHandle);
  }
}
void smoke_Nullable_NullableIntsStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeNullableNullableintsstructReleaseHandle(handle);
// Nullable Nullable_NullableIntsStruct
final _smoke_Nullable_NullableIntsStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_create_handle_nullable'));
final _smoke_Nullable_NullableIntsStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_release_handle_nullable'));
final _smoke_Nullable_NullableIntsStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_value_nullable'));
Pointer<Void> smoke_Nullable_NullableIntsStruct_toFfi_nullable(Nullable_NullableIntsStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Nullable_NullableIntsStruct_toFfi(value);
  final result = _smoke_Nullable_NullableIntsStructCreateHandleNullable(_handle);
  smoke_Nullable_NullableIntsStruct_releaseFfiHandle(_handle);
  return result;
}
Nullable_NullableIntsStruct smoke_Nullable_NullableIntsStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Nullable_NullableIntsStructGetValueNullable(handle);
  final result = smoke_Nullable_NullableIntsStruct_fromFfi(_handle);
  smoke_Nullable_NullableIntsStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Nullable_NullableIntsStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Nullable_NullableIntsStructReleaseHandleNullable(handle);
// End of Nullable_NullableIntsStruct "private" section.
// Nullable "private" section, not exported.
final _smokeNullableCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_copy_handle'));
final _smokeNullableReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_release_handle'));
class Nullable$Impl extends __lib.NativeBase implements Nullable {
  Nullable$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeNullableReleaseHandle(handle);
    handle = null;
  }
  @override
  String methodWithString(String input) {
    final _methodWithStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithString__String'));
    final _inputHandle = String_toFfi_nullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithStringFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle_nullable(_inputHandle);
    try {
      return String_fromFfi_nullable(__resultHandle);
    } finally {
      String_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  bool methodWithBoolean(bool input) {
    final _methodWithBooleanFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithBoolean__Boolean'));
    final _inputHandle = Boolean_toFfi_nullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithBooleanFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    Boolean_releaseFfiHandle_nullable(_inputHandle);
    try {
      return Boolean_fromFfi_nullable(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  double methodWithDouble(double input) {
    final _methodWithDoubleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithDouble__Double'));
    final _inputHandle = Double_toFfi_nullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithDoubleFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    Double_releaseFfiHandle_nullable(_inputHandle);
    try {
      return Double_fromFfi_nullable(__resultHandle);
    } finally {
      Double_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  int methodWithInt(int input) {
    final _methodWithIntFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithInt__Long'));
    final _inputHandle = Long_toFfi_nullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithIntFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    Long_releaseFfiHandle_nullable(_inputHandle);
    try {
      return Long_fromFfi_nullable(__resultHandle);
    } finally {
      Long_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  Nullable_SomeStruct methodWithSomeStruct(Nullable_SomeStruct input) {
    final _methodWithSomeStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeStruct__SomeStruct'));
    final _inputHandle = smoke_Nullable_SomeStruct_toFfi_nullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSomeStructFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_inputHandle);
    try {
      return smoke_Nullable_SomeStruct_fromFfi_nullable(__resultHandle);
    } finally {
      smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  Nullable_SomeEnum methodWithSomeEnum(Nullable_SomeEnum input) {
    final _methodWithSomeEnumFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeEnum__SomeEnum'));
    final _inputHandle = smoke_Nullable_SomeEnum_toFfi_nullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSomeEnumFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(_inputHandle);
    try {
      return smoke_Nullable_SomeEnum_fromFfi_nullable(__resultHandle);
    } finally {
      smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  List<String> methodWithSomeArray(List<String> input) {
    final _methodWithSomeArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeArray__ListOf_1String'));
    final _inputHandle = foobar_ListOf_String_toFfi_nullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSomeArrayFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_ListOf_String_releaseFfiHandle_nullable(_inputHandle);
    try {
      return foobar_ListOf_String_fromFfi_nullable(__resultHandle);
    } finally {
      foobar_ListOf_String_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  List<String> methodWithInlineArray(List<String> input) {
    final _methodWithInlineArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithInlineArray__ListOf_1String'));
    final _inputHandle = foobar_ListOf_String_toFfi_nullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithInlineArrayFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_ListOf_String_releaseFfiHandle_nullable(_inputHandle);
    try {
      return foobar_ListOf_String_fromFfi_nullable(__resultHandle);
    } finally {
      foobar_ListOf_String_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  Map<int, String> methodWithSomeMap(Map<int, String> input) {
    final _methodWithSomeMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeMap__MapOf_1Long_1to_1String'));
    final _inputHandle = foobar_MapOf_Long_to_String_toFfi_nullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSomeMapFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobar_MapOf_Long_to_String_releaseFfiHandle_nullable(_inputHandle);
    try {
      return foobar_MapOf_Long_to_String_fromFfi_nullable(__resultHandle);
    } finally {
      foobar_MapOf_Long_to_String_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  SomeInterface methodWithInstance(SomeInterface input) {
    final _methodWithInstanceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithInstance__SomeInterface'));
    final _inputHandle = smoke_SomeInterface_toFfi_nullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithInstanceFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smoke_SomeInterface_releaseFfiHandle_nullable(_inputHandle);
    try {
      return smoke_SomeInterface_fromFfi_nullable(__resultHandle);
    } finally {
      smoke_SomeInterface_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  String get stringProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_stringProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi_nullable(__resultHandle);
    } finally {
      String_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  set stringProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_stringProperty_set__String'));
    final _valueHandle = String_toFfi_nullable(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    String_releaseFfiHandle_nullable(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  bool get isBoolProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_isBoolProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi_nullable(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  set isBoolProperty(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_isBoolProperty_set__Boolean'));
    final _valueHandle = Boolean_toFfi_nullable(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    Boolean_releaseFfiHandle_nullable(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  double get doubleProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_doubleProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Double_fromFfi_nullable(__resultHandle);
    } finally {
      Double_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  set doubleProperty(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_doubleProperty_set__Double'));
    final _valueHandle = Double_toFfi_nullable(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    Double_releaseFfiHandle_nullable(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  int get intProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_intProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Long_fromFfi_nullable(__resultHandle);
    } finally {
      Long_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  set intProperty(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_intProperty_set__Long'));
    final _valueHandle = Long_toFfi_nullable(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    Long_releaseFfiHandle_nullable(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  Nullable_SomeStruct get structProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_structProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_Nullable_SomeStruct_fromFfi_nullable(__resultHandle);
    } finally {
      smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  set structProperty(Nullable_SomeStruct value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_structProperty_set__SomeStruct'));
    final _valueHandle = smoke_Nullable_SomeStruct_toFfi_nullable(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  Nullable_SomeEnum get enumProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_enumProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_Nullable_SomeEnum_fromFfi_nullable(__resultHandle);
    } finally {
      smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  set enumProperty(Nullable_SomeEnum value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_enumProperty_set__SomeEnum'));
    final _valueHandle = smoke_Nullable_SomeEnum_toFfi_nullable(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  List<String> get arrayProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_arrayProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_ListOf_String_fromFfi_nullable(__resultHandle);
    } finally {
      foobar_ListOf_String_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  set arrayProperty(List<String> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_arrayProperty_set__ListOf_1String'));
    final _valueHandle = foobar_ListOf_String_toFfi_nullable(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobar_ListOf_String_releaseFfiHandle_nullable(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  List<String> get inlineArrayProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_inlineArrayProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_ListOf_String_fromFfi_nullable(__resultHandle);
    } finally {
      foobar_ListOf_String_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  set inlineArrayProperty(List<String> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_inlineArrayProperty_set__ListOf_1String'));
    final _valueHandle = foobar_ListOf_String_toFfi_nullable(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobar_ListOf_String_releaseFfiHandle_nullable(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  Map<int, String> get mapProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_mapProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_MapOf_Long_to_String_fromFfi_nullable(__resultHandle);
    } finally {
      foobar_MapOf_Long_to_String_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  set mapProperty(Map<int, String> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_mapProperty_set__MapOf_1Long_1to_1String'));
    final _valueHandle = foobar_MapOf_Long_to_String_toFfi_nullable(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobar_MapOf_Long_to_String_releaseFfiHandle_nullable(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  SomeInterface get instanceProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_instanceProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_SomeInterface_fromFfi_nullable(__resultHandle);
    } finally {
      smoke_SomeInterface_releaseFfiHandle_nullable(__resultHandle);
    }
  }
  @override
  set instanceProperty(SomeInterface value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_instanceProperty_set__SomeInterface'));
    final _valueHandle = smoke_SomeInterface_toFfi_nullable(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smoke_SomeInterface_releaseFfiHandle_nullable(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_Nullable_toFfi(Nullable value) =>
  _smokeNullableCopyHandle((value as __lib.NativeBase).handle);
Nullable smoke_Nullable_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Nullable;
  if (instance != null) return instance;
  final _copiedHandle = _smokeNullableCopyHandle(handle);
  final result = Nullable$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_Nullable_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeNullableReleaseHandle(handle);
Pointer<Void> smoke_Nullable_toFfi_nullable(Nullable value) =>
  value != null ? smoke_Nullable_toFfi(value) : Pointer<Void>.fromAddress(0);
Nullable smoke_Nullable_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Nullable_fromFfi(handle) : null;
void smoke_Nullable_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeNullableReleaseHandle(handle);
// End of Nullable "private" section.
