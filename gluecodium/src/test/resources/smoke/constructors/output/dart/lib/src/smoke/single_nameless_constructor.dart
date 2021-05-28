import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
abstract class SingleNamelessConstructor {
  factory SingleNamelessConstructor() => SingleNamelessConstructor$Impl.create();
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
// SingleNamelessConstructor "private" section, not exported.
final _smokeSinglenamelessconstructorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SingleNamelessConstructor_copy_handle'));
final _smokeSinglenamelessconstructorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SingleNamelessConstructor_release_handle'));
class SingleNamelessConstructor$Impl extends __lib.NativeBase implements SingleNamelessConstructor {
  SingleNamelessConstructor$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheInstance(handle);
    _smokeSinglenamelessconstructorReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  SingleNamelessConstructor$Impl.create() : super(_create()) {
    __lib.cacheInstance(handle, this);
  }
  static Pointer<Void> _create() {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_SingleNamelessConstructor_create'));
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }
}
Pointer<Void> smokeSinglenamelessconstructorToFfi(SingleNamelessConstructor value) =>
  _smokeSinglenamelessconstructorCopyHandle((value as __lib.NativeBase).handle);
SingleNamelessConstructor smokeSinglenamelessconstructorFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SingleNamelessConstructor) return instance as SingleNamelessConstructor;
  final _copiedHandle = _smokeSinglenamelessconstructorCopyHandle(handle);
  final result = SingleNamelessConstructor$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  return result;
}
void smokeSinglenamelessconstructorReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSinglenamelessconstructorReleaseHandle(handle);
Pointer<Void> smokeSinglenamelessconstructorToFfiNullable(SingleNamelessConstructor? value) =>
  value != null ? smokeSinglenamelessconstructorToFfi(value) : Pointer<Void>.fromAddress(0);
SingleNamelessConstructor? smokeSinglenamelessconstructorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSinglenamelessconstructorFromFfi(handle) : null;
void smokeSinglenamelessconstructorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSinglenamelessconstructorReleaseHandle(handle);
// End of SingleNamelessConstructor "private" section.
