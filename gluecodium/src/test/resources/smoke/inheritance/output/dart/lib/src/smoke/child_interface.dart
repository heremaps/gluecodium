import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_interface.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ChildInterface implements ParentInterface {
  ChildInterface();
  factory ChildInterface.fromLambdas({
    @required void Function() lambda_rootMethod,
    @required void Function() lambda_childMethod,
    @required String Function() lambda_rootProperty_get,
    @required void Function(String) lambda_rootProperty_set
  }) => ChildInterface$Lambdas(
    lambda_rootMethod,
    lambda_childMethod,
    lambda_rootProperty_get,
    lambda_rootProperty_set
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  childMethod();
}
// ChildInterface "private" section, not exported.
final _smokeChildinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildInterface_copy_handle'));
final _smokeChildinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildInterface_release_handle'));
final _smokeChildinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ChildInterface_create_proxy'));
final _smokeChildinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildInterface_get_type_id'));
class ChildInterface$Lambdas implements ChildInterface {
  void Function() lambda_rootMethod;
  void Function() lambda_childMethod;
  String Function() lambda_rootProperty_get;
  void Function(String) lambda_rootProperty_set;
  ChildInterface$Lambdas(
    this.lambda_rootMethod,
    this.lambda_childMethod,
    this.lambda_rootProperty_get,
    this.lambda_rootProperty_set
  );
  @override
  void release() {}
  @override
  rootMethod() =>
    lambda_rootMethod();
  @override
  childMethod() =>
    lambda_childMethod();
  @override
  String get rootProperty => lambda_rootProperty_get();
  @override
  set rootProperty(String value) => lambda_rootProperty_set(value);
}
class ChildInterface$Impl extends __lib.NativeBase implements ChildInterface {
  ChildInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeChildinterfaceReleaseHandle(handle);
    handle = null;
  }
  @override
  rootMethod() {
    final _rootMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootMethod'));
    final _handle = this.handle;
    final __resultHandle = _rootMethodFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  childMethod() {
    final _childMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildInterface_childMethod'));
    final _handle = this.handle;
    final __resultHandle = _childMethodFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  String get rootProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
  set rootProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentInterface_rootProperty_set__String'));
    final _valueHandle = String_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    String_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _ChildInterface_rootMethod_static(int _token) {
  try {
    (__lib.instanceCache[_token] as ChildInterface).rootMethod();
  } finally {
  }
  return 0;
}
int _ChildInterface_childMethod_static(int _token) {
  try {
    (__lib.instanceCache[_token] as ChildInterface).childMethod();
  } finally {
  }
  return 0;
}
int _ChildInterface_rootProperty_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi((__lib.instanceCache[_token] as ChildInterface).rootProperty);
  return 0;
}
int _ChildInterface_rootProperty_set_static(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as ChildInterface).rootProperty =
      String_fromFfi(_value);
  } finally {
    String_releaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smoke_ChildInterface_toFfi(ChildInterface value) {
  if (value is __lib.NativeBase) return _smokeChildinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeChildinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64)>(_ChildInterface_rootMethod_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64)>(_ChildInterface_childMethod_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ChildInterface_rootProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_ChildInterface_rootProperty_set_static, __lib.unknownError)
  );
  return result;
}
ChildInterface smoke_ChildInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ChildInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeChildinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeChildinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ChildInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ChildInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeChildinterfaceReleaseHandle(handle);
Pointer<Void> smoke_ChildInterface_toFfi_nullable(ChildInterface value) =>
  value != null ? smoke_ChildInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ChildInterface smoke_ChildInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ChildInterface_fromFfi(handle) : null;
void smoke_ChildInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeChildinterfaceReleaseHandle(handle);
// End of ChildInterface "private" section.
