import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
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
Pointer<Void> smokeStructwithsomedefaultsToFfi(StructWithSomeDefaults value) {
  final _intFieldHandle = (value.intField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeStructwithsomedefaultsCreateHandle(_intFieldHandle, _stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
StructWithSomeDefaults smokeStructwithsomedefaultsFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeStructwithsomedefaultsGetFieldintField(handle);
  final _stringFieldHandle = _smokeStructwithsomedefaultsGetFieldstringField(handle);
  try {
    return StructWithSomeDefaults(
      stringFromFfi(_stringFieldHandle),
      (_intFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeStructwithsomedefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeStructwithsomedefaultsReleaseHandle(handle);
// Nullable StructWithSomeDefaults
final _smokeStructwithsomedefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithSomeDefaults_create_handle_nullable'));
final _smokeStructwithsomedefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithSomeDefaults_release_handle_nullable'));
final _smokeStructwithsomedefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithSomeDefaults_get_value_nullable'));
Pointer<Void> smokeStructwithsomedefaultsToFfiNullable(StructWithSomeDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructwithsomedefaultsToFfi(value);
  final result = _smokeStructwithsomedefaultsCreateHandleNullable(_handle);
  smokeStructwithsomedefaultsReleaseFfiHandle(_handle);
  return result;
}
StructWithSomeDefaults smokeStructwithsomedefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructwithsomedefaultsGetValueNullable(handle);
  final result = smokeStructwithsomedefaultsFromFfi(_handle);
  smokeStructwithsomedefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeStructwithsomedefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructwithsomedefaultsReleaseHandleNullable(handle);
// End of StructWithSomeDefaults "private" section.
