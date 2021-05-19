import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ExternalInterface {
  ExternalInterface();
  factory ExternalInterface.fromLambdas({
    required void Function(int) lambda_someMethod,
    required String Function() lambda_someProperty_get
  }) => ExternalInterface$Lambdas(
    lambda_someMethod,
    lambda_someProperty_get
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  someMethod(int someParameter);
  String get someProperty;
}
enum ExternalInterface_SomeEnum {
    someValue
}
// ExternalInterface_SomeEnum "private" section, not exported.
int smokeExternalinterfaceSomeenumToFfi(ExternalInterface_SomeEnum value) {
  switch (value) {
  case ExternalInterface_SomeEnum.someValue:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for ExternalInterface_SomeEnum enum.");
  }
}
ExternalInterface_SomeEnum smokeExternalinterfaceSomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExternalInterface_SomeEnum.someValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ExternalInterface_SomeEnum enum.");
  }
}
void smokeExternalinterfaceSomeenumReleaseFfiHandle(int handle) {}
final _smokeExternalinterfaceSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExternalInterface_SomeEnum_create_handle_nullable'));
final _smokeExternalinterfaceSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeEnum_release_handle_nullable'));
final _smokeExternalinterfaceSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeEnum_get_value_nullable'));
Pointer<Void> smokeExternalinterfaceSomeenumToFfiNullable(ExternalInterface_SomeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExternalinterfaceSomeenumToFfi(value);
  final result = _smokeExternalinterfaceSomeenumCreateHandleNullable(_handle);
  smokeExternalinterfaceSomeenumReleaseFfiHandle(_handle);
  return result;
}
ExternalInterface_SomeEnum? smokeExternalinterfaceSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExternalinterfaceSomeenumGetValueNullable(handle);
  final result = smokeExternalinterfaceSomeenumFromFfi(_handle);
  smokeExternalinterfaceSomeenumReleaseFfiHandle(_handle);
  return result;
}
void smokeExternalinterfaceSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExternalinterfaceSomeenumReleaseHandleNullable(handle);
// End of ExternalInterface_SomeEnum "private" section.
class ExternalInterface_SomeStruct {
  String someField;
  ExternalInterface_SomeStruct(this.someField);
}
// ExternalInterface_SomeStruct "private" section, not exported.
final _smokeExternalinterfaceSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_create_handle'));
final _smokeExternalinterfaceSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_release_handle'));
final _smokeExternalinterfaceSomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_get_field_someField'));
Pointer<Void> smokeExternalinterfaceSomestructToFfi(ExternalInterface_SomeStruct value) {
  final _someFieldHandle = stringToFfi(value.someField);
  final _result = _smokeExternalinterfaceSomestructCreateHandle(_someFieldHandle);
  stringReleaseFfiHandle(_someFieldHandle);
  return _result;
}
ExternalInterface_SomeStruct smokeExternalinterfaceSomestructFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeExternalinterfaceSomestructGetFieldsomeField(handle);
  try {
    return ExternalInterface_SomeStruct(
      stringFromFfi(_someFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_someFieldHandle);
  }
}
void smokeExternalinterfaceSomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeExternalinterfaceSomestructReleaseHandle(handle);
// Nullable ExternalInterface_SomeStruct
final _smokeExternalinterfaceSomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_create_handle_nullable'));
final _smokeExternalinterfaceSomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_release_handle_nullable'));
final _smokeExternalinterfaceSomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_get_value_nullable'));
Pointer<Void> smokeExternalinterfaceSomestructToFfiNullable(ExternalInterface_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExternalinterfaceSomestructToFfi(value);
  final result = _smokeExternalinterfaceSomestructCreateHandleNullable(_handle);
  smokeExternalinterfaceSomestructReleaseFfiHandle(_handle);
  return result;
}
ExternalInterface_SomeStruct? smokeExternalinterfaceSomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExternalinterfaceSomestructGetValueNullable(handle);
  final result = smokeExternalinterfaceSomestructFromFfi(_handle);
  smokeExternalinterfaceSomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeExternalinterfaceSomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExternalinterfaceSomestructReleaseHandleNullable(handle);
// End of ExternalInterface_SomeStruct "private" section.
// ExternalInterface "private" section, not exported.
final _smokeExternalinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_copy_handle'));
final _smokeExternalinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_release_handle'));
final _smokeExternalinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer)
  >('library_smoke_ExternalInterface_create_proxy'));
final _smokeExternalinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_get_type_id'));
class ExternalInterface$Lambdas implements ExternalInterface {
  void Function(int) lambda_someMethod;
  String Function() lambda_someProperty_get;
  ExternalInterface$Lambdas(
    this.lambda_someMethod,
    this.lambda_someProperty_get
  );
  @override
  void release() {}
  @override
  someMethod(int someParameter) =>
    lambda_someMethod(someParameter);
  @override
  String get someProperty => lambda_someProperty_get();
}
class ExternalInterface$Impl extends __lib.NativeBase implements ExternalInterface {
  ExternalInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeExternalinterfaceReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  someMethod(int someParameter) {
    final _someMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int8), void Function(Pointer<Void>, int, int)>('library_smoke_ExternalInterface_someMethod__Byte'));
    final _someParameterHandle = (someParameter);
    final _handle = this.handle;
    final __resultHandle = _someMethodFfi(_handle, __lib.LibraryContext.isolateId, _someParameterHandle);
    (_someParameterHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  String get someProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ExternalInterface_someProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
int _ExternalInterfacesomeMethodStatic(int _token, int someParameter) {
  try {
    (__lib.instanceCache[_token] as ExternalInterface).someMethod((someParameter));
  } finally {
    (someParameter);
  }
  return 0;
}
int _ExternalInterfacesomePropertyGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((__lib.instanceCache[_token] as ExternalInterface).someProperty);
  return 0;
}
Pointer<Void> smokeExternalinterfaceToFfi(ExternalInterface value) {
  if (value is __lib.NativeBase) return _smokeExternalinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeExternalinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Int8)>(_ExternalInterfacesomeMethodStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ExternalInterfacesomePropertyGetStatic, __lib.unknownError)
  );
  return result;
}
ExternalInterface smokeExternalinterfaceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is ExternalInterface) return instance;
  final _typeIdHandle = _smokeExternalinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeExternalinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ExternalInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeExternalinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeExternalinterfaceReleaseHandle(handle);
Pointer<Void> smokeExternalinterfaceToFfiNullable(ExternalInterface? value) =>
  value != null ? smokeExternalinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
ExternalInterface? smokeExternalinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeExternalinterfaceFromFfi(handle) : null;
void smokeExternalinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExternalinterfaceReleaseHandle(handle);
// End of ExternalInterface "private" section.
