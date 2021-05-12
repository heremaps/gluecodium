import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/free_enum.dart';
import 'package:library/src/smoke/free_exception.dart';
import 'package:library/src/smoke/free_point.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class UseFreeTypes {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  DateTime doStuff(FreePoint point, FreeEnum mode);
}
// UseFreeTypes "private" section, not exported.
final _smokeUsefreetypesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_copy_handle'));
final _smokeUsefreetypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_release_handle'));
final _doStuffReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_release_handle'));
final _doStuffReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_get_result'));
final _doStuffReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_get_error'));
final _doStuffReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_has_error'));
class UseFreeTypes$Impl extends __lib.NativeBase implements UseFreeTypes {
  UseFreeTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeUsefreetypesReleaseHandle(handle);
    handle = null;
  }
  @override
  DateTime doStuff(FreePoint point, FreeEnum mode) {
    final _doStuffFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum'));
    final _pointHandle = smokeFreepointToFfi(point);
    final _modeHandle = smokeFreeenumToFfi(mode);
    final _handle = this.handle;
    final __callResultHandle = _doStuffFfi(_handle, __lib.LibraryContext.isolateId, _pointHandle, _modeHandle);
    smokeFreepointReleaseFfiHandle(_pointHandle);
    smokeFreeenumReleaseFfiHandle(_modeHandle);
    if (_doStuffReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _doStuffReturnGetError(__callResultHandle);
        _doStuffReturnReleaseHandle(__callResultHandle);
        try {
          throw FreeException(smokeFreeenumFromFfi(__errorHandle));
        } finally {
          smokeFreeenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _doStuffReturnGetResult(__callResultHandle);
    _doStuffReturnReleaseHandle(__callResultHandle);
    try {
      return dateFromFfi(__resultHandle);
    } finally {
      dateReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeUsefreetypesToFfi(UseFreeTypes value) =>
  _smokeUsefreetypesCopyHandle((value as __lib.NativeBase).handle);
UseFreeTypes smokeUsefreetypesFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as UseFreeTypes;
  if (instance != null) return instance;
  final _copiedHandle = _smokeUsefreetypesCopyHandle(handle);
  final result = UseFreeTypes$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeUsefreetypesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeUsefreetypesReleaseHandle(handle);
Pointer<Void> smokeUsefreetypesToFfiNullable(UseFreeTypes value) =>
  value != null ? smokeUsefreetypesToFfi(value) : Pointer<Void>.fromAddress(0);
UseFreeTypes smokeUsefreetypesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeUsefreetypesFromFfi(handle) : null;
void smokeUsefreetypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeUsefreetypesReleaseHandle(handle);
// End of UseFreeTypes "private" section.
