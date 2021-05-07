import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
enum SkipEnumeratorExplicitTag {
    zero,
    one,
    three
}
// SkipEnumeratorExplicitTag "private" section, not exported.
int smoke_SkipEnumeratorExplicitTag_toFfi(SkipEnumeratorExplicitTag value) {
  switch (value) {
  case SkipEnumeratorExplicitTag.zero:
    return 0;
  break;
  case SkipEnumeratorExplicitTag.one:
    return 3;
  break;
  case SkipEnumeratorExplicitTag.three:
    return 4;
  break;
  default:
    throw StateError("Invalid enum value $value for SkipEnumeratorExplicitTag enum.");
  }
}
SkipEnumeratorExplicitTag smoke_SkipEnumeratorExplicitTag_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return SkipEnumeratorExplicitTag.zero;
  break;
  case 3:
    return SkipEnumeratorExplicitTag.one;
  break;
  case 4:
    return SkipEnumeratorExplicitTag.three;
  break;
  default:
    throw StateError("Invalid numeric value $handle for SkipEnumeratorExplicitTag enum.");
  }
}
void smoke_SkipEnumeratorExplicitTag_releaseFfiHandle(int handle) {}
final _smoke_SkipEnumeratorExplicitTag_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_SkipEnumeratorExplicitTag_create_handle_nullable'));
final _smoke_SkipEnumeratorExplicitTag_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipEnumeratorExplicitTag_release_handle_nullable'));
final _smoke_SkipEnumeratorExplicitTag_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_SkipEnumeratorExplicitTag_get_value_nullable'));
Pointer<Void> smoke_SkipEnumeratorExplicitTag_toFfi_nullable(SkipEnumeratorExplicitTag value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_SkipEnumeratorExplicitTag_toFfi(value);
  final result = _smoke_SkipEnumeratorExplicitTag_create_handle_nullable(_handle);
  smoke_SkipEnumeratorExplicitTag_releaseFfiHandle(_handle);
  return result;
}
SkipEnumeratorExplicitTag smoke_SkipEnumeratorExplicitTag_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_SkipEnumeratorExplicitTag_get_value_nullable(handle);
  final result = smoke_SkipEnumeratorExplicitTag_fromFfi(_handle);
  smoke_SkipEnumeratorExplicitTag_releaseFfiHandle(_handle);
  return result;
}
void smoke_SkipEnumeratorExplicitTag_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SkipEnumeratorExplicitTag_release_handle_nullable(handle);
// End of SkipEnumeratorExplicitTag "private" section.
