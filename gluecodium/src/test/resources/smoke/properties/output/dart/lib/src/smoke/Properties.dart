import 'dart:typed_data';
import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/smoke/PropertiesInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_Properties_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Properties_copy_handle');
final _smoke_Properties_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Properties_release_handle');
class Properties {
  final Pointer<Void> _handle;
  Properties._(this._handle);
  void release() => _smoke_Properties_release_handle(_handle);
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
    final _result = library_ListOf_String_fromFfi(__result_handle);
    library_ListOf_String_releaseFfiHandle(__result_handle);
    return _result;
  }
  set arrayProperty(List<String> value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_Properties_arrayProperty_set__ListOf_1String');
    final _value_handle = library_ListOf_String_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    library_ListOf_String_releaseFfiHandle(_value_handle);
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
  Uint8List get byteBufferProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Properties_byteBufferProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = Blob_fromFfi(__result_handle);
    Blob_releaseFfiHandle(__result_handle);
    return _result;
  }
  set byteBufferProperty(Uint8List value) {
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
  _smoke_Properties_copy_handle(value._handle);
Properties smoke_Properties_fromFfi(Pointer<Void> handle) =>
  Properties._(_smoke_Properties_copy_handle(handle));
void smoke_Properties_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Properties_release_handle(handle);
Pointer<Void> smoke_Properties_toFfi_nullable(Properties value) =>
  value != null ? smoke_Properties_toFfi(value) : Pointer<Void>.fromAddress(0);
Properties smoke_Properties_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Properties_fromFfi(handle) : null;
void smoke_Properties_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Properties_release_handle(handle);
enum Properties_InternalErrorCode {
    errorNone,
    errorFatal
}
// Properties_InternalErrorCode "private" section, not exported.
int smoke_Properties_InternalErrorCode_toFfi(Properties_InternalErrorCode value) {
  switch (value) {
  case Properties_InternalErrorCode.errorNone:
    return 0;
  break;
  case Properties_InternalErrorCode.errorFatal:
    return 999;
  break;
  default:
    throw StateError("Invalid enum value $value for Properties_InternalErrorCode enum.");
  }
}
Properties_InternalErrorCode smoke_Properties_InternalErrorCode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Properties_InternalErrorCode.errorNone;
  break;
  case 999:
    return Properties_InternalErrorCode.errorFatal;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Properties_InternalErrorCode enum.");
  }
}
void smoke_Properties_InternalErrorCode_releaseFfiHandle(int handle) {}
final _smoke_Properties_InternalErrorCode_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('smoke_Properties_InternalErrorCode_create_handle_nullable');
final _smoke_Properties_InternalErrorCode_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Properties_InternalErrorCode_release_handle_nullable');
final _smoke_Properties_InternalErrorCode_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Properties_InternalErrorCode_get_value_nullable');
Pointer<Void> smoke_Properties_InternalErrorCode_toFfi_nullable(Properties_InternalErrorCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Properties_InternalErrorCode_toFfi(value);
  final result = _smoke_Properties_InternalErrorCode_create_handle_nullable(_handle);
  smoke_Properties_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
Properties_InternalErrorCode smoke_Properties_InternalErrorCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Properties_InternalErrorCode_get_value_nullable(handle);
  final result = smoke_Properties_InternalErrorCode_fromFfi(_handle);
  smoke_Properties_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
void smoke_Properties_InternalErrorCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Properties_InternalErrorCode_release_handle_nullable(handle);
// End of Properties_InternalErrorCode "private" section.
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
// Nullable Properties_ExampleStruct
final _smoke_Properties_ExampleStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Properties_ExampleStruct_create_handle_nullable');
final _smoke_Properties_ExampleStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Properties_ExampleStruct_release_handle_nullable');
final _smoke_Properties_ExampleStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Properties_ExampleStruct_get_value_nullable');
Pointer<Void> smoke_Properties_ExampleStruct_toFfi_nullable(Properties_ExampleStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Properties_ExampleStruct_toFfi(value);
  final result = _smoke_Properties_ExampleStruct_create_handle_nullable(_handle);
  smoke_Properties_ExampleStruct_releaseFfiHandle(_handle);
  return result;
}
Properties_ExampleStruct smoke_Properties_ExampleStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Properties_ExampleStruct_get_value_nullable(handle);
  final result = smoke_Properties_ExampleStruct_fromFfi(_handle);
  smoke_Properties_ExampleStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Properties_ExampleStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Properties_ExampleStruct_release_handle_nullable(handle);
// End of Properties_ExampleStruct "private" section.
