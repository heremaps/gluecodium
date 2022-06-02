import 'dart:ffi';
import 'package:foo/alien_enum1.dart' as alien_enum1;
import 'package:foo/alien_enum2.dart' as alien_enum2;
import 'package:foo/alien_enum3.dart' as alien_enum3;
import 'package:foo/alien_enum4.dart' as alien_enum4;
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';
class EnumCollectionDefaultsExternal {
  List<alien_enum1.ExternalEnum1> listField;
  Set<alien_enum2.ExternalEnum2> setField;
  Map<alien_enum3.ExternalEnum3, alien_enum4.ExternalEnum4> mapField;
  EnumCollectionDefaultsExternal._(this.listField, this.setField, this.mapField);
  EnumCollectionDefaultsExternal()
    : listField = [alien_enum1.ExternalEnum1.disabled], setField = {alien_enum2.ExternalEnum2.disabled}, mapField = {alien_enum3.ExternalEnum3.disabled: alien_enum4.ExternalEnum4.disabled};
}
// EnumCollectionDefaultsExternal "private" section, not exported.
final _smokeEnumcollectiondefaultsexternalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_EnumCollectionDefaultsExternal_create_handle'));
final _smokeEnumcollectiondefaultsexternalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaultsExternal_release_handle'));
final _smokeEnumcollectiondefaultsexternalGetFieldlistField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaultsExternal_get_field_listField'));
final _smokeEnumcollectiondefaultsexternalGetFieldsetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaultsExternal_get_field_setField'));
final _smokeEnumcollectiondefaultsexternalGetFieldmapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaultsExternal_get_field_mapField'));
Pointer<Void> smokeEnumcollectiondefaultsexternalToFfi(EnumCollectionDefaultsExternal value) {
  final _listFieldHandle = listofFireExternalenum1ToFfi(value.listField);
  final _setFieldHandle = setofFireExternalenum2ToFfi(value.setField);
  final _mapFieldHandle = mapofFireExternalenum3ToFireExternalenum4ToFfi(value.mapField);
  final _result = _smokeEnumcollectiondefaultsexternalCreateHandle(_listFieldHandle, _setFieldHandle, _mapFieldHandle);
  listofFireExternalenum1ReleaseFfiHandle(_listFieldHandle);
  setofFireExternalenum2ReleaseFfiHandle(_setFieldHandle);
  mapofFireExternalenum3ToFireExternalenum4ReleaseFfiHandle(_mapFieldHandle);
  return _result;
}
EnumCollectionDefaultsExternal smokeEnumcollectiondefaultsexternalFromFfi(Pointer<Void> handle) {
  final _listFieldHandle = _smokeEnumcollectiondefaultsexternalGetFieldlistField(handle);
  final _setFieldHandle = _smokeEnumcollectiondefaultsexternalGetFieldsetField(handle);
  final _mapFieldHandle = _smokeEnumcollectiondefaultsexternalGetFieldmapField(handle);
  try {
    return EnumCollectionDefaultsExternal._(
      listofFireExternalenum1FromFfi(_listFieldHandle),
      setofFireExternalenum2FromFfi(_setFieldHandle),
      mapofFireExternalenum3ToFireExternalenum4FromFfi(_mapFieldHandle)
    );
  } finally {
    listofFireExternalenum1ReleaseFfiHandle(_listFieldHandle);
    setofFireExternalenum2ReleaseFfiHandle(_setFieldHandle);
    mapofFireExternalenum3ToFireExternalenum4ReleaseFfiHandle(_mapFieldHandle);
  }
}
void smokeEnumcollectiondefaultsexternalReleaseFfiHandle(Pointer<Void> handle) => _smokeEnumcollectiondefaultsexternalReleaseHandle(handle);
// Nullable EnumCollectionDefaultsExternal
final _smokeEnumcollectiondefaultsexternalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaultsExternal_create_handle_nullable'));
final _smokeEnumcollectiondefaultsexternalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaultsExternal_release_handle_nullable'));
final _smokeEnumcollectiondefaultsexternalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnumCollectionDefaultsExternal_get_value_nullable'));
Pointer<Void> smokeEnumcollectiondefaultsexternalToFfiNullable(EnumCollectionDefaultsExternal? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumcollectiondefaultsexternalToFfi(value);
  final result = _smokeEnumcollectiondefaultsexternalCreateHandleNullable(_handle);
  smokeEnumcollectiondefaultsexternalReleaseFfiHandle(_handle);
  return result;
}
EnumCollectionDefaultsExternal? smokeEnumcollectiondefaultsexternalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumcollectiondefaultsexternalGetValueNullable(handle);
  final result = smokeEnumcollectiondefaultsexternalFromFfi(_handle);
  smokeEnumcollectiondefaultsexternalReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumcollectiondefaultsexternalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumcollectiondefaultsexternalReleaseHandleNullable(handle);
// End of EnumCollectionDefaultsExternal "private" section.
