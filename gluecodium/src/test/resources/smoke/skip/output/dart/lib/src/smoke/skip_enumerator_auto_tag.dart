import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
enum SkipEnumeratorAutoTag {
    one,
    three
}
// SkipEnumeratorAutoTag "private" section, not exported.
int smoke_SkipEnumeratorAutoTag_toFfi(SkipEnumeratorAutoTag value) {
  switch (value) {
  case SkipEnumeratorAutoTag.one:
    return 0;
  break;
  case SkipEnumeratorAutoTag.three:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for SkipEnumeratorAutoTag enum.");
  }
}
SkipEnumeratorAutoTag smoke_SkipEnumeratorAutoTag_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return SkipEnumeratorAutoTag.one;
  break;
  case 1:
    return SkipEnumeratorAutoTag.three;
  break;
  default:
    throw StateError("Invalid numeric value $handle for SkipEnumeratorAutoTag enum.");
  }
}
void smoke_SkipEnumeratorAutoTag_releaseFfiHandle(int handle) {}
final _smoke_SkipEnumeratorAutoTagCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_SkipEnumeratorAutoTag_create_handle_nullable'));
final _smoke_SkipEnumeratorAutoTagReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipEnumeratorAutoTag_release_handle_nullable'));
final _smoke_SkipEnumeratorAutoTagGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_SkipEnumeratorAutoTag_get_value_nullable'));
Pointer<Void> smoke_SkipEnumeratorAutoTag_toFfi_nullable(SkipEnumeratorAutoTag value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_SkipEnumeratorAutoTag_toFfi(value);
  final result = _smoke_SkipEnumeratorAutoTagCreateHandleNullable(_handle);
  smoke_SkipEnumeratorAutoTag_releaseFfiHandle(_handle);
  return result;
}
SkipEnumeratorAutoTag smoke_SkipEnumeratorAutoTag_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_SkipEnumeratorAutoTagGetValueNullable(handle);
  final result = smoke_SkipEnumeratorAutoTag_fromFfi(_handle);
  smoke_SkipEnumeratorAutoTag_releaseFfiHandle(_handle);
  return result;
}
void smoke_SkipEnumeratorAutoTag_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SkipEnumeratorAutoTagReleaseHandleNullable(handle);
// End of SkipEnumeratorAutoTag "private" section.
