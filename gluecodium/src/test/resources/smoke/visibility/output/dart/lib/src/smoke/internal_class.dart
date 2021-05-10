import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
abstract class InternalClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// @nodoc
  internal_fooBar();
}
// InternalClass "private" section, not exported.
final _smokeInternalclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClass_copy_handle'));
final _smokeInternalclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClass_release_handle'));
class InternalClass$Impl extends __lib.NativeBase implements InternalClass {
  InternalClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeInternalclassReleaseHandle(handle);
    handle = null;
  }
  @override
  internal_fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalClass_fooBar'));
    final _handle = this.handle;
    final __resultHandle = _fooBarFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_InternalClass_toFfi(InternalClass value) =>
  _smokeInternalclassCopyHandle((value as __lib.NativeBase).handle);
InternalClass smoke_InternalClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as InternalClass;
  if (instance != null) return instance;
  final _copiedHandle = _smokeInternalclassCopyHandle(handle);
  final result = InternalClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_InternalClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeInternalclassReleaseHandle(handle);
Pointer<Void> smoke_InternalClass_toFfi_nullable(InternalClass value) =>
  value != null ? smoke_InternalClass_toFfi(value) : Pointer<Void>.fromAddress(0);
InternalClass smoke_InternalClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InternalClass_fromFfi(handle) : null;
void smoke_InternalClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeInternalclassReleaseHandle(handle);
// End of InternalClass "private" section.
