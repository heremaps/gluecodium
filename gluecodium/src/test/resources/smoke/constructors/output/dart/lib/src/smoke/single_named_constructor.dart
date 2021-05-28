import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
abstract class SingleNamedConstructor {
  factory SingleNamedConstructor.fooBar() => SingleNamedConstructor$Impl.fooBar();
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
// SingleNamedConstructor "private" section, not exported.
final _smokeSinglenamedconstructorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SingleNamedConstructor_copy_handle'));
final _smokeSinglenamedconstructorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SingleNamedConstructor_release_handle'));
class SingleNamedConstructor$Impl extends __lib.NativeBase implements SingleNamedConstructor {
  SingleNamedConstructor$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheInstance(handle);
    _smokeSinglenamedconstructorReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  SingleNamedConstructor$Impl.fooBar() : super(_fooBar()) {
    __lib.cacheInstance(handle, this);
  }
  static Pointer<Void> _fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_SingleNamedConstructor_create'));
    final __resultHandle = _fooBarFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }
}
Pointer<Void> smokeSinglenamedconstructorToFfi(SingleNamedConstructor value) =>
  _smokeSinglenamedconstructorCopyHandle((value as __lib.NativeBase).handle);
SingleNamedConstructor smokeSinglenamedconstructorFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SingleNamedConstructor) return instance as SingleNamedConstructor;
  final _copiedHandle = _smokeSinglenamedconstructorCopyHandle(handle);
  final result = SingleNamedConstructor$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  return result;
}
void smokeSinglenamedconstructorReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSinglenamedconstructorReleaseHandle(handle);
Pointer<Void> smokeSinglenamedconstructorToFfiNullable(SingleNamedConstructor? value) =>
  value != null ? smokeSinglenamedconstructorToFfi(value) : Pointer<Void>.fromAddress(0);
SingleNamedConstructor? smokeSinglenamedconstructorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSinglenamedconstructorFromFfi(handle) : null;
void smokeSinglenamedconstructorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSinglenamedconstructorReleaseHandle(handle);
// End of SingleNamedConstructor "private" section.
