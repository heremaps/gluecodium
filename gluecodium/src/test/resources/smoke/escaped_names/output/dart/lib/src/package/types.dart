import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
class Types {
  static final Types_Enum Const = Types_Enum.naN;
}
enum Types_Enum {
    naN
}
// Types_Enum "private" section, not exported.
int packageTypesEnumToFfi(Types_Enum value) {
  switch (value) {
  case Types_Enum.naN:
    return 0;
  default:
    throw StateError("Invalid enum value $value for Types_Enum enum.");
  }
}
Types_Enum packageTypesEnumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Types_Enum.naN;
  default:
    throw StateError("Invalid numeric value $handle for Types_Enum enum.");
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
Pointer<Void> packageTypesEnumToFfiNullable(Types_Enum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = packageTypesEnumToFfi(value);
  final result = _packageTypesEnumCreateHandleNullable(_handle);
  packageTypesEnumReleaseFfiHandle(_handle);
  return result;
}
Types_Enum? packageTypesEnumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _packageTypesEnumGetValueNullable(handle);
  final result = packageTypesEnumFromFfi(_handle);
  packageTypesEnumReleaseFfiHandle(_handle);
  return result;
}
void packageTypesEnumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _packageTypesEnumReleaseHandleNullable(handle);
// End of Types_Enum "private" section.
class Types_ExceptionException implements Exception {
  final Types_Enum error;
  Types_ExceptionException(this.error);
}
class Types_Struct {
  Types_Enum null;
  Types_Struct._(this.null);
  Types_Struct()
    : null = Types_Enum.naN;
}
// Types_Struct "private" section, not exported.
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
Pointer<Void> packageTypesStructToFfi(Types_Struct value) {
  final _nullHandle = packageTypesEnumToFfi(value.null);
  final _result = _packageTypesStructCreateHandle(_nullHandle);
  packageTypesEnumReleaseFfiHandle(_nullHandle);
  return _result;
}
Types_Struct packageTypesStructFromFfi(Pointer<Void> handle) {
  final _nullHandle = _packageTypesStructGetFieldnull(handle);
  try {
    return Types_Struct._(
      packageTypesEnumFromFfi(_nullHandle)
    );
  } finally {
    packageTypesEnumReleaseFfiHandle(_nullHandle);
  }
}
void packageTypesStructReleaseFfiHandle(Pointer<Void> handle) => _packageTypesStructReleaseHandle(handle);
// Nullable Types_Struct
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
Pointer<Void> packageTypesStructToFfiNullable(Types_Struct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = packageTypesStructToFfi(value);
  final result = _packageTypesStructCreateHandleNullable(_handle);
  packageTypesStructReleaseFfiHandle(_handle);
  return result;
}
Types_Struct? packageTypesStructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _packageTypesStructGetValueNullable(handle);
  final result = packageTypesStructFromFfi(_handle);
  packageTypesStructReleaseFfiHandle(_handle);
  return result;
}
void packageTypesStructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _packageTypesStructReleaseHandleNullable(handle);
// End of Types_Struct "private" section.
// Types "private" section, not exported.
final _packageTypesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_package_Types_create_handle'));
final _packageTypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Types_release_handle'));
Pointer<Void> packageTypesToFfi(Types value) {
  final _result = _packageTypesCreateHandle();
  return _result;
}
Types packageTypesFromFfi(Pointer<Void> handle) {
  try {
    return Types(
    );
  } finally {
  }
}
void packageTypesReleaseFfiHandle(Pointer<Void> handle) => _packageTypesReleaseHandle(handle);
// Nullable Types
final _packageTypesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Types_create_handle_nullable'));
final _packageTypesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Types_release_handle_nullable'));
final _packageTypesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Types_get_value_nullable'));
Pointer<Void> packageTypesToFfiNullable(Types? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = packageTypesToFfi(value);
  final result = _packageTypesCreateHandleNullable(_handle);
  packageTypesReleaseFfiHandle(_handle);
  return result;
}
Types? packageTypesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _packageTypesGetValueNullable(handle);
  final result = packageTypesFromFfi(_handle);
  packageTypesReleaseFfiHandle(_handle);
  return result;
}
void packageTypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _packageTypesReleaseHandleNullable(handle);
// End of Types "private" section.
