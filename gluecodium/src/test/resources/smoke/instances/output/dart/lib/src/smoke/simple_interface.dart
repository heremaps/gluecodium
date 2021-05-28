import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
abstract class SimpleInterface {
  SimpleInterface();
  factory SimpleInterface.fromLambdas({
    required String Function() lambda_getStringValue,
    required SimpleInterface Function(SimpleInterface) lambda_useSimpleInterface,
  }) => SimpleInterface$Lambdas(
    lambda_getStringValue,
    lambda_useSimpleInterface,
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  String getStringValue();
  SimpleInterface useSimpleInterface(SimpleInterface input);
}
// SimpleInterface "private" section, not exported.
final _smokeSimpleinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_copy_handle'));
final _smokeSimpleinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_release_handle'));
final _smokeSimpleinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer)
  >('library_smoke_SimpleInterface_create_proxy'));
final _smokeSimpleinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_get_type_id'));
class SimpleInterface$Lambdas implements SimpleInterface {
  String Function() lambda_getStringValue;
  SimpleInterface Function(SimpleInterface) lambda_useSimpleInterface;
  SimpleInterface$Lambdas(
    this.lambda_getStringValue,
    this.lambda_useSimpleInterface,
  );
  @override
  void release() {}
  @override
  String getStringValue() =>
    lambda_getStringValue();
  @override
  SimpleInterface useSimpleInterface(SimpleInterface input) =>
    lambda_useSimpleInterface(input);
}
class SimpleInterface$Impl extends __lib.NativeBase implements SimpleInterface {
  SimpleInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeSimpleinterfaceReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
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
int _smokeSimpleinterfacegetStringValueStatic(int _token, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as SimpleInterface).getStringValue();
    _result.value = stringToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _smokeSimpleinterfaceuseSimpleInterfaceStatic(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  SimpleInterface? _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as SimpleInterface).useSimpleInterface(smokeSimpleinterfaceFromFfi(input));
    _result.value = smokeSimpleinterfaceToFfi(_resultObject);
  } finally {
    smokeSimpleinterfaceReleaseFfiHandle(input);
    _resultObject?.release();
  }
  return 0;
}
Pointer<Void> smokeSimpleinterfaceToFfi(SimpleInterface value) {
  if (value is __lib.NativeBase) return _smokeSimpleinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeSimpleinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_smokeSimpleinterfacegetStringValueStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_smokeSimpleinterfaceuseSimpleInterfaceStatic, __lib.unknownError)
  );
  return result;
}
SimpleInterface smokeSimpleinterfaceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is SimpleInterface) return instance;
  final _typeIdHandle = _smokeSimpleinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeSimpleinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SimpleInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
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
