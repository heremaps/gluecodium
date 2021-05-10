import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class PropertiesInterface {
  PropertiesInterface();
  factory PropertiesInterface.fromLambdas({
    @required PropertiesInterface_ExampleStruct Function() lambda_structProperty_get,
    @required void Function(PropertiesInterface_ExampleStruct) lambda_structProperty_set
  }) => PropertiesInterface$Lambdas(
    lambda_structProperty_get,
    lambda_structProperty_set
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  PropertiesInterface_ExampleStruct get structProperty;
  set structProperty(PropertiesInterface_ExampleStruct value);
}
class PropertiesInterface_ExampleStruct {
  double value;
  PropertiesInterface_ExampleStruct(this.value);
}
// PropertiesInterface_ExampleStruct "private" section, not exported.
final _smokePropertiesinterfaceExamplestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_PropertiesInterface_ExampleStruct_create_handle'));
final _smokePropertiesinterfaceExamplestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_release_handle'));
final _smokePropertiesinterfaceExamplestructGetFieldvalue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_get_field_value'));
Pointer<Void> smoke_PropertiesInterface_ExampleStruct_toFfi(PropertiesInterface_ExampleStruct value) {
  final _valueHandle = (value.value);
  final _result = _smokePropertiesinterfaceExamplestructCreateHandle(_valueHandle);
  (_valueHandle);
  return _result;
}
PropertiesInterface_ExampleStruct smoke_PropertiesInterface_ExampleStruct_fromFfi(Pointer<Void> handle) {
  final _valueHandle = _smokePropertiesinterfaceExamplestructGetFieldvalue(handle);
  try {
    return PropertiesInterface_ExampleStruct(
      (_valueHandle)
    );
  } finally {
    (_valueHandle);
  }
}
void smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(Pointer<Void> handle) => _smokePropertiesinterfaceExamplestructReleaseHandle(handle);
// Nullable PropertiesInterface_ExampleStruct
final _smoke_PropertiesInterface_ExampleStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_create_handle_nullable'));
final _smoke_PropertiesInterface_ExampleStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_release_handle_nullable'));
final _smoke_PropertiesInterface_ExampleStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_get_value_nullable'));
Pointer<Void> smoke_PropertiesInterface_ExampleStruct_toFfi_nullable(PropertiesInterface_ExampleStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PropertiesInterface_ExampleStruct_toFfi(value);
  final result = _smoke_PropertiesInterface_ExampleStructCreateHandleNullable(_handle);
  smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(_handle);
  return result;
}
PropertiesInterface_ExampleStruct smoke_PropertiesInterface_ExampleStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PropertiesInterface_ExampleStructGetValueNullable(handle);
  final result = smoke_PropertiesInterface_ExampleStruct_fromFfi(_handle);
  smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PropertiesInterface_ExampleStructReleaseHandleNullable(handle);
// End of PropertiesInterface_ExampleStruct "private" section.
// PropertiesInterface "private" section, not exported.
final _smokePropertiesinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_copy_handle'));
final _smokePropertiesinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_release_handle'));
final _smokePropertiesinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer)
  >('library_smoke_PropertiesInterface_create_proxy'));
final _smokePropertiesinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_get_type_id'));
class PropertiesInterface$Lambdas implements PropertiesInterface {
  PropertiesInterface_ExampleStruct Function() lambda_structProperty_get;
  void Function(PropertiesInterface_ExampleStruct) lambda_structProperty_set;
  PropertiesInterface$Lambdas(
    this.lambda_structProperty_get,
    this.lambda_structProperty_set
  );
  @override
  void release() {}
  @override
  PropertiesInterface_ExampleStruct get structProperty => lambda_structProperty_get();
  @override
  set structProperty(PropertiesInterface_ExampleStruct value) => lambda_structProperty_set(value);
}
class PropertiesInterface$Impl extends __lib.NativeBase implements PropertiesInterface {
  PropertiesInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokePropertiesinterfaceReleaseHandle(handle);
    handle = null;
  }
  PropertiesInterface_ExampleStruct get structProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_PropertiesInterface_structProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_PropertiesInterface_ExampleStruct_fromFfi(__resultHandle);
    } finally {
      smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(__resultHandle);
    }
  }
  set structProperty(PropertiesInterface_ExampleStruct value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PropertiesInterface_structProperty_set__ExampleStruct'));
    final _valueHandle = smoke_PropertiesInterface_ExampleStruct_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _PropertiesInterface_structProperty_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = smoke_PropertiesInterface_ExampleStruct_toFfi((__lib.instanceCache[_token] as PropertiesInterface).structProperty);
  return 0;
}
int _PropertiesInterface_structProperty_set_static(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as PropertiesInterface).structProperty =
      smoke_PropertiesInterface_ExampleStruct_fromFfi(_value);
  } finally {
    smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smoke_PropertiesInterface_toFfi(PropertiesInterface value) {
  if (value is __lib.NativeBase) return _smokePropertiesinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokePropertiesinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_PropertiesInterface_structProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_PropertiesInterface_structProperty_set_static, __lib.unknownError)
  );
  return result;
}
PropertiesInterface smoke_PropertiesInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as PropertiesInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokePropertiesinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokePropertiesinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : PropertiesInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_PropertiesInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smokePropertiesinterfaceReleaseHandle(handle);
Pointer<Void> smoke_PropertiesInterface_toFfi_nullable(PropertiesInterface value) =>
  value != null ? smoke_PropertiesInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
PropertiesInterface smoke_PropertiesInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_PropertiesInterface_fromFfi(handle) : null;
void smoke_PropertiesInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokePropertiesinterfaceReleaseHandle(handle);
// End of PropertiesInterface "private" section.
