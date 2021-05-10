import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/types_with_defaults.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class StructWithInitializerDefaults {
  List<int> intsField;
  List<double> floatsField;
  StructWithAnEnum structField;
  Set<String> setTypeField;
  Map<int, String> mapField;
  StructWithInitializerDefaults(this.intsField, this.floatsField, this.structField, this.setTypeField, this.mapField);
  StructWithInitializerDefaults.withDefaults()
    : intsField = [4, -2, 42], floatsField = [3.14, double.negativeInfinity], structField = StructWithAnEnum(AnEnum.disabled), setTypeField = {"foo", "bar"}, mapField = {1: "foo", 42: "bar"};
}
// StructWithInitializerDefaults "private" section, not exported.
final _smokeStructwithinitializerdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_create_handle'));
final _smokeStructwithinitializerdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_release_handle'));
final _smokeStructwithinitializerdefaultsGetFieldintsField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_get_field_intsField'));
final _smokeStructwithinitializerdefaultsGetFieldfloatsField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_get_field_floatsField'));
final _smokeStructwithinitializerdefaultsGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_get_field_structField'));
final _smokeStructwithinitializerdefaultsGetFieldsetTypeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_get_field_setTypeField'));
final _smokeStructwithinitializerdefaultsGetFieldmapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_get_field_mapField'));
Pointer<Void> smoke_StructWithInitializerDefaults_toFfi(StructWithInitializerDefaults value) {
  final _intsFieldHandle = ListOf_Int_toFfi(value.intsField);
  final _floatsFieldHandle = ListOf_Float_toFfi(value.floatsField);
  final _structFieldHandle = smoke_TypesWithDefaults_StructWithAnEnum_toFfi(value.structField);
  final _setTypeFieldHandle = SetOf_String_toFfi(value.setTypeField);
  final _mapFieldHandle = MapOf_UInt_to_String_toFfi(value.mapField);
  final _result = _smokeStructwithinitializerdefaultsCreateHandle(_intsFieldHandle, _floatsFieldHandle, _structFieldHandle, _setTypeFieldHandle, _mapFieldHandle);
  ListOf_Int_releaseFfiHandle(_intsFieldHandle);
  ListOf_Float_releaseFfiHandle(_floatsFieldHandle);
  smoke_TypesWithDefaults_StructWithAnEnum_releaseFfiHandle(_structFieldHandle);
  SetOf_String_releaseFfiHandle(_setTypeFieldHandle);
  MapOf_UInt_to_String_releaseFfiHandle(_mapFieldHandle);
  return _result;
}
StructWithInitializerDefaults smoke_StructWithInitializerDefaults_fromFfi(Pointer<Void> handle) {
  final _intsFieldHandle = _smokeStructwithinitializerdefaultsGetFieldintsField(handle);
  final _floatsFieldHandle = _smokeStructwithinitializerdefaultsGetFieldfloatsField(handle);
  final _structFieldHandle = _smokeStructwithinitializerdefaultsGetFieldstructField(handle);
  final _setTypeFieldHandle = _smokeStructwithinitializerdefaultsGetFieldsetTypeField(handle);
  final _mapFieldHandle = _smokeStructwithinitializerdefaultsGetFieldmapField(handle);
  try {
    return StructWithInitializerDefaults(
      ListOf_Int_fromFfi(_intsFieldHandle),
      ListOf_Float_fromFfi(_floatsFieldHandle),
      smoke_TypesWithDefaults_StructWithAnEnum_fromFfi(_structFieldHandle),
      SetOf_String_fromFfi(_setTypeFieldHandle),
      MapOf_UInt_to_String_fromFfi(_mapFieldHandle)
    );
  } finally {
    ListOf_Int_releaseFfiHandle(_intsFieldHandle);
    ListOf_Float_releaseFfiHandle(_floatsFieldHandle);
    smoke_TypesWithDefaults_StructWithAnEnum_releaseFfiHandle(_structFieldHandle);
    SetOf_String_releaseFfiHandle(_setTypeFieldHandle);
    MapOf_UInt_to_String_releaseFfiHandle(_mapFieldHandle);
  }
}
void smoke_StructWithInitializerDefaults_releaseFfiHandle(Pointer<Void> handle) => _smokeStructwithinitializerdefaultsReleaseHandle(handle);
// Nullable StructWithInitializerDefaults
final _smoke_StructWithInitializerDefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_create_handle_nullable'));
final _smoke_StructWithInitializerDefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_release_handle_nullable'));
final _smoke_StructWithInitializerDefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_get_value_nullable'));
Pointer<Void> smoke_StructWithInitializerDefaults_toFfi_nullable(StructWithInitializerDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithInitializerDefaults_toFfi(value);
  final result = _smoke_StructWithInitializerDefaultsCreateHandleNullable(_handle);
  smoke_StructWithInitializerDefaults_releaseFfiHandle(_handle);
  return result;
}
StructWithInitializerDefaults smoke_StructWithInitializerDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithInitializerDefaultsGetValueNullable(handle);
  final result = smoke_StructWithInitializerDefaults_fromFfi(_handle);
  smoke_StructWithInitializerDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithInitializerDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithInitializerDefaultsReleaseHandleNullable(handle);
// End of StructWithInitializerDefaults "private" section.
