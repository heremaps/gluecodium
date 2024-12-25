

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;

enum SkipEnumeratorAutoTag {
    one,
    three
}

// SkipEnumeratorAutoTag "private" section, not exported.

int smokeSkipenumeratorautotagToFfi(SkipEnumeratorAutoTag value) {
  switch (value) {
  case SkipEnumeratorAutoTag.one:
    return 0;
  case SkipEnumeratorAutoTag.three:
    return 1;
  }
}

SkipEnumeratorAutoTag smokeSkipenumeratorautotagFromFfi(int handle) {
  switch (handle) {
  case 0:
    return SkipEnumeratorAutoTag.one;
  case 1:
    return SkipEnumeratorAutoTag.three;
  default:
    throw StateError("Invalid numeric value $handle for SkipEnumeratorAutoTag enum.");
  }
}

void smokeSkipenumeratorautotagReleaseFfiHandle(int handle) {}

final _smokeSkipenumeratorautotagCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_SkipEnumeratorAutoTag_create_handle_nullable'));
final _smokeSkipenumeratorautotagReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipEnumeratorAutoTag_release_handle_nullable'));
final _smokeSkipenumeratorautotagGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_SkipEnumeratorAutoTag_get_value_nullable'));

Pointer<Void> smokeSkipenumeratorautotagToFfiNullable(SkipEnumeratorAutoTag? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeSkipenumeratorautotagToFfi(value);
  final result = _smokeSkipenumeratorautotagCreateHandleNullable(_handle);
  smokeSkipenumeratorautotagReleaseFfiHandle(_handle);
  return result;
}

SkipEnumeratorAutoTag? smokeSkipenumeratorautotagFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeSkipenumeratorautotagGetValueNullable(handle);
  final result = smokeSkipenumeratorautotagFromFfi(_handle);
  smokeSkipenumeratorautotagReleaseFfiHandle(_handle);
  return result;
}

void smokeSkipenumeratorautotagReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkipenumeratorautotagReleaseHandleNullable(handle);

// End of SkipEnumeratorAutoTag "private" section.


