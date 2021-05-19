import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Interface {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
}
// Interface "private" section, not exported.
final _packageInterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Interface_copy_handle'));
final _packageInterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Interface_release_handle'));
final _packageInterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer),
    Pointer<Void> Function(int, int, Pointer)
  >('library_package_Interface_create_proxy'));
final _packageInterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Interface_get_type_id'));
class Interface$Impl extends __lib.NativeBase implements Interface {
  Interface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _packageInterfaceReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
}
Pointer<Void> packageInterfaceToFfi(Interface value) {
  if (value is __lib.NativeBase) return _packageInterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _packageInterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi
  );
  return result;
}
Interface packageInterfaceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is Interface) return instance;
  final _typeIdHandle = _packageInterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _packageInterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : Interface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void packageInterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _packageInterfaceReleaseHandle(handle);
Pointer<Void> packageInterfaceToFfiNullable(Interface? value) =>
  value != null ? packageInterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
Interface? packageInterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? packageInterfaceFromFfi(handle) : null;
void packageInterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _packageInterfaceReleaseHandle(handle);
// End of Interface "private" section.
