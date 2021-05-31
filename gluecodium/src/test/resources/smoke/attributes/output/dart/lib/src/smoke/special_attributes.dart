import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
abstract class SpecialAttributes {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  @Deprecated("foo\nbar")
  withEscaping();
  @HackMerm -rf *
  withLineBreak();
}
// SpecialAttributes "private" section, not exported.
final _smokeSpecialattributesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SpecialAttributes_register_finalizer'));
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
  void release() {}
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
  _smokeSpecialattributesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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
