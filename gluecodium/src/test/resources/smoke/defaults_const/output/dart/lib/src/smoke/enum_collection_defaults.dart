import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/fire/enum1.dart';
import 'package:library/src/fire/enum2.dart';
import 'package:library/src/fire/enum3.dart';
import 'package:library/src/fire/enum4.dart';
import 'package:library/src/generic_types__conversion.dart';
class EnumCollectionDefaults {
  List<Enum1> listField;
  Set<Enum2> setField;
  Map<Enum3, Enum4> mapField;
  EnumCollectionDefaults._(this.listField, this.setField, this.mapField);
  EnumCollectionDefaults()
    : listField = [Enum1.disabled], setField = {Enum2.disabled}, mapField = {Enum3.disabled: Enum4.disabled};
}
// EnumCollectionDefaults "private" section, not exported.
final _smokeEnumcollectiondefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_EnumCollectionDefaults_create_handle'));
final _smokeEnumcollectiondefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaults_release_handle'));
final _smokeEnumcollectiondefaultsGetFieldlistField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaults_get_field_listField'));
final _smokeEnumcollectiondefaultsGetFieldsetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaults_get_field_setField'));
final _smokeEnumcollectiondefaultsGetFieldmapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaults_get_field_mapField'));
Pointer<Void> smokeEnumcollectiondefaultsToFfi(EnumCollectionDefaults value) {
  final _listFieldHandle = listofFireEnum1ToFfi(value.listField);
  final _setFieldHandle = setofFireEnum2ToFfi(value.setField);
  final _mapFieldHandle = mapofFireEnum3ToFireEnum4ToFfi(value.mapField);
  final _result = _smokeEnumcollectiondefaultsCreateHandle(_listFieldHandle, _setFieldHandle, _mapFieldHandle);
  listofFireEnum1ReleaseFfiHandle(_listFieldHandle);
  setofFireEnum2ReleaseFfiHandle(_setFieldHandle);
  mapofFireEnum3ToFireEnum4ReleaseFfiHandle(_mapFieldHandle);
  return _result;
}
EnumCollectionDefaults smokeEnumcollectiondefaultsFromFfi(Pointer<Void> handle) {
  final _listFieldHandle = _smokeEnumcollectiondefaultsGetFieldlistField(handle);
  final _setFieldHandle = _smokeEnumcollectiondefaultsGetFieldsetField(handle);
  final _mapFieldHandle = _smokeEnumcollectiondefaultsGetFieldmapField(handle);
  try {
    return EnumCollectionDefaults._(
      listofFireEnum1FromFfi(_listFieldHandle),
      setofFireEnum2FromFfi(_setFieldHandle),
      mapofFireEnum3ToFireEnum4FromFfi(_mapFieldHandle)
    );
  } finally {
    listofFireEnum1ReleaseFfiHandle(_listFieldHandle);
    setofFireEnum2ReleaseFfiHandle(_setFieldHandle);
    mapofFireEnum3ToFireEnum4ReleaseFfiHandle(_mapFieldHandle);
  }
}
void smokeEnumcollectiondefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeEnumcollectiondefaultsReleaseHandle(handle);
// Nullable EnumCollectionDefaults
final _smokeEnumcollectiondefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaults_create_handle_nullable'));
final _smokeEnumcollectiondefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaults_release_handle_nullable'));
final _smokeEnumcollectiondefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaults_get_value_nullable'));
Pointer<Void> smokeEnumcollectiondefaultsToFfiNullable(EnumCollectionDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumcollectiondefaultsToFfi(value);
  final result = _smokeEnumcollectiondefaultsCreateHandleNullable(_handle);
  smokeEnumcollectiondefaultsReleaseFfiHandle(_handle);
  return result;
}
EnumCollectionDefaults? smokeEnumcollectiondefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumcollectiondefaultsGetValueNullable(handle);
  final result = smokeEnumcollectiondefaultsFromFfi(_handle);
  smokeEnumcollectiondefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumcollectiondefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumcollectiondefaultsReleaseHandleNullable(handle);
// End of EnumCollectionDefaults "private" section.
