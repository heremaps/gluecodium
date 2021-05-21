import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
enum EnumStartsWithOne {
    first,
    second
}
// EnumStartsWithOne "private" section, not exported.
int smokeEnumstartswithoneToFfi(EnumStartsWithOne value) {
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
EnumStartsWithOne smokeEnumstartswithoneFromFfi(int handle) {
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
void smokeEnumstartswithoneReleaseFfiHandle(int handle) {}
final _smokeEnumstartswithoneCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_EnumStartsWithOne_create_handle_nullable'));
final _smokeEnumstartswithoneReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumStartsWithOne_release_handle_nullable'));
final _smokeEnumstartswithoneGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_EnumStartsWithOne_get_value_nullable'));
Pointer<Void> smokeEnumstartswithoneToFfiNullable(EnumStartsWithOne value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumstartswithoneToFfi(value);
  final result = _smokeEnumstartswithoneCreateHandleNullable(_handle);
  smokeEnumstartswithoneReleaseFfiHandle(_handle);
  return result;
}
EnumStartsWithOne smokeEnumstartswithoneFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumstartswithoneGetValueNullable(handle);
  final result = smokeEnumstartswithoneFromFfi(_handle);
  smokeEnumstartswithoneReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumstartswithoneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumstartswithoneReleaseHandleNullable(handle);
// End of EnumStartsWithOne "private" section.
