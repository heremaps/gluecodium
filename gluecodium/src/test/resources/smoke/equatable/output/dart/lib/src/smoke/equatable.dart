import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
enum SomeEnum {
    foo,
    bar
}
// SomeEnum "private" section, not exported.
int smoke_Equatable_SomeEnum_toFfi(SomeEnum value) {
  switch (value) {
  case SomeEnum.foo:
    return 0;
  break;
  case SomeEnum.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for SomeEnum enum.");
  }
}
SomeEnum smoke_Equatable_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return SomeEnum.foo;
  break;
  case 1:
    return SomeEnum.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for SomeEnum enum.");
  }
}
void smoke_Equatable_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_Equatable_SomeEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Equatable_SomeEnum_create_handle_nullable');
final _smoke_Equatable_SomeEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_SomeEnum_release_handle_nullable');
final _smoke_Equatable_SomeEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_SomeEnum_get_value_nullable');
Pointer<Void> smoke_Equatable_SomeEnum_toFfi_nullable(SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Equatable_SomeEnum_toFfi(value);
  final result = _smoke_Equatable_SomeEnum_create_handle_nullable(_handle);
  smoke_Equatable_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
SomeEnum smoke_Equatable_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Equatable_SomeEnum_get_value_nullable(handle);
  final result = smoke_Equatable_SomeEnum_fromFfi(_handle);
  smoke_Equatable_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Equatable_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Equatable_SomeEnum_release_handle_nullable(handle);
// End of SomeEnum "private" section.
class EquatableStruct {
  bool boolField;
  int intField;
  int longField;
  double floatField;
  double doubleField;
  String stringField;
  NestedEquatableStruct structField;
  SomeEnum enumField;
  List<String> arrayField;
  Map<int, String> mapField;
  EquatableStruct(this.boolField, this.intField, this.longField, this.floatField, this.doubleField, this.stringField, this.structField, this.enumField, this.arrayField, this.mapField);
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EquatableStruct) return false;
    EquatableStruct _other = other;
    return boolField == _other.boolField &&
        intField == _other.intField &&
        longField == _other.longField &&
        floatField == _other.floatField &&
        doubleField == _other.doubleField &&
        stringField == _other.stringField &&
        structField == _other.structField &&
        enumField == _other.enumField &&
        DeepCollectionEquality().equals(arrayField, _other.arrayField) &&
        DeepCollectionEquality().equals(mapField, _other.mapField);
  }
  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + boolField.hashCode;
    result = 31 * result + intField.hashCode;
    result = 31 * result + longField.hashCode;
    result = 31 * result + floatField.hashCode;
    result = 31 * result + doubleField.hashCode;
    result = 31 * result + stringField.hashCode;
    result = 31 * result + structField.hashCode;
    result = 31 * result + enumField.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(arrayField);
    result = 31 * result + DeepCollectionEquality().hash(mapField);
    return result;
  }
}
// EquatableStruct "private" section, not exported.
final _smoke_Equatable_EquatableStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Int32, Int64, Float, Double, Pointer<Void>, Pointer<Void>, Uint32, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, int, int, double, double, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_create_handle');
final _smoke_Equatable_EquatableStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_release_handle');
final _smoke_Equatable_EquatableStruct_get_field_boolField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_boolField');
final _smoke_Equatable_EquatableStruct_get_field_intField = __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_intField');
final _smoke_Equatable_EquatableStruct_get_field_longField = __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_longField');
final _smoke_Equatable_EquatableStruct_get_field_floatField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_floatField');
final _smoke_Equatable_EquatableStruct_get_field_doubleField = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_doubleField');
final _smoke_Equatable_EquatableStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_stringField');
final _smoke_Equatable_EquatableStruct_get_field_structField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_structField');
final _smoke_Equatable_EquatableStruct_get_field_enumField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_enumField');
final _smoke_Equatable_EquatableStruct_get_field_arrayField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_arrayField');
final _smoke_Equatable_EquatableStruct_get_field_mapField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_mapField');
Pointer<Void> smoke_Equatable_EquatableStruct_toFfi(EquatableStruct value) {
  final _boolField_handle = Boolean_toFfi(value.boolField);
  final _intField_handle = (value.intField);
  final _longField_handle = (value.longField);
  final _floatField_handle = (value.floatField);
  final _doubleField_handle = (value.doubleField);
  final _stringField_handle = String_toFfi(value.stringField);
  final _structField_handle = smoke_Equatable_NestedEquatableStruct_toFfi(value.structField);
  final _enumField_handle = smoke_Equatable_SomeEnum_toFfi(value.enumField);
  final _arrayField_handle = ListOf_String_toFfi(value.arrayField);
  final _mapField_handle = MapOf_Int_to_String_toFfi(value.mapField);
  final _result = _smoke_Equatable_EquatableStruct_create_handle(_boolField_handle, _intField_handle, _longField_handle, _floatField_handle, _doubleField_handle, _stringField_handle, _structField_handle, _enumField_handle, _arrayField_handle, _mapField_handle);
  Boolean_releaseFfiHandle(_boolField_handle);
  (_intField_handle);
  (_longField_handle);
  (_floatField_handle);
  (_doubleField_handle);
  String_releaseFfiHandle(_stringField_handle);
  smoke_Equatable_NestedEquatableStruct_releaseFfiHandle(_structField_handle);
  smoke_Equatable_SomeEnum_releaseFfiHandle(_enumField_handle);
  ListOf_String_releaseFfiHandle(_arrayField_handle);
  MapOf_Int_to_String_releaseFfiHandle(_mapField_handle);
  return _result;
}
EquatableStruct smoke_Equatable_EquatableStruct_fromFfi(Pointer<Void> handle) {
  final _boolField_handle = _smoke_Equatable_EquatableStruct_get_field_boolField(handle);
  final _intField_handle = _smoke_Equatable_EquatableStruct_get_field_intField(handle);
  final _longField_handle = _smoke_Equatable_EquatableStruct_get_field_longField(handle);
  final _floatField_handle = _smoke_Equatable_EquatableStruct_get_field_floatField(handle);
  final _doubleField_handle = _smoke_Equatable_EquatableStruct_get_field_doubleField(handle);
  final _stringField_handle = _smoke_Equatable_EquatableStruct_get_field_stringField(handle);
  final _structField_handle = _smoke_Equatable_EquatableStruct_get_field_structField(handle);
  final _enumField_handle = _smoke_Equatable_EquatableStruct_get_field_enumField(handle);
  final _arrayField_handle = _smoke_Equatable_EquatableStruct_get_field_arrayField(handle);
  final _mapField_handle = _smoke_Equatable_EquatableStruct_get_field_mapField(handle);
  try {
    return EquatableStruct(
      Boolean_fromFfi(_boolField_handle),
      (_intField_handle),
      (_longField_handle),
      (_floatField_handle),
      (_doubleField_handle),
      String_fromFfi(_stringField_handle),
      smoke_Equatable_NestedEquatableStruct_fromFfi(_structField_handle),
      smoke_Equatable_SomeEnum_fromFfi(_enumField_handle),
      ListOf_String_fromFfi(_arrayField_handle),
      MapOf_Int_to_String_fromFfi(_mapField_handle)
    );
  } finally {
    Boolean_releaseFfiHandle(_boolField_handle);
    (_intField_handle);
    (_longField_handle);
    (_floatField_handle);
    (_doubleField_handle);
    String_releaseFfiHandle(_stringField_handle);
    smoke_Equatable_NestedEquatableStruct_releaseFfiHandle(_structField_handle);
    smoke_Equatable_SomeEnum_releaseFfiHandle(_enumField_handle);
    ListOf_String_releaseFfiHandle(_arrayField_handle);
    MapOf_Int_to_String_releaseFfiHandle(_mapField_handle);
  }
}
void smoke_Equatable_EquatableStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Equatable_EquatableStruct_release_handle(handle);
// Nullable EquatableStruct
final _smoke_Equatable_EquatableStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_create_handle_nullable');
final _smoke_Equatable_EquatableStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_release_handle_nullable');
final _smoke_Equatable_EquatableStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_value_nullable');
Pointer<Void> smoke_Equatable_EquatableStruct_toFfi_nullable(EquatableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Equatable_EquatableStruct_toFfi(value);
  final result = _smoke_Equatable_EquatableStruct_create_handle_nullable(_handle);
  smoke_Equatable_EquatableStruct_releaseFfiHandle(_handle);
  return result;
}
EquatableStruct smoke_Equatable_EquatableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Equatable_EquatableStruct_get_value_nullable(handle);
  final result = smoke_Equatable_EquatableStruct_fromFfi(_handle);
  smoke_Equatable_EquatableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Equatable_EquatableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Equatable_EquatableStruct_release_handle_nullable(handle);
// End of EquatableStruct "private" section.
class EquatableNullableStruct {
  bool boolField;
  int intField;
  int uintField;
  double floatField;
  String stringField;
  NestedEquatableStruct structField;
  SomeEnum enumField;
  List<String> arrayField;
  Map<int, String> mapField;
  EquatableNullableStruct(this.boolField, this.intField, this.uintField, this.floatField, this.stringField, this.structField, this.enumField, this.arrayField, this.mapField);
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EquatableNullableStruct) return false;
    EquatableNullableStruct _other = other;
    return boolField == _other.boolField &&
        intField == _other.intField &&
        uintField == _other.uintField &&
        floatField == _other.floatField &&
        stringField == _other.stringField &&
        structField == _other.structField &&
        enumField == _other.enumField &&
        DeepCollectionEquality().equals(arrayField, _other.arrayField) &&
        DeepCollectionEquality().equals(mapField, _other.mapField);
  }
  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + boolField.hashCode;
    result = 31 * result + intField.hashCode;
    result = 31 * result + uintField.hashCode;
    result = 31 * result + floatField.hashCode;
    result = 31 * result + stringField.hashCode;
    result = 31 * result + structField.hashCode;
    result = 31 * result + enumField.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(arrayField);
    result = 31 * result + DeepCollectionEquality().hash(mapField);
    return result;
  }
}
// EquatableNullableStruct "private" section, not exported.
final _smoke_Equatable_EquatableNullableStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_create_handle');
final _smoke_Equatable_EquatableNullableStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_release_handle');
final _smoke_Equatable_EquatableNullableStruct_get_field_boolField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_boolField');
final _smoke_Equatable_EquatableNullableStruct_get_field_intField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_intField');
final _smoke_Equatable_EquatableNullableStruct_get_field_uintField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_uintField');
final _smoke_Equatable_EquatableNullableStruct_get_field_floatField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_floatField');
final _smoke_Equatable_EquatableNullableStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_stringField');
final _smoke_Equatable_EquatableNullableStruct_get_field_structField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_structField');
final _smoke_Equatable_EquatableNullableStruct_get_field_enumField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_enumField');
final _smoke_Equatable_EquatableNullableStruct_get_field_arrayField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_arrayField');
final _smoke_Equatable_EquatableNullableStruct_get_field_mapField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_mapField');
Pointer<Void> smoke_Equatable_EquatableNullableStruct_toFfi(EquatableNullableStruct value) {
  final _boolField_handle = Boolean_toFfi_nullable(value.boolField);
  final _intField_handle = Int_toFfi_nullable(value.intField);
  final _uintField_handle = UShort_toFfi_nullable(value.uintField);
  final _floatField_handle = Float_toFfi_nullable(value.floatField);
  final _stringField_handle = String_toFfi_nullable(value.stringField);
  final _structField_handle = smoke_Equatable_NestedEquatableStruct_toFfi_nullable(value.structField);
  final _enumField_handle = smoke_Equatable_SomeEnum_toFfi_nullable(value.enumField);
  final _arrayField_handle = ListOf_String_toFfi_nullable(value.arrayField);
  final _mapField_handle = MapOf_Int_to_String_toFfi_nullable(value.mapField);
  final _result = _smoke_Equatable_EquatableNullableStruct_create_handle(_boolField_handle, _intField_handle, _uintField_handle, _floatField_handle, _stringField_handle, _structField_handle, _enumField_handle, _arrayField_handle, _mapField_handle);
  Boolean_releaseFfiHandle_nullable(_boolField_handle);
  Int_releaseFfiHandle_nullable(_intField_handle);
  UShort_releaseFfiHandle_nullable(_uintField_handle);
  Float_releaseFfiHandle_nullable(_floatField_handle);
  String_releaseFfiHandle_nullable(_stringField_handle);
  smoke_Equatable_NestedEquatableStruct_releaseFfiHandle_nullable(_structField_handle);
  smoke_Equatable_SomeEnum_releaseFfiHandle_nullable(_enumField_handle);
  ListOf_String_releaseFfiHandle_nullable(_arrayField_handle);
  MapOf_Int_to_String_releaseFfiHandle_nullable(_mapField_handle);
  return _result;
}
EquatableNullableStruct smoke_Equatable_EquatableNullableStruct_fromFfi(Pointer<Void> handle) {
  final _boolField_handle = _smoke_Equatable_EquatableNullableStruct_get_field_boolField(handle);
  final _intField_handle = _smoke_Equatable_EquatableNullableStruct_get_field_intField(handle);
  final _uintField_handle = _smoke_Equatable_EquatableNullableStruct_get_field_uintField(handle);
  final _floatField_handle = _smoke_Equatable_EquatableNullableStruct_get_field_floatField(handle);
  final _stringField_handle = _smoke_Equatable_EquatableNullableStruct_get_field_stringField(handle);
  final _structField_handle = _smoke_Equatable_EquatableNullableStruct_get_field_structField(handle);
  final _enumField_handle = _smoke_Equatable_EquatableNullableStruct_get_field_enumField(handle);
  final _arrayField_handle = _smoke_Equatable_EquatableNullableStruct_get_field_arrayField(handle);
  final _mapField_handle = _smoke_Equatable_EquatableNullableStruct_get_field_mapField(handle);
  try {
    return EquatableNullableStruct(
      Boolean_fromFfi_nullable(_boolField_handle),
      Int_fromFfi_nullable(_intField_handle),
      UShort_fromFfi_nullable(_uintField_handle),
      Float_fromFfi_nullable(_floatField_handle),
      String_fromFfi_nullable(_stringField_handle),
      smoke_Equatable_NestedEquatableStruct_fromFfi_nullable(_structField_handle),
      smoke_Equatable_SomeEnum_fromFfi_nullable(_enumField_handle),
      ListOf_String_fromFfi_nullable(_arrayField_handle),
      MapOf_Int_to_String_fromFfi_nullable(_mapField_handle)
    );
  } finally {
    Boolean_releaseFfiHandle_nullable(_boolField_handle);
    Int_releaseFfiHandle_nullable(_intField_handle);
    UShort_releaseFfiHandle_nullable(_uintField_handle);
    Float_releaseFfiHandle_nullable(_floatField_handle);
    String_releaseFfiHandle_nullable(_stringField_handle);
    smoke_Equatable_NestedEquatableStruct_releaseFfiHandle_nullable(_structField_handle);
    smoke_Equatable_SomeEnum_releaseFfiHandle_nullable(_enumField_handle);
    ListOf_String_releaseFfiHandle_nullable(_arrayField_handle);
    MapOf_Int_to_String_releaseFfiHandle_nullable(_mapField_handle);
  }
}
void smoke_Equatable_EquatableNullableStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Equatable_EquatableNullableStruct_release_handle(handle);
// Nullable EquatableNullableStruct
final _smoke_Equatable_EquatableNullableStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_create_handle_nullable');
final _smoke_Equatable_EquatableNullableStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_release_handle_nullable');
final _smoke_Equatable_EquatableNullableStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_value_nullable');
Pointer<Void> smoke_Equatable_EquatableNullableStruct_toFfi_nullable(EquatableNullableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Equatable_EquatableNullableStruct_toFfi(value);
  final result = _smoke_Equatable_EquatableNullableStruct_create_handle_nullable(_handle);
  smoke_Equatable_EquatableNullableStruct_releaseFfiHandle(_handle);
  return result;
}
EquatableNullableStruct smoke_Equatable_EquatableNullableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Equatable_EquatableNullableStruct_get_value_nullable(handle);
  final result = smoke_Equatable_EquatableNullableStruct_fromFfi(_handle);
  smoke_Equatable_EquatableNullableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Equatable_EquatableNullableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Equatable_EquatableNullableStruct_release_handle_nullable(handle);
// End of EquatableNullableStruct "private" section.
class NestedEquatableStruct {
  String fooField;
  NestedEquatableStruct(this.fooField);
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! NestedEquatableStruct) return false;
    NestedEquatableStruct _other = other;
    return fooField == _other.fooField;
  }
  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + fooField.hashCode;
    return result;
  }
}
// NestedEquatableStruct "private" section, not exported.
final _smoke_Equatable_NestedEquatableStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_create_handle');
final _smoke_Equatable_NestedEquatableStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_release_handle');
final _smoke_Equatable_NestedEquatableStruct_get_field_fooField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_get_field_fooField');
Pointer<Void> smoke_Equatable_NestedEquatableStruct_toFfi(NestedEquatableStruct value) {
  final _fooField_handle = String_toFfi(value.fooField);
  final _result = _smoke_Equatable_NestedEquatableStruct_create_handle(_fooField_handle);
  String_releaseFfiHandle(_fooField_handle);
  return _result;
}
NestedEquatableStruct smoke_Equatable_NestedEquatableStruct_fromFfi(Pointer<Void> handle) {
  final _fooField_handle = _smoke_Equatable_NestedEquatableStruct_get_field_fooField(handle);
  try {
    return NestedEquatableStruct(
      String_fromFfi(_fooField_handle)
    );
  } finally {
    String_releaseFfiHandle(_fooField_handle);
  }
}
void smoke_Equatable_NestedEquatableStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Equatable_NestedEquatableStruct_release_handle(handle);
// Nullable NestedEquatableStruct
final _smoke_Equatable_NestedEquatableStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_create_handle_nullable');
final _smoke_Equatable_NestedEquatableStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_release_handle_nullable');
final _smoke_Equatable_NestedEquatableStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_get_value_nullable');
Pointer<Void> smoke_Equatable_NestedEquatableStruct_toFfi_nullable(NestedEquatableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Equatable_NestedEquatableStruct_toFfi(value);
  final result = _smoke_Equatable_NestedEquatableStruct_create_handle_nullable(_handle);
  smoke_Equatable_NestedEquatableStruct_releaseFfiHandle(_handle);
  return result;
}
NestedEquatableStruct smoke_Equatable_NestedEquatableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Equatable_NestedEquatableStruct_get_value_nullable(handle);
  final result = smoke_Equatable_NestedEquatableStruct_fromFfi(_handle);
  smoke_Equatable_NestedEquatableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Equatable_NestedEquatableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Equatable_NestedEquatableStruct_release_handle_nullable(handle);
// End of NestedEquatableStruct "private" section.
