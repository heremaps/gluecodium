import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class CollectionConstants {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  static final List<String> listConstant = ["foo", "bar"];
  static final Set<String> setConstant = {"foo", "bar"};
  static final Map<String, String> mapConstant = {"foo": "bar"};
  static final Map<List<String>, Set<String>> mixedConstant = {["foo"]: {"bar"}};
}
// CollectionConstants "private" section, not exported.
final _smoke_CollectionConstants_register_finalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CollectionConstants_register_finalizer'));
final _smoke_CollectionConstants_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CollectionConstants_copy_handle'));
final _smoke_CollectionConstants_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CollectionConstants_release_handle'));
class CollectionConstants$Impl implements CollectionConstants {
  @protected
  Pointer<Void> handle;
  CollectionConstants$Impl(this.handle);
  @override
  void release() {}
}
Pointer<Void> smoke_CollectionConstants_toFfi(CollectionConstants value) =>
  _smoke_CollectionConstants_copy_handle((value as CollectionConstants$Impl).handle);
CollectionConstants smoke_CollectionConstants_fromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CollectionConstants) return instance as CollectionConstants;
  final _copied_handle = _smoke_CollectionConstants_copy_handle(handle);
  final result = CollectionConstants$Impl(_copied_handle);
  __lib.cacheInstance(_copied_handle, result, _smoke_CollectionConstants_register_finalizer);
  return result;
}
void smoke_CollectionConstants_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_CollectionConstants_release_handle(handle);
Pointer<Void> smoke_CollectionConstants_toFfi_nullable(CollectionConstants value) =>
  value != null ? smoke_CollectionConstants_toFfi(value) : Pointer<Void>.fromAddress(0);
CollectionConstants smoke_CollectionConstants_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_CollectionConstants_fromFfi(handle) : null;
void smoke_CollectionConstants_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CollectionConstants_release_handle(handle);
// End of CollectionConstants "private" section.
