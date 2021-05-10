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
    @required void Function(int) lambda_someMethod,
    @required String Function() lambda_someProperty_get
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
int smoke_ExternalInterface_SomeEnum_toFfi(ExternalInterface_SomeEnum value) {
  switch (value) {
  case ExternalInterface_SomeEnum.someValue:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for ExternalInterface_SomeEnum enum.");
  }
}
ExternalInterface_SomeEnum smoke_ExternalInterface_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExternalInterface_SomeEnum.someValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ExternalInterface_SomeEnum enum.");
  }
}
void smoke_ExternalInterface_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_ExternalInterface_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExternalInterface_SomeEnum_create_handle_nullable'));
final _smoke_ExternalInterface_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeEnum_release_handle_nullable'));
final _smoke_ExternalInterface_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_ExternalInterface_SomeEnum_toFfi_nullable(ExternalInterface_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExternalInterface_SomeEnum_toFfi(value);
  final result = _smoke_ExternalInterface_SomeEnumCreateHandleNullable(_handle);
  smoke_ExternalInterface_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
ExternalInterface_SomeEnum smoke_ExternalInterface_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExternalInterface_SomeEnumGetValueNullable(handle);
  final result = smoke_ExternalInterface_SomeEnum_fromFfi(_handle);
  smoke_ExternalInterface_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExternalInterface_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalInterface_SomeEnumReleaseHandleNullable(handle);
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
Pointer<Void> smoke_ExternalInterface_SomeStruct_toFfi(ExternalInterface_SomeStruct value) {
  final _someFieldHandle = String_toFfi(value.someField);
  final _result = _smokeExternalinterfaceSomestructCreateHandle(_someFieldHandle);
  String_releaseFfiHandle(_someFieldHandle);
  return _result;
}
ExternalInterface_SomeStruct smoke_ExternalInterface_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeExternalinterfaceSomestructGetFieldsomeField(handle);
  try {
    return ExternalInterface_SomeStruct(
      String_fromFfi(_someFieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_someFieldHandle);
  }
}
void smoke_ExternalInterface_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeExternalinterfaceSomestructReleaseHandle(handle);
// Nullable ExternalInterface_SomeStruct
final _smoke_ExternalInterface_SomeStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_create_handle_nullable'));
final _smoke_ExternalInterface_SomeStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_release_handle_nullable'));
final _smoke_ExternalInterface_SomeStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_ExternalInterface_SomeStruct_toFfi_nullable(ExternalInterface_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExternalInterface_SomeStruct_toFfi(value);
  final result = _smoke_ExternalInterface_SomeStructCreateHandleNullable(_handle);
  smoke_ExternalInterface_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
ExternalInterface_SomeStruct smoke_ExternalInterface_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExternalInterface_SomeStructGetValueNullable(handle);
  final result = smoke_ExternalInterface_SomeStruct_fromFfi(_handle);
  smoke_ExternalInterface_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExternalInterface_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalInterface_SomeStructReleaseHandleNullable(handle);
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
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeExternalinterfaceReleaseHandle(handle);
    handle = null;
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
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
}
int _ExternalInterface_someMethod_static(int _token, int someParameter) {
  try {
    (__lib.instanceCache[_token] as ExternalInterface).someMethod((someParameter));
  } finally {
    (someParameter);
  }
  return 0;
}
int _ExternalInterface_someProperty_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi((__lib.instanceCache[_token] as ExternalInterface).someProperty);
  return 0;
}
Pointer<Void> smoke_ExternalInterface_toFfi(ExternalInterface value) {
  if (value is __lib.NativeBase) return _smokeExternalinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeExternalinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Int8)>(_ExternalInterface_someMethod_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ExternalInterface_someProperty_get_static, __lib.unknownError)
  );
  return result;
}
ExternalInterface smoke_ExternalInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ExternalInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeExternalinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeExternalinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ExternalInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ExternalInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeExternalinterfaceReleaseHandle(handle);
Pointer<Void> smoke_ExternalInterface_toFfi_nullable(ExternalInterface value) =>
  value != null ? smoke_ExternalInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ExternalInterface smoke_ExternalInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ExternalInterface_fromFfi(handle) : null;
void smoke_ExternalInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeExternalinterfaceReleaseHandle(handle);
// End of ExternalInterface "private" section.
