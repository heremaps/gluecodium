import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
enum EnumStartsWithOne {
    first,
    second
}
// EnumStartsWithOne "private" section, not exported.
int smoke_EnumStartsWithOne_toFfi(EnumStartsWithOne value) {
  switch (value) {
  case EnumStartsWithOne.first:
    return 1;
  break;
  case EnumStartsWithOne.second:
    return 2;
  break;
  default:
    throw StateError("Invalid enum value $value for EnumStartsWithOne enum.");
  }
}
EnumStartsWithOne smoke_EnumStartsWithOne_fromFfi(int handle) {
  switch (handle) {
  case 1:
    return EnumStartsWithOne.first;
  break;
  case 2:
    return EnumStartsWithOne.second;
  break;
  default:
    throw StateError("Invalid numeric value $handle for EnumStartsWithOne enum.");
  }
}
void smoke_EnumStartsWithOne_releaseFfiHandle(int handle) {}
final _smoke_EnumStartsWithOne_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_EnumStartsWithOne_create_handle_nullable'));
final _smoke_EnumStartsWithOne_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumStartsWithOne_release_handle_nullable'));
final _smoke_EnumStartsWithOne_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_EnumStartsWithOne_get_value_nullable'));
Pointer<Void> smoke_EnumStartsWithOne_toFfi_nullable(EnumStartsWithOne? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_EnumStartsWithOne_toFfi(value);
  final result = _smoke_EnumStartsWithOne_create_handle_nullable(_handle);
  smoke_EnumStartsWithOne_releaseFfiHandle(_handle);
  return result;
}
EnumStartsWithOne? smoke_EnumStartsWithOne_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_EnumStartsWithOne_get_value_nullable(handle);
  final result = smoke_EnumStartsWithOne_fromFfi(_handle);
  smoke_EnumStartsWithOne_releaseFfiHandle(_handle);
  return result;
}
void smoke_EnumStartsWithOne_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_EnumStartsWithOne_release_handle_nullable(handle);
// End of EnumStartsWithOne "private" section.
