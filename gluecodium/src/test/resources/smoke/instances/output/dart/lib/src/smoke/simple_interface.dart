import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
abstract class SimpleInterface {
  factory SimpleInterface(
    String Function() getStringValueLambda,
    SimpleInterface Function(SimpleInterface) useSimpleInterfaceLambda,
  ) => SimpleInterface$Lambdas(
    getStringValueLambda,
    useSimpleInterfaceLambda,
  );
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
  String getStringValue();
  SimpleInterface useSimpleInterface(SimpleInterface input);
}
// SimpleInterface "private" section, not exported.
final _smokeSimpleinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SimpleInterface_register_finalizer'));
final _smokeSimpleinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_copy_handle'));
final _smokeSimpleinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_release_handle'));
final _smokeSimpleinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_SimpleInterface_create_proxy'));
final _smokeSimpleinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_get_type_id'));
class SimpleInterface$Lambdas implements SimpleInterface {
  String Function() getStringValueLambda;
  SimpleInterface Function(SimpleInterface) useSimpleInterfaceLambda;
  SimpleInterface$Lambdas(
    this.getStringValueLambda,
    this.useSimpleInterfaceLambda,
  );
  @override
  void release() {}
  @override
  String getStringValue() =>
    getStringValueLambda();
  @override
  SimpleInterface useSimpleInterface(SimpleInterface input) =>
    useSimpleInterfaceLambda(input);
}
class SimpleInterface$Impl extends __lib.NativeBase implements SimpleInterface {
  SimpleInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  String getStringValue() {
    final _getStringValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SimpleInterface_getStringValue'));
    final _handle = this.handle;
    final __resultHandle = _getStringValueFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  SimpleInterface useSimpleInterface(SimpleInterface input) {
    final _useSimpleInterfaceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SimpleInterface_useSimpleInterface__SimpleInterface'));
    final _inputHandle = smokeSimpleinterfaceToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _useSimpleInterfaceFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    smokeSimpleinterfaceReleaseFfiHandle(_inputHandle);
    try {
      return smokeSimpleinterfaceFromFfi(__resultHandle);
    } finally {
      smokeSimpleinterfaceReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeSimpleinterfacegetStringValueStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (_obj as SimpleInterface).getStringValue();
    _result.value = stringToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _smokeSimpleinterfaceuseSimpleInterfaceStatic(Object _obj, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  SimpleInterface? _resultObject;
  try {
    _resultObject = (_obj as SimpleInterface).useSimpleInterface(smokeSimpleinterfaceFromFfi(input));
    _result.value = smokeSimpleinterfaceToFfi(_resultObject);
  } finally {
    smokeSimpleinterfaceReleaseFfiHandle(input);
  }
  return 0;
}
Pointer<Void> smokeSimpleinterfaceToFfi(SimpleInterface value) {
  if (value is __lib.NativeBase) return _smokeSimpleinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeSimpleinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeSimpleinterfacegetStringValueStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Pointer<Void>>)>(_smokeSimpleinterfaceuseSimpleInterfaceStatic, __lib.unknownError)
  );
  return result;
}
SimpleInterface smokeSimpleinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SimpleInterface) return instance as SimpleInterface;
  final _typeIdHandle = _smokeSimpleinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeSimpleinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SimpleInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeSimpleinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeSimpleinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSimpleinterfaceReleaseHandle(handle);
Pointer<Void> smokeSimpleinterfaceToFfiNullable(SimpleInterface? value) =>
  value != null ? smokeSimpleinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
SimpleInterface? smokeSimpleinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSimpleinterfaceFromFfi(handle) : null;
void smokeSimpleinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSimpleinterfaceReleaseHandle(handle);
// End of SimpleInterface "private" section.
