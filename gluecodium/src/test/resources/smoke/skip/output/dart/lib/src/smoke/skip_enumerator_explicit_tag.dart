import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
enum SkipEnumeratorExplicitTag {
    zero,
    one,
    three
}
// SkipEnumeratorExplicitTag "private" section, not exported.
int smokeSkipenumeratorexplicittagToFfi(SkipEnumeratorExplicitTag value) {
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
SkipEnumeratorExplicitTag smokeSkipenumeratorexplicittagFromFfi(int handle) {
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
void smokeSkipenumeratorexplicittagReleaseFfiHandle(int handle) {}
final _smokeSkipenumeratorexplicittagCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_SkipEnumeratorExplicitTag_create_handle_nullable'));
final _smokeSkipenumeratorexplicittagReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipEnumeratorExplicitTag_release_handle_nullable'));
final _smokeSkipenumeratorexplicittagGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_SkipEnumeratorExplicitTag_get_value_nullable'));
Pointer<Void> smokeSkipenumeratorexplicittagToFfiNullable(SkipEnumeratorExplicitTag value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeSkipenumeratorexplicittagToFfi(value);
  final result = _smokeSkipenumeratorexplicittagCreateHandleNullable(_handle);
  smokeSkipenumeratorexplicittagReleaseFfiHandle(_handle);
  return result;
}
SkipEnumeratorExplicitTag smokeSkipenumeratorexplicittagFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeSkipenumeratorexplicittagGetValueNullable(handle);
  final result = smokeSkipenumeratorexplicittagFromFfi(_handle);
  smokeSkipenumeratorexplicittagReleaseFfiHandle(_handle);
  return result;
}
void smokeSkipenumeratorexplicittagReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkipenumeratorexplicittagReleaseHandleNullable(handle);
// End of SkipEnumeratorExplicitTag "private" section.

