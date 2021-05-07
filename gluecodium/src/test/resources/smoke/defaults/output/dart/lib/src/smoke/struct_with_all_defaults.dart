import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
final _smoke_StructWithAllDefaults_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_create_handle'));
final _smoke_StructWithAllDefaults_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_release_handle'));
final _smoke_StructWithAllDefaults_get_field_intField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_get_field_intField'));
final _smoke_StructWithAllDefaults_get_field_stringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_get_field_stringField'));
Pointer<Void> smoke_StructWithAllDefaults_toFfi(StructWithAllDefaults value) {
  final _intField_handle = (value.intField);
  final _stringField_handle = String_toFfi(value.stringField);
  final _result = _smoke_StructWithAllDefaults_create_handle(_intField_handle, _stringField_handle);
  (_intField_handle);
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
StructWithAllDefaults smoke_StructWithAllDefaults_fromFfi(Pointer<Void> handle) {
  final _intField_handle = _smoke_StructWithAllDefaults_get_field_intField(handle);
  final _stringField_handle = _smoke_StructWithAllDefaults_get_field_stringField(handle);
  try {
    return StructWithAllDefaults(
      (_intField_handle),
      String_fromFfi(_stringField_handle)
    );
  } finally {
    (_intField_handle);
    String_releaseFfiHandle(_stringField_handle);
  }
}
void smoke_StructWithAllDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructWithAllDefaults_release_handle(handle);
// Nullable StructWithAllDefaults
final _smoke_StructWithAllDefaults_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_create_handle_nullable'));
final _smoke_StructWithAllDefaults_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_release_handle_nullable'));
final _smoke_StructWithAllDefaults_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithAllDefaults_get_value_nullable'));
Pointer<Void> smoke_StructWithAllDefaults_toFfi_nullable(StructWithAllDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithAllDefaults_toFfi(value);
  final result = _smoke_StructWithAllDefaults_create_handle_nullable(_handle);
  smoke_StructWithAllDefaults_releaseFfiHandle(_handle);
  return result;
}
StructWithAllDefaults smoke_StructWithAllDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithAllDefaults_get_value_nullable(handle);
  final result = smoke_StructWithAllDefaults_fromFfi(_handle);
  smoke_StructWithAllDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithAllDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithAllDefaults_release_handle_nullable(handle);
// End of StructWithAllDefaults "private" section.
