import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
// End of PropertiesInterface_ExampleStruct "private" section.
// PropertiesInterface "private" section, not exported.
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PropertiesInterface_release_handle');
class PropertiesInterface__Impl implements PropertiesInterface{
  final Pointer<Void> _handle;
  PropertiesInterface__Impl._(this._handle);
  void release() => __release_handle(_handle);
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
Pointer<Void> smoke_PropertiesInterface_toFfi(PropertiesInterface__Impl value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
PropertiesInterface smoke_PropertiesInterface_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? PropertiesInterface__Impl._(handle) : null;
void smoke_PropertiesInterface_releaseFfiHandle(Pointer<Void> handle) {}
// End of PropertiesInterface "private" section.
