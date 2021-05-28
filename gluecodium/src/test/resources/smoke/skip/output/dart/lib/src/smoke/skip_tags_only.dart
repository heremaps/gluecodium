import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
abstract class SkipTagsOnly {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
}
// SkipTagsOnly "private" section, not exported.
final _smokeSkiptagsonlyRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SkipTagsOnly_register_finalizer'));
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
  void release() {}
}
Pointer<Void> smokeSkiptagsonlyToFfi(SkipTagsOnly value) =>
  _smokeSkiptagsonlyCopyHandle((value as __lib.NativeBase).handle);
SkipTagsOnly smokeSkiptagsonlyFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SkipTagsOnly) return instance as SkipTagsOnly;
  final _copiedHandle = _smokeSkiptagsonlyCopyHandle(handle);
  final result = SkipTagsOnly$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeSkiptagsonlyRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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
