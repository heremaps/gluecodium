import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
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
    if (handle.address == 0) return;
    __lib.uncacheInstance(handle);
    _smokeEnableifskippedReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
}
Pointer<Void> smokeEnableifskippedToFfi(EnableIfSkipped value) =>
  _smokeEnableifskippedCopyHandle((value as __lib.NativeBase).handle);
EnableIfSkipped smokeEnableifskippedFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is EnableIfSkipped) return instance as EnableIfSkipped;
  final _copiedHandle = _smokeEnableifskippedCopyHandle(handle);
  final result = EnableIfSkipped$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  return result;
}
void smokeEnableifskippedReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeEnableifskippedReleaseHandle(handle);
Pointer<Void> smokeEnableifskippedToFfiNullable(EnableIfSkipped? value) =>
  value != null ? smokeEnableifskippedToFfi(value) : Pointer<Void>.fromAddress(0);
EnableIfSkipped? smokeEnableifskippedFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeEnableifskippedFromFfi(handle) : null;
void smokeEnableifskippedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnableifskippedReleaseHandle(handle);
// End of EnableIfSkipped "private" section.
