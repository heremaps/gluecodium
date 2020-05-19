import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class PropertiesInterface {
  PropertiesInterface() {}
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
final _smoke_PropertiesInterface_ExampleStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_PropertiesInterface_ExampleStruct_create_handle');
final _smoke_PropertiesInterface_ExampleStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_release_handle');
final _smoke_PropertiesInterface_ExampleStruct_get_field_value = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_get_field_value');
Pointer<Void> smoke_PropertiesInterface_ExampleStruct_toFfi(PropertiesInterface_ExampleStruct value) {
  final _value_handle = (value.value);
  final _result = _smoke_PropertiesInterface_ExampleStruct_create_handle(_value_handle);
  (_value_handle);
  return _result;
}
PropertiesInterface_ExampleStruct smoke_PropertiesInterface_ExampleStruct_fromFfi(Pointer<Void> handle) {
  final _value_handle = _smoke_PropertiesInterface_ExampleStruct_get_field_value(handle);
  final _result = PropertiesInterface_ExampleStruct(
    (_value_handle)
  );
  (_value_handle);
  return _result;
}
void smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_PropertiesInterface_ExampleStruct_release_handle(handle);
// Nullable PropertiesInterface_ExampleStruct
final _smoke_PropertiesInterface_ExampleStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_create_handle_nullable');
final _smoke_PropertiesInterface_ExampleStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_release_handle_nullable');
final _smoke_PropertiesInterface_ExampleStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_ExampleStruct_get_value_nullable');
Pointer<Void> smoke_PropertiesInterface_ExampleStruct_toFfi_nullable(PropertiesInterface_ExampleStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PropertiesInterface_ExampleStruct_toFfi(value);
  final result = _smoke_PropertiesInterface_ExampleStruct_create_handle_nullable(_handle);
  smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(_handle);
  return result;
}
PropertiesInterface_ExampleStruct smoke_PropertiesInterface_ExampleStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PropertiesInterface_ExampleStruct_get_value_nullable(handle);
  final result = smoke_PropertiesInterface_ExampleStruct_fromFfi(_handle);
  smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PropertiesInterface_ExampleStruct_release_handle_nullable(handle);
// End of PropertiesInterface_ExampleStruct "private" section.
// PropertiesInterface "private" section, not exported.
final _smoke_PropertiesInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_copy_handle');
final _smoke_PropertiesInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_release_handle');
final _smoke_PropertiesInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer)
  >('library_smoke_PropertiesInterface_create_proxy');
final _smoke_PropertiesInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_PropertiesInterface_get_raw_pointer');
final _smoke_PropertiesInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PropertiesInterface_get_type_id');
class PropertiesInterface$Lambdas implements PropertiesInterface {
  PropertiesInterface_ExampleStruct Function() lambda_structProperty_get;
  void Function(PropertiesInterface_ExampleStruct) lambda_structProperty_set;
  PropertiesInterface$Lambdas(
    PropertiesInterface_ExampleStruct Function() lambda_structProperty_get,
    void Function(PropertiesInterface_ExampleStruct) lambda_structProperty_set
  ) {
    this.lambda_structProperty_get = lambda_structProperty_get;
    this.lambda_structProperty_set = lambda_structProperty_set;
  }
  @override
  void release() {}
  @override
  PropertiesInterface_ExampleStruct get structProperty => lambda_structProperty_get();
  @override
  set structProperty(PropertiesInterface_ExampleStruct value) => lambda_structProperty_set(value);
}
class PropertiesInterface$Impl implements PropertiesInterface {
  @protected
  Pointer<Void> handle;
  PropertiesInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_PropertiesInterface_get_raw_pointer(handle));
    _smoke_PropertiesInterface_release_handle(handle);
    handle = null;
  }
  PropertiesInterface_ExampleStruct get structProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_PropertiesInterface_structProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = smoke_PropertiesInterface_ExampleStruct_fromFfi(__result_handle);
    smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  set structProperty(PropertiesInterface_ExampleStruct value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PropertiesInterface_structProperty_set__ExampleStruct');
    final _value_handle = smoke_PropertiesInterface_ExampleStruct_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _PropertiesInterface_structProperty_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = smoke_PropertiesInterface_ExampleStruct_toFfi((__lib.instanceCache[_token] as PropertiesInterface).structProperty);
  return 0;
}
int _PropertiesInterface_structProperty_set_static(int _token, Pointer<Void> _value) {
  final __value = smoke_PropertiesInterface_ExampleStruct_fromFfi(_value);
  smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(_value);
  (__lib.instanceCache[_token] as PropertiesInterface).structProperty = __value;
  return 0;
}
Pointer<Void> smoke_PropertiesInterface_toFfi(PropertiesInterface value) {
  if (value is PropertiesInterface$Impl) return _smoke_PropertiesInterface_copy_handle(value.handle);
  final result = _smoke_PropertiesInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_PropertiesInterface_structProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_PropertiesInterface_structProperty_set_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_PropertiesInterface_get_raw_pointer(result)] = value;
  return result;
}
PropertiesInterface smoke_PropertiesInterface_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_PropertiesInterface_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as PropertiesInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_PropertiesInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_PropertiesInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : PropertiesInterface$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_PropertiesInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_PropertiesInterface_release_handle(handle);
Pointer<Void> smoke_PropertiesInterface_toFfi_nullable(PropertiesInterface value) =>
  value != null ? smoke_PropertiesInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
PropertiesInterface smoke_PropertiesInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_PropertiesInterface_fromFfi(handle) : null;
void smoke_PropertiesInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PropertiesInterface_release_handle(handle);
// End of PropertiesInterface "private" section.
