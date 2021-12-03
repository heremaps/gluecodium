import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class ExternalInterface {
  factory ExternalInterface(
    void Function(int) someMethodLambda,
    String Function() somePropertyGetLambda
  ) => ExternalInterface$Lambdas(
    someMethodLambda,
    somePropertyGetLambda
  );
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
  void someMethod(int someParameter);
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
  default:
    throw StateError("Invalid enum value $value for ExternalInterface_SomeEnum enum.");
  }
}
ExternalInterface_SomeEnum smokeExternalinterfaceSomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExternalInterface_SomeEnum.someValue;
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
final _smokeExternalinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ExternalInterface_register_finalizer'));
final _smokeExternalinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_copy_handle'));
final _smokeExternalinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_release_handle'));
final _smokeExternalinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_ExternalInterface_create_proxy'));
final _smokeExternalinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_get_type_id'));
class ExternalInterface$Lambdas implements ExternalInterface {
  void Function(int) someMethodLambda;
  String Function() somePropertyGetLambda;
  ExternalInterface$Lambdas(
    this.someMethodLambda,
    this.somePropertyGetLambda
  );
  @override
  void release() {}
  @override
  void someMethod(int someParameter) =>
    someMethodLambda(someParameter);
  @override
  String get someProperty => somePropertyGetLambda();
}
class ExternalInterface$Impl extends __lib.NativeBase implements ExternalInterface {
  ExternalInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  void someMethod(int someParameter) {
    final _someMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int8), void Function(Pointer<Void>, int, int)>('library_smoke_ExternalInterface_someMethod__Byte'));
    final _someParameterHandle = (someParameter);
    final _handle = this.handle;
    _someMethodFfi(_handle, __lib.LibraryContext.isolateId, _someParameterHandle);
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
int _smokeExternalinterfacesomeMethodStatic(Object _obj, int someParameter) {
  try {
    (_obj as ExternalInterface).someMethod((someParameter));
  } finally {
  }
  return 0;
}
int _smokeExternalinterfacesomePropertyGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((_obj as ExternalInterface).someProperty);
  return 0;
}
Pointer<Void> smokeExternalinterfaceToFfi(ExternalInterface value) {
  if (value is __lib.NativeBase) return _smokeExternalinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeExternalinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Int8)>(_smokeExternalinterfacesomeMethodStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_smokeExternalinterfacesomePropertyGetStatic, __lib.unknownError)
  );
  return result;
}
ExternalInterface smokeExternalinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ExternalInterface) return instance;
  final _typeIdHandle = _smokeExternalinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeExternalinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ExternalInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeExternalinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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
