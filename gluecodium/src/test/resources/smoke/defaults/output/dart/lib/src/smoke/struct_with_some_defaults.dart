import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class StructWithSomeDefaults {
  int intField;
  String stringField;
  StructWithSomeDefaults(String stringField, [int intField = 42])
    : intField = intField, stringField = stringField;
  StructWithSomeDefaults.withDefaults(String stringField)
    : intField = 42, stringField = stringField;
}
// StructWithSomeDefaults "private" section, not exported.
final _smokeStructwithsomedefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_StructWithSomeDefaults_create_handle'));
final _smokeStructwithsomedefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithSomeDefaults_release_handle'));
final _smokeStructwithsomedefaultsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithSomeDefaults_get_field_intField'));
final _smokeStructwithsomedefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithSomeDefaults_get_field_stringField'));
Pointer<Void> smoke_StructWithSomeDefaults_toFfi(StructWithSomeDefaults value) {
  final _intFieldHandle = (value.intField);
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _result = _smokeStructwithsomedefaultsCreateHandle(_intFieldHandle, _stringFieldHandle);
  (_intFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  return _result;
}
StructWithSomeDefaults smoke_StructWithSomeDefaults_fromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeStructwithsomedefaultsGetFieldintField(handle);
  final _stringFieldHandle = _smokeStructwithsomedefaultsGetFieldstringField(handle);
  try {
    return StructWithSomeDefaults(
      String_fromFfi(_stringFieldHandle),
      (_intFieldHandle)
    );
  } finally {
    (_intFieldHandle);
    String_releaseFfiHandle(_stringFieldHandle);
  }
}
void smoke_StructWithSomeDefaults_releaseFfiHandle(Pointer<Void> handle) => _smokeStructwithsomedefaultsReleaseHandle(handle);
// Nullable StructWithSomeDefaults
final _smoke_StructWithSomeDefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithSomeDefaults_create_handle_nullable'));
final _smoke_StructWithSomeDefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithSomeDefaults_release_handle_nullable'));
final _smoke_StructWithSomeDefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithSomeDefaults_get_value_nullable'));
Pointer<Void> smoke_StructWithSomeDefaults_toFfi_nullable(StructWithSomeDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithSomeDefaults_toFfi(value);
  final result = _smoke_StructWithSomeDefaultsCreateHandleNullable(_handle);
  smoke_StructWithSomeDefaults_releaseFfiHandle(_handle);
  return result;
}
StructWithSomeDefaults smoke_StructWithSomeDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithSomeDefaultsGetValueNullable(handle);
  final result = smoke_StructWithSomeDefaults_fromFfi(_handle);
  smoke_StructWithSomeDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithSomeDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithSomeDefaultsReleaseHandleNullable(handle);
// End of StructWithSomeDefaults "private" section.
