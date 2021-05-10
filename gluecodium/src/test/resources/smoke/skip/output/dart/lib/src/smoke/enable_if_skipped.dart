import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class EnableIfSkipped {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
// EnableIfSkipped "private" section, not exported.
final _smokeEnableifskippedCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnableIfSkipped_copy_handle'));
final _smokeEnableifskippedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnableIfSkipped_release_handle'));
class EnableIfSkipped$Impl extends __lib.NativeBase implements EnableIfSkipped {
  EnableIfSkipped$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeEnableifskippedReleaseHandle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_EnableIfSkipped_toFfi(EnableIfSkipped value) =>
  _smokeEnableifskippedCopyHandle((value as __lib.NativeBase).handle);
EnableIfSkipped smoke_EnableIfSkipped_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as EnableIfSkipped;
  if (instance != null) return instance;
  final _copiedHandle = _smokeEnableifskippedCopyHandle(handle);
  final result = EnableIfSkipped$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_EnableIfSkipped_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeEnableifskippedReleaseHandle(handle);
Pointer<Void> smoke_EnableIfSkipped_toFfi_nullable(EnableIfSkipped value) =>
  value != null ? smoke_EnableIfSkipped_toFfi(value) : Pointer<Void>.fromAddress(0);
EnableIfSkipped smoke_EnableIfSkipped_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_EnableIfSkipped_fromFfi(handle) : null;
void smoke_EnableIfSkipped_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeEnableifskippedReleaseHandle(handle);
// End of EnableIfSkipped "private" section.
