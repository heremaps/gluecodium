import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class InterfaceWithStatic {
  InterfaceWithStatic() {}
  factory InterfaceWithStatic.fromLambdas({
    @required String Function() lambda_regularFunction,
    @required String Function() lambda_regularProperty_get,
    @required void Function(String) lambda_regularProperty_set,
  }) => InterfaceWithStatic$Lambdas(
    lambda_regularFunction,
    lambda_regularProperty_get,
    lambda_regularProperty_set,
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  String regularFunction();
  static String staticFunction() => InterfaceWithStatic$Impl.staticFunction();
  String get regularProperty;
  set regularProperty(String value);
  static String get staticProperty => InterfaceWithStatic$Impl.staticProperty;
  static set staticProperty(String value) { InterfaceWithStatic$Impl.staticProperty = value; }
}
// InterfaceWithStatic "private" section, not exported.
final _smoke_InterfaceWithStatic_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InterfaceWithStatic_copy_handle'));
final _smoke_InterfaceWithStatic_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InterfaceWithStatic_release_handle'));
final _smoke_InterfaceWithStatic_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_InterfaceWithStatic_create_proxy'));
final _smoke_InterfaceWithStatic_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InterfaceWithStatic_get_type_id'));
class InterfaceWithStatic$Lambdas implements InterfaceWithStatic {
  String Function() lambda_regularFunction;
  String Function() lambda_regularProperty_get;
  void Function(String) lambda_regularProperty_set;
  InterfaceWithStatic$Lambdas(
    this.lambda_regularFunction,
    this.lambda_regularProperty_get,
    this.lambda_regularProperty_set,
  );
  @override
  void release() {}
  @override
  String regularFunction() =>
    lambda_regularFunction();
  @override
  String get regularProperty => lambda_regularProperty_get();
  @override
  set regularProperty(String value) => lambda_regularProperty_set(value);
}
class InterfaceWithStatic$Impl extends __lib.NativeBase implements InterfaceWithStatic {
  InterfaceWithStatic$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_InterfaceWithStatic_release_handle(handle);
    handle = null;
  }
  @override
  String regularFunction() {
    final _regularFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_InterfaceWithStatic_regularFunction'));
    final _handle = this.handle;
    final __result_handle = _regularFunction_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  @override
  static String staticFunction() {
    final _staticFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_InterfaceWithStatic_staticFunction'));
    final __result_handle = _staticFunction_ffi(__lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  String get regularProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_InterfaceWithStatic_regularProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  set regularProperty(String value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_InterfaceWithStatic_regularProperty_set__String'));
    final _value_handle = String_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    String_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static String get staticProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_InterfaceWithStatic_staticProperty_get'));
    final __result_handle = _get_ffi(__lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  static set staticProperty(String value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('library_smoke_InterfaceWithStatic_staticProperty_set__String'));
    final _value_handle = String_toFfi(value);
    final __result_handle = _set_ffi(__lib.LibraryContext.isolateId, _value_handle);
    String_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
int _InterfaceWithStatic_regularFunction_static(int _token, Pointer<Pointer<Void>> _result) {
  String _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as InterfaceWithStatic).regularFunction();
    _result.value = String_toFfi(_result_object);
  } finally {
  }
  return 0;
}
int _InterfaceWithStatic_regularProperty_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi((__lib.instanceCache[_token] as InterfaceWithStatic).regularProperty);
  return 0;
}
int _InterfaceWithStatic_regularProperty_set_static(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as InterfaceWithStatic).regularProperty =
      String_fromFfi(_value);
  } finally {
    String_releaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smoke_InterfaceWithStatic_toFfi(InterfaceWithStatic value) {
  if (value is __lib.NativeBase) return _smoke_InterfaceWithStatic_copy_handle((value as __lib.NativeBase).handle);
  final result = _smoke_InterfaceWithStatic_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_InterfaceWithStatic_regularFunction_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_InterfaceWithStatic_regularProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_InterfaceWithStatic_regularProperty_set_static, __lib.unknownError)
  );
  return result;
}
InterfaceWithStatic smoke_InterfaceWithStatic_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as InterfaceWithStatic;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_InterfaceWithStatic_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_InterfaceWithStatic_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : InterfaceWithStatic$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_InterfaceWithStatic_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_InterfaceWithStatic_release_handle(handle);
Pointer<Void> smoke_InterfaceWithStatic_toFfi_nullable(InterfaceWithStatic value) =>
  value != null ? smoke_InterfaceWithStatic_toFfi(value) : Pointer<Void>.fromAddress(0);
InterfaceWithStatic smoke_InterfaceWithStatic_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InterfaceWithStatic_fromFfi(handle) : null;
void smoke_InterfaceWithStatic_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_InterfaceWithStatic_release_handle(handle);
// End of InterfaceWithStatic "private" section.
