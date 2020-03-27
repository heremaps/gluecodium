import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_library_init.dart' as __lib;
enum FreeEnum {
    foo,
    bar
}
// FreeEnum "private" section, not exported.
int smoke_FreeEnum_toFfi(FreeEnum value) {
  switch (value) {
  case FreeEnum.foo:
    return 0;
  break;
  case FreeEnum.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for FreeEnum enum.");
  }
}
FreeEnum smoke_FreeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return FreeEnum.foo;
  break;
  case 1:
    return FreeEnum.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for FreeEnum enum.");
  }
}
void smoke_FreeEnum_releaseFfiHandle(int handle) {}
final _smoke_FreeEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_FreeEnum_create_handle_nullable');
final _smoke_FreeEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FreeEnum_release_handle_nullable');
final _smoke_FreeEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FreeEnum_get_value_nullable');
Pointer<Void> smoke_FreeEnum_toFfi_nullable(FreeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_FreeEnum_toFfi(value);
  final result = _smoke_FreeEnum_create_handle_nullable(_handle);
  smoke_FreeEnum_releaseFfiHandle(_handle);
  return result;
}
FreeEnum smoke_FreeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_FreeEnum_get_value_nullable(handle);
  final result = smoke_FreeEnum_fromFfi(_handle);
  smoke_FreeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_FreeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_FreeEnum_release_handle_nullable(handle);
// End of FreeEnum "private" section.
