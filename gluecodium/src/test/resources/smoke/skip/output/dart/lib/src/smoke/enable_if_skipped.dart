import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
abstract class EnableIfSkipped {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
}
// EnableIfSkipped "private" section, not exported.
final _smokeEnableifskippedRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_EnableIfSkipped_register_finalizer'));
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
  void release() {}
}
Pointer<Void> smokeEnableifskippedToFfi(EnableIfSkipped value) =>
  _smokeEnableifskippedCopyHandle((value as __lib.NativeBase).handle);
EnableIfSkipped smokeEnableifskippedFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is EnableIfSkipped) return instance;
  final _copiedHandle = _smokeEnableifskippedCopyHandle(handle);
  final result = EnableIfSkipped$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeEnableifskippedRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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
