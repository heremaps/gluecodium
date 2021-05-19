import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
enum FreeEnum {
    foo,
    bar
}
// FreeEnum "private" section, not exported.
int smokeFreeenumToFfi(FreeEnum value) {
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
FreeEnum smokeFreeenumFromFfi(int handle) {
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
void smokeFreeenumReleaseFfiHandle(int handle) {}
final _smokeFreeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_FreeEnum_create_handle_nullable'));
final _smokeFreeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FreeEnum_release_handle_nullable'));
final _smokeFreeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FreeEnum_get_value_nullable'));
Pointer<Void> smokeFreeenumToFfiNullable(FreeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFreeenumToFfi(value);
  final result = _smokeFreeenumCreateHandleNullable(_handle);
  smokeFreeenumReleaseFfiHandle(_handle);
  return result;
}
FreeEnum? smokeFreeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFreeenumGetValueNullable(handle);
  final result = smokeFreeenumFromFfi(_handle);
  smokeFreeenumReleaseFfiHandle(_handle);
  return result;
}
void smokeFreeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFreeenumReleaseHandleNullable(handle);
// End of FreeEnum "private" section.
