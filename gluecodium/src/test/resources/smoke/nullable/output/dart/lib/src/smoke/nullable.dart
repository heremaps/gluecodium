import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/some_interface.dart';
abstract class Nullable {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  String? methodWithString(String? input);
  bool? methodWithBoolean(bool? input);
  double? methodWithDouble(double? input);
  int? methodWithInt(int? input);
  Nullable_SomeStruct? methodWithSomeStruct(Nullable_SomeStruct? input);
  Nullable_SomeEnum? methodWithSomeEnum(Nullable_SomeEnum? input);
  List<String>? methodWithSomeArray(List<String>? input);
  List<String>? methodWithInlineArray(List<String>? input);
  Map<int, String>? methodWithSomeMap(Map<int, String>? input);
  SomeInterface? methodWithInstance(SomeInterface? input);
  String? get stringProperty;
  set stringProperty(String? value);
  bool? get isBoolProperty;
  set isBoolProperty(bool? value);
  double? get doubleProperty;
  set doubleProperty(double? value);
  int? get intProperty;
  set intProperty(int? value);
  Nullable_SomeStruct? get structProperty;
  set structProperty(Nullable_SomeStruct? value);
  Nullable_SomeEnum? get enumProperty;
  set enumProperty(Nullable_SomeEnum? value);
  List<String>? get arrayProperty;
  set arrayProperty(List<String>? value);
  List<String>? get inlineArrayProperty;
  set inlineArrayProperty(List<String>? value);
  Map<int, String>? get mapProperty;
  set mapProperty(Map<int, String>? value);
  SomeInterface? get instanceProperty;
  set instanceProperty(SomeInterface? value);
}
enum Nullable_SomeEnum {
    on,
    off
}
// Nullable_SomeEnum "private" section, not exported.
int smokeNullableSomeenumToFfi(Nullable_SomeEnum value) {
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
Nullable_SomeEnum smokeNullableSomeenumFromFfi(int handle) {
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
void smokeNullableSomeenumReleaseFfiHandle(int handle) {}
final _smokeNullableSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Nullable_SomeEnum_create_handle_nullable'));
final _smokeNullableSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeEnum_release_handle_nullable'));
final _smokeNullableSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeEnum_get_value_nullable'));
Pointer<Void> smokeNullableSomeenumToFfiNullable(Nullable_SomeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeNullableSomeenumToFfi(value);
  final result = _smokeNullableSomeenumCreateHandleNullable(_handle);
  smokeNullableSomeenumReleaseFfiHandle(_handle);
  return result;
}
Nullable_SomeEnum? smokeNullableSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeNullableSomeenumGetValueNullable(handle);
  final result = smokeNullableSomeenumFromFfi(_handle);
  smokeNullableSomeenumReleaseFfiHandle(_handle);
  return result;
}
void smokeNullableSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeNullableSomeenumReleaseHandleNullable(handle);
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
Pointer<Void> smokeNullableSomestructToFfi(Nullable_SomeStruct value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeNullableSomestructCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
Nullable_SomeStruct smokeNullableSomestructFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeNullableSomestructGetFieldstringField(handle);
  try {
    return Nullable_SomeStruct(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeNullableSomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeNullableSomestructReleaseHandle(handle);
// Nullable Nullable_SomeStruct
final _smokeNullableSomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_create_handle_nullable'));
final _smokeNullableSomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_release_handle_nullable'));
final _smokeNullableSomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_get_value_nullable'));
Pointer<Void> smokeNullableSomestructToFfiNullable(Nullable_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeNullableSomestructToFfi(value);
  final result = _smokeNullableSomestructCreateHandleNullable(_handle);
  smokeNullableSomestructReleaseFfiHandle(_handle);
  return result;
}
Nullable_SomeStruct? smokeNullableSomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeNullableSomestructGetValueNullable(handle);
  final result = smokeNullableSomestructFromFfi(_handle);
  smokeNullableSomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeNullableSomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeNullableSomestructReleaseHandleNullable(handle);
// End of Nullable_SomeStruct "private" section.
class Nullable_NullableStruct {
  String? stringField;
  bool? boolField;
  double? doubleField;
  Nullable_SomeStruct? structField;
  Nullable_SomeEnum? enumField;
  List<String>? arrayField;
  List<String>? inlineArrayField;
  Map<int, String>? mapField;
  SomeInterface? instanceField;
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
Pointer<Void> smokeNullableNullablestructToFfi(Nullable_NullableStruct value) {
  final _stringFieldHandle = stringToFfiNullable(value.stringField);
  final _boolFieldHandle = booleanToFfiNullable(value.boolField);
  final _doubleFieldHandle = doubleToFfiNullable(value.doubleField);
  final _structFieldHandle = smokeNullableSomestructToFfiNullable(value.structField);
  final _enumFieldHandle = smokeNullableSomeenumToFfiNullable(value.enumField);
  final _arrayFieldHandle = foobarListofStringToFfiNullable(value.arrayField);
  final _inlineArrayFieldHandle = foobarListofStringToFfiNullable(value.inlineArrayField);
  final _mapFieldHandle = foobarMapofLongToStringToFfiNullable(value.mapField);
  final _instanceFieldHandle = smokeSomeinterfaceToFfiNullable(value.instanceField);
  final _result = _smokeNullableNullablestructCreateHandle(_stringFieldHandle, _boolFieldHandle, _doubleFieldHandle, _structFieldHandle, _enumFieldHandle, _arrayFieldHandle, _inlineArrayFieldHandle, _mapFieldHandle, _instanceFieldHandle);
  stringReleaseFfiHandleNullable(_stringFieldHandle);
  booleanReleaseFfiHandleNullable(_boolFieldHandle);
  doubleReleaseFfiHandleNullable(_doubleFieldHandle);
  smokeNullableSomestructReleaseFfiHandleNullable(_structFieldHandle);
  smokeNullableSomeenumReleaseFfiHandleNullable(_enumFieldHandle);
  foobarListofStringReleaseFfiHandleNullable(_arrayFieldHandle);
  foobarListofStringReleaseFfiHandleNullable(_inlineArrayFieldHandle);
  foobarMapofLongToStringReleaseFfiHandleNullable(_mapFieldHandle);
  smokeSomeinterfaceReleaseFfiHandleNullable(_instanceFieldHandle);
  return _result;
}
Nullable_NullableStruct smokeNullableNullablestructFromFfi(Pointer<Void> handle) {
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
      stringFromFfiNullable(_stringFieldHandle),
      booleanFromFfiNullable(_boolFieldHandle),
      doubleFromFfiNullable(_doubleFieldHandle),
      smokeNullableSomestructFromFfiNullable(_structFieldHandle),
      smokeNullableSomeenumFromFfiNullable(_enumFieldHandle),
      foobarListofStringFromFfiNullable(_arrayFieldHandle),
      foobarListofStringFromFfiNullable(_inlineArrayFieldHandle),
      foobarMapofLongToStringFromFfiNullable(_mapFieldHandle),
      smokeSomeinterfaceFromFfiNullable(_instanceFieldHandle)
    );
  } finally {
    stringReleaseFfiHandleNullable(_stringFieldHandle);
    booleanReleaseFfiHandleNullable(_boolFieldHandle);
    doubleReleaseFfiHandleNullable(_doubleFieldHandle);
    smokeNullableSomestructReleaseFfiHandleNullable(_structFieldHandle);
    smokeNullableSomeenumReleaseFfiHandleNullable(_enumFieldHandle);
    foobarListofStringReleaseFfiHandleNullable(_arrayFieldHandle);
    foobarListofStringReleaseFfiHandleNullable(_inlineArrayFieldHandle);
    foobarMapofLongToStringReleaseFfiHandleNullable(_mapFieldHandle);
    smokeSomeinterfaceReleaseFfiHandleNullable(_instanceFieldHandle);
  }
}
void smokeNullableNullablestructReleaseFfiHandle(Pointer<Void> handle) => _smokeNullableNullablestructReleaseHandle(handle);
// Nullable Nullable_NullableStruct
final _smokeNullableNullablestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_create_handle_nullable'));
final _smokeNullableNullablestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_release_handle_nullable'));
final _smokeNullableNullablestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_value_nullable'));
Pointer<Void> smokeNullableNullablestructToFfiNullable(Nullable_NullableStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeNullableNullablestructToFfi(value);
  final result = _smokeNullableNullablestructCreateHandleNullable(_handle);
  smokeNullableNullablestructReleaseFfiHandle(_handle);
  return result;
}
Nullable_NullableStruct? smokeNullableNullablestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeNullableNullablestructGetValueNullable(handle);
  final result = smokeNullableNullablestructFromFfi(_handle);
  smokeNullableNullablestructReleaseFfiHandle(_handle);
  return result;
}
void smokeNullableNullablestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeNullableNullablestructReleaseHandleNullable(handle);
// End of Nullable_NullableStruct "private" section.
class Nullable_NullableIntsStruct {
  int? int8Field;
  int? int16Field;
  int? int32Field;
  int? int64Field;
  int? uint8Field;
  int? uint16Field;
  int? uint32Field;
  int? uint64Field;
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
Pointer<Void> smokeNullableNullableintsstructToFfi(Nullable_NullableIntsStruct value) {
  final _int8FieldHandle = byteToFfiNullable(value.int8Field);
  final _int16FieldHandle = shortToFfiNullable(value.int16Field);
  final _int32FieldHandle = intToFfiNullable(value.int32Field);
  final _int64FieldHandle = longToFfiNullable(value.int64Field);
  final _uint8FieldHandle = uByteToFfiNullable(value.uint8Field);
  final _uint16FieldHandle = uShortToFfiNullable(value.uint16Field);
  final _uint32FieldHandle = uIntToFfiNullable(value.uint32Field);
  final _uint64FieldHandle = uLongToFfiNullable(value.uint64Field);
  final _result = _smokeNullableNullableintsstructCreateHandle(_int8FieldHandle, _int16FieldHandle, _int32FieldHandle, _int64FieldHandle, _uint8FieldHandle, _uint16FieldHandle, _uint32FieldHandle, _uint64FieldHandle);
  byteReleaseFfiHandleNullable(_int8FieldHandle);
  shortReleaseFfiHandleNullable(_int16FieldHandle);
  intReleaseFfiHandleNullable(_int32FieldHandle);
  longReleaseFfiHandleNullable(_int64FieldHandle);
  uByteReleaseFfiHandleNullable(_uint8FieldHandle);
  uShortReleaseFfiHandleNullable(_uint16FieldHandle);
  uIntReleaseFfiHandleNullable(_uint32FieldHandle);
  uLongReleaseFfiHandleNullable(_uint64FieldHandle);
  return _result;
}
Nullable_NullableIntsStruct smokeNullableNullableintsstructFromFfi(Pointer<Void> handle) {
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
      byteFromFfiNullable(_int8FieldHandle),
      shortFromFfiNullable(_int16FieldHandle),
      intFromFfiNullable(_int32FieldHandle),
      longFromFfiNullable(_int64FieldHandle),
      uByteFromFfiNullable(_uint8FieldHandle),
      uShortFromFfiNullable(_uint16FieldHandle),
      uIntFromFfiNullable(_uint32FieldHandle),
      uLongFromFfiNullable(_uint64FieldHandle)
    );
  } finally {
    byteReleaseFfiHandleNullable(_int8FieldHandle);
    shortReleaseFfiHandleNullable(_int16FieldHandle);
    intReleaseFfiHandleNullable(_int32FieldHandle);
    longReleaseFfiHandleNullable(_int64FieldHandle);
    uByteReleaseFfiHandleNullable(_uint8FieldHandle);
    uShortReleaseFfiHandleNullable(_uint16FieldHandle);
    uIntReleaseFfiHandleNullable(_uint32FieldHandle);
    uLongReleaseFfiHandleNullable(_uint64FieldHandle);
  }
}
void smokeNullableNullableintsstructReleaseFfiHandle(Pointer<Void> handle) => _smokeNullableNullableintsstructReleaseHandle(handle);
// Nullable Nullable_NullableIntsStruct
final _smokeNullableNullableintsstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_create_handle_nullable'));
final _smokeNullableNullableintsstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_release_handle_nullable'));
final _smokeNullableNullableintsstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_value_nullable'));
Pointer<Void> smokeNullableNullableintsstructToFfiNullable(Nullable_NullableIntsStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeNullableNullableintsstructToFfi(value);
  final result = _smokeNullableNullableintsstructCreateHandleNullable(_handle);
  smokeNullableNullableintsstructReleaseFfiHandle(_handle);
  return result;
}
Nullable_NullableIntsStruct? smokeNullableNullableintsstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeNullableNullableintsstructGetValueNullable(handle);
  final result = smokeNullableNullableintsstructFromFfi(_handle);
  smokeNullableNullableintsstructReleaseFfiHandle(_handle);
  return result;
}
void smokeNullableNullableintsstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeNullableNullableintsstructReleaseHandleNullable(handle);
// End of Nullable_NullableIntsStruct "private" section.
// Nullable "private" section, not exported.
final _smokeNullableRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Nullable_register_finalizer'));
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
  void release() {}
  @override
  String? methodWithString(String? input) {
    final _methodWithStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithString__String'));
    final _inputHandle = stringToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithStringFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandleNullable(_inputHandle);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  bool? methodWithBoolean(bool? input) {
    final _methodWithBooleanFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithBoolean__Boolean'));
    final _inputHandle = booleanToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithBooleanFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    booleanReleaseFfiHandleNullable(_inputHandle);
    try {
      return booleanFromFfiNullable(__resultHandle);
    } finally {
      booleanReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  double? methodWithDouble(double? input) {
    final _methodWithDoubleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithDouble__Double'));
    final _inputHandle = doubleToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithDoubleFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    doubleReleaseFfiHandleNullable(_inputHandle);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  int? methodWithInt(int? input) {
    final _methodWithIntFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithInt__Long'));
    final _inputHandle = longToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithIntFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    longReleaseFfiHandleNullable(_inputHandle);
    try {
      return longFromFfiNullable(__resultHandle);
    } finally {
      longReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  Nullable_SomeStruct? methodWithSomeStruct(Nullable_SomeStruct? input) {
    final _methodWithSomeStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeStruct__SomeStruct'));
    final _inputHandle = smokeNullableSomestructToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSomeStructFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smokeNullableSomestructReleaseFfiHandleNullable(_inputHandle);
    try {
      return smokeNullableSomestructFromFfiNullable(__resultHandle);
    } finally {
      smokeNullableSomestructReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  Nullable_SomeEnum? methodWithSomeEnum(Nullable_SomeEnum? input) {
    final _methodWithSomeEnumFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeEnum__SomeEnum'));
    final _inputHandle = smokeNullableSomeenumToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSomeEnumFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smokeNullableSomeenumReleaseFfiHandleNullable(_inputHandle);
    try {
      return smokeNullableSomeenumFromFfiNullable(__resultHandle);
    } finally {
      smokeNullableSomeenumReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  List<String>? methodWithSomeArray(List<String>? input) {
    final _methodWithSomeArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeArray__ListOf_1String'));
    final _inputHandle = foobarListofStringToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSomeArrayFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofStringReleaseFfiHandleNullable(_inputHandle);
    try {
      return foobarListofStringFromFfiNullable(__resultHandle);
    } finally {
      foobarListofStringReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  List<String>? methodWithInlineArray(List<String>? input) {
    final _methodWithInlineArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithInlineArray__ListOf_1String'));
    final _inputHandle = foobarListofStringToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithInlineArrayFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofStringReleaseFfiHandleNullable(_inputHandle);
    try {
      return foobarListofStringFromFfiNullable(__resultHandle);
    } finally {
      foobarListofStringReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  Map<int, String>? methodWithSomeMap(Map<int, String>? input) {
    final _methodWithSomeMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeMap__MapOf_1Long_1to_1String'));
    final _inputHandle = foobarMapofLongToStringToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithSomeMapFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarMapofLongToStringReleaseFfiHandleNullable(_inputHandle);
    try {
      return foobarMapofLongToStringFromFfiNullable(__resultHandle);
    } finally {
      foobarMapofLongToStringReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  SomeInterface? methodWithInstance(SomeInterface? input) {
    final _methodWithInstanceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_methodWithInstance__SomeInterface'));
    final _inputHandle = smokeSomeinterfaceToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _methodWithInstanceFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smokeSomeinterfaceReleaseFfiHandleNullable(_inputHandle);
    try {
      return smokeSomeinterfaceFromFfiNullable(__resultHandle);
    } finally {
      smokeSomeinterfaceReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  String? get stringProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_stringProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  set stringProperty(String? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_stringProperty_set__String'));
    final _valueHandle = stringToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandleNullable(_valueHandle);
  }
  @override
  bool? get isBoolProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_isBoolProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfiNullable(__resultHandle);
    } finally {
      booleanReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  set isBoolProperty(bool? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_isBoolProperty_set__Boolean'));
    final _valueHandle = booleanToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandleNullable(_valueHandle);
  }
  @override
  double? get doubleProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_doubleProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  set doubleProperty(double? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_doubleProperty_set__Double'));
    final _valueHandle = doubleToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    doubleReleaseFfiHandleNullable(_valueHandle);
  }
  @override
  int? get intProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_intProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return longFromFfiNullable(__resultHandle);
    } finally {
      longReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  set intProperty(int? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_intProperty_set__Long'));
    final _valueHandle = longToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    longReleaseFfiHandleNullable(_valueHandle);
  }
  @override
  Nullable_SomeStruct? get structProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_structProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeNullableSomestructFromFfiNullable(__resultHandle);
    } finally {
      smokeNullableSomestructReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  set structProperty(Nullable_SomeStruct? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_structProperty_set__SomeStruct'));
    final _valueHandle = smokeNullableSomestructToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokeNullableSomestructReleaseFfiHandleNullable(_valueHandle);
  }
  @override
  Nullable_SomeEnum? get enumProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_enumProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeNullableSomeenumFromFfiNullable(__resultHandle);
    } finally {
      smokeNullableSomeenumReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  set enumProperty(Nullable_SomeEnum? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_enumProperty_set__SomeEnum'));
    final _valueHandle = smokeNullableSomeenumToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokeNullableSomeenumReleaseFfiHandleNullable(_valueHandle);
  }
  @override
  List<String>? get arrayProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_arrayProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarListofStringFromFfiNullable(__resultHandle);
    } finally {
      foobarListofStringReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  set arrayProperty(List<String>? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_arrayProperty_set__ListOf_1String'));
    final _valueHandle = foobarListofStringToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarListofStringReleaseFfiHandleNullable(_valueHandle);
  }
  @override
  List<String>? get inlineArrayProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_inlineArrayProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarListofStringFromFfiNullable(__resultHandle);
    } finally {
      foobarListofStringReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  set inlineArrayProperty(List<String>? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_inlineArrayProperty_set__ListOf_1String'));
    final _valueHandle = foobarListofStringToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarListofStringReleaseFfiHandleNullable(_valueHandle);
  }
  @override
  Map<int, String>? get mapProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_mapProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarMapofLongToStringFromFfiNullable(__resultHandle);
    } finally {
      foobarMapofLongToStringReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  set mapProperty(Map<int, String>? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_mapProperty_set__MapOf_1Long_1to_1String'));
    final _valueHandle = foobarMapofLongToStringToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarMapofLongToStringReleaseFfiHandleNullable(_valueHandle);
  }
  @override
  SomeInterface? get instanceProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Nullable_instanceProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeSomeinterfaceFromFfiNullable(__resultHandle);
    } finally {
      smokeSomeinterfaceReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  set instanceProperty(SomeInterface? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Nullable_instanceProperty_set__SomeInterface'));
    final _valueHandle = smokeSomeinterfaceToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokeSomeinterfaceReleaseFfiHandleNullable(_valueHandle);
  }
}
Pointer<Void> smokeNullableToFfi(Nullable value) =>
  _smokeNullableCopyHandle((value as __lib.NativeBase).handle);
Nullable smokeNullableFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Nullable) return instance as Nullable;
  final _copiedHandle = _smokeNullableCopyHandle(handle);
  final result = Nullable$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeNullableRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeNullableReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeNullableReleaseHandle(handle);
Pointer<Void> smokeNullableToFfiNullable(Nullable? value) =>
  value != null ? smokeNullableToFfi(value) : Pointer<Void>.fromAddress(0);
Nullable? smokeNullableFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeNullableFromFfi(handle) : null;
void smokeNullableReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeNullableReleaseHandle(handle);
// End of Nullable "private" section.
