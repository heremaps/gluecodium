import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
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
final _smoke_Equatable_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Equatable_SomeEnum_create_handle_nullable'));
final _smoke_Equatable_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_SomeEnum_release_handle_nullable'));
final _smoke_Equatable_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_Equatable_SomeEnum_toFfi_nullable(SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Equatable_SomeEnum_toFfi(value);
  final result = _smoke_Equatable_SomeEnumCreateHandleNullable(_handle);
  smoke_Equatable_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
SomeEnum smoke_Equatable_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Equatable_SomeEnumGetValueNullable(handle);
  final result = smoke_Equatable_SomeEnum_fromFfi(_handle);
  smoke_Equatable_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Equatable_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Equatable_SomeEnumReleaseHandleNullable(handle);
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
final _smokeEquatableEquatablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Int32, Int64, Float, Double, Pointer<Void>, Pointer<Void>, Uint32, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, int, int, double, double, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_create_handle'));
final _smokeEquatableEquatablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_release_handle'));
final _smokeEquatableEquatablestructGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_boolField'));
final _smokeEquatableEquatablestructGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_intField'));
final _smokeEquatableEquatablestructGetFieldlongField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_longField'));
final _smokeEquatableEquatablestructGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_floatField'));
final _smokeEquatableEquatablestructGetFielddoubleField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_doubleField'));
final _smokeEquatableEquatablestructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_stringField'));
final _smokeEquatableEquatablestructGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_structField'));
final _smokeEquatableEquatablestructGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_enumField'));
final _smokeEquatableEquatablestructGetFieldarrayField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_arrayField'));
final _smokeEquatableEquatablestructGetFieldmapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_mapField'));
Pointer<Void> smoke_Equatable_EquatableStruct_toFfi(EquatableStruct value) {
  final _boolFieldHandle = Boolean_toFfi(value.boolField);
  final _intFieldHandle = (value.intField);
  final _longFieldHandle = (value.longField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _structFieldHandle = smoke_Equatable_NestedEquatableStruct_toFfi(value.structField);
  final _enumFieldHandle = smoke_Equatable_SomeEnum_toFfi(value.enumField);
  final _arrayFieldHandle = foobar_ListOf_String_toFfi(value.arrayField);
  final _mapFieldHandle = foobar_MapOf_Int_to_String_toFfi(value.mapField);
  final _result = _smokeEquatableEquatablestructCreateHandle(_boolFieldHandle, _intFieldHandle, _longFieldHandle, _floatFieldHandle, _doubleFieldHandle, _stringFieldHandle, _structFieldHandle, _enumFieldHandle, _arrayFieldHandle, _mapFieldHandle);
  Boolean_releaseFfiHandle(_boolFieldHandle);
  (_intFieldHandle);
  (_longFieldHandle);
  (_floatFieldHandle);
  (_doubleFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  smoke_Equatable_NestedEquatableStruct_releaseFfiHandle(_structFieldHandle);
  smoke_Equatable_SomeEnum_releaseFfiHandle(_enumFieldHandle);
  foobar_ListOf_String_releaseFfiHandle(_arrayFieldHandle);
  foobar_MapOf_Int_to_String_releaseFfiHandle(_mapFieldHandle);
  return _result;
}
EquatableStruct smoke_Equatable_EquatableStruct_fromFfi(Pointer<Void> handle) {
  final _boolFieldHandle = _smokeEquatableEquatablestructGetFieldboolField(handle);
  final _intFieldHandle = _smokeEquatableEquatablestructGetFieldintField(handle);
  final _longFieldHandle = _smokeEquatableEquatablestructGetFieldlongField(handle);
  final _floatFieldHandle = _smokeEquatableEquatablestructGetFieldfloatField(handle);
  final _doubleFieldHandle = _smokeEquatableEquatablestructGetFielddoubleField(handle);
  final _stringFieldHandle = _smokeEquatableEquatablestructGetFieldstringField(handle);
  final _structFieldHandle = _smokeEquatableEquatablestructGetFieldstructField(handle);
  final _enumFieldHandle = _smokeEquatableEquatablestructGetFieldenumField(handle);
  final _arrayFieldHandle = _smokeEquatableEquatablestructGetFieldarrayField(handle);
  final _mapFieldHandle = _smokeEquatableEquatablestructGetFieldmapField(handle);
  try {
    return EquatableStruct(
      Boolean_fromFfi(_boolFieldHandle),
      (_intFieldHandle),
      (_longFieldHandle),
      (_floatFieldHandle),
      (_doubleFieldHandle),
      String_fromFfi(_stringFieldHandle),
      smoke_Equatable_NestedEquatableStruct_fromFfi(_structFieldHandle),
      smoke_Equatable_SomeEnum_fromFfi(_enumFieldHandle),
      foobar_ListOf_String_fromFfi(_arrayFieldHandle),
      foobar_MapOf_Int_to_String_fromFfi(_mapFieldHandle)
    );
  } finally {
    Boolean_releaseFfiHandle(_boolFieldHandle);
    (_intFieldHandle);
    (_longFieldHandle);
    (_floatFieldHandle);
    (_doubleFieldHandle);
    String_releaseFfiHandle(_stringFieldHandle);
    smoke_Equatable_NestedEquatableStruct_releaseFfiHandle(_structFieldHandle);
    smoke_Equatable_SomeEnum_releaseFfiHandle(_enumFieldHandle);
    foobar_ListOf_String_releaseFfiHandle(_arrayFieldHandle);
    foobar_MapOf_Int_to_String_releaseFfiHandle(_mapFieldHandle);
  }
}
void smoke_Equatable_EquatableStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeEquatableEquatablestructReleaseHandle(handle);
// Nullable EquatableStruct
final _smoke_Equatable_EquatableStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_create_handle_nullable'));
final _smoke_Equatable_EquatableStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_release_handle_nullable'));
final _smoke_Equatable_EquatableStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_value_nullable'));
Pointer<Void> smoke_Equatable_EquatableStruct_toFfi_nullable(EquatableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Equatable_EquatableStruct_toFfi(value);
  final result = _smoke_Equatable_EquatableStructCreateHandleNullable(_handle);
  smoke_Equatable_EquatableStruct_releaseFfiHandle(_handle);
  return result;
}
EquatableStruct smoke_Equatable_EquatableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Equatable_EquatableStructGetValueNullable(handle);
  final result = smoke_Equatable_EquatableStruct_fromFfi(_handle);
  smoke_Equatable_EquatableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Equatable_EquatableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Equatable_EquatableStructReleaseHandleNullable(handle);
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
final _smokeEquatableEquatablenullablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_create_handle'));
final _smokeEquatableEquatablenullablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_release_handle'));
final _smokeEquatableEquatablenullablestructGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_boolField'));
final _smokeEquatableEquatablenullablestructGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_intField'));
final _smokeEquatableEquatablenullablestructGetFielduintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_uintField'));
final _smokeEquatableEquatablenullablestructGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_floatField'));
final _smokeEquatableEquatablenullablestructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_stringField'));
final _smokeEquatableEquatablenullablestructGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_structField'));
final _smokeEquatableEquatablenullablestructGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_enumField'));
final _smokeEquatableEquatablenullablestructGetFieldarrayField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_arrayField'));
final _smokeEquatableEquatablenullablestructGetFieldmapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_mapField'));
Pointer<Void> smoke_Equatable_EquatableNullableStruct_toFfi(EquatableNullableStruct value) {
  final _boolFieldHandle = Boolean_toFfi_nullable(value.boolField);
  final _intFieldHandle = Int_toFfi_nullable(value.intField);
  final _uintFieldHandle = UShort_toFfi_nullable(value.uintField);
  final _floatFieldHandle = Float_toFfi_nullable(value.floatField);
  final _stringFieldHandle = String_toFfi_nullable(value.stringField);
  final _structFieldHandle = smoke_Equatable_NestedEquatableStruct_toFfi_nullable(value.structField);
  final _enumFieldHandle = smoke_Equatable_SomeEnum_toFfi_nullable(value.enumField);
  final _arrayFieldHandle = foobar_ListOf_String_toFfi_nullable(value.arrayField);
  final _mapFieldHandle = foobar_MapOf_Int_to_String_toFfi_nullable(value.mapField);
  final _result = _smokeEquatableEquatablenullablestructCreateHandle(_boolFieldHandle, _intFieldHandle, _uintFieldHandle, _floatFieldHandle, _stringFieldHandle, _structFieldHandle, _enumFieldHandle, _arrayFieldHandle, _mapFieldHandle);
  Boolean_releaseFfiHandle_nullable(_boolFieldHandle);
  Int_releaseFfiHandle_nullable(_intFieldHandle);
  UShort_releaseFfiHandle_nullable(_uintFieldHandle);
  Float_releaseFfiHandle_nullable(_floatFieldHandle);
  String_releaseFfiHandle_nullable(_stringFieldHandle);
  smoke_Equatable_NestedEquatableStruct_releaseFfiHandle_nullable(_structFieldHandle);
  smoke_Equatable_SomeEnum_releaseFfiHandle_nullable(_enumFieldHandle);
  foobar_ListOf_String_releaseFfiHandle_nullable(_arrayFieldHandle);
  foobar_MapOf_Int_to_String_releaseFfiHandle_nullable(_mapFieldHandle);
  return _result;
}
EquatableNullableStruct smoke_Equatable_EquatableNullableStruct_fromFfi(Pointer<Void> handle) {
  final _boolFieldHandle = _smokeEquatableEquatablenullablestructGetFieldboolField(handle);
  final _intFieldHandle = _smokeEquatableEquatablenullablestructGetFieldintField(handle);
  final _uintFieldHandle = _smokeEquatableEquatablenullablestructGetFielduintField(handle);
  final _floatFieldHandle = _smokeEquatableEquatablenullablestructGetFieldfloatField(handle);
  final _stringFieldHandle = _smokeEquatableEquatablenullablestructGetFieldstringField(handle);
  final _structFieldHandle = _smokeEquatableEquatablenullablestructGetFieldstructField(handle);
  final _enumFieldHandle = _smokeEquatableEquatablenullablestructGetFieldenumField(handle);
  final _arrayFieldHandle = _smokeEquatableEquatablenullablestructGetFieldarrayField(handle);
  final _mapFieldHandle = _smokeEquatableEquatablenullablestructGetFieldmapField(handle);
  try {
    return EquatableNullableStruct(
      Boolean_fromFfi_nullable(_boolFieldHandle),
      Int_fromFfi_nullable(_intFieldHandle),
      UShort_fromFfi_nullable(_uintFieldHandle),
      Float_fromFfi_nullable(_floatFieldHandle),
      String_fromFfi_nullable(_stringFieldHandle),
      smoke_Equatable_NestedEquatableStruct_fromFfi_nullable(_structFieldHandle),
      smoke_Equatable_SomeEnum_fromFfi_nullable(_enumFieldHandle),
      foobar_ListOf_String_fromFfi_nullable(_arrayFieldHandle),
      foobar_MapOf_Int_to_String_fromFfi_nullable(_mapFieldHandle)
    );
  } finally {
    Boolean_releaseFfiHandle_nullable(_boolFieldHandle);
    Int_releaseFfiHandle_nullable(_intFieldHandle);
    UShort_releaseFfiHandle_nullable(_uintFieldHandle);
    Float_releaseFfiHandle_nullable(_floatFieldHandle);
    String_releaseFfiHandle_nullable(_stringFieldHandle);
    smoke_Equatable_NestedEquatableStruct_releaseFfiHandle_nullable(_structFieldHandle);
    smoke_Equatable_SomeEnum_releaseFfiHandle_nullable(_enumFieldHandle);
    foobar_ListOf_String_releaseFfiHandle_nullable(_arrayFieldHandle);
    foobar_MapOf_Int_to_String_releaseFfiHandle_nullable(_mapFieldHandle);
  }
}
void smoke_Equatable_EquatableNullableStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeEquatableEquatablenullablestructReleaseHandle(handle);
// Nullable EquatableNullableStruct
final _smoke_Equatable_EquatableNullableStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_create_handle_nullable'));
final _smoke_Equatable_EquatableNullableStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_release_handle_nullable'));
final _smoke_Equatable_EquatableNullableStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_value_nullable'));
Pointer<Void> smoke_Equatable_EquatableNullableStruct_toFfi_nullable(EquatableNullableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Equatable_EquatableNullableStruct_toFfi(value);
  final result = _smoke_Equatable_EquatableNullableStructCreateHandleNullable(_handle);
  smoke_Equatable_EquatableNullableStruct_releaseFfiHandle(_handle);
  return result;
}
EquatableNullableStruct smoke_Equatable_EquatableNullableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Equatable_EquatableNullableStructGetValueNullable(handle);
  final result = smoke_Equatable_EquatableNullableStruct_fromFfi(_handle);
  smoke_Equatable_EquatableNullableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Equatable_EquatableNullableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Equatable_EquatableNullableStructReleaseHandleNullable(handle);
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
final _smokeEquatableNestedequatablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_create_handle'));
final _smokeEquatableNestedequatablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_release_handle'));
final _smokeEquatableNestedequatablestructGetFieldfooField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_get_field_fooField'));
Pointer<Void> smoke_Equatable_NestedEquatableStruct_toFfi(NestedEquatableStruct value) {
  final _fooFieldHandle = String_toFfi(value.fooField);
  final _result = _smokeEquatableNestedequatablestructCreateHandle(_fooFieldHandle);
  String_releaseFfiHandle(_fooFieldHandle);
  return _result;
}
NestedEquatableStruct smoke_Equatable_NestedEquatableStruct_fromFfi(Pointer<Void> handle) {
  final _fooFieldHandle = _smokeEquatableNestedequatablestructGetFieldfooField(handle);
  try {
    return NestedEquatableStruct(
      String_fromFfi(_fooFieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_fooFieldHandle);
  }
}
void smoke_Equatable_NestedEquatableStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeEquatableNestedequatablestructReleaseHandle(handle);
// Nullable NestedEquatableStruct
final _smoke_Equatable_NestedEquatableStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_create_handle_nullable'));
final _smoke_Equatable_NestedEquatableStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_release_handle_nullable'));
final _smoke_Equatable_NestedEquatableStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_get_value_nullable'));
Pointer<Void> smoke_Equatable_NestedEquatableStruct_toFfi_nullable(NestedEquatableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Equatable_NestedEquatableStruct_toFfi(value);
  final result = _smoke_Equatable_NestedEquatableStructCreateHandleNullable(_handle);
  smoke_Equatable_NestedEquatableStruct_releaseFfiHandle(_handle);
  return result;
}
NestedEquatableStruct smoke_Equatable_NestedEquatableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Equatable_NestedEquatableStructGetValueNullable(handle);
  final result = smoke_Equatable_NestedEquatableStruct_fromFfi(_handle);
  smoke_Equatable_NestedEquatableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Equatable_NestedEquatableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Equatable_NestedEquatableStructReleaseHandleNullable(handle);
// End of NestedEquatableStruct "private" section.
