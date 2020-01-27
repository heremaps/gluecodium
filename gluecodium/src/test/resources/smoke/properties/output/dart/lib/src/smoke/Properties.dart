import 'package:library/src/Blob__conversion.dart';
import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/String__conversion.dart';
import 'package:library/src/smoke/PropertiesInterface.dart';
import 'package:library/src/smoke/Properties_InternalErrorCode__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Properties_release_handle');
class Properties {
  final Pointer<Void> _handle;
  Properties._(this._handle);
  void release() => __release_handle(_handle);
  int get builtInTypeProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>), int Function(Pointer<Void>)>('smoke_Properties_builtInTypeProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  set builtInTypeProperty(int value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Uint32), void Function(Pointer<Void>, int)>('smoke_Properties_builtInTypeProperty_set__UInt');
    final _value_handle = (value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    (_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  double get readonlyProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>), double Function(Pointer<Void>)>('smoke_Properties_readonlyProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  Properties_ExampleStruct get structProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Properties_structProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = smoke_Properties_ExampleStruct_fromFfi(__result_handle);
    smoke_Properties_ExampleStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  set structProperty(Properties_ExampleStruct value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_Properties_structProperty_set__ExampleStruct');
    final _value_handle = smoke_Properties_ExampleStruct_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    smoke_Properties_ExampleStruct_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  List<String> get arrayProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Properties_arrayProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = ListOf_String_fromFfi(__result_handle);
    ListOf_String_releaseFfiHandle(__result_handle);
    return _result;
  }
  set arrayProperty(List<String> value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_Properties_arrayProperty_set__ListOf_1String');
    final _value_handle = ListOf_String_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    ListOf_String_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  Properties_InternalErrorCode get complexTypeProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>), int Function(Pointer<Void>)>('smoke_Properties_complexTypeProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = smoke_Properties_InternalErrorCode_fromFfi(__result_handle);
    smoke_Properties_InternalErrorCode_releaseFfiHandle(__result_handle);
    return _result;
  }
  set complexTypeProperty(Properties_InternalErrorCode value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Uint32), void Function(Pointer<Void>, int)>('smoke_Properties_complexTypeProperty_set__InternalErrorCode');
    final _value_handle = smoke_Properties_InternalErrorCode_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    smoke_Properties_InternalErrorCode_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  List<int> get byteBufferProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Properties_byteBufferProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = Blob_fromFfi(__result_handle);
    Blob_releaseFfiHandle(__result_handle);
    return _result;
  }
  set byteBufferProperty(List<int> value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_Properties_byteBufferProperty_set__Blob');
    final _value_handle = Blob_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    Blob_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  PropertiesInterface get instanceProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Properties_instanceProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = smoke_PropertiesInterface_fromFfi(__result_handle);
    smoke_PropertiesInterface_releaseFfiHandle(__result_handle);
    return _result;
  }
  set instanceProperty(PropertiesInterface value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_Properties_instanceProperty_set__PropertiesInterface');
    final _value_handle = smoke_PropertiesInterface_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    smoke_PropertiesInterface_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  bool get isBooleanProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>), int Function(Pointer<Void>)>('smoke_Properties_isBooleanProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  set isBooleanProperty(bool value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Uint8), void Function(Pointer<Void>, int)>('smoke_Properties_isBooleanProperty_set__Boolean');
    final _value_handle = Boolean_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    Boolean_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  static String get staticProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Properties_staticProperty_get');
    final __result_handle = _get_ffi();
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  static set staticProperty(String value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('smoke_Properties_staticProperty_set__String');
    final _value_handle = String_toFfi(value);
    final __result_handle = _set_ffi(_value_handle);
    String_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  static Properties_ExampleStruct get staticReadonlyProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Properties_staticReadonlyProperty_get');
    final __result_handle = _get_ffi();
    final _result = smoke_Properties_ExampleStruct_fromFfi(__result_handle);
    smoke_Properties_ExampleStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_Properties_toFfi(Properties value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
Properties smoke_Properties_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? Properties._(handle) : null;
void smoke_Properties_releaseFfiHandle(Pointer<Void> handle) {}
enum Properties_InternalErrorCode {
    errorNone,
    errorFatal
}
class Properties_ExampleStruct {
  double value;
  Properties_ExampleStruct(this.value);
}
// Properties_ExampleStruct "private" section, not exported.
final _smoke_Properties_ExampleStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('smoke_Properties_ExampleStruct_create_handle');
final _smoke_Properties_ExampleStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Properties_ExampleStruct_release_handle');
final _smoke_Properties_ExampleStruct_get_field_value = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_Properties_ExampleStruct_get_field_value');
Pointer<Void> smoke_Properties_ExampleStruct_toFfi(Properties_ExampleStruct value) {
  final _value_handle = (value.value);
  final _result = _smoke_Properties_ExampleStruct_create_handle(_value_handle);
  (_value_handle);
  return _result;
}
Properties_ExampleStruct smoke_Properties_ExampleStruct_fromFfi(Pointer<Void> handle) {
  final _value_handle = _smoke_Properties_ExampleStruct_get_field_value(handle);
  final _result = Properties_ExampleStruct(
    (_value_handle)
  );
  (_value_handle);
  return _result;
}
void smoke_Properties_ExampleStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Properties_ExampleStruct_release_handle(handle);
// End of Properties_ExampleStruct "private" section.
