import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
enum Enum {
    naN
}
// Enum "private" section, not exported.
int packageTypesEnumToFfi(Enum value) {
  switch (value) {
  case Enum.naN:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for Enum enum.");
  }
}
Enum packageTypesEnumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enum.naN;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Enum enum.");
  }
}
void packageTypesEnumReleaseFfiHandle(int handle) {}
final _packageTypesEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_package_Types_Enum_create_handle_nullable'));
final _packageTypesEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Types_Enum_release_handle_nullable'));
final _packageTypesEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_package_Types_Enum_get_value_nullable'));
Pointer<Void> packageTypesEnumToFfiNullable(Enum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = packageTypesEnumToFfi(value);
  final result = _packageTypesEnumCreateHandleNullable(_handle);
  packageTypesEnumReleaseFfiHandle(_handle);
  return result;
}
Enum packageTypesEnumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _packageTypesEnumGetValueNullable(handle);
  final result = packageTypesEnumFromFfi(_handle);
  packageTypesEnumReleaseFfiHandle(_handle);
  return result;
}
void packageTypesEnumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _packageTypesEnumReleaseHandleNullable(handle);
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
final _packageTypesStructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_package_Types_Struct_create_handle'));
final _packageTypesStructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Types_Struct_release_handle'));
final _packageTypesStructGetFieldnull = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_package_Types_Struct_get_field_null'));
Pointer<Void> packageTypesStructToFfi(Struct value) {
  final _nullHandle = packageTypesEnumToFfi(value.null);
  final _result = _packageTypesStructCreateHandle(_nullHandle);
  packageTypesEnumReleaseFfiHandle(_nullHandle);
  return _result;
}
Struct packageTypesStructFromFfi(Pointer<Void> handle) {
  final _nullHandle = _packageTypesStructGetFieldnull(handle);
  try {
    return Struct(
      packageTypesEnumFromFfi(_nullHandle)
    );
  } finally {
    packageTypesEnumReleaseFfiHandle(_nullHandle);
  }
}
void packageTypesStructReleaseFfiHandle(Pointer<Void> handle) => _packageTypesStructReleaseHandle(handle);
// Nullable Struct
final _packageTypesStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Types_Struct_create_handle_nullable'));
final _packageTypesStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Types_Struct_release_handle_nullable'));
final _packageTypesStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Types_Struct_get_value_nullable'));
Pointer<Void> packageTypesStructToFfiNullable(Struct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = packageTypesStructToFfi(value);
  final result = _packageTypesStructCreateHandleNullable(_handle);
  packageTypesStructReleaseFfiHandle(_handle);
  return result;
}
Struct packageTypesStructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _packageTypesStructGetValueNullable(handle);
  final result = packageTypesStructFromFfi(_handle);
  packageTypesStructReleaseFfiHandle(_handle);
  return result;
}
void packageTypesStructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _packageTypesStructReleaseHandleNullable(handle);
// End of Struct "private" section.
final Enum Const = Enum.naN;
