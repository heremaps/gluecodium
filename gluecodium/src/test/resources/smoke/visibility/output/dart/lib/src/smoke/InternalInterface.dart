import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_library_init.dart' as __lib;
abstract class InternalInterface {
  void release() {}
}
// InternalInterface "private" section, not exported.
final _smoke_InternalInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalInterface_copy_handle');
final _smoke_InternalInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalInterface_release_handle');
final _smoke_InternalInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer),
    Pointer<Void> Function(int, int, Pointer)
  >('library_smoke_InternalInterface_create_proxy');
final _smoke_InternalInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_InternalInterface_get_raw_pointer');
final _smoke_InternalInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalInterface_get_type_id');
class InternalInterface$Impl implements InternalInterface {
  final Pointer<Void> handle;
  InternalInterface$Impl(this.handle);
  @override
  void release() => _smoke_InternalInterface_release_handle(handle);
}
Pointer<Void> smoke_InternalInterface_toFfi(InternalInterface value) {
  if (value is InternalInterface$Impl) return _smoke_InternalInterface_copy_handle(value.handle);
  final result = _smoke_InternalInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi
  );
  __lib.reverseCache[_smoke_InternalInterface_get_raw_pointer(result)] = value;
  return result;
}
InternalInterface smoke_InternalInterface_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_InternalInterface_get_raw_pointer(handle)] as InternalInterface;
  if (instance != null) return instance;
  final _copied_handle = _smoke_InternalInterface_copy_handle(handle);
  final _type_id_handle = _smoke_InternalInterface_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? InternalInterface$Impl(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_InternalInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_InternalInterface_release_handle(handle);
Pointer<Void> smoke_InternalInterface_toFfi_nullable(InternalInterface value) =>
  value != null ? smoke_InternalInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
InternalInterface smoke_InternalInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InternalInterface_fromFfi(handle) : null;
void smoke_InternalInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_InternalInterface_release_handle(handle);
// End of InternalInterface "private" section.
