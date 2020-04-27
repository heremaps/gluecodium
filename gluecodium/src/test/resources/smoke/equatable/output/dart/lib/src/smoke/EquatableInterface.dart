import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class EquatableInterface {
  void release() {}
}
// EquatableInterface "private" section, not exported.
final _smoke_EquatableInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableInterface_copy_handle');
final _smoke_EquatableInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EquatableInterface_release_handle');
final _smoke_EquatableInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer),
    Pointer<Void> Function(int, int, Pointer)
  >('library_smoke_EquatableInterface_create_proxy');
final _smoke_EquatableInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_EquatableInterface_get_raw_pointer');
final __are_equal = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_EquatableInterface_are_equal');final _smoke_EquatableInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableInterface_get_type_id');
class EquatableInterface$Impl implements EquatableInterface {
  @protected
  Pointer<Void> handle;
  EquatableInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_EquatableInterface_get_raw_pointer(handle));
    _smoke_EquatableInterface_release_handle(handle);
    handle = null;
  }
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EquatableInterface$Impl) return false;
    return __are_equal((this as EquatableInterface$Impl).handle, other.handle) != 0;
  }
}
Pointer<Void> smoke_EquatableInterface_toFfi(EquatableInterface value) {
  if (value is EquatableInterface$Impl) return _smoke_EquatableInterface_copy_handle(value.handle);
  final result = _smoke_EquatableInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi
  );
  __lib.reverseCache[_smoke_EquatableInterface_get_raw_pointer(result)] = value;
  return result;
}
EquatableInterface smoke_EquatableInterface_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_EquatableInterface_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as EquatableInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_EquatableInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_EquatableInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : EquatableInterface$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_EquatableInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_EquatableInterface_release_handle(handle);
Pointer<Void> smoke_EquatableInterface_toFfi_nullable(EquatableInterface value) =>
  value != null ? smoke_EquatableInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
EquatableInterface smoke_EquatableInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_EquatableInterface_fromFfi(handle) : null;
void smoke_EquatableInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_EquatableInterface_release_handle(handle);
// End of EquatableInterface "private" section.
