import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/types_with_defaults.dart';
class StructWithInitializerDefaults {
  List<int> intsField;
  List<double> floatsField;
  StructWithAnEnum structField;
  Set<String> setTypeField;
  Map<int, String> mapField;
  StructWithInitializerDefaults._(this.intsField, this.floatsField, this.structField, this.setTypeField, this.mapField);
  StructWithInitializerDefaults()
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
Pointer<Void> smokeStructwithinitializerdefaultsToFfi(StructWithInitializerDefaults value) {
  final _intsFieldHandle = listofIntToFfi(value.intsField);
  final _floatsFieldHandle = listofFloatToFfi(value.floatsField);
  final _structFieldHandle = smokeTypeswithdefaultsStructwithanenumToFfi(value.structField);
  final _setTypeFieldHandle = setofStringToFfi(value.setTypeField);
  final _mapFieldHandle = mapofUintToStringToFfi(value.mapField);
  final _result = _smokeStructwithinitializerdefaultsCreateHandle(_intsFieldHandle, _floatsFieldHandle, _structFieldHandle, _setTypeFieldHandle, _mapFieldHandle);
  listofIntReleaseFfiHandle(_intsFieldHandle);
  listofFloatReleaseFfiHandle(_floatsFieldHandle);
  smokeTypeswithdefaultsStructwithanenumReleaseFfiHandle(_structFieldHandle);
  setofStringReleaseFfiHandle(_setTypeFieldHandle);
  mapofUintToStringReleaseFfiHandle(_mapFieldHandle);
  return _result;
}
StructWithInitializerDefaults smokeStructwithinitializerdefaultsFromFfi(Pointer<Void> handle) {
  final _intsFieldHandle = _smokeStructwithinitializerdefaultsGetFieldintsField(handle);
  final _floatsFieldHandle = _smokeStructwithinitializerdefaultsGetFieldfloatsField(handle);
  final _structFieldHandle = _smokeStructwithinitializerdefaultsGetFieldstructField(handle);
  final _setTypeFieldHandle = _smokeStructwithinitializerdefaultsGetFieldsetTypeField(handle);
  final _mapFieldHandle = _smokeStructwithinitializerdefaultsGetFieldmapField(handle);
  try {
    return StructWithInitializerDefaults._(
      listofIntFromFfi(_intsFieldHandle),
      listofFloatFromFfi(_floatsFieldHandle),
      smokeTypeswithdefaultsStructwithanenumFromFfi(_structFieldHandle),
      setofStringFromFfi(_setTypeFieldHandle),
      mapofUintToStringFromFfi(_mapFieldHandle)
    );
  } finally {
    listofIntReleaseFfiHandle(_intsFieldHandle);
    listofFloatReleaseFfiHandle(_floatsFieldHandle);
    smokeTypeswithdefaultsStructwithanenumReleaseFfiHandle(_structFieldHandle);
    setofStringReleaseFfiHandle(_setTypeFieldHandle);
    mapofUintToStringReleaseFfiHandle(_mapFieldHandle);
  }
}
void smokeStructwithinitializerdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeStructwithinitializerdefaultsReleaseHandle(handle);
// Nullable StructWithInitializerDefaults
final _smokeStructwithinitializerdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_create_handle_nullable'));
final _smokeStructwithinitializerdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_release_handle_nullable'));
final _smokeStructwithinitializerdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInitializerDefaults_get_value_nullable'));
Pointer<Void> smokeStructwithinitializerdefaultsToFfiNullable(StructWithInitializerDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructwithinitializerdefaultsToFfi(value);
  final result = _smokeStructwithinitializerdefaultsCreateHandleNullable(_handle);
  smokeStructwithinitializerdefaultsReleaseFfiHandle(_handle);
  return result;
}
StructWithInitializerDefaults? smokeStructwithinitializerdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructwithinitializerdefaultsGetValueNullable(handle);
  final result = smokeStructwithinitializerdefaultsFromFfi(_handle);
  smokeStructwithinitializerdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeStructwithinitializerdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructwithinitializerdefaultsReleaseHandleNullable(handle);
// End of StructWithInitializerDefaults "private" section.
