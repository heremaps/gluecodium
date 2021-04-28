import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
final _smoke_StructWithCollectionDefaults_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_create_handle'));
final _smoke_StructWithCollectionDefaults_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_release_handle'));
final _smoke_StructWithCollectionDefaults_get_field_emptyListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_emptyListField'));
final _smoke_StructWithCollectionDefaults_get_field_emptyMapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_emptyMapField'));
final _smoke_StructWithCollectionDefaults_get_field_emptySetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_emptySetField'));
final _smoke_StructWithCollectionDefaults_get_field_listField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_listField'));
final _smoke_StructWithCollectionDefaults_get_field_mapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_mapField'));
final _smoke_StructWithCollectionDefaults_get_field_setField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_field_setField'));
Pointer<Void> smoke_StructWithCollectionDefaults_toFfi(StructWithCollectionDefaults value) {
  final _emptyListField_handle = ListOf_String_toFfi(value.emptyListField);
  final _emptyMapField_handle = MapOf_String_to_String_toFfi(value.emptyMapField);
  final _emptySetField_handle = SetOf_String_toFfi(value.emptySetField);
  final _listField_handle = ListOf_String_toFfi(value.listField);
  final _mapField_handle = MapOf_String_to_String_toFfi(value.mapField);
  final _setField_handle = SetOf_String_toFfi(value.setField);
  final _result = _smoke_StructWithCollectionDefaults_create_handle(_emptyListField_handle, _emptyMapField_handle, _emptySetField_handle, _listField_handle, _mapField_handle, _setField_handle);
  ListOf_String_releaseFfiHandle(_emptyListField_handle);
  MapOf_String_to_String_releaseFfiHandle(_emptyMapField_handle);
  SetOf_String_releaseFfiHandle(_emptySetField_handle);
  ListOf_String_releaseFfiHandle(_listField_handle);
  MapOf_String_to_String_releaseFfiHandle(_mapField_handle);
  SetOf_String_releaseFfiHandle(_setField_handle);
  return _result;
}
StructWithCollectionDefaults smoke_StructWithCollectionDefaults_fromFfi(Pointer<Void> handle) {
  final _emptyListField_handle = _smoke_StructWithCollectionDefaults_get_field_emptyListField(handle);
  final _emptyMapField_handle = _smoke_StructWithCollectionDefaults_get_field_emptyMapField(handle);
  final _emptySetField_handle = _smoke_StructWithCollectionDefaults_get_field_emptySetField(handle);
  final _listField_handle = _smoke_StructWithCollectionDefaults_get_field_listField(handle);
  final _mapField_handle = _smoke_StructWithCollectionDefaults_get_field_mapField(handle);
  final _setField_handle = _smoke_StructWithCollectionDefaults_get_field_setField(handle);
  try {
    return StructWithCollectionDefaults(
      ListOf_String_fromFfi(_emptyListField_handle),
      MapOf_String_to_String_fromFfi(_emptyMapField_handle),
      SetOf_String_fromFfi(_emptySetField_handle),
      ListOf_String_fromFfi(_listField_handle),
      MapOf_String_to_String_fromFfi(_mapField_handle),
      SetOf_String_fromFfi(_setField_handle)
    );
  } finally {
    ListOf_String_releaseFfiHandle(_emptyListField_handle);
    MapOf_String_to_String_releaseFfiHandle(_emptyMapField_handle);
    SetOf_String_releaseFfiHandle(_emptySetField_handle);
    ListOf_String_releaseFfiHandle(_listField_handle);
    MapOf_String_to_String_releaseFfiHandle(_mapField_handle);
    SetOf_String_releaseFfiHandle(_setField_handle);
  }
}
void smoke_StructWithCollectionDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructWithCollectionDefaults_release_handle(handle);
// Nullable StructWithCollectionDefaults
final _smoke_StructWithCollectionDefaults_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_create_handle_nullable'));
final _smoke_StructWithCollectionDefaults_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_release_handle_nullable'));
final _smoke_StructWithCollectionDefaults_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithCollectionDefaults_get_value_nullable'));
Pointer<Void> smoke_StructWithCollectionDefaults_toFfi_nullable(StructWithCollectionDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithCollectionDefaults_toFfi(value);
  final result = _smoke_StructWithCollectionDefaults_create_handle_nullable(_handle);
  smoke_StructWithCollectionDefaults_releaseFfiHandle(_handle);
  return result;
}
StructWithCollectionDefaults? smoke_StructWithCollectionDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithCollectionDefaults_get_value_nullable(handle);
  final result = smoke_StructWithCollectionDefaults_fromFfi(_handle);
  smoke_StructWithCollectionDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithCollectionDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithCollectionDefaults_release_handle_nullable(handle);
// End of StructWithCollectionDefaults "private" section.
