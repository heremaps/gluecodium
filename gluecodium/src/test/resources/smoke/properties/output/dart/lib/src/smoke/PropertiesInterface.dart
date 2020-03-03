import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class PropertiesInterface {
  void release();
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
  >('smoke_PropertiesInterface_ExampleStruct_create_handle');
final _smoke_PropertiesInterface_ExampleStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PropertiesInterface_ExampleStruct_release_handle');
final _smoke_PropertiesInterface_ExampleStruct_get_field_value = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_PropertiesInterface_ExampleStruct_get_field_value');
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
  >('smoke_PropertiesInterface_ExampleStruct_create_handle_nullable');
final _smoke_PropertiesInterface_ExampleStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PropertiesInterface_ExampleStruct_release_handle_nullable');
final _smoke_PropertiesInterface_ExampleStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PropertiesInterface_ExampleStruct_get_value_nullable');
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
  >('smoke_PropertiesInterface_copy_handle');
final _smoke_PropertiesInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PropertiesInterface_release_handle');
final _smoke_PropertiesInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer)
  >('smoke_PropertiesInterface_create_proxy');
final _smoke_PropertiesInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('smoke_PropertiesInterface_get_raw_pointer');
final _smoke_PropertiesInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PropertiesInterface_get_type_id');
class PropertiesInterface__Impl implements PropertiesInterface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  PropertiesInterface__Impl(this.handle);
  @override
  void release() => _smoke_PropertiesInterface_release_handle(handle);
  PropertiesInterface_ExampleStruct get structProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_PropertiesInterface_structProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = smoke_PropertiesInterface_ExampleStruct_fromFfi(__result_handle);
    smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  set structProperty(PropertiesInterface_ExampleStruct value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_PropertiesInterface_structProperty_set__ExampleStruct');
    final _value_handle = smoke_PropertiesInterface_ExampleStruct_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
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
  (__lib.instanceCache[_token] as PropertiesInterface).structProperty = smoke_PropertiesInterface_ExampleStruct_fromFfi(_value);
  smoke_PropertiesInterface_ExampleStruct_releaseFfiHandle(_value);
  return 0;
}
Pointer<Void> smoke_PropertiesInterface_toFfi(PropertiesInterface value) {
  if (value is PropertiesInterface__Impl) return _smoke_PropertiesInterface_copy_handle(value.handle);
  final token = __lib.getNewToken();
  __lib.instanceCache[token] = value;
  final result = _smoke_PropertiesInterface_create_proxy(token, Pointer.fromFunction<Int64 Function(Uint64, Pointer<Pointer<Void>>)>(_PropertiesInterface_structProperty_get_static, __lib.unknownError), Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_PropertiesInterface_structProperty_set_static, __lib.unknownError));
  __lib.reverseCache[_smoke_PropertiesInterface_get_raw_pointer(result)] = value;
  return result;
}
PropertiesInterface smoke_PropertiesInterface_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_PropertiesInterface_get_raw_pointer(handle)] as PropertiesInterface;
  if (instance != null) return instance;
  final _copied_handle = _smoke_PropertiesInterface_copy_handle(handle);
  final _type_id_handle = _smoke_PropertiesInterface_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? PropertiesInterface__Impl(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
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
