

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

abstract class Interface implements Finalizable {

}


// Interface "private" section, not exported.

final _packageInterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_package_Interface_register_finalizer'));
final _packageInterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Interface_copy_handle'));
final _packageInterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Interface_release_handle'));
final _packageInterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle),
    Pointer<Void> Function(int, int, Object)
  >('library_package_Interface_create_proxy'));
final _packageInterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Interface_get_type_id'));


class Interface$Impl extends __lib.NativeBase implements Interface {

  Interface$Impl(Pointer<Void> handle) : super(handle);


}



Pointer<Void> packageInterfaceToFfi(Interface value) {
  if (value is __lib.NativeBase) return _packageInterfaceCopyHandle((value as __lib.NativeBase).handle);

  final result = _packageInterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value
  );

  return result;
}

Interface packageInterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Interface) return instance;

  final _typeIdHandle = _packageInterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _packageInterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : Interface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _packageInterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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


