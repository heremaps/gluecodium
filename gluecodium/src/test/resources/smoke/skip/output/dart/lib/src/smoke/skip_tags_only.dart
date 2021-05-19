import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
abstract class SkipTagsOnly {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
// SkipTagsOnly "private" section, not exported.
final _smokeSkiptagsonlyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTagsOnly_copy_handle'));
final _smokeSkiptagsonlyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTagsOnly_release_handle'));
class SkipTagsOnly$Impl extends __lib.NativeBase implements SkipTagsOnly {
  SkipTagsOnly$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeSkiptagsonlyReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
}
Pointer<Void> smokeSkiptagsonlyToFfi(SkipTagsOnly value) =>
  _smokeSkiptagsonlyCopyHandle((value as __lib.NativeBase).handle);
SkipTagsOnly smokeSkiptagsonlyFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is SkipTagsOnly) return instance;
  final _copiedHandle = _smokeSkiptagsonlyCopyHandle(handle);
  final result = SkipTagsOnly$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeSkiptagsonlyReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSkiptagsonlyReleaseHandle(handle);
Pointer<Void> smokeSkiptagsonlyToFfiNullable(SkipTagsOnly? value) =>
  value != null ? smokeSkiptagsonlyToFfi(value) : Pointer<Void>.fromAddress(0);
SkipTagsOnly? smokeSkiptagsonlyFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSkiptagsonlyFromFfi(handle) : null;
void smokeSkiptagsonlyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkiptagsonlyReleaseHandle(handle);
// End of SkipTagsOnly "private" section.
