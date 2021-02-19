import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// This is some very useful interface.
/// @nodoc
abstract class ExcludedCommentsInterface {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
}
// ExcludedCommentsInterface "private" section, not exported.
final _smoke_ExcludedCommentsInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_copy_handle'));
final _smoke_ExcludedCommentsInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_release_handle'));
final _smoke_ExcludedCommentsInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle),
    Pointer<Void> Function(int, int, Object)
  >('library_smoke_ExcludedCommentsInterface_create_proxy'));
final _smoke_ExcludedCommentsInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_get_type_id'));
class ExcludedCommentsInterface$Impl implements ExcludedCommentsInterface {
  Pointer<Void> handle;
  ExcludedCommentsInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheInstance(handle);
    _smoke_ExcludedCommentsInterface_release_handle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_ExcludedCommentsInterface_toFfi(ExcludedCommentsInterface value) {
  if (value is ExcludedCommentsInterface$Impl) return _smoke_ExcludedCommentsInterface_copy_handle(value.handle);
  final result = _smoke_ExcludedCommentsInterface_create_proxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value
  );
  return result;
}
ExcludedCommentsInterface smoke_ExcludedCommentsInterface_fromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ExcludedCommentsInterface) return instance as ExcludedCommentsInterface;
  final _type_id_handle = _smoke_ExcludedCommentsInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_ExcludedCommentsInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : ExcludedCommentsInterface$Impl(_copied_handle);
  __lib.cacheInstance(_copied_handle, result);
  return result;
}
void smoke_ExcludedCommentsInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ExcludedCommentsInterface_release_handle(handle);
Pointer<Void> smoke_ExcludedCommentsInterface_toFfi_nullable(ExcludedCommentsInterface value) =>
  value != null ? smoke_ExcludedCommentsInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ExcludedCommentsInterface smoke_ExcludedCommentsInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ExcludedCommentsInterface_fromFfi(handle) : null;
void smoke_ExcludedCommentsInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExcludedCommentsInterface_release_handle(handle);
// End of ExcludedCommentsInterface "private" section.
