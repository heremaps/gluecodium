import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
abstract class SimpleClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  String getStringValue();
  SimpleClass useSimpleClass(SimpleClass input);
}
// SimpleClass "private" section, not exported.
final _smokeSimpleclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleClass_copy_handle'));
final _smokeSimpleclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleClass_release_handle'));
class SimpleClass$Impl extends __lib.NativeBase implements SimpleClass {
  SimpleClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeSimpleclassReleaseHandle(handle);
    handle = null;
  }
  @override
  String getStringValue() {
    final _getStringValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SimpleClass_getStringValue'));
    final _handle = this.handle;
    final __resultHandle = _getStringValueFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  SimpleClass useSimpleClass(SimpleClass input) {
    final _useSimpleClassFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SimpleClass_useSimpleClass__SimpleClass'));
    final _inputHandle = smokeSimpleclassToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _useSimpleClassFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smokeSimpleclassReleaseFfiHandle(_inputHandle);
    try {
      return smokeSimpleclassFromFfi(__resultHandle);
    } finally {
      smokeSimpleclassReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeSimpleclassToFfi(SimpleClass value) =>
  _smokeSimpleclassCopyHandle((value as __lib.NativeBase).handle);
SimpleClass smokeSimpleclassFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as SimpleClass;
  if (instance != null) return instance;
  final _copiedHandle = _smokeSimpleclassCopyHandle(handle);
  final result = SimpleClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeSimpleclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSimpleclassReleaseHandle(handle);
Pointer<Void> smokeSimpleclassToFfiNullable(SimpleClass value) =>
  value != null ? smokeSimpleclassToFfi(value) : Pointer<Void>.fromAddress(0);
SimpleClass smokeSimpleclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSimpleclassFromFfi(handle) : null;
void smokeSimpleclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSimpleclassReleaseHandle(handle);
// End of SimpleClass "private" section.
