import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/smoke/SomeInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class Nullable {
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
final _smoke_Nullable_SomeEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Nullable_SomeEnum_create_handle_nullable');
final _smoke_Nullable_SomeEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeEnum_release_handle_nullable');
final _smoke_Nullable_SomeEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeEnum_get_value_nullable');
Pointer<Void> smoke_Nullable_SomeEnum_toFfi_nullable(Nullable_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Nullable_SomeEnum_toFfi(value);
  final result = _smoke_Nullable_SomeEnum_create_handle_nullable(_handle);
  smoke_Nullable_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
Nullable_SomeEnum smoke_Nullable_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Nullable_SomeEnum_get_value_nullable(handle);
  final result = smoke_Nullable_SomeEnum_fromFfi(_handle);
  smoke_Nullable_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Nullable_SomeEnum_release_handle_nullable(handle);
// End of Nullable_SomeEnum "private" section.
class Nullable_SomeStruct {
  String stringField;
  Nullable_SomeStruct(this.stringField);
}
// Nullable_SomeStruct "private" section, not exported.
final _smoke_Nullable_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_create_handle');
final _smoke_Nullable_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_release_handle');
final _smoke_Nullable_SomeStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_get_field_stringField');
Pointer<Void> smoke_Nullable_SomeStruct_toFfi(Nullable_SomeStruct value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _result = _smoke_Nullable_SomeStruct_create_handle(_stringField_handle);
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
Nullable_SomeStruct smoke_Nullable_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_Nullable_SomeStruct_get_field_stringField(handle);
  final _result = Nullable_SomeStruct(
    String_fromFfi(_stringField_handle)
  );
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
void smoke_Nullable_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Nullable_SomeStruct_release_handle(handle);
// Nullable Nullable_SomeStruct
final _smoke_Nullable_SomeStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_create_handle_nullable');
final _smoke_Nullable_SomeStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_release_handle_nullable');
final _smoke_Nullable_SomeStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_SomeStruct_get_value_nullable');
Pointer<Void> smoke_Nullable_SomeStruct_toFfi_nullable(Nullable_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Nullable_SomeStruct_toFfi(value);
  final result = _smoke_Nullable_SomeStruct_create_handle_nullable(_handle);
  smoke_Nullable_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
Nullable_SomeStruct smoke_Nullable_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Nullable_SomeStruct_get_value_nullable(handle);
  final result = smoke_Nullable_SomeStruct_fromFfi(_handle);
  smoke_Nullable_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Nullable_SomeStruct_release_handle_nullable(handle);
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
final _smoke_Nullable_NullableStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_create_handle');
final _smoke_Nullable_NullableStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_release_handle');
final _smoke_Nullable_NullableStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_stringField');
final _smoke_Nullable_NullableStruct_get_field_boolField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_boolField');
final _smoke_Nullable_NullableStruct_get_field_doubleField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_doubleField');
final _smoke_Nullable_NullableStruct_get_field_structField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_structField');
final _smoke_Nullable_NullableStruct_get_field_enumField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_enumField');
final _smoke_Nullable_NullableStruct_get_field_arrayField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_arrayField');
final _smoke_Nullable_NullableStruct_get_field_inlineArrayField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_inlineArrayField');
final _smoke_Nullable_NullableStruct_get_field_mapField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_mapField');
final _smoke_Nullable_NullableStruct_get_field_instanceField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_field_instanceField');
Pointer<Void> smoke_Nullable_NullableStruct_toFfi(Nullable_NullableStruct value) {
  final _stringField_handle = String_toFfi_nullable(value.stringField);
  final _boolField_handle = Boolean_toFfi_nullable(value.boolField);
  final _doubleField_handle = Double_toFfi_nullable(value.doubleField);
  final _structField_handle = smoke_Nullable_SomeStruct_toFfi_nullable(value.structField);
  final _enumField_handle = smoke_Nullable_SomeEnum_toFfi_nullable(value.enumField);
  final _arrayField_handle = ListOf_String_toFfi_nullable(value.arrayField);
  final _inlineArrayField_handle = ListOf_String_toFfi_nullable(value.inlineArrayField);
  final _mapField_handle = MapOf_Long_to_String_toFfi_nullable(value.mapField);
  final _instanceField_handle = smoke_SomeInterface_toFfi_nullable(value.instanceField);
  final _result = _smoke_Nullable_NullableStruct_create_handle(_stringField_handle, _boolField_handle, _doubleField_handle, _structField_handle, _enumField_handle, _arrayField_handle, _inlineArrayField_handle, _mapField_handle, _instanceField_handle);
  String_releaseFfiHandle_nullable(_stringField_handle);
  Boolean_releaseFfiHandle_nullable(_boolField_handle);
  Double_releaseFfiHandle_nullable(_doubleField_handle);
  smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_structField_handle);
  smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(_enumField_handle);
  ListOf_String_releaseFfiHandle_nullable(_arrayField_handle);
  ListOf_String_releaseFfiHandle_nullable(_inlineArrayField_handle);
  MapOf_Long_to_String_releaseFfiHandle_nullable(_mapField_handle);
  smoke_SomeInterface_releaseFfiHandle_nullable(_instanceField_handle);
  return _result;
}
Nullable_NullableStruct smoke_Nullable_NullableStruct_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_Nullable_NullableStruct_get_field_stringField(handle);
  final _boolField_handle = _smoke_Nullable_NullableStruct_get_field_boolField(handle);
  final _doubleField_handle = _smoke_Nullable_NullableStruct_get_field_doubleField(handle);
  final _structField_handle = _smoke_Nullable_NullableStruct_get_field_structField(handle);
  final _enumField_handle = _smoke_Nullable_NullableStruct_get_field_enumField(handle);
  final _arrayField_handle = _smoke_Nullable_NullableStruct_get_field_arrayField(handle);
  final _inlineArrayField_handle = _smoke_Nullable_NullableStruct_get_field_inlineArrayField(handle);
  final _mapField_handle = _smoke_Nullable_NullableStruct_get_field_mapField(handle);
  final _instanceField_handle = _smoke_Nullable_NullableStruct_get_field_instanceField(handle);
  final _result = Nullable_NullableStruct(
    String_fromFfi_nullable(_stringField_handle),
    Boolean_fromFfi_nullable(_boolField_handle),
    Double_fromFfi_nullable(_doubleField_handle),
    smoke_Nullable_SomeStruct_fromFfi_nullable(_structField_handle),
    smoke_Nullable_SomeEnum_fromFfi_nullable(_enumField_handle),
    ListOf_String_fromFfi_nullable(_arrayField_handle),
    ListOf_String_fromFfi_nullable(_inlineArrayField_handle),
    MapOf_Long_to_String_fromFfi_nullable(_mapField_handle),
    smoke_SomeInterface_fromFfi_nullable(_instanceField_handle)
  );
  String_releaseFfiHandle_nullable(_stringField_handle);
  Boolean_releaseFfiHandle_nullable(_boolField_handle);
  Double_releaseFfiHandle_nullable(_doubleField_handle);
  smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_structField_handle);
  smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(_enumField_handle);
  ListOf_String_releaseFfiHandle_nullable(_arrayField_handle);
  ListOf_String_releaseFfiHandle_nullable(_inlineArrayField_handle);
  MapOf_Long_to_String_releaseFfiHandle_nullable(_mapField_handle);
  smoke_SomeInterface_releaseFfiHandle_nullable(_instanceField_handle);
  return _result;
}
void smoke_Nullable_NullableStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Nullable_NullableStruct_release_handle(handle);
// Nullable Nullable_NullableStruct
final _smoke_Nullable_NullableStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_create_handle_nullable');
final _smoke_Nullable_NullableStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_release_handle_nullable');
final _smoke_Nullable_NullableStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableStruct_get_value_nullable');
Pointer<Void> smoke_Nullable_NullableStruct_toFfi_nullable(Nullable_NullableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Nullable_NullableStruct_toFfi(value);
  final result = _smoke_Nullable_NullableStruct_create_handle_nullable(_handle);
  smoke_Nullable_NullableStruct_releaseFfiHandle(_handle);
  return result;
}
Nullable_NullableStruct smoke_Nullable_NullableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Nullable_NullableStruct_get_value_nullable(handle);
  final result = smoke_Nullable_NullableStruct_fromFfi(_handle);
  smoke_Nullable_NullableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Nullable_NullableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Nullable_NullableStruct_release_handle_nullable(handle);
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
final _smoke_Nullable_NullableIntsStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_create_handle');
final _smoke_Nullable_NullableIntsStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_release_handle');
final _smoke_Nullable_NullableIntsStruct_get_field_int8Field = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_int8Field');
final _smoke_Nullable_NullableIntsStruct_get_field_int16Field = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_int16Field');
final _smoke_Nullable_NullableIntsStruct_get_field_int32Field = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_int32Field');
final _smoke_Nullable_NullableIntsStruct_get_field_int64Field = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_int64Field');
final _smoke_Nullable_NullableIntsStruct_get_field_uint8Field = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_uint8Field');
final _smoke_Nullable_NullableIntsStruct_get_field_uint16Field = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_uint16Field');
final _smoke_Nullable_NullableIntsStruct_get_field_uint32Field = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_uint32Field');
final _smoke_Nullable_NullableIntsStruct_get_field_uint64Field = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_field_uint64Field');
Pointer<Void> smoke_Nullable_NullableIntsStruct_toFfi(Nullable_NullableIntsStruct value) {
  final _int8Field_handle = Byte_toFfi_nullable(value.int8Field);
  final _int16Field_handle = Short_toFfi_nullable(value.int16Field);
  final _int32Field_handle = Int_toFfi_nullable(value.int32Field);
  final _int64Field_handle = Long_toFfi_nullable(value.int64Field);
  final _uint8Field_handle = UByte_toFfi_nullable(value.uint8Field);
  final _uint16Field_handle = UShort_toFfi_nullable(value.uint16Field);
  final _uint32Field_handle = UInt_toFfi_nullable(value.uint32Field);
  final _uint64Field_handle = ULong_toFfi_nullable(value.uint64Field);
  final _result = _smoke_Nullable_NullableIntsStruct_create_handle(_int8Field_handle, _int16Field_handle, _int32Field_handle, _int64Field_handle, _uint8Field_handle, _uint16Field_handle, _uint32Field_handle, _uint64Field_handle);
  Byte_releaseFfiHandle_nullable(_int8Field_handle);
  Short_releaseFfiHandle_nullable(_int16Field_handle);
  Int_releaseFfiHandle_nullable(_int32Field_handle);
  Long_releaseFfiHandle_nullable(_int64Field_handle);
  UByte_releaseFfiHandle_nullable(_uint8Field_handle);
  UShort_releaseFfiHandle_nullable(_uint16Field_handle);
  UInt_releaseFfiHandle_nullable(_uint32Field_handle);
  ULong_releaseFfiHandle_nullable(_uint64Field_handle);
  return _result;
}
Nullable_NullableIntsStruct smoke_Nullable_NullableIntsStruct_fromFfi(Pointer<Void> handle) {
  final _int8Field_handle = _smoke_Nullable_NullableIntsStruct_get_field_int8Field(handle);
  final _int16Field_handle = _smoke_Nullable_NullableIntsStruct_get_field_int16Field(handle);
  final _int32Field_handle = _smoke_Nullable_NullableIntsStruct_get_field_int32Field(handle);
  final _int64Field_handle = _smoke_Nullable_NullableIntsStruct_get_field_int64Field(handle);
  final _uint8Field_handle = _smoke_Nullable_NullableIntsStruct_get_field_uint8Field(handle);
  final _uint16Field_handle = _smoke_Nullable_NullableIntsStruct_get_field_uint16Field(handle);
  final _uint32Field_handle = _smoke_Nullable_NullableIntsStruct_get_field_uint32Field(handle);
  final _uint64Field_handle = _smoke_Nullable_NullableIntsStruct_get_field_uint64Field(handle);
  final _result = Nullable_NullableIntsStruct(
    Byte_fromFfi_nullable(_int8Field_handle),
    Short_fromFfi_nullable(_int16Field_handle),
    Int_fromFfi_nullable(_int32Field_handle),
    Long_fromFfi_nullable(_int64Field_handle),
    UByte_fromFfi_nullable(_uint8Field_handle),
    UShort_fromFfi_nullable(_uint16Field_handle),
    UInt_fromFfi_nullable(_uint32Field_handle),
    ULong_fromFfi_nullable(_uint64Field_handle)
  );
  Byte_releaseFfiHandle_nullable(_int8Field_handle);
  Short_releaseFfiHandle_nullable(_int16Field_handle);
  Int_releaseFfiHandle_nullable(_int32Field_handle);
  Long_releaseFfiHandle_nullable(_int64Field_handle);
  UByte_releaseFfiHandle_nullable(_uint8Field_handle);
  UShort_releaseFfiHandle_nullable(_uint16Field_handle);
  UInt_releaseFfiHandle_nullable(_uint32Field_handle);
  ULong_releaseFfiHandle_nullable(_uint64Field_handle);
  return _result;
}
void smoke_Nullable_NullableIntsStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Nullable_NullableIntsStruct_release_handle(handle);
// Nullable Nullable_NullableIntsStruct
final _smoke_Nullable_NullableIntsStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_create_handle_nullable');
final _smoke_Nullable_NullableIntsStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_release_handle_nullable');
final _smoke_Nullable_NullableIntsStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_NullableIntsStruct_get_value_nullable');
Pointer<Void> smoke_Nullable_NullableIntsStruct_toFfi_nullable(Nullable_NullableIntsStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Nullable_NullableIntsStruct_toFfi(value);
  final result = _smoke_Nullable_NullableIntsStruct_create_handle_nullable(_handle);
  smoke_Nullable_NullableIntsStruct_releaseFfiHandle(_handle);
  return result;
}
Nullable_NullableIntsStruct smoke_Nullable_NullableIntsStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Nullable_NullableIntsStruct_get_value_nullable(handle);
  final result = smoke_Nullable_NullableIntsStruct_fromFfi(_handle);
  smoke_Nullable_NullableIntsStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Nullable_NullableIntsStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Nullable_NullableIntsStruct_release_handle_nullable(handle);
// End of Nullable_NullableIntsStruct "private" section.
// Nullable "private" section, not exported.
final _smoke_Nullable_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Nullable_copy_handle');
final _smoke_Nullable_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Nullable_release_handle');
class Nullable$Impl implements Nullable {
  final Pointer<Void> handle;
  Nullable$Impl(this.handle);
  @override
  void release() => _smoke_Nullable_release_handle(handle);
  @override
  String methodWithString(String input) {
    final _methodWithString_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_methodWithString__String');
    final _input_handle = String_toFfi_nullable(input);
    final _handle = this.handle;
    final __result_handle = _methodWithString_ffi(_handle, _input_handle);
    String_releaseFfiHandle_nullable(_input_handle);
    final _result = String_fromFfi_nullable(__result_handle);
    String_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  bool methodWithBoolean(bool input) {
    final _methodWithBoolean_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_methodWithBoolean__Boolean');
    final _input_handle = Boolean_toFfi_nullable(input);
    final _handle = this.handle;
    final __result_handle = _methodWithBoolean_ffi(_handle, _input_handle);
    Boolean_releaseFfiHandle_nullable(_input_handle);
    final _result = Boolean_fromFfi_nullable(__result_handle);
    Boolean_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  double methodWithDouble(double input) {
    final _methodWithDouble_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_methodWithDouble__Double');
    final _input_handle = Double_toFfi_nullable(input);
    final _handle = this.handle;
    final __result_handle = _methodWithDouble_ffi(_handle, _input_handle);
    Double_releaseFfiHandle_nullable(_input_handle);
    final _result = Double_fromFfi_nullable(__result_handle);
    Double_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  int methodWithInt(int input) {
    final _methodWithInt_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_methodWithInt__Long');
    final _input_handle = Long_toFfi_nullable(input);
    final _handle = this.handle;
    final __result_handle = _methodWithInt_ffi(_handle, _input_handle);
    Long_releaseFfiHandle_nullable(_input_handle);
    final _result = Long_fromFfi_nullable(__result_handle);
    Long_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  Nullable_SomeStruct methodWithSomeStruct(Nullable_SomeStruct input) {
    final _methodWithSomeStruct_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeStruct__SomeStruct');
    final _input_handle = smoke_Nullable_SomeStruct_toFfi_nullable(input);
    final _handle = this.handle;
    final __result_handle = _methodWithSomeStruct_ffi(_handle, _input_handle);
    smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_input_handle);
    final _result = smoke_Nullable_SomeStruct_fromFfi_nullable(__result_handle);
    smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  Nullable_SomeEnum methodWithSomeEnum(Nullable_SomeEnum input) {
    final _methodWithSomeEnum_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeEnum__SomeEnum');
    final _input_handle = smoke_Nullable_SomeEnum_toFfi_nullable(input);
    final _handle = this.handle;
    final __result_handle = _methodWithSomeEnum_ffi(_handle, _input_handle);
    smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(_input_handle);
    final _result = smoke_Nullable_SomeEnum_fromFfi_nullable(__result_handle);
    smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  List<String> methodWithSomeArray(List<String> input) {
    final _methodWithSomeArray_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeArray__ListOf_1String');
    final _input_handle = ListOf_String_toFfi_nullable(input);
    final _handle = this.handle;
    final __result_handle = _methodWithSomeArray_ffi(_handle, _input_handle);
    ListOf_String_releaseFfiHandle_nullable(_input_handle);
    final _result = ListOf_String_fromFfi_nullable(__result_handle);
    ListOf_String_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  List<String> methodWithInlineArray(List<String> input) {
    final _methodWithInlineArray_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_methodWithInlineArray__ListOf_1String');
    final _input_handle = ListOf_String_toFfi_nullable(input);
    final _handle = this.handle;
    final __result_handle = _methodWithInlineArray_ffi(_handle, _input_handle);
    ListOf_String_releaseFfiHandle_nullable(_input_handle);
    final _result = ListOf_String_fromFfi_nullable(__result_handle);
    ListOf_String_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  Map<int, String> methodWithSomeMap(Map<int, String> input) {
    final _methodWithSomeMap_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_methodWithSomeMap__MapOf_1Long_1to_1String');
    final _input_handle = MapOf_Long_to_String_toFfi_nullable(input);
    final _handle = this.handle;
    final __result_handle = _methodWithSomeMap_ffi(_handle, _input_handle);
    MapOf_Long_to_String_releaseFfiHandle_nullable(_input_handle);
    final _result = MapOf_Long_to_String_fromFfi_nullable(__result_handle);
    MapOf_Long_to_String_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  SomeInterface methodWithInstance(SomeInterface input) {
    final _methodWithInstance_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_methodWithInstance__SomeInterface');
    final _input_handle = smoke_SomeInterface_toFfi_nullable(input);
    final _handle = this.handle;
    final __result_handle = _methodWithInstance_ffi(_handle, _input_handle);
    smoke_SomeInterface_releaseFfiHandle_nullable(_input_handle);
    final _result = smoke_SomeInterface_fromFfi_nullable(__result_handle);
    smoke_SomeInterface_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  String get stringProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Nullable_stringProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle);
    final _result = String_fromFfi_nullable(__result_handle);
    String_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  set stringProperty(String value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_stringProperty_set__String');
    final _value_handle = String_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, _value_handle);
    String_releaseFfiHandle_nullable(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  bool get isBoolProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Nullable_isBoolProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle);
    final _result = Boolean_fromFfi_nullable(__result_handle);
    Boolean_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  set isBoolProperty(bool value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_isBoolProperty_set__Boolean');
    final _value_handle = Boolean_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, _value_handle);
    Boolean_releaseFfiHandle_nullable(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  double get doubleProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Nullable_doubleProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle);
    final _result = Double_fromFfi_nullable(__result_handle);
    Double_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  set doubleProperty(double value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_doubleProperty_set__Double');
    final _value_handle = Double_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, _value_handle);
    Double_releaseFfiHandle_nullable(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  int get intProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Nullable_intProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle);
    final _result = Long_fromFfi_nullable(__result_handle);
    Long_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  set intProperty(int value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_intProperty_set__Long');
    final _value_handle = Long_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, _value_handle);
    Long_releaseFfiHandle_nullable(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  Nullable_SomeStruct get structProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Nullable_structProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle);
    final _result = smoke_Nullable_SomeStruct_fromFfi_nullable(__result_handle);
    smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  set structProperty(Nullable_SomeStruct value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_structProperty_set__SomeStruct');
    final _value_handle = smoke_Nullable_SomeStruct_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, _value_handle);
    smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  Nullable_SomeEnum get enumProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Nullable_enumProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle);
    final _result = smoke_Nullable_SomeEnum_fromFfi_nullable(__result_handle);
    smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  set enumProperty(Nullable_SomeEnum value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_enumProperty_set__SomeEnum');
    final _value_handle = smoke_Nullable_SomeEnum_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, _value_handle);
    smoke_Nullable_SomeEnum_releaseFfiHandle_nullable(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  List<String> get arrayProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Nullable_arrayProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle);
    final _result = ListOf_String_fromFfi_nullable(__result_handle);
    ListOf_String_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  set arrayProperty(List<String> value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_arrayProperty_set__ListOf_1String');
    final _value_handle = ListOf_String_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, _value_handle);
    ListOf_String_releaseFfiHandle_nullable(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  List<String> get inlineArrayProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Nullable_inlineArrayProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle);
    final _result = ListOf_String_fromFfi_nullable(__result_handle);
    ListOf_String_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  set inlineArrayProperty(List<String> value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_inlineArrayProperty_set__ListOf_1String');
    final _value_handle = ListOf_String_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, _value_handle);
    ListOf_String_releaseFfiHandle_nullable(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  Map<int, String> get mapProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Nullable_mapProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle);
    final _result = MapOf_Long_to_String_fromFfi_nullable(__result_handle);
    MapOf_Long_to_String_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  set mapProperty(Map<int, String> value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_mapProperty_set__MapOf_1Long_1to_1String');
    final _value_handle = MapOf_Long_to_String_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, _value_handle);
    MapOf_Long_to_String_releaseFfiHandle_nullable(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  SomeInterface get instanceProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Nullable_instanceProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle);
    final _result = smoke_SomeInterface_fromFfi_nullable(__result_handle);
    smoke_SomeInterface_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
  @override
  set instanceProperty(SomeInterface value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Nullable_instanceProperty_set__SomeInterface');
    final _value_handle = smoke_SomeInterface_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, _value_handle);
    smoke_SomeInterface_releaseFfiHandle_nullable(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_Nullable_toFfi(Nullable value) =>
  _smoke_Nullable_copy_handle((value as Nullable$Impl).handle);
Nullable smoke_Nullable_fromFfi(Pointer<Void> handle) =>
  Nullable$Impl(_smoke_Nullable_copy_handle(handle));
void smoke_Nullable_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Nullable_release_handle(handle);
Pointer<Void> smoke_Nullable_toFfi_nullable(Nullable value) =>
  value != null ? smoke_Nullable_toFfi(value) : Pointer<Void>.fromAddress(0);
Nullable smoke_Nullable_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Nullable_fromFfi(handle) : null;
void smoke_Nullable_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Nullable_release_handle(handle);
// End of Nullable "private" section.
