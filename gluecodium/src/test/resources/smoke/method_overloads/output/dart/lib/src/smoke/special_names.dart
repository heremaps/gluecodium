import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
abstract class SpecialNames {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  create();
  reallyRelease();
  createProxy();
  Uppercase();
}
// SpecialNames "private" section, not exported.
final _smokeSpecialnamesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SpecialNames_copy_handle'));
final _smokeSpecialnamesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SpecialNames_release_handle'));
class SpecialNames$Impl extends __lib.NativeBase implements SpecialNames {
  SpecialNames$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeSpecialnamesReleaseHandle(handle);
    handle = null;
  }
  @override
  create() {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_create'));
    final _handle = this.handle;
    final __resultHandle = _createFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  reallyRelease() {
    final _reallyReleaseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_release'));
    final _handle = this.handle;
    final __resultHandle = _reallyReleaseFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  createProxy() {
    final _createProxyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_createProxy'));
    final _handle = this.handle;
    final __resultHandle = _createProxyFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  Uppercase() {
    final _UppercaseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_Uppercase'));
    final _handle = this.handle;
    final __resultHandle = _UppercaseFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
Pointer<Void> smokeSpecialnamesToFfi(SpecialNames value) =>
  _smokeSpecialnamesCopyHandle((value as __lib.NativeBase).handle);
SpecialNames smokeSpecialnamesFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as SpecialNames;
  if (instance != null) return instance;
  final _copiedHandle = _smokeSpecialnamesCopyHandle(handle);
  final result = SpecialNames$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeSpecialnamesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSpecialnamesReleaseHandle(handle);
Pointer<Void> smokeSpecialnamesToFfiNullable(SpecialNames value) =>
  value != null ? smokeSpecialnamesToFfi(value) : Pointer<Void>.fromAddress(0);
SpecialNames smokeSpecialnamesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSpecialnamesFromFfi(handle) : null;
void smokeSpecialnamesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSpecialnamesReleaseHandle(handle);
// End of SpecialNames "private" section.
