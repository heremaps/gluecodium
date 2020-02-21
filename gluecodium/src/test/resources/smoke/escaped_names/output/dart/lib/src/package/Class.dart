import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/package/Interface.dart';
import 'package:library/src/package/Types.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _package_Class_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('package_Class_copy_handle');
final _package_Class_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('package_Class_release_handle');
final _package_Class_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('package_Class_get_type_id');
final _fun_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('package_Class_fun__ListOf_1package_1Types_1Struct_return_release_handle');
final _fun_return_get_result = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('package_Class_fun__ListOf_1package_1Types_1Struct_return_get_result');
final _fun_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('package_Class_fun__ListOf_1package_1Types_1Struct_return_get_error');
final _fun_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('package_Class_fun__ListOf_1package_1Types_1Struct_return_has_error');
class Class implements Interface {
  final Pointer<Void> _handle;
  Class._(this._handle);
  void release() => _package_Class_release_handle(_handle);
  Class() : this._(_constructor());
  static Pointer<Void> _constructor() {
    final _constructor_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('package_Class_constructor');
    final __result_handle = _constructor_ffi();
    return __result_handle;
  }
  Struct fun(List<Struct> double) {
    final _fun_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('package_Class_fun__ListOf_1package_1Types_1Struct');
    final _double_handle = ListOf_package_Types_Struct_toFfi(double);
    final __call_result_handle = _fun_ffi(_handle, _double_handle);
    ListOf_package_Types_Struct_releaseFfiHandle(_double_handle);
    if (_fun_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _fun_return_get_error(__call_result_handle);
        _fun_return_release_handle(__call_result_handle);
        final _error_value = package_Types_Enum_fromFfi(__error_handle);
        package_Types_Enum_releaseFfiHandle(__error_handle);
        throw ExceptionException(_error_value);
    }
    final __result_handle = _fun_return_get_result(__call_result_handle);
    _fun_return_release_handle(__call_result_handle);
    final _result = package_Types_Struct_fromFfi(__result_handle);
    package_Types_Struct_releaseFfiHandle(__result_handle);
    return _result;
  }
  Enum get property {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>), int Function(Pointer<Void>)>('package_Class_property_get');
    final __result_handle = _get_ffi(_handle);
    final _result = package_Types_Enum_fromFfi(__result_handle);
    package_Types_Enum_releaseFfiHandle(__result_handle);
    return _result;
  }
  set property(Enum value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Uint32), void Function(Pointer<Void>, int)>('package_Class_property_set__enum');
    final _value_handle = package_Types_Enum_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    package_Types_Enum_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> package_Class_toFfi(Class value) =>
  _package_Class_copy_handle(value._handle);
Class package_Class_fromFfi(Pointer<Void> handle) {
  final _copied_handle = _package_Class_copy_handle(handle);
  final _type_id_handle = _package_Class_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? Class._(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void package_Class_releaseFfiHandle(Pointer<Void> handle) =>
  _package_Class_release_handle(handle);
Pointer<Void> package_Class_toFfi_nullable(Class value) =>
  value != null ? package_Class_toFfi(value) : Pointer<Void>.fromAddress(0);
Class package_Class_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? package_Class_fromFfi(handle) : null;
void package_Class_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _package_Class_release_handle(handle);
// Internal, not exported.
class Class__Factory {
  static Class create(Pointer<Void> handle) => Class._(handle);
}
