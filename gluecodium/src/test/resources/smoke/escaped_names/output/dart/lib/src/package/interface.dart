import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Interface {
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
}
// Interface "private" section, not exported.
final _package_Interface_register_finalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_package_Interface_register_finalizer'));
final _package_Interface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Interface_copy_handle'));
final _package_Interface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Interface_release_handle'));
final _package_Interface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle),
    Pointer<Void> Function(int, int, Object)
  >('library_package_Interface_create_proxy'));
final _package_Interface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Interface_get_type_id'));
class Interface$Impl implements Interface {
  Pointer<Void> handle;
  Interface$Impl(this.handle);
  @override
  void release() {}
}
Pointer<Void> package_Interface_toFfi(Interface value) {
  if (value is Interface$Impl) return _package_Interface_copy_handle(value.handle);
  final result = _package_Interface_create_proxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value
  );
  return result;
}
Interface package_Interface_fromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Interface) return instance as Interface;
  final _type_id_handle = _package_Interface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _package_Interface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : Interface$Impl(_copied_handle);
  __lib.cacheInstance(_copied_handle, result, _package_Interface_register_finalizer);
  return result;
}
void package_Interface_releaseFfiHandle(Pointer<Void> handle) =>
  _package_Interface_release_handle(handle);
Pointer<Void> package_Interface_toFfi_nullable(Interface value) =>
  value != null ? package_Interface_toFfi(value) : Pointer<Void>.fromAddress(0);
Interface package_Interface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? package_Interface_fromFfi(handle) : null;
void package_Interface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _package_Interface_release_handle(handle);
// End of Interface "private" section.
