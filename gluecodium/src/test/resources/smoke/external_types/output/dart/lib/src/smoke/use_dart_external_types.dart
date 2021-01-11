import 'dart:math' as math;
import 'package:foo/bar.dart' as bar;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/smoke/http_client_response_compression_state.dart';
import 'package:library/src/smoke/int.dart';
import 'package:library/src/smoke/rectangle_int_.dart';
import 'package:library/src/smoke/string.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class UseDartExternalTypes {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static math.Rectangle<int> rectangleRoundTrip(math.Rectangle<int> input) => UseDartExternalTypes$Impl.rectangleRoundTrip(input);
  static bar.HttpClientResponseCompressionState compressionStateRoundTrip(bar.HttpClientResponseCompressionState input) => UseDartExternalTypes$Impl.compressionStateRoundTrip(input);
  static int colorRoundTrip(int input) => UseDartExternalTypes$Impl.colorRoundTrip(input);
  static String seasonRoundTrip(String input) => UseDartExternalTypes$Impl.seasonRoundTrip(input);
}
// UseDartExternalTypes "private" section, not exported.
final _smoke_UseDartExternalTypes_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseDartExternalTypes_copy_handle'));
final _smoke_UseDartExternalTypes_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseDartExternalTypes_release_handle'));
class UseDartExternalTypes$Impl implements UseDartExternalTypes {
  @protected
  Pointer<Void> handle;
  UseDartExternalTypes$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_UseDartExternalTypes_release_handle(handle);
    handle = null;
  }
  static math.Rectangle<int> rectangleRoundTrip(math.Rectangle<int> input) {
    final _rectangleRoundTrip_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_UseDartExternalTypes_rectangleRoundTrip__Rectangle'));
    final _input_handle = smoke_Rectangle_toFfi(input);
    final __result_handle = _rectangleRoundTrip_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_Rectangle_releaseFfiHandle(_input_handle);
    try {
      return smoke_Rectangle_fromFfi(__result_handle);
    } finally {
      smoke_Rectangle_releaseFfiHandle(__result_handle);
    }
  }
  static bar.HttpClientResponseCompressionState compressionStateRoundTrip(bar.HttpClientResponseCompressionState input) {
    final _compressionStateRoundTrip_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_UseDartExternalTypes_compressionStateRoundTrip__CompressionState'));
    final _input_handle = smoke_CompressionState_toFfi(input);
    final __result_handle = _compressionStateRoundTrip_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_CompressionState_releaseFfiHandle(_input_handle);
    try {
      return smoke_CompressionState_fromFfi(__result_handle);
    } finally {
      smoke_CompressionState_releaseFfiHandle(__result_handle);
    }
  }
  static int colorRoundTrip(int input) {
    final _colorRoundTrip_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_UseDartExternalTypes_colorRoundTrip__DartColor'));
    final _input_handle = smoke_DartColor_toFfi(input);
    final __result_handle = _colorRoundTrip_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_DartColor_releaseFfiHandle(_input_handle);
    try {
      return smoke_DartColor_fromFfi(__result_handle);
    } finally {
      smoke_DartColor_releaseFfiHandle(__result_handle);
    }
  }
  static String seasonRoundTrip(String input) {
    final _seasonRoundTrip_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_UseDartExternalTypes_seasonRoundTrip__DartSeason'));
    final _input_handle = smoke_DartSeason_toFfi(input);
    final __result_handle = _seasonRoundTrip_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_DartSeason_releaseFfiHandle(_input_handle);
    try {
      return smoke_DartSeason_fromFfi(__result_handle);
    } finally {
      smoke_DartSeason_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_UseDartExternalTypes_toFfi(UseDartExternalTypes value) =>
  _smoke_UseDartExternalTypes_copy_handle((value as UseDartExternalTypes$Impl).handle);
UseDartExternalTypes smoke_UseDartExternalTypes_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as UseDartExternalTypes;
  if (instance != null) return instance;
  final _copied_handle = _smoke_UseDartExternalTypes_copy_handle(handle);
  final result = UseDartExternalTypes$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_UseDartExternalTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_UseDartExternalTypes_release_handle(handle);
Pointer<Void> smoke_UseDartExternalTypes_toFfi_nullable(UseDartExternalTypes value) =>
  value != null ? smoke_UseDartExternalTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
UseDartExternalTypes smoke_UseDartExternalTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_UseDartExternalTypes_fromFfi(handle) : null;
void smoke_UseDartExternalTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_UseDartExternalTypes_release_handle(handle);
// End of UseDartExternalTypes "private" section.
