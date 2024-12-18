

import 'dart:ffi';
import 'package:foo/bar.dart' as bar;
import 'package:library/src/_library_context.dart' as __lib;


// HttpClientResponseCompressionState "private" section, not exported.

int smokeCompressionstateToFfi(bar.HttpClientResponseCompressionState value) {
  switch (value) {
  case bar.HttpClientResponseCompressionState.compressed:
    return 0;
  case bar.HttpClientResponseCompressionState.decompressed:
    return 1;
  case bar.HttpClientResponseCompressionState.notCompressed:
    return 2;
  }
}

bar.HttpClientResponseCompressionState smokeCompressionstateFromFfi(int handle) {
  switch (handle) {
  case 0:
    return bar.HttpClientResponseCompressionState.compressed;
  case 1:
    return bar.HttpClientResponseCompressionState.decompressed;
  case 2:
    return bar.HttpClientResponseCompressionState.notCompressed;
  default:
    throw StateError("Invalid numeric value $handle for HttpClientResponseCompressionState enum.");
  }
}

void smokeCompressionstateReleaseFfiHandle(int handle) {}

final _smokeCompressionstateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_CompressionState_create_handle_nullable'));
final _smokeCompressionstateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CompressionState_release_handle_nullable'));
final _smokeCompressionstateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CompressionState_get_value_nullable'));

Pointer<Void> smokeCompressionstateToFfiNullable(bar.HttpClientResponseCompressionState? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeCompressionstateToFfi(value);
  final result = _smokeCompressionstateCreateHandleNullable(_handle);
  smokeCompressionstateReleaseFfiHandle(_handle);
  return result;
}

bar.HttpClientResponseCompressionState? smokeCompressionstateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeCompressionstateGetValueNullable(handle);
  final result = smokeCompressionstateFromFfi(_handle);
  smokeCompressionstateReleaseFfiHandle(_handle);
  return result;
}

void smokeCompressionstateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCompressionstateReleaseHandleNullable(handle);

// End of HttpClientResponseCompressionState "private" section.


