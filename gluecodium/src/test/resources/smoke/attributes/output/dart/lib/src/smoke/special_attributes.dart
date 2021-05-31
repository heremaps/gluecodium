import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
abstract class SpecialAttributes {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  @Deprecated("foo\nbar")
  withEscaping();
  @HackMerm -rf *
  withLineBreak();
}
// SpecialAttributes "private" section, not exported.
final _smokeSpecialattributesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SpecialAttributes_copy_handle'));
final _smokeSpecialattributesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SpecialAttributes_release_handle'));
class SpecialAttributes$Impl extends __lib.NativeBase implements SpecialAttributes {
  SpecialAttributes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheInstance(handle);
    _smokeSpecialattributesReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  withEscaping() {
    final _withEscapingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialAttributes_withEscaping'));
    final _handle = this.handle;
    final __resultHandle = _withEscapingFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  withLineBreak() {
    final _withLineBreakFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialAttributes_withLineBreak'));
    final _handle = this.handle;
    final __resultHandle = _withLineBreakFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
Pointer<Void> smokeSpecialattributesToFfi(SpecialAttributes value) =>
  _smokeSpecialattributesCopyHandle((value as __lib.NativeBase).handle);
SpecialAttributes smokeSpecialattributesFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SpecialAttributes) return instance as SpecialAttributes;
  final _copiedHandle = _smokeSpecialattributesCopyHandle(handle);
  final result = SpecialAttributes$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  return result;
}
void smokeSpecialattributesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSpecialattributesReleaseHandle(handle);
Pointer<Void> smokeSpecialattributesToFfiNullable(SpecialAttributes? value) =>
  value != null ? smokeSpecialattributesToFfi(value) : Pointer<Void>.fromAddress(0);
SpecialAttributes? smokeSpecialattributesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSpecialattributesFromFfi(handle) : null;
void smokeSpecialattributesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSpecialattributesReleaseHandle(handle);
// End of SpecialAttributes "private" section.
