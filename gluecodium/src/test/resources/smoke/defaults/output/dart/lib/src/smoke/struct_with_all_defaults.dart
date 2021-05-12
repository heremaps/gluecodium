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
Pointer<Void> smokeStructwithalldefaultsToFfi(StructWithAllDefaults value) {
  final _intFieldHandle = (value.intField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeStructwithalldefaultsCreateHandle(_intFieldHandle, _stringFieldHandle);
  (_intFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
StructWithAllDefaults smokeStructwithalldefaultsFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeStructwithalldefaultsGetFieldintField(handle);
  final _stringFieldHandle = _smokeStructwithalldefaultsGetFieldstringField(handle);
  try {
    return StructWithAllDefaults(
      (_intFieldHandle),
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    (_intFieldHandle);
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeStructwithalldefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeStructwithalldefaultsReleaseHandle(handle);
// Nullable StructWithAllDefaults
final _smokeStructwithalldefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_create_handle_nullable'));
final _smokeStructwithalldefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_release_handle_nullable'));
final _smokeStructwithalldefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_get_value_nullable'));
Pointer<Void> smokeStructwithalldefaultsToFfiNullable(StructWithAllDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructwithalldefaultsToFfi(value);
  final result = _smokeStructwithalldefaultsCreateHandleNullable(_handle);
  smokeStructwithalldefaultsReleaseFfiHandle(_handle);
  return result;
}
StructWithAllDefaults smokeStructwithalldefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructwithalldefaultsGetValueNullable(handle);
  final result = smokeStructwithalldefaultsFromFfi(_handle);
  smokeStructwithalldefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeStructwithalldefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructwithalldefaultsReleaseHandleNullable(handle);
// End of StructWithAllDefaults "private" section.
