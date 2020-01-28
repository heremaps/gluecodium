import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/smoke/TypesWithDefaults.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
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
final _smoke_StructWithInitializerDefaults_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('smoke_StructWithInitializerDefaults_create_handle');
final _smoke_StructWithInitializerDefaults_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_StructWithInitializerDefaults_release_handle');
final _smoke_StructWithInitializerDefaults_get_field_intsField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructWithInitializerDefaults_get_field_intsField');
final _smoke_StructWithInitializerDefaults_get_field_floatsField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructWithInitializerDefaults_get_field_floatsField');
final _smoke_StructWithInitializerDefaults_get_field_structField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructWithInitializerDefaults_get_field_structField');
final _smoke_StructWithInitializerDefaults_get_field_setTypeField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructWithInitializerDefaults_get_field_setTypeField');
final _smoke_StructWithInitializerDefaults_get_field_mapField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructWithInitializerDefaults_get_field_mapField');
Pointer<Void> smoke_StructWithInitializerDefaults_toFfi(StructWithInitializerDefaults value) {
  final _intsField_handle = ListOf_Int_toFfi(value.intsField);
  final _floatsField_handle = ListOf_Float_toFfi(value.floatsField);
  final _structField_handle = smoke_TypesWithDefaults_StructWithAnEnum_toFfi(value.structField);
  final _setTypeField_handle = SetOf_String_toFfi(value.setTypeField);
  final _mapField_handle = MapOf_UInt_to_String_toFfi(value.mapField);
  final _result = _smoke_StructWithInitializerDefaults_create_handle(_intsField_handle, _floatsField_handle, _structField_handle, _setTypeField_handle, _mapField_handle);
  ListOf_Int_releaseFfiHandle(_intsField_handle);
  ListOf_Float_releaseFfiHandle(_floatsField_handle);
  smoke_TypesWithDefaults_StructWithAnEnum_releaseFfiHandle(_structField_handle);
  SetOf_String_releaseFfiHandle(_setTypeField_handle);
  MapOf_UInt_to_String_releaseFfiHandle(_mapField_handle);
  return _result;
}
StructWithInitializerDefaults smoke_StructWithInitializerDefaults_fromFfi(Pointer<Void> handle) {
  final _intsField_handle = _smoke_StructWithInitializerDefaults_get_field_intsField(handle);
  final _floatsField_handle = _smoke_StructWithInitializerDefaults_get_field_floatsField(handle);
  final _structField_handle = _smoke_StructWithInitializerDefaults_get_field_structField(handle);
  final _setTypeField_handle = _smoke_StructWithInitializerDefaults_get_field_setTypeField(handle);
  final _mapField_handle = _smoke_StructWithInitializerDefaults_get_field_mapField(handle);
  final _result = StructWithInitializerDefaults(
    ListOf_Int_fromFfi(_intsField_handle),
    ListOf_Float_fromFfi(_floatsField_handle),
    smoke_TypesWithDefaults_StructWithAnEnum_fromFfi(_structField_handle),
    SetOf_String_fromFfi(_setTypeField_handle),
    MapOf_UInt_to_String_fromFfi(_mapField_handle)
  );
  ListOf_Int_releaseFfiHandle(_intsField_handle);
  ListOf_Float_releaseFfiHandle(_floatsField_handle);
  smoke_TypesWithDefaults_StructWithAnEnum_releaseFfiHandle(_structField_handle);
  SetOf_String_releaseFfiHandle(_setTypeField_handle);
  MapOf_UInt_to_String_releaseFfiHandle(_mapField_handle);
  return _result;
}
void smoke_StructWithInitializerDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructWithInitializerDefaults_release_handle(handle);
// Nullable StructWithInitializerDefaults
final _smoke_StructWithInitializerDefaults_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructWithInitializerDefaults_create_handle_nullable');
final _smoke_StructWithInitializerDefaults_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_StructWithInitializerDefaults_release_handle_nullable');
final _smoke_StructWithInitializerDefaults_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructWithInitializerDefaults_get_value_nullable');
Pointer<Void> smoke_StructWithInitializerDefaults_toFfi_nullable(StructWithInitializerDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithInitializerDefaults_toFfi(value);
  final result = _smoke_StructWithInitializerDefaults_create_handle_nullable(_handle);
  smoke_StructWithInitializerDefaults_releaseFfiHandle(_handle);
  return result;
}
StructWithInitializerDefaults smoke_StructWithInitializerDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithInitializerDefaults_get_value_nullable(handle);
  final result = smoke_StructWithInitializerDefaults_fromFfi(_handle);
  smoke_StructWithInitializerDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithInitializerDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithInitializerDefaults_release_handle_nullable(handle);
// End of StructWithInitializerDefaults "private" section.
