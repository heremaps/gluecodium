import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class SpecialNames {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  create();
  reallyRelease();
  createProxy();
  Uppercase();
}
// SpecialNames "private" section, not exported.
final _smoke_SpecialNames_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SpecialNames_copy_handle'));
final _smoke_SpecialNames_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SpecialNames_release_handle'));
final _smoke_SpecialNames_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_SpecialNames_get_raw_pointer'));
class SpecialNames$Impl implements SpecialNames {
  @protected
  Pointer<Void> handle;
  SpecialNames$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_SpecialNames_get_raw_pointer(handle));
    _smoke_SpecialNames_release_handle(handle);
    handle = null;
  }
  @override
  create() {
    final _create_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_create'));
    final _handle = this.handle;
    final __result_handle = _create_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  reallyRelease() {
    final _reallyRelease_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_release'));
    final _handle = this.handle;
    final __result_handle = _reallyRelease_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  createProxy() {
    final _createProxy_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_createProxy'));
    final _handle = this.handle;
    final __result_handle = _createProxy_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  Uppercase() {
    final _Uppercase_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SpecialNames_Uppercase'));
    final _handle = this.handle;
    final __result_handle = _Uppercase_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_SpecialNames_toFfi(SpecialNames value) =>
  _smoke_SpecialNames_copy_handle((value as SpecialNames$Impl).handle);
SpecialNames smoke_SpecialNames_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_SpecialNames_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle];
  if (instance is SpecialNames) return instance as SpecialNames;
  final _copied_handle = _smoke_SpecialNames_copy_handle(handle);
  final result = SpecialNames$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_SpecialNames_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SpecialNames_release_handle(handle);
Pointer<Void> smoke_SpecialNames_toFfi_nullable(SpecialNames value) =>
  value != null ? smoke_SpecialNames_toFfi(value) : Pointer<Void>.fromAddress(0);
SpecialNames smoke_SpecialNames_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SpecialNames_fromFfi(handle) : null;
void smoke_SpecialNames_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SpecialNames_release_handle(handle);
// End of SpecialNames "private" section.
