import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/free_enum.dart';
import 'package:library/src/smoke/free_exception.dart';
import 'package:library/src/smoke/free_point.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class UseFreeTypes {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  DateTime doStuff(FreePoint point, FreeEnum mode);
}
// UseFreeTypes "private" section, not exported.
final _smoke_UseFreeTypes_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_copy_handle'));
final _smoke_UseFreeTypes_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_release_handle'));
final _doStuff_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_release_handle'));
final _doStuff_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_get_result'));
final _doStuff_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_get_error'));
final _doStuff_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_has_error'));
class UseFreeTypes$Impl extends __lib.NativeBase implements UseFreeTypes {
  UseFreeTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_UseFreeTypes_release_handle(handle);
    handle = null;
  }
  @override
  DateTime doStuff(FreePoint point, FreeEnum mode) {
    final _doStuff_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum'));
    final _point_handle = smoke_FreePoint_toFfi(point);
    final _mode_handle = smoke_FreeEnum_toFfi(mode);
    final _handle = this.handle;
    final __call_result_handle = _doStuff_ffi(_handle, __lib.LibraryContext.isolateId, _point_handle, _mode_handle);
    smoke_FreePoint_releaseFfiHandle(_point_handle);
    smoke_FreeEnum_releaseFfiHandle(_mode_handle);
    if (_doStuff_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _doStuff_return_get_error(__call_result_handle);
        _doStuff_return_release_handle(__call_result_handle);
        try {
          throw FreeException(smoke_FreeEnum_fromFfi(__error_handle));
        } finally {
          smoke_FreeEnum_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _doStuff_return_get_result(__call_result_handle);
    _doStuff_return_release_handle(__call_result_handle);
    try {
      return Date_fromFfi(__result_handle);
    } finally {
      Date_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_UseFreeTypes_toFfi(UseFreeTypes value) =>
  _smoke_UseFreeTypes_copy_handle((value as __lib.NativeBase).handle);
UseFreeTypes smoke_UseFreeTypes_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as UseFreeTypes;
  if (instance != null) return instance;
  final _copied_handle = _smoke_UseFreeTypes_copy_handle(handle);
  final result = UseFreeTypes$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_UseFreeTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_UseFreeTypes_release_handle(handle);
Pointer<Void> smoke_UseFreeTypes_toFfi_nullable(UseFreeTypes value) =>
  value != null ? smoke_UseFreeTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
UseFreeTypes smoke_UseFreeTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_UseFreeTypes_fromFfi(handle) : null;
void smoke_UseFreeTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_UseFreeTypes_release_handle(handle);
// End of UseFreeTypes "private" section.
