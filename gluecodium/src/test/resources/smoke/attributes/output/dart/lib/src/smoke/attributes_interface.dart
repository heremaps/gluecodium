import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
@OnInterface
abstract class AttributesInterface {
  factory AttributesInterface(
    void Function(String) veryFunLambda,
    String Function() propGetLambda,
    void Function(String) propSetLambda
  ) => AttributesInterface$Lambdas(
    veryFunLambda,
    propGetLambda,
    propSetLambda
  );
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
  @OnConstInInterface
  static final bool pi = false;
  @OnFunctionInInterface
  void veryFun(@OnParameterInInterface String param);
  @OnPropertyInInterface
  String get prop;
  @OnPropertyInInterface
  set prop(String value);
}
// AttributesInterface "private" section, not exported.
final _smokeAttributesinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_AttributesInterface_register_finalizer'));
final _smokeAttributesinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesInterface_copy_handle'));
final _smokeAttributesinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesInterface_release_handle'));
final _smokeAttributesinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('library_smoke_AttributesInterface_create_proxy'));
final _smokeAttributesinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesInterface_get_type_id'));
class AttributesInterface$Lambdas implements AttributesInterface {
  void Function(String) veryFunLambda;
  String Function() propGetLambda;
  void Function(String) propSetLambda;
  AttributesInterface$Lambdas(
    this.veryFunLambda,
    this.propGetLambda,
    this.propSetLambda
  );
  @override
  void release() {}
  @override
  void veryFun(@OnParameterInInterface String param) =>
    veryFunLambda(param);
  @override
  String get prop => propGetLambda();
  @override
  set prop(String value) => propSetLambda(value);
}
class AttributesInterface$Impl extends __lib.NativeBase implements AttributesInterface {
  AttributesInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  void veryFun(@OnParameterInInterface String param) {
    final _veryFunFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesInterface_veryFun__String'));
    final _paramHandle = stringToFfi(param);
    final _handle = this.handle;
    final __resultHandle = _veryFunFfi(_handle, __lib.LibraryContext.isolateId, _paramHandle);
    stringReleaseFfiHandle(_paramHandle);
    try {
      return (__resultHandle);
    } finally {
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
    }
  }
}
int _smokeAttributesinterfaceveryFunStatic(Object _obj, Pointer<Void> param) {
  try {
    (_obj as AttributesInterface).veryFun(stringFromFfi(param));
  } finally {
    stringReleaseFfiHandle(param);
  }
  return 0;
}
int _smokeAttributesinterfacepropGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((_obj as AttributesInterface).prop);
  return 0;
}
int _smokeAttributesinterfacepropSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as AttributesInterface).prop =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeAttributesinterfaceToFfi(AttributesInterface value) {
  if (value is __lib.NativeBase) return _smokeAttributesinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeAttributesinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeAttributesinterfaceveryFunStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeAttributesinterfacepropGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokeAttributesinterfacepropSetStatic, __lib.unknownError)
  );
  return result;
}
AttributesInterface smokeAttributesinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is AttributesInterface) return instance as AttributesInterface;
  final _typeIdHandle = _smokeAttributesinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeAttributesinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : AttributesInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeAttributesinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeAttributesinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAttributesinterfaceReleaseHandle(handle);
Pointer<Void> smokeAttributesinterfaceToFfiNullable(AttributesInterface? value) =>
  value != null ? smokeAttributesinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
AttributesInterface? smokeAttributesinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeAttributesinterfaceFromFfi(handle) : null;
void smokeAttributesinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAttributesinterfaceReleaseHandle(handle);
// End of AttributesInterface "private" section.
