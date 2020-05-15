import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class CollectionConstants {
  void release();
  static final List<String> listConstant = ["foo", "bar"];
  static final Set<String> setConstant = {"foo", "bar"};
  static final Map<String, String> mapConstant = {"foo": "bar"};
  static final Map<List<String>, Set<String>> mixedConstant = {["foo"]: {"bar"}};
}
// CollectionConstants "private" section, not exported.
final _smoke_CollectionConstants_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CollectionConstants_copy_handle');
final _smoke_CollectionConstants_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CollectionConstants_release_handle');
final _smoke_CollectionConstants_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_CollectionConstants_get_raw_pointer');
class CollectionConstants$Impl implements CollectionConstants {
  @protected
  Pointer<Void> handle;
  CollectionConstants$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_CollectionConstants_get_raw_pointer(handle));
    _smoke_CollectionConstants_release_handle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_CollectionConstants_toFfi(CollectionConstants value) =>
  _smoke_CollectionConstants_copy_handle((value as CollectionConstants$Impl).handle);
CollectionConstants smoke_CollectionConstants_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_CollectionConstants_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as CollectionConstants;
  if (instance != null) return instance;
  final _copied_handle = _smoke_CollectionConstants_copy_handle(handle);
  final result = CollectionConstants$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
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
