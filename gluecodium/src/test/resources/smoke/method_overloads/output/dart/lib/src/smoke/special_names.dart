import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
abstract class SpecialNames {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  create();
  reallyRelease();
  createProxy();
  Uppercase();
}
// SpecialNames "private" section, not exported.
final _smokeSpecialnamesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SpecialNames_register_finalizer'));
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
  void release() {}
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
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SpecialNames) return instance as SpecialNames;
  final _copiedHandle = _smokeSpecialnamesCopyHandle(handle);
  final result = SpecialNames$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeSpecialnamesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeSpecialnamesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSpecialnamesReleaseHandle(handle);
Pointer<Void> smokeSpecialnamesToFfiNullable(SpecialNames? value) =>
  value != null ? smokeSpecialnamesToFfi(value) : Pointer<Void>.fromAddress(0);
SpecialNames? smokeSpecialnamesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSpecialnamesFromFfi(handle) : null;
void smokeSpecialnamesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSpecialnamesReleaseHandle(handle);
// End of SpecialNames "private" section.
