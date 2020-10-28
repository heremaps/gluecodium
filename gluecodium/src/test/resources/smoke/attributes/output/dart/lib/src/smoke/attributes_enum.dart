import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@OnEnumeration
enum AttributesEnum {
    @OnEnumerator
    nope
}
// AttributesEnum "private" section, not exported.
int smoke_AttributesEnum_toFfi(AttributesEnum value) {
  switch (value) {
  case AttributesEnum.nope:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for AttributesEnum enum.");
  }
}
AttributesEnum smoke_AttributesEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return AttributesEnum.nope;
  break;
  default:
    throw StateError("Invalid numeric value $handle for AttributesEnum enum.");
  }
}
void smoke_AttributesEnum_releaseFfiHandle(int handle) {}
final _smoke_AttributesEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_AttributesEnum_create_handle_nullable'));
final _smoke_AttributesEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesEnum_release_handle_nullable'));
final _smoke_AttributesEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_AttributesEnum_get_value_nullable'));
Pointer<Void> smoke_AttributesEnum_toFfi_nullable(AttributesEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_AttributesEnum_toFfi(value);
  final result = _smoke_AttributesEnum_create_handle_nullable(_handle);
  smoke_AttributesEnum_releaseFfiHandle(_handle);
  return result;
}
AttributesEnum smoke_AttributesEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_AttributesEnum_get_value_nullable(handle);
  final result = smoke_AttributesEnum_fromFfi(_handle);
  smoke_AttributesEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_AttributesEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesEnum_release_handle_nullable(handle);
// End of AttributesEnum "private" section.
