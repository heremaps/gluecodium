import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/smoke/ValidationErrorCode__conversion.dart';
import 'package:library/src/smoke/ValidationUtils.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _create_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_StructsWithMethods_Vector_create__Vector_return_release_handle');
final _create_return_get_result = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructsWithMethods_Vector_create__Vector_return_get_result');
final _create_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_StructsWithMethods_Vector_create__Vector_return_get_error');
final _create_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_StructsWithMethods_Vector_create__Vector_return_has_error');
class Vector {
  double x;
  double y;
  Vector._(this.x, this.y);
  Vector._copy(Vector _other) : this._(_other.x, _other.y);
  Vector.create(double x, double y) : this._copy(_create(x, y));
  Vector.create(Vector other) : this._copy(_create(other));
  double distanceTo(Vector other) {
    final _distanceTo_ffi = __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Pointer<Void>), double Function(Pointer<Void>, Pointer<Void>)>('smoke_StructsWithMethods_Vector_distanceTo__Vector');
    final _other_handle = smoke_StructsWithMethods_Vector_toFfi(other);
    final _handle = smoke_StructsWithMethods_Vector_toFfi(this);
    final __result_handle = _distanceTo_ffi(_handle, _other_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(_other_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  Vector add(Vector other) {
    final _add_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_StructsWithMethods_Vector_add__Vector');
    final _other_handle = smoke_StructsWithMethods_Vector_toFfi(other);
    final _handle = smoke_StructsWithMethods_Vector_toFfi(this);
    final __result_handle = _add_ffi(_handle, _other_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(_other_handle);
    final _result = smoke_StructsWithMethods_Vector_fromFfi(__result_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(__result_handle);
    return _result;
  }
  static bool validate(double x, double y) {
    final _validate_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Double, Double), int Function(double, double)>('smoke_StructsWithMethods_Vector_validate__Double_Double');
    final _x_handle = (x);
    final _y_handle = (y);
    final __result_handle = _validate_ffi(_x_handle, _y_handle);
    (_x_handle);
    (_y_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Vector _create(double x, double y) {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Double, Double), Pointer<Void> Function(double, double)>('smoke_StructsWithMethods_Vector_create__Double_Double');
    final _x_handle = (x);
    final _y_handle = (y);
    final __result_handle = _create_ffi(_x_handle, _y_handle);
    (_x_handle);
    (_y_handle);
    final _result = smoke_StructsWithMethods_Vector_fromFfi(__result_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Vector _create(Vector other) {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_StructsWithMethods_Vector_create__Vector');
    final _other_handle = smoke_StructsWithMethods_Vector_toFfi(other);
    final __call_result_handle = _create_ffi(_other_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(_other_handle);
    if (_create_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _create_return_get_error(__call_result_handle);
        _create_return_release_handle(__call_result_handle);
        final _error_value = smoke_ValidationUtils_ValidationErrorCode_fromFfi(__error_handle);
        smoke_ValidationUtils_ValidationErrorCode_releaseFfiHandle(__error_handle);
        throw ValidationException(_error_value);
    }
    final __result_handle = _create_return_get_result(__call_result_handle);
    _create_return_release_handle(__call_result_handle);
    final _result = smoke_StructsWithMethods_Vector_fromFfi(__result_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(__result_handle);
    return _result;
  }
}
// Vector "private" section, not exported.
final _smoke_StructsWithMethods_Vector_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('smoke_StructsWithMethods_Vector_create_handle');
final _smoke_StructsWithMethods_Vector_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_StructsWithMethods_Vector_release_handle');
final _smoke_StructsWithMethods_Vector_get_field_x = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_StructsWithMethods_Vector_get_field_x');
final _smoke_StructsWithMethods_Vector_get_field_y = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_StructsWithMethods_Vector_get_field_y');
Pointer<Void> smoke_StructsWithMethods_Vector_toFfi(Vector value) {
  final _x_handle = (value.x);
  final _y_handle = (value.y);
  final _result = _smoke_StructsWithMethods_Vector_create_handle(_x_handle, _y_handle);
  (_x_handle);
  (_y_handle);
  return _result;
}
Vector smoke_StructsWithMethods_Vector_fromFfi(Pointer<Void> handle) {
  final _x_handle = _smoke_StructsWithMethods_Vector_get_field_x(handle);
  final _y_handle = _smoke_StructsWithMethods_Vector_get_field_y(handle);
  final _result = Vector._(
    (_x_handle),
    (_y_handle)
  );
  (_x_handle);
  (_y_handle);
  return _result;
}
void smoke_StructsWithMethods_Vector_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructsWithMethods_Vector_release_handle(handle);
// End of Vector "private" section.
