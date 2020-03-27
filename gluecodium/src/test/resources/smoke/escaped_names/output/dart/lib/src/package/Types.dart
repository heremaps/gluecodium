import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_library_init.dart' as __lib;
enum Enum {
    naN
}
// Enum "private" section, not exported.
int package_Types_Enum_toFfi(Enum value) {
  switch (value) {
  case Enum.naN:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for Enum enum.");
  }
}
Enum package_Types_Enum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enum.naN;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Enum enum.");
  }
}
void package_Types_Enum_releaseFfiHandle(int handle) {}
final _package_Types_Enum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_package_Types_Enum_create_handle_nullable');
final _package_Types_Enum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Types_Enum_release_handle_nullable');
final _package_Types_Enum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_package_Types_Enum_get_value_nullable');
Pointer<Void> package_Types_Enum_toFfi_nullable(Enum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = package_Types_Enum_toFfi(value);
  final result = _package_Types_Enum_create_handle_nullable(_handle);
  package_Types_Enum_releaseFfiHandle(_handle);
  return result;
}
Enum package_Types_Enum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _package_Types_Enum_get_value_nullable(handle);
  final result = package_Types_Enum_fromFfi(_handle);
  package_Types_Enum_releaseFfiHandle(_handle);
  return result;
}
void package_Types_Enum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _package_Types_Enum_release_handle_nullable(handle);
// End of Enum "private" section.
class ExceptionException implements Exception {
  final Enum error;
  ExceptionException(this.error);
}
class Struct {
  Enum null;
  Struct(this.null);
  Struct.withDefaults()
    : null = Enum.naN;
}
// Struct "private" section, not exported.
final _package_Types_Struct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_package_Types_Struct_create_handle');
final _package_Types_Struct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Types_Struct_release_handle');
final _package_Types_Struct_get_field_null = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_package_Types_Struct_get_field_null');
Pointer<Void> package_Types_Struct_toFfi(Struct value) {
  final _null_handle = package_Types_Enum_toFfi(value.null);
  final _result = _package_Types_Struct_create_handle(_null_handle);
  package_Types_Enum_releaseFfiHandle(_null_handle);
  return _result;
}
Struct package_Types_Struct_fromFfi(Pointer<Void> handle) {
  final _null_handle = _package_Types_Struct_get_field_null(handle);
  final _result = Struct(
    package_Types_Enum_fromFfi(_null_handle)
  );
  package_Types_Enum_releaseFfiHandle(_null_handle);
  return _result;
}
void package_Types_Struct_releaseFfiHandle(Pointer<Void> handle) => _package_Types_Struct_release_handle(handle);
// Nullable Struct
final _package_Types_Struct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Types_Struct_create_handle_nullable');
final _package_Types_Struct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Types_Struct_release_handle_nullable');
final _package_Types_Struct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Types_Struct_get_value_nullable');
Pointer<Void> package_Types_Struct_toFfi_nullable(Struct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = package_Types_Struct_toFfi(value);
  final result = _package_Types_Struct_create_handle_nullable(_handle);
  package_Types_Struct_releaseFfiHandle(_handle);
  return result;
}
Struct package_Types_Struct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _package_Types_Struct_get_value_nullable(handle);
  final result = package_Types_Struct_fromFfi(_handle);
  package_Types_Struct_releaseFfiHandle(_handle);
  return result;
}
void package_Types_Struct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _package_Types_Struct_release_handle_nullable(handle);
// End of Struct "private" section.
final Enum Const = Enum.naN;
