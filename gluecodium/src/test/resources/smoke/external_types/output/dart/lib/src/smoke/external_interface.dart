import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ExternalInterface {
  ExternalInterface() {}
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
final _smoke_ExternalInterface_SomeEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExternalInterface_SomeEnum_create_handle_nullable'));
final _smoke_ExternalInterface_SomeEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeEnum_release_handle_nullable'));
final _smoke_ExternalInterface_SomeEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_ExternalInterface_SomeEnum_toFfi_nullable(ExternalInterface_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExternalInterface_SomeEnum_toFfi(value);
  final result = _smoke_ExternalInterface_SomeEnum_create_handle_nullable(_handle);
  smoke_ExternalInterface_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
ExternalInterface_SomeEnum smoke_ExternalInterface_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExternalInterface_SomeEnum_get_value_nullable(handle);
  final result = smoke_ExternalInterface_SomeEnum_fromFfi(_handle);
  smoke_ExternalInterface_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExternalInterface_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalInterface_SomeEnum_release_handle_nullable(handle);
// End of ExternalInterface_SomeEnum "private" section.
class ExternalInterface_SomeStruct {
  String someField;
  ExternalInterface_SomeStruct(this.someField);
}
// ExternalInterface_SomeStruct "private" section, not exported.
final _smoke_ExternalInterface_SomeStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_create_handle'));
final _smoke_ExternalInterface_SomeStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_release_handle'));
final _smoke_ExternalInterface_SomeStruct_get_field_someField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_get_field_someField'));
Pointer<Void> smoke_ExternalInterface_SomeStruct_toFfi(ExternalInterface_SomeStruct value) {
  final _someField_handle = String_toFfi(value.someField);
  final _result = _smoke_ExternalInterface_SomeStruct_create_handle(_someField_handle);
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
ExternalInterface_SomeStruct smoke_ExternalInterface_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_ExternalInterface_SomeStruct_get_field_someField(handle);
  try {
    return ExternalInterface_SomeStruct(
      String_fromFfi(_someField_handle)
    );
  } finally {
    String_releaseFfiHandle(_someField_handle);
  }
}
void smoke_ExternalInterface_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_ExternalInterface_SomeStruct_release_handle(handle);
// Nullable ExternalInterface_SomeStruct
final _smoke_ExternalInterface_SomeStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_create_handle_nullable'));
final _smoke_ExternalInterface_SomeStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_release_handle_nullable'));
final _smoke_ExternalInterface_SomeStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_ExternalInterface_SomeStruct_toFfi_nullable(ExternalInterface_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExternalInterface_SomeStruct_toFfi(value);
  final result = _smoke_ExternalInterface_SomeStruct_create_handle_nullable(_handle);
  smoke_ExternalInterface_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
ExternalInterface_SomeStruct smoke_ExternalInterface_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExternalInterface_SomeStruct_get_value_nullable(handle);
  final result = smoke_ExternalInterface_SomeStruct_fromFfi(_handle);
  smoke_ExternalInterface_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExternalInterface_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalInterface_SomeStruct_release_handle_nullable(handle);
// End of ExternalInterface_SomeStruct "private" section.
// ExternalInterface "private" section, not exported.
final _smoke_ExternalInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_copy_handle'));
final _smoke_ExternalInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_release_handle'));
final _smoke_ExternalInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer)
  >('library_smoke_ExternalInterface_create_proxy'));
final _smoke_ExternalInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalInterface_get_type_id'));
class ExternalInterface$Lambdas implements ExternalInterface {
  void Function(int) lambda_someMethod;
  String Function() lambda_someProperty_get;
  ExternalInterface$Lambdas(
    void Function(int) lambda_someMethod,
    String Function() lambda_someProperty_get
  ) {
    this.lambda_someMethod = lambda_someMethod;
    this.lambda_someProperty_get = lambda_someProperty_get;
  }
  @override
  void release() {}
  @override
  someMethod(int someParameter) =>
    lambda_someMethod(someParameter);
  @override
  String get someProperty => lambda_someProperty_get();
}
class ExternalInterface$Impl implements ExternalInterface {
  @protected
  Pointer<Void> handle;
  ExternalInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_ExternalInterface_release_handle(handle);
    handle = null;
  }
  @override
  someMethod(int someParameter) {
    final _someMethod_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int8), void Function(Pointer<Void>, int, int)>('library_smoke_ExternalInterface_someMethod__Byte'));
    final _someParameter_handle = (someParameter);
    final _handle = this.handle;
    final __result_handle = _someMethod_ffi(_handle, __lib.LibraryContext.isolateId, _someParameter_handle);
    (_someParameter_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  String get someProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ExternalInterface_someProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
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
  if (value is ExternalInterface$Impl) return _smoke_ExternalInterface_copy_handle(value.handle);
  final result = _smoke_ExternalInterface_create_proxy(
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
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as ExternalInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_ExternalInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_ExternalInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : ExternalInterface$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ExternalInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ExternalInterface_release_handle(handle);
Pointer<Void> smoke_ExternalInterface_toFfi_nullable(ExternalInterface value) =>
  value != null ? smoke_ExternalInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ExternalInterface smoke_ExternalInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ExternalInterface_fromFfi(handle) : null;
void smoke_ExternalInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalInterface_release_handle(handle);
// End of ExternalInterface "private" section.
