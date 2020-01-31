import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/String__conversion.dart';
import 'package:library/src/smoke/TypeCollection.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_TypeDefs_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_TypeDefs_release_handle');
class TypeDefs {
  final Pointer<Void> _handle;
  TypeDefs._(this._handle);
  void release() => _smoke_TypeDefs_release_handle(_handle);
  static double methodWithPrimitiveTypeDef(double input) {
    final _methodWithPrimitiveTypeDef_ffi = __lib.nativeLibrary.lookupFunction<Double Function(Double), double Function(double)>('smoke_TypeDefs_methodWithPrimitiveTypeDef__Double');
    final _input_handle = (input);
    final __result_handle = _methodWithPrimitiveTypeDef_ffi(_input_handle);
    (_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  static List<TypeDefs_TestStruct> methodWithComplexTypeDef(List<TypeDefs_TestStruct> input) {
    final _methodWithComplexTypeDef_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_TypeDefs_methodWithComplexTypeDef__ListOf_1smoke_1TypeDefs_1TestStruct');
    final _input_handle = ListOf_smoke_TypeDefs_TestStruct_toFfi(input);
    final __result_handle = _methodWithComplexTypeDef_ffi(_input_handle);
    ListOf_smoke_TypeDefs_TestStruct_releaseFfiHandle(_input_handle);
    final _result = ListOf_smoke_TypeDefs_TestStruct_fromFfi(__result_handle);
    ListOf_smoke_TypeDefs_TestStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static double returnNestedIntTypeDef(double input) {
    final _returnNestedIntTypeDef_ffi = __lib.nativeLibrary.lookupFunction<Double Function(Double), double Function(double)>('smoke_TypeDefs_returnNestedIntTypeDef__Double');
    final _input_handle = (input);
    final __result_handle = _returnNestedIntTypeDef_ffi(_input_handle);
    (_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  static TypeDefs_TestStruct returnTestStructTypeDef(TypeDefs_TestStruct input) {
    final _returnTestStructTypeDef_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_TypeDefs_returnTestStructTypeDef__TestStruct');
    final _input_handle = smoke_TypeDefs_TestStruct_toFfi(input);
    final __result_handle = _returnTestStructTypeDef_ffi(_input_handle);
    smoke_TypeDefs_TestStruct_releaseFfiHandle(_input_handle);
    final _result = smoke_TypeDefs_TestStruct_fromFfi(__result_handle);
    smoke_TypeDefs_TestStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static TypeDefs_TestStruct returnNestedStructTypeDef(TypeDefs_TestStruct input) {
    final _returnNestedStructTypeDef_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_TypeDefs_returnNestedStructTypeDef__TestStruct');
    final _input_handle = smoke_TypeDefs_TestStruct_toFfi(input);
    final __result_handle = _returnNestedStructTypeDef_ffi(_input_handle);
    smoke_TypeDefs_TestStruct_releaseFfiHandle(_input_handle);
    final _result = smoke_TypeDefs_TestStruct_fromFfi(__result_handle);
    smoke_TypeDefs_TestStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Point returnTypeDefPointFromTypeCollection(Point input) {
    final _returnTypeDefPointFromTypeCollection_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_TypeDefs_returnTypeDefPointFromTypeCollection__Point');
    final _input_handle = smoke_TypeCollection_Point_toFfi(input);
    final __result_handle = _returnTypeDefPointFromTypeCollection_ffi(_input_handle);
    smoke_TypeCollection_Point_releaseFfiHandle(_input_handle);
    final _result = smoke_TypeCollection_Point_fromFfi(__result_handle);
    smoke_TypeCollection_Point_releaseFfiHandle(__result_handle);
    return _result;
  }
  List<double> get primitiveTypeProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_TypeDefs_primitiveTypeProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = ListOf_Double_fromFfi(__result_handle);
    ListOf_Double_releaseFfiHandle(__result_handle);
    return _result;
  }
  set primitiveTypeProperty(List<double> value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_TypeDefs_primitiveTypeProperty_set__ListOf_1Double');
    final _value_handle = ListOf_Double_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    ListOf_Double_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_TypeDefs_toFfi(TypeDefs value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
TypeDefs smoke_TypeDefs_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? TypeDefs._(handle) : null;
void smoke_TypeDefs_releaseFfiHandle(Pointer<Void> handle) {}
class TypeDefs_StructHavingAliasFieldDefinedBelow {
  double field;
  TypeDefs_StructHavingAliasFieldDefinedBelow(this.field);
}
// TypeDefs_StructHavingAliasFieldDefinedBelow "private" section, not exported.
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle');
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle');
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_field_field = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_field_field');
Pointer<Void> smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_toFfi(TypeDefs_StructHavingAliasFieldDefinedBelow value) {
  final _field_handle = (value.field);
  final _result = _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle(_field_handle);
  (_field_handle);
  return _result;
}
TypeDefs_StructHavingAliasFieldDefinedBelow smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_fromFfi(Pointer<Void> handle) {
  final _field_handle = _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_field_field(handle);
  final _result = TypeDefs_StructHavingAliasFieldDefinedBelow(
    (_field_handle)
  );
  (_field_handle);
  return _result;
}
void smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_releaseFfiHandle(Pointer<Void> handle) => _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle(handle);
// End of TypeDefs_StructHavingAliasFieldDefinedBelow "private" section.
class TypeDefs_TestStruct {
  String something;
  TypeDefs_TestStruct(this.something);
}
// TypeDefs_TestStruct "private" section, not exported.
final _smoke_TypeDefs_TestStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_TypeDefs_TestStruct_create_handle');
final _smoke_TypeDefs_TestStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_TypeDefs_TestStruct_release_handle');
final _smoke_TypeDefs_TestStruct_get_field_something = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_TypeDefs_TestStruct_get_field_something');
Pointer<Void> smoke_TypeDefs_TestStruct_toFfi(TypeDefs_TestStruct value) {
  final _something_handle = String_toFfi(value.something);
  final _result = _smoke_TypeDefs_TestStruct_create_handle(_something_handle);
  String_releaseFfiHandle(_something_handle);
  return _result;
}
TypeDefs_TestStruct smoke_TypeDefs_TestStruct_fromFfi(Pointer<Void> handle) {
  final _something_handle = _smoke_TypeDefs_TestStruct_get_field_something(handle);
  final _result = TypeDefs_TestStruct(
    String_fromFfi(_something_handle)
  );
  String_releaseFfiHandle(_something_handle);
  return _result;
}
void smoke_TypeDefs_TestStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_TypeDefs_TestStruct_release_handle(handle);
// End of TypeDefs_TestStruct "private" section.
