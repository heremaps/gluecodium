import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
abstract class InternalInterface {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
}
// InternalInterface "private" section, not exported.
final _smoke_InternalInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalInterface_copy_handle'));
final _smoke_InternalInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalInterface_release_handle'));
final _smoke_InternalInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer),
    Pointer<Void> Function(int, int, Pointer)
  >('library_smoke_InternalInterface_create_proxy'));
final _smoke_InternalInterface_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_InternalInterface_get_raw_pointer'));
final _smoke_InternalInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalInterface_get_type_id'));
class InternalInterface$Impl implements InternalInterface {
  @protected
  Pointer<Void> handle;
  InternalInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_InternalInterface_get_raw_pointer(handle));
    _smoke_InternalInterface_release_handle(handle);
    handle = null;
  }
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
  final raw_handle = _smoke_InternalInterface_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as InternalInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_InternalInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_InternalInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : InternalInterface$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
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
