import 'dart:ffi';
import 'dart:math' as math;
import 'package:foo/bar.dart' as bar;
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/smoke/http_client_response_compression_state.dart';
import 'package:library/src/smoke/int.dart';
import 'package:library/src/smoke/rectangle_int_.dart';
import 'package:library/src/smoke/string.dart';
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
    final _inputHandle = smokeRectangleToFfi(input);
    final __resultHandle = _rectangleRoundTripFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeRectangleReleaseFfiHandle(_inputHandle);
    try {
      return smokeRectangleFromFfi(__resultHandle);
    } finally {
      smokeRectangleReleaseFfiHandle(__resultHandle);
    }
  }
  static bar.HttpClientResponseCompressionState compressionStateRoundTrip(bar.HttpClientResponseCompressionState input) {
    final _compressionStateRoundTripFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_UseDartExternalTypes_compressionStateRoundTrip__CompressionState'));
    final _inputHandle = smokeCompressionstateToFfi(input);
    final __resultHandle = _compressionStateRoundTripFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeCompressionstateReleaseFfiHandle(_inputHandle);
    try {
      return smokeCompressionstateFromFfi(__resultHandle);
    } finally {
      smokeCompressionstateReleaseFfiHandle(__resultHandle);
    }
  }
  static int colorRoundTrip(int input) {
    final _colorRoundTripFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_UseDartExternalTypes_colorRoundTrip__DartColor'));
    final _inputHandle = smokeDartcolorToFfi(input);
    final __resultHandle = _colorRoundTripFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeDartcolorReleaseFfiHandle(_inputHandle);
    try {
      return smokeDartcolorFromFfi(__resultHandle);
    } finally {
      smokeDartcolorReleaseFfiHandle(__resultHandle);
    }
  }
  static String seasonRoundTrip(String input) {
    final _seasonRoundTripFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_UseDartExternalTypes_seasonRoundTrip__DartSeason'));
    final _inputHandle = smokeDartseasonToFfi(input);
    final __resultHandle = _seasonRoundTripFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeDartseasonReleaseFfiHandle(_inputHandle);
    try {
      return smokeDartseasonFromFfi(__resultHandle);
    } finally {
      smokeDartseasonReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeUsedartexternaltypesToFfi(UseDartExternalTypes value) =>
  _smokeUsedartexternaltypesCopyHandle((value as __lib.NativeBase).handle);
UseDartExternalTypes smokeUsedartexternaltypesFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as UseDartExternalTypes;
  if (instance != null) return instance;
  final _copiedHandle = _smokeUsedartexternaltypesCopyHandle(handle);
  final result = UseDartExternalTypes$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeUsedartexternaltypesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeUsedartexternaltypesReleaseHandle(handle);
Pointer<Void> smokeUsedartexternaltypesToFfiNullable(UseDartExternalTypes value) =>
  value != null ? smokeUsedartexternaltypesToFfi(value) : Pointer<Void>.fromAddress(0);
UseDartExternalTypes smokeUsedartexternaltypesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeUsedartexternaltypesFromFfi(handle) : null;
void smokeUsedartexternaltypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeUsedartexternaltypesReleaseHandle(handle);
// End of UseDartExternalTypes "private" section.
