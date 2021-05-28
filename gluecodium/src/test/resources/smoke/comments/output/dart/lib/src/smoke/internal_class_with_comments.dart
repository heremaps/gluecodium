import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
/// This looks internal
/// @nodoc
abstract class InternalClassWithComments {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// This is definitely internal
  ///
  /// @nodoc
  internal_doNothing();
}
// InternalClassWithComments "private" section, not exported.
final _smokeInternalclasswithcommentsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClassWithComments_copy_handle'));
final _smokeInternalclasswithcommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClassWithComments_release_handle'));
class InternalClassWithComments$Impl extends __lib.NativeBase implements InternalClassWithComments {
  InternalClassWithComments$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheInstance(handle);
    _smokeInternalclasswithcommentsReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  internal_doNothing() {
    final _doNothingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalClassWithComments_doNothing'));
    final _handle = this.handle;
    final __resultHandle = _doNothingFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
Pointer<Void> smokeInternalclasswithcommentsToFfi(InternalClassWithComments value) =>
  _smokeInternalclasswithcommentsCopyHandle((value as __lib.NativeBase).handle);
InternalClassWithComments smokeInternalclasswithcommentsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InternalClassWithComments) return instance as InternalClassWithComments;
  final _copiedHandle = _smokeInternalclasswithcommentsCopyHandle(handle);
  final result = InternalClassWithComments$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  return result;
}
void smokeInternalclasswithcommentsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeInternalclasswithcommentsReleaseHandle(handle);
Pointer<Void> smokeInternalclasswithcommentsToFfiNullable(InternalClassWithComments? value) =>
  value != null ? smokeInternalclasswithcommentsToFfi(value) : Pointer<Void>.fromAddress(0);
InternalClassWithComments? smokeInternalclasswithcommentsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeInternalclasswithcommentsFromFfi(handle) : null;
void smokeInternalclasswithcommentsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInternalclasswithcommentsReleaseHandle(handle);
// End of InternalClassWithComments "private" section.
