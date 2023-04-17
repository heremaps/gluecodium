import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_interface.dart';
abstract class ChildClassFromInterface implements ParentInterface {
  void childClassMethod();
}
// ChildClassFromInterface "private" section, not exported.
final _smokeChildclassfrominterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ChildClassFromInterface_register_finalizer'));
final _smokeChildclassfrominterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromInterface_copy_handle'));
final _smokeChildclassfrominterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildClassFromInterface_release_handle'));
final _smokeChildclassfrominterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromInterface_get_type_id'));
class ChildClassFromInterface$Impl extends __lib.NativeBase implements ChildClassFromInterface {
  ChildClassFromInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void childClassMethod() {
    final _childClassMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildClassFromInterface_childClassMethod'));
    final _handle = this.handle;
    _childClassMethodFfi(_handle, __lib.LibraryContext.isolateId);
  }
  @override
  void rootMethod() {
    final _rootMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildClassFromInterface_rootMethod'));
    final _handle = this.handle;
    _rootMethodFfi(_handle, __lib.LibraryContext.isolateId);
  }
  @override
  String get rootProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ChildClassFromInterface_rootProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set rootProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ChildClassFromInterface_rootProperty_set'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
}
Pointer<Void> smokeChildclassfrominterfaceToFfi(ChildClassFromInterface value) =>
  _smokeChildclassfrominterfaceCopyHandle((value as __lib.NativeBase).handle);
ChildClassFromInterface smokeChildclassfrominterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ChildClassFromInterface) return instance;
  final _typeIdHandle = _smokeChildclassfrominterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeChildclassfrominterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ChildClassFromInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeChildclassfrominterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeChildclassfrominterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeChildclassfrominterfaceReleaseHandle(handle);
Pointer<Void> smokeChildclassfrominterfaceToFfiNullable(ChildClassFromInterface? value) =>
  value != null ? smokeChildclassfrominterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
ChildClassFromInterface? smokeChildclassfrominterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeChildclassfrominterfaceFromFfi(handle) : null;
void smokeChildclassfrominterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeChildclassfrominterfaceReleaseHandle(handle);
// End of ChildClassFromInterface "private" section.
