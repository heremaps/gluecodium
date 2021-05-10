import 'dart:math' as math;
import 'package:foo/bar.dart' as bar;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/smoke/http_client_response_compression_state.dart';
import 'package:library/src/smoke/int.dart';
import 'package:library/src/smoke/rectangle_int_.dart';
import 'package:library/src/smoke/string.dart';
import 'dart:ffi';
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
final _smokeUsedartexternaltypesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseDartExternalTypes_copy_handle'));
final _smokeUsedartexternaltypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseDartExternalTypes_release_handle'));
class UseDartExternalTypes$Impl extends __lib.NativeBase implements UseDartExternalTypes {
  UseDartExternalTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeUsedartexternaltypesReleaseHandle(handle);
    handle = null;
  }
  static math.Rectangle<int> rectangleRoundTrip(math.Rectangle<int> input) {
    final _rectangleRoundTripFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_UseDartExternalTypes_rectangleRoundTrip__Rectangle'));
    final _inputHandle = smoke_Rectangle_toFfi(input);
    final __resultHandle = _rectangleRoundTripFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_Rectangle_releaseFfiHandle(_inputHandle);
    try {
      return smoke_Rectangle_fromFfi(__resultHandle);
    } finally {
      smoke_Rectangle_releaseFfiHandle(__resultHandle);
    }
  }
  static bar.HttpClientResponseCompressionState compressionStateRoundTrip(bar.HttpClientResponseCompressionState input) {
    final _compressionStateRoundTripFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_UseDartExternalTypes_compressionStateRoundTrip__CompressionState'));
    final _inputHandle = smoke_CompressionState_toFfi(input);
    final __resultHandle = _compressionStateRoundTripFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_CompressionState_releaseFfiHandle(_inputHandle);
    try {
      return smoke_CompressionState_fromFfi(__resultHandle);
    } finally {
      smoke_CompressionState_releaseFfiHandle(__resultHandle);
    }
  }
  static int colorRoundTrip(int input) {
    final _colorRoundTripFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_UseDartExternalTypes_colorRoundTrip__DartColor'));
    final _inputHandle = smoke_DartColor_toFfi(input);
    final __resultHandle = _colorRoundTripFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_DartColor_releaseFfiHandle(_inputHandle);
    try {
      return smoke_DartColor_fromFfi(__resultHandle);
    } finally {
      smoke_DartColor_releaseFfiHandle(__resultHandle);
    }
  }
  static String seasonRoundTrip(String input) {
    final _seasonRoundTripFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_UseDartExternalTypes_seasonRoundTrip__DartSeason'));
    final _inputHandle = smoke_DartSeason_toFfi(input);
    final __resultHandle = _seasonRoundTripFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_DartSeason_releaseFfiHandle(_inputHandle);
    try {
      return smoke_DartSeason_fromFfi(__resultHandle);
    } finally {
      smoke_DartSeason_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_UseDartExternalTypes_toFfi(UseDartExternalTypes value) =>
  _smokeUsedartexternaltypesCopyHandle((value as __lib.NativeBase).handle);
UseDartExternalTypes smoke_UseDartExternalTypes_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as UseDartExternalTypes;
  if (instance != null) return instance;
  final _copiedHandle = _smokeUsedartexternaltypesCopyHandle(handle);
  final result = UseDartExternalTypes$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_UseDartExternalTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeUsedartexternaltypesReleaseHandle(handle);
Pointer<Void> smoke_UseDartExternalTypes_toFfi_nullable(UseDartExternalTypes value) =>
  value != null ? smoke_UseDartExternalTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
UseDartExternalTypes smoke_UseDartExternalTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_UseDartExternalTypes_fromFfi(handle) : null;
void smoke_UseDartExternalTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeUsedartexternaltypesReleaseHandle(handle);
// End of UseDartExternalTypes "private" section.
