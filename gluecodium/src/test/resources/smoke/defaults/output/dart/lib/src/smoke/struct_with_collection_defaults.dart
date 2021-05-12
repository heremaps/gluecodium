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
Pointer<Void> smokeStructwithcollectiondefaultsToFfi(StructWithCollectionDefaults value) {
  final _emptyListFieldHandle = listofStringToFfi(value.emptyListField);
  final _emptyMapFieldHandle = mapofStringToStringToFfi(value.emptyMapField);
  final _emptySetFieldHandle = setofStringToFfi(value.emptySetField);
  final _listFieldHandle = listofStringToFfi(value.listField);
  final _mapFieldHandle = mapofStringToStringToFfi(value.mapField);
  final _setFieldHandle = setofStringToFfi(value.setField);
  final _result = _smokeStructwithcollectiondefaultsCreateHandle(_emptyListFieldHandle, _emptyMapFieldHandle, _emptySetFieldHandle, _listFieldHandle, _mapFieldHandle, _setFieldHandle);
  listofStringReleaseFfiHandle(_emptyListFieldHandle);
  mapofStringToStringReleaseFfiHandle(_emptyMapFieldHandle);
  setofStringReleaseFfiHandle(_emptySetFieldHandle);
  listofStringReleaseFfiHandle(_listFieldHandle);
  mapofStringToStringReleaseFfiHandle(_mapFieldHandle);
  setofStringReleaseFfiHandle(_setFieldHandle);
  return _result;
}
StructWithCollectionDefaults smokeStructwithcollectiondefaultsFromFfi(Pointer<Void> handle) {
  final _emptyListFieldHandle = _smokeStructwithcollectiondefaultsGetFieldemptyListField(handle);
  final _emptyMapFieldHandle = _smokeStructwithcollectiondefaultsGetFieldemptyMapField(handle);
  final _emptySetFieldHandle = _smokeStructwithcollectiondefaultsGetFieldemptySetField(handle);
  final _listFieldHandle = _smokeStructwithcollectiondefaultsGetFieldlistField(handle);
  final _mapFieldHandle = _smokeStructwithcollectiondefaultsGetFieldmapField(handle);
  final _setFieldHandle = _smokeStructwithcollectiondefaultsGetFieldsetField(handle);
  try {
    return StructWithCollectionDefaults(
      listofStringFromFfi(_emptyListFieldHandle),
      mapofStringToStringFromFfi(_emptyMapFieldHandle),
      setofStringFromFfi(_emptySetFieldHandle),
      listofStringFromFfi(_listFieldHandle),
      mapofStringToStringFromFfi(_mapFieldHandle),
      setofStringFromFfi(_setFieldHandle)
    );
  } finally {
    listofStringReleaseFfiHandle(_emptyListFieldHandle);
    mapofStringToStringReleaseFfiHandle(_emptyMapFieldHandle);
    setofStringReleaseFfiHandle(_emptySetFieldHandle);
    listofStringReleaseFfiHandle(_listFieldHandle);
    mapofStringToStringReleaseFfiHandle(_mapFieldHandle);
    setofStringReleaseFfiHandle(_setFieldHandle);
  }
}
void smokeStructwithcollectiondefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeStructwithcollectiondefaultsReleaseHandle(handle);
// Nullable StructWithCollectionDefaults
final _smokeStructwithcollectiondefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_create_handle_nullable'));
final _smokeStructwithcollectiondefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_release_handle_nullable'));
final _smokeStructwithcollectiondefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_value_nullable'));
Pointer<Void> smokeStructwithcollectiondefaultsToFfiNullable(StructWithCollectionDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructwithcollectiondefaultsToFfi(value);
  final result = _smokeStructwithcollectiondefaultsCreateHandleNullable(_handle);
  smokeStructwithcollectiondefaultsReleaseFfiHandle(_handle);
  return result;
}
StructWithCollectionDefaults smokeStructwithcollectiondefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructwithcollectiondefaultsGetValueNullable(handle);
  final result = smokeStructwithcollectiondefaultsFromFfi(_handle);
  smokeStructwithcollectiondefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeStructwithcollectiondefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructwithcollectiondefaultsReleaseHandleNullable(handle);
// End of StructWithCollectionDefaults "private" section.
