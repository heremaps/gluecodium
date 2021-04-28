import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class CollectionConstants {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static final List<String> listConstant = ["foo", "bar"];
  static final Set<String> setConstant = {"foo", "bar"};
  static final Map<String, String> mapConstant = {"foo": "bar"};
  static final Map<List<String>, Set<String>> mixedConstant = {["foo"]: {"bar"}};
}
// CollectionConstants "private" section, not exported.
final _smoke_CollectionConstants_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CollectionConstants_copy_handle'));
final _smoke_CollectionConstants_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CollectionConstants_release_handle'));
class CollectionConstants$Impl extends __lib.NativeBase implements CollectionConstants {
  CollectionConstants$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_CollectionConstants_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
}
Pointer<Void> smoke_CollectionConstants_toFfi(CollectionConstants value) =>
  _smoke_CollectionConstants_copy_handle((value as __lib.NativeBase).handle);
CollectionConstants smoke_CollectionConstants_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is CollectionConstants) return instance;
  final _copied_handle = _smoke_CollectionConstants_copy_handle(handle);
  final result = CollectionConstants$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_CollectionConstants_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_CollectionConstants_release_handle(handle);
Pointer<Void> smoke_CollectionConstants_toFfi_nullable(CollectionConstants? value) =>
  value != null ? smoke_CollectionConstants_toFfi(value) : Pointer<Void>.fromAddress(0);
CollectionConstants? smoke_CollectionConstants_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_CollectionConstants_fromFfi(handle) : null;
void smoke_CollectionConstants_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CollectionConstants_release_handle(handle);
// End of CollectionConstants "private" section.
