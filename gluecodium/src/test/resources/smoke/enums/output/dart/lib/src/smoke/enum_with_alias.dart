import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
class EnumWithAlias {
  final int index;
  const EnumWithAlias._(this.index);

  static const one = EnumWithAlias._(0);
  static const two = EnumWithAlias._(1);
  static const three = EnumWithAlias._(2);
  static const first = EnumWithAlias.one;
}
// EnumWithAlias "private" section, not exported.
int smokeEnumwithaliasToFfi(EnumWithAlias value) {
  switch (value) {
  case EnumWithAlias.one:
    return 2;
  case EnumWithAlias.two:
    return 3;
  case EnumWithAlias.three:
    return 4;
  default:
    throw StateError("Invalid enum value $value for EnumWithAlias enum.");
  }
}
EnumWithAlias smokeEnumwithaliasFromFfi(int handle) {
  switch (handle) {
  case 2:
    return EnumWithAlias.one;
  case 3:
    return EnumWithAlias.two;
  case 4:
    return EnumWithAlias.three;
  default:
    throw StateError("Invalid numeric value $handle for EnumWithAlias enum.");
  }
}
void smokeEnumwithaliasReleaseFfiHandle(int handle) {}
final _smokeEnumwithaliasCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_EnumWithAlias_create_handle_nullable'));
final _smokeEnumwithaliasReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnumWithAlias_release_handle_nullable'));
final _smokeEnumwithaliasGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_EnumWithAlias_get_value_nullable'));
Pointer<Void> smokeEnumwithaliasToFfiNullable(EnumWithAlias? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumwithaliasToFfi(value);
  final result = _smokeEnumwithaliasCreateHandleNullable(_handle);
  smokeEnumwithaliasReleaseFfiHandle(_handle);
  return result;
}
EnumWithAlias? smokeEnumwithaliasFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumwithaliasGetValueNullable(handle);
  final result = smokeEnumwithaliasFromFfi(_handle);
  smokeEnumwithaliasReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumwithaliasReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumwithaliasReleaseHandleNullable(handle);
// End of EnumWithAlias "private" section.
