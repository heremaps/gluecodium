import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_interface.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ChildClassFromInterface implements ParentInterface {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  childClassMethod();
}
// ChildClassFromInterface "private" section, not exported.
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
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeChildclassfrominterfaceReleaseHandle(handle);
    handle = null;
  }
  @override
  childClassMethod() {
    final _childClassMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildClassFromInterface_childClassMethod'));
    final _handle = this.handle;
    final __resultHandle = _childClassMethodFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  rootMethod() {
    final _rootMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootMethod'));
    final _handle = this.handle;
    final __resultHandle = _rootMethodFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  String get rootProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootProperty_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentInterface_rootProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
Pointer<Void> smokeChildclassfrominterfaceToFfi(ChildClassFromInterface value) =>
  _smokeChildclassfrominterfaceCopyHandle((value as __lib.NativeBase).handle);
ChildClassFromInterface smokeChildclassfrominterfaceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ChildClassFromInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeChildclassfrominterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeChildclassfrominterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ChildClassFromInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeChildclassfrominterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeChildclassfrominterfaceReleaseHandle(handle);
Pointer<Void> smokeChildclassfrominterfaceToFfiNullable(ChildClassFromInterface value) =>
  value != null ? smokeChildclassfrominterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
ChildClassFromInterface smokeChildclassfrominterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeChildclassfrominterfaceFromFfi(handle) : null;
void smokeChildclassfrominterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeChildclassfrominterfaceReleaseHandle(handle);
// End of ChildClassFromInterface "private" section.
