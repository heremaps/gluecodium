import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@OnEnumeration
enum AttributesEnum {
    @OnEnumerator
    nope
}
// AttributesEnum "private" section, not exported.
int smokeAttributesenumToFfi(AttributesEnum value) {
  switch (value) {
  case AttributesEnum.nope:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for AttributesEnum enum.");
  }
}
AttributesEnum smokeAttributesenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return AttributesEnum.nope;
  break;
  default:
    throw StateError("Invalid numeric value $handle for AttributesEnum enum.");
  }
}
void smokeAttributesenumReleaseFfiHandle(int handle) {}
final _smokeAttributesenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_AttributesEnum_create_handle_nullable'));
final _smokeAttributesenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesEnum_release_handle_nullable'));
final _smokeAttributesenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_AttributesEnum_get_value_nullable'));
Pointer<Void> smokeAttributesenumToFfiNullable(AttributesEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeAttributesenumToFfi(value);
  final result = _smokeAttributesenumCreateHandleNullable(_handle);
  smokeAttributesenumReleaseFfiHandle(_handle);
  return result;
}
AttributesEnum? smokeAttributesenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeAttributesenumGetValueNullable(handle);
  final result = smokeAttributesenumFromFfi(_handle);
  smokeAttributesenumReleaseFfiHandle(_handle);
  return result;
}
void smokeAttributesenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAttributesenumReleaseHandleNullable(handle);
// End of AttributesEnum "private" section.
