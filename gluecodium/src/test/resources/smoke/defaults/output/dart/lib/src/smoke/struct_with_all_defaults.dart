import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class StructWithAllDefaults {
  int intField;
  String stringField;
  StructWithAllDefaults([int intField = 42, String stringField = "\\Jonny \"Magic\" Smith\n"])
    : intField = intField, stringField = stringField;
  StructWithAllDefaults.withDefaults()
    : intField = 42, stringField = "\\Jonny \"Magic\" Smith\n";
}
// StructWithAllDefaults "private" section, not exported.
final _smokeStructwithalldefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_create_handle'));
final _smokeStructwithalldefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_release_handle'));
final _smokeStructwithalldefaultsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_get_field_intField'));
final _smokeStructwithalldefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_get_field_stringField'));
Pointer<Void> smoke_StructWithAllDefaults_toFfi(StructWithAllDefaults value) {
  final _intFieldHandle = (value.intField);
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _result = _smokeStructwithalldefaultsCreateHandle(_intFieldHandle, _stringFieldHandle);
  (_intFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  return _result;
}
StructWithAllDefaults smoke_StructWithAllDefaults_fromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeStructwithalldefaultsGetFieldintField(handle);
  final _stringFieldHandle = _smokeStructwithalldefaultsGetFieldstringField(handle);
  try {
    return StructWithAllDefaults(
      (_intFieldHandle),
      String_fromFfi(_stringFieldHandle)
    );
  } finally {
    (_intFieldHandle);
    String_releaseFfiHandle(_stringFieldHandle);
  }
}
void smoke_StructWithAllDefaults_releaseFfiHandle(Pointer<Void> handle) => _smokeStructwithalldefaultsReleaseHandle(handle);
// Nullable StructWithAllDefaults
final _smoke_StructWithAllDefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_create_handle_nullable'));
final _smoke_StructWithAllDefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_release_handle_nullable'));
final _smoke_StructWithAllDefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_get_value_nullable'));
Pointer<Void> smoke_StructWithAllDefaults_toFfi_nullable(StructWithAllDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithAllDefaults_toFfi(value);
  final result = _smoke_StructWithAllDefaultsCreateHandleNullable(_handle);
  smoke_StructWithAllDefaults_releaseFfiHandle(_handle);
  return result;
}
StructWithAllDefaults smoke_StructWithAllDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithAllDefaultsGetValueNullable(handle);
  final result = smoke_StructWithAllDefaults_fromFfi(_handle);
  smoke_StructWithAllDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithAllDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithAllDefaultsReleaseHandleNullable(handle);
// End of StructWithAllDefaults "private" section.
