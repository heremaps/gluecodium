import 'package:foo/bar.dart' as bar;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
// HttpClientResponseCompressionState "private" section, not exported.
int smoke_CompressionState_toFfi(bar.HttpClientResponseCompressionState value) {
  switch (value) {
  case bar.HttpClientResponseCompressionState.compressed:
    return 0;
  break;
  case bar.HttpClientResponseCompressionState.decompressed:
    return 1;
  break;
  case bar.HttpClientResponseCompressionState.notCompressed:
    return 2;
  break;
  default:
    throw StateError("Invalid enum value $value for HttpClientResponseCompressionState enum.");
  }
}
bar.HttpClientResponseCompressionState smoke_CompressionState_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return bar.HttpClientResponseCompressionState.compressed;
  break;
  case 1:
    return bar.HttpClientResponseCompressionState.decompressed;
  break;
  case 2:
    return bar.HttpClientResponseCompressionState.notCompressed;
  break;
  default:
    throw StateError("Invalid numeric value $handle for HttpClientResponseCompressionState enum.");
  }
}
void smoke_CompressionState_releaseFfiHandle(int handle) {}
final _smoke_CompressionState_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_CompressionState_create_handle_nullable'));
final _smoke_CompressionState_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CompressionState_release_handle_nullable'));
final _smoke_CompressionState_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CompressionState_get_value_nullable'));
Pointer<Void> smoke_CompressionState_toFfi_nullable(bar.HttpClientResponseCompressionState? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_CompressionState_toFfi(value);
  final result = _smoke_CompressionState_create_handle_nullable(_handle);
  smoke_CompressionState_releaseFfiHandle(_handle);
  return result;
}
bar.HttpClientResponseCompressionState? smoke_CompressionState_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_CompressionState_get_value_nullable(handle);
  final result = smoke_CompressionState_fromFfi(_handle);
  smoke_CompressionState_releaseFfiHandle(_handle);
  return result;
}
void smoke_CompressionState_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CompressionState_release_handle_nullable(handle);
// End of HttpClientResponseCompressionState "private" section.
