import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class SingleNamedConstructor {
  factory SingleNamedConstructor.fooBar() => SingleNamedConstructor$Impl.fooBar();
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
// SingleNamedConstructor "private" section, not exported.
final _smoke_SingleNamedConstructor_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SingleNamedConstructor_copy_handle'));
final _smoke_SingleNamedConstructor_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SingleNamedConstructor_release_handle'));
class SingleNamedConstructor$Impl extends __lib.NativeBase implements SingleNamedConstructor {
  SingleNamedConstructor$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_SingleNamedConstructor_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  SingleNamedConstructor$Impl.fooBar() : super(_fooBar()) {
    __lib.ffi_cache_token(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  static Pointer<Void> _fooBar() {
    final _fooBar_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_SingleNamedConstructor_create'));
    final __result_handle = _fooBar_ffi(__lib.LibraryContext.isolateId);
    return __result_handle;
  }
}
Pointer<Void> smoke_SingleNamedConstructor_toFfi(SingleNamedConstructor value) =>
  _smoke_SingleNamedConstructor_copy_handle((value as __lib.NativeBase).handle);
SingleNamedConstructor smoke_SingleNamedConstructor_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is SingleNamedConstructor) return instance;
  final _copied_handle = _smoke_SingleNamedConstructor_copy_handle(handle);
  final result = SingleNamedConstructor$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_SingleNamedConstructor_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SingleNamedConstructor_release_handle(handle);
Pointer<Void> smoke_SingleNamedConstructor_toFfi_nullable(SingleNamedConstructor? value) =>
  value != null ? smoke_SingleNamedConstructor_toFfi(value) : Pointer<Void>.fromAddress(0);
SingleNamedConstructor? smoke_SingleNamedConstructor_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SingleNamedConstructor_fromFfi(handle) : null;
void smoke_SingleNamedConstructor_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SingleNamedConstructor_release_handle(handle);
// End of SingleNamedConstructor "private" section.
