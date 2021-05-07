import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class EquatableInterface {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
}
// EquatableInterface "private" section, not exported.
final _smoke_EquatableInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableInterface_copy_handle'));
final _smoke_EquatableInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EquatableInterface_release_handle'));
final _smoke_EquatableInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer),
    Pointer<Void> Function(int, int, Pointer)
  >('library_smoke_EquatableInterface_create_proxy'));
final __are_equal = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_EquatableInterface_are_equal'));final _smoke_EquatableInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableInterface_get_type_id'));
class EquatableInterface$Impl extends __lib.NativeBase implements EquatableInterface {
  EquatableInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
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
  if (value is __lib.NativeBase) return _smoke_EquatableInterface_copy_handle((value as __lib.NativeBase).handle);
  final result = _smoke_EquatableInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi
  );
  return result;
}
EquatableInterface smoke_EquatableInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as EquatableInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_EquatableInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_EquatableInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : EquatableInterface$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
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
