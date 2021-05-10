import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class StructWithCollectionDefaults {
  List<String> emptyListField;
  Map<String, String> emptyMapField;
  Set<String> emptySetField;
  List<String> listField;
  Map<String, String> mapField;
  Set<String> setField;
  StructWithCollectionDefaults([List<String> emptyListField = const [], Map<String, String> emptyMapField = const {}, Set<String> emptySetField = const {}, List<String> listField = const ["foo", "bar"], Map<String, String> mapField = const {"foo": "bar"}, Set<String> setField = const {"foo", "bar"}])
    : emptyListField = emptyListField, emptyMapField = emptyMapField, emptySetField = emptySetField, listField = listField, mapField = mapField, setField = setField;
  StructWithCollectionDefaults.withDefaults()
    : emptyListField = [], emptyMapField = {}, emptySetField = {}, listField = ["foo", "bar"], mapField = {"foo": "bar"}, setField = {"foo", "bar"};
}
// StructWithCollectionDefaults "private" section, not exported.
final _smokeStructwithcollectiondefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_create_handle'));
final _smokeStructwithcollectiondefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_release_handle'));
final _smokeStructwithcollectiondefaultsGetFieldemptyListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_emptyListField'));
final _smokeStructwithcollectiondefaultsGetFieldemptyMapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_emptyMapField'));
final _smokeStructwithcollectiondefaultsGetFieldemptySetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_emptySetField'));
final _smokeStructwithcollectiondefaultsGetFieldlistField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_listField'));
final _smokeStructwithcollectiondefaultsGetFieldmapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_mapField'));
final _smokeStructwithcollectiondefaultsGetFieldsetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_setField'));
Pointer<Void> smoke_StructWithCollectionDefaults_toFfi(StructWithCollectionDefaults value) {
  final _emptyListFieldHandle = ListOf_String_toFfi(value.emptyListField);
  final _emptyMapFieldHandle = MapOf_String_to_String_toFfi(value.emptyMapField);
  final _emptySetFieldHandle = SetOf_String_toFfi(value.emptySetField);
  final _listFieldHandle = ListOf_String_toFfi(value.listField);
  final _mapFieldHandle = MapOf_String_to_String_toFfi(value.mapField);
  final _setFieldHandle = SetOf_String_toFfi(value.setField);
  final _result = _smokeStructwithcollectiondefaultsCreateHandle(_emptyListFieldHandle, _emptyMapFieldHandle, _emptySetFieldHandle, _listFieldHandle, _mapFieldHandle, _setFieldHandle);
  ListOf_String_releaseFfiHandle(_emptyListFieldHandle);
  MapOf_String_to_String_releaseFfiHandle(_emptyMapFieldHandle);
  SetOf_String_releaseFfiHandle(_emptySetFieldHandle);
  ListOf_String_releaseFfiHandle(_listFieldHandle);
  MapOf_String_to_String_releaseFfiHandle(_mapFieldHandle);
  SetOf_String_releaseFfiHandle(_setFieldHandle);
  return _result;
}
StructWithCollectionDefaults smoke_StructWithCollectionDefaults_fromFfi(Pointer<Void> handle) {
  final _emptyListFieldHandle = _smokeStructwithcollectiondefaultsGetFieldemptyListField(handle);
  final _emptyMapFieldHandle = _smokeStructwithcollectiondefaultsGetFieldemptyMapField(handle);
  final _emptySetFieldHandle = _smokeStructwithcollectiondefaultsGetFieldemptySetField(handle);
  final _listFieldHandle = _smokeStructwithcollectiondefaultsGetFieldlistField(handle);
  final _mapFieldHandle = _smokeStructwithcollectiondefaultsGetFieldmapField(handle);
  final _setFieldHandle = _smokeStructwithcollectiondefaultsGetFieldsetField(handle);
  try {
    return StructWithCollectionDefaults(
      ListOf_String_fromFfi(_emptyListFieldHandle),
      MapOf_String_to_String_fromFfi(_emptyMapFieldHandle),
      SetOf_String_fromFfi(_emptySetFieldHandle),
      ListOf_String_fromFfi(_listFieldHandle),
      MapOf_String_to_String_fromFfi(_mapFieldHandle),
      SetOf_String_fromFfi(_setFieldHandle)
    );
  } finally {
    ListOf_String_releaseFfiHandle(_emptyListFieldHandle);
    MapOf_String_to_String_releaseFfiHandle(_emptyMapFieldHandle);
    SetOf_String_releaseFfiHandle(_emptySetFieldHandle);
    ListOf_String_releaseFfiHandle(_listFieldHandle);
    MapOf_String_to_String_releaseFfiHandle(_mapFieldHandle);
    SetOf_String_releaseFfiHandle(_setFieldHandle);
  }
}
void smoke_StructWithCollectionDefaults_releaseFfiHandle(Pointer<Void> handle) => _smokeStructwithcollectiondefaultsReleaseHandle(handle);
// Nullable StructWithCollectionDefaults
final _smoke_StructWithCollectionDefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_create_handle_nullable'));
final _smoke_StructWithCollectionDefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_release_handle_nullable'));
final _smoke_StructWithCollectionDefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_value_nullable'));
Pointer<Void> smoke_StructWithCollectionDefaults_toFfi_nullable(StructWithCollectionDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithCollectionDefaults_toFfi(value);
  final result = _smoke_StructWithCollectionDefaultsCreateHandleNullable(_handle);
  smoke_StructWithCollectionDefaults_releaseFfiHandle(_handle);
  return result;
}
StructWithCollectionDefaults smoke_StructWithCollectionDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithCollectionDefaultsGetValueNullable(handle);
  final result = smoke_StructWithCollectionDefaults_fromFfi(_handle);
  smoke_StructWithCollectionDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithCollectionDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithCollectionDefaultsReleaseHandleNullable(handle);
// End of StructWithCollectionDefaults "private" section.
