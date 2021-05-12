import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@OnInterface
abstract class AttributesInterface {
  AttributesInterface();
  factory AttributesInterface.fromLambdas({
    @required void Function(String) lambda_veryFun,
    @required String Function() lambda_prop_get,
    @required void Function(String) lambda_prop_set
  }) => AttributesInterface$Lambdas(
    lambda_veryFun,
    lambda_prop_get,
    lambda_prop_set
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  @OnConstInInterface
  static final bool pi = false;
  @OnFunctionInInterface
  veryFun(@OnParameterInInterface String param);
  @OnPropertyInInterface
  String get prop;
  @OnPropertyInInterface
  set prop(String value);
}
// AttributesInterface "private" section, not exported.
final _smokeAttributesinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesInterface_copy_handle'));
final _smokeAttributesinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesInterface_release_handle'));
final _smokeAttributesinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_AttributesInterface_create_proxy'));
final _smokeAttributesinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesInterface_get_type_id'));
class AttributesInterface$Lambdas implements AttributesInterface {
  void Function(String) lambda_veryFun;
  String Function() lambda_prop_get;
  void Function(String) lambda_prop_set;
  AttributesInterface$Lambdas(
    this.lambda_veryFun,
    this.lambda_prop_get,
    this.lambda_prop_set
  );
  @override
  void release() {}
  @override
  veryFun(@OnParameterInInterface String param) =>
    lambda_veryFun(param);
  @override
  String get prop => lambda_prop_get();
  @override
  set prop(String value) => lambda_prop_set(value);
}
class AttributesInterface$Impl extends __lib.NativeBase implements AttributesInterface {
  AttributesInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeAttributesinterfaceReleaseHandle(handle);
    handle = null;
  }
  @override
  veryFun(@OnParameterInInterface String param) {
    final _veryFunFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesInterface_veryFun__String'));
    final _paramHandle = stringToFfi(param);
    final _handle = this.handle;
    final __resultHandle = _veryFunFfi(_handle, __lib.LibraryContext.isolateId, _paramHandle);
    stringReleaseFfiHandle(_paramHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @OnPropertyInInterface
  String get prop {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_AttributesInterface_prop_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @OnPropertyInInterface
  set prop(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesInterface_prop_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _AttributesInterfaceveryFunStatic(int _token, Pointer<Void> param) {
  try {
    (__lib.instanceCache[_token] as AttributesInterface).veryFun(stringFromFfi(param));
  } finally {
    stringReleaseFfiHandle(param);
  }
  return 0;
}
int _AttributesInterfacepropGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((__lib.instanceCache[_token] as AttributesInterface).prop);
  return 0;
}
int _AttributesInterfacepropSetStatic(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as AttributesInterface).prop =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeAttributesinterfaceToFfi(AttributesInterface value) {
  if (value is __lib.NativeBase) return _smokeAttributesinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeAttributesinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_AttributesInterfaceveryFunStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_AttributesInterfacepropGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_AttributesInterfacepropSetStatic, __lib.unknownError)
  );
  return result;
}
AttributesInterface smokeAttributesinterfaceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as AttributesInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeAttributesinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeAttributesinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : AttributesInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeAttributesinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAttributesinterfaceReleaseHandle(handle);
Pointer<Void> smokeAttributesinterfaceToFfiNullable(AttributesInterface value) =>
  value != null ? smokeAttributesinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
AttributesInterface smokeAttributesinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeAttributesinterfaceFromFfi(handle) : null;
void smokeAttributesinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAttributesinterfaceReleaseHandle(handle);
// End of AttributesInterface "private" section.
