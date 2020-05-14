import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/type_collection.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class TypeDefs {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static double methodWithPrimitiveTypeDef(double input) => TypeDefs$Impl.methodWithPrimitiveTypeDef(input);
  static List<TypeDefs_TestStruct> methodWithComplexTypeDef(List<TypeDefs_TestStruct> input) => TypeDefs$Impl.methodWithComplexTypeDef(input);
  static double returnNestedIntTypeDef(double input) => TypeDefs$Impl.returnNestedIntTypeDef(input);
  static TypeDefs_TestStruct returnTestStructTypeDef(TypeDefs_TestStruct input) => TypeDefs$Impl.returnTestStructTypeDef(input);
  static TypeDefs_TestStruct returnNestedStructTypeDef(TypeDefs_TestStruct input) => TypeDefs$Impl.returnNestedStructTypeDef(input);
  static Point returnTypeDefPointFromTypeCollection(Point input) => TypeDefs$Impl.returnTypeDefPointFromTypeCollection(input);
  List<double> get primitiveTypeProperty;
  set primitiveTypeProperty(List<double> value);
}
class TypeDefs_StructHavingAliasFieldDefinedBelow {
  double field;
  TypeDefs_StructHavingAliasFieldDefinedBelow(this.field);
}
// TypeDefs_StructHavingAliasFieldDefinedBelow "private" section, not exported.
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle');
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle');
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_field_field = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_field_field');
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
// Nullable TypeDefs_StructHavingAliasFieldDefinedBelow
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle_nullable');
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle_nullable');
final _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_value_nullable');
Pointer<Void> smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_toFfi_nullable(TypeDefs_StructHavingAliasFieldDefinedBelow value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_toFfi(value);
  final result = _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_create_handle_nullable(_handle);
  smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_releaseFfiHandle(_handle);
  return result;
}
TypeDefs_StructHavingAliasFieldDefinedBelow smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_get_value_nullable(handle);
  final result = smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_fromFfi(_handle);
  smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_releaseFfiHandle(_handle);
  return result;
}
void smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_TypeDefs_StructHavingAliasFieldDefinedBelow_release_handle_nullable(handle);
// End of TypeDefs_StructHavingAliasFieldDefinedBelow "private" section.
class TypeDefs_TestStruct {
  String something;
  TypeDefs_TestStruct(this.something);
}
// TypeDefs_TestStruct "private" section, not exported.
final _smoke_TypeDefs_TestStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_create_handle');
final _smoke_TypeDefs_TestStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_release_handle');
final _smoke_TypeDefs_TestStruct_get_field_something = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_get_field_something');
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
// Nullable TypeDefs_TestStruct
final _smoke_TypeDefs_TestStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_create_handle_nullable');
final _smoke_TypeDefs_TestStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_release_handle_nullable');
final _smoke_TypeDefs_TestStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_TestStruct_get_value_nullable');
Pointer<Void> smoke_TypeDefs_TestStruct_toFfi_nullable(TypeDefs_TestStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_TypeDefs_TestStruct_toFfi(value);
  final result = _smoke_TypeDefs_TestStruct_create_handle_nullable(_handle);
  smoke_TypeDefs_TestStruct_releaseFfiHandle(_handle);
  return result;
}
TypeDefs_TestStruct smoke_TypeDefs_TestStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_TypeDefs_TestStruct_get_value_nullable(handle);
  final result = smoke_TypeDefs_TestStruct_fromFfi(_handle);
  smoke_TypeDefs_TestStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_TypeDefs_TestStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_TypeDefs_TestStruct_release_handle_nullable(handle);
// End of TypeDefs_TestStruct "private" section.
// TypeDefs "private" section, not exported.
final _smoke_TypeDefs_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypeDefs_copy_handle');
final _smoke_TypeDefs_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypeDefs_release_handle');
final _smoke_TypeDefs_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_TypeDefs_get_raw_pointer');
class TypeDefs$Impl implements TypeDefs {
  @protected
  Pointer<Void> handle;
  TypeDefs$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_TypeDefs_get_raw_pointer(handle));
    _smoke_TypeDefs_release_handle(handle);
    handle = null;
  }
  static double methodWithPrimitiveTypeDef(double input) {
    final _methodWithPrimitiveTypeDef_ffi = __lib.nativeLibrary.lookupFunction<Double Function(Int32, Double), double Function(int, double)>('library_smoke_TypeDefs_methodWithPrimitiveTypeDef__Double');
    final _input_handle = (input);
    final __result_handle = _methodWithPrimitiveTypeDef_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  static List<TypeDefs_TestStruct> methodWithComplexTypeDef(List<TypeDefs_TestStruct> input) {
    final _methodWithComplexTypeDef_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_methodWithComplexTypeDef__ListOf_1smoke_1TypeDefs_1TestStruct');
    final _input_handle = ListOf_smoke_TypeDefs_TestStruct_toFfi(input);
    final __result_handle = _methodWithComplexTypeDef_ffi(__lib.LibraryContext.isolateId, _input_handle);
    ListOf_smoke_TypeDefs_TestStruct_releaseFfiHandle(_input_handle);
    final _result = ListOf_smoke_TypeDefs_TestStruct_fromFfi(__result_handle);
    ListOf_smoke_TypeDefs_TestStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static double returnNestedIntTypeDef(double input) {
    final _returnNestedIntTypeDef_ffi = __lib.nativeLibrary.lookupFunction<Double Function(Int32, Double), double Function(int, double)>('library_smoke_TypeDefs_returnNestedIntTypeDef__Double');
    final _input_handle = (input);
    final __result_handle = _returnNestedIntTypeDef_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  static TypeDefs_TestStruct returnTestStructTypeDef(TypeDefs_TestStruct input) {
    final _returnTestStructTypeDef_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_returnTestStructTypeDef__TestStruct');
    final _input_handle = smoke_TypeDefs_TestStruct_toFfi(input);
    final __result_handle = _returnTestStructTypeDef_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_TypeDefs_TestStruct_releaseFfiHandle(_input_handle);
    final _result = smoke_TypeDefs_TestStruct_fromFfi(__result_handle);
    smoke_TypeDefs_TestStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static TypeDefs_TestStruct returnNestedStructTypeDef(TypeDefs_TestStruct input) {
    final _returnNestedStructTypeDef_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_returnNestedStructTypeDef__TestStruct');
    final _input_handle = smoke_TypeDefs_TestStruct_toFfi(input);
    final __result_handle = _returnNestedStructTypeDef_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_TypeDefs_TestStruct_releaseFfiHandle(_input_handle);
    final _result = smoke_TypeDefs_TestStruct_fromFfi(__result_handle);
    smoke_TypeDefs_TestStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Point returnTypeDefPointFromTypeCollection(Point input) {
    final _returnTypeDefPointFromTypeCollection_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_TypeDefs_returnTypeDefPointFromTypeCollection__Point');
    final _input_handle = smoke_TypeCollection_Point_toFfi(input);
    final __result_handle = _returnTypeDefPointFromTypeCollection_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_TypeCollection_Point_releaseFfiHandle(_input_handle);
    final _result = smoke_TypeCollection_Point_fromFfi(__result_handle);
    smoke_TypeCollection_Point_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  List<double> get primitiveTypeProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_TypeDefs_primitiveTypeProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = ListOf_Double_fromFfi(__result_handle);
    ListOf_Double_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  set primitiveTypeProperty(List<double> value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_TypeDefs_primitiveTypeProperty_set__ListOf_1Double');
    final _value_handle = ListOf_Double_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    ListOf_Double_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_TypeDefs_toFfi(TypeDefs value) =>
  _smoke_TypeDefs_copy_handle((value as TypeDefs$Impl).handle);
TypeDefs smoke_TypeDefs_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_TypeDefs_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as TypeDefs;
  if (instance != null) return instance;
  final _copied_handle = _smoke_TypeDefs_copy_handle(handle);
  final result = TypeDefs$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_TypeDefs_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_TypeDefs_release_handle(handle);
Pointer<Void> smoke_TypeDefs_toFfi_nullable(TypeDefs value) =>
  value != null ? smoke_TypeDefs_toFfi(value) : Pointer<Void>.fromAddress(0);
TypeDefs smoke_TypeDefs_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_TypeDefs_fromFfi(handle) : null;
void smoke_TypeDefs_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_TypeDefs_release_handle(handle);
// End of TypeDefs "private" section.
