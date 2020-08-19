import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/validation_utils.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
final _copy_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_release_handle');
final _copy_return_get_result = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_get_result');
final _copy_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_get_error');
final _copy_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_has_error');
class Vector {
  double x;
  double y;
  Vector._(this.x, this.y);
  Vector._copy(Vector _other) : this._(_other.x, _other.y);
  Vector(double x, double y) : this._copy(_$init(x, y));
  Vector.copy(Vector other) : this._copy(_copy(other));
  Vector.create(int input) : this._copy(_create(input));
  double distanceTo(Vector other) {
    final _distanceTo_ffi = __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>), double Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_StructsWithMethods_Vector_distanceTo__Vector');
    final _other_handle = smoke_StructsWithMethods_Vector_toFfi(other);
    final _handle = smoke_StructsWithMethods_Vector_toFfi(this);
    final __result_handle = _distanceTo_ffi(_handle, __lib.LibraryContext.isolateId, _other_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(_other_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  Vector add(Vector other) {
    final _add_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_StructsWithMethods_Vector_add__Vector');
    final _other_handle = smoke_StructsWithMethods_Vector_toFfi(other);
    final _handle = smoke_StructsWithMethods_Vector_toFfi(this);
    final __result_handle = _add_ffi(_handle, __lib.LibraryContext.isolateId, _other_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(_other_handle);
    try {
      return smoke_StructsWithMethods_Vector_fromFfi(__result_handle);
    } finally {
      smoke_StructsWithMethods_Vector_releaseFfiHandle(__result_handle);
    }
  }
  static bool validate(double x, double y) {
    final _validate_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Double, Double), int Function(int, double, double)>('library_smoke_StructsWithMethods_Vector_validate__Double_Double');
    final _x_handle = (x);
    final _y_handle = (y);
    final __result_handle = _validate_ffi(__lib.LibraryContext.isolateId, _x_handle, _y_handle);
    (_x_handle);
    (_y_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  static Vector _$init(double x, double y) {
    final _$init_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('library_smoke_StructsWithMethods_Vector_create__Double_Double');
    final _x_handle = (x);
    final _y_handle = (y);
    final __result_handle = _$init_ffi(__lib.LibraryContext.isolateId, _x_handle, _y_handle);
    (_x_handle);
    (_y_handle);
    try {
      return smoke_StructsWithMethods_Vector_fromFfi(__result_handle);
    } finally {
      smoke_StructsWithMethods_Vector_releaseFfiHandle(__result_handle);
    }
  }
  static Vector _copy(Vector other) {
    final _copy_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_StructsWithMethods_Vector_create__Vector');
    final _other_handle = smoke_StructsWithMethods_Vector_toFfi(other);
    final __call_result_handle = _copy_ffi(__lib.LibraryContext.isolateId, _other_handle);
    smoke_StructsWithMethods_Vector_releaseFfiHandle(_other_handle);
    if (_copy_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _copy_return_get_error(__call_result_handle);
        _copy_return_release_handle(__call_result_handle);
        try {
          throw ValidationException(smoke_ValidationUtils_ValidationErrorCode_fromFfi(__error_handle));
        } finally {
          smoke_ValidationUtils_ValidationErrorCode_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _copy_return_get_result(__call_result_handle);
    _copy_return_release_handle(__call_result_handle);
    try {
      return smoke_StructsWithMethods_Vector_fromFfi(__result_handle);
    } finally {
      smoke_StructsWithMethods_Vector_releaseFfiHandle(__result_handle);
    }
  }
  static Vector _create(int input) {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint64), Pointer<Void> Function(int, int)>('library_smoke_StructsWithMethods_Vector_create__ULong');
    final _input_handle = (input);
    final __result_handle = _create_ffi(__lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    try {
      return smoke_StructsWithMethods_Vector_fromFfi(__result_handle);
    } finally {
      smoke_StructsWithMethods_Vector_releaseFfiHandle(__result_handle);
    }
  }
}
// Vector "private" section, not exported.
final _smoke_StructsWithMethods_Vector_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('library_smoke_StructsWithMethods_Vector_create_handle');
final _smoke_StructsWithMethods_Vector_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_release_handle');
final _smoke_StructsWithMethods_Vector_get_field_x = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_get_field_x');
final _smoke_StructsWithMethods_Vector_get_field_y = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_get_field_y');
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
  try {
    return Vector._(
      (_x_handle),
      (_y_handle)
    );
  } finally {
    (_x_handle);
    (_y_handle);
  }
}
void smoke_StructsWithMethods_Vector_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructsWithMethods_Vector_release_handle(handle);
// Nullable Vector
final _smoke_StructsWithMethods_Vector_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create_handle_nullable');
final _smoke_StructsWithMethods_Vector_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_release_handle_nullable');
final _smoke_StructsWithMethods_Vector_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_get_value_nullable');
Pointer<Void> smoke_StructsWithMethods_Vector_toFfi_nullable(Vector value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructsWithMethods_Vector_toFfi(value);
  final result = _smoke_StructsWithMethods_Vector_create_handle_nullable(_handle);
  smoke_StructsWithMethods_Vector_releaseFfiHandle(_handle);
  return result;
}
Vector smoke_StructsWithMethods_Vector_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructsWithMethods_Vector_get_value_nullable(handle);
  final result = smoke_StructsWithMethods_Vector_fromFfi(_handle);
  smoke_StructsWithMethods_Vector_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructsWithMethods_Vector_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructsWithMethods_Vector_release_handle_nullable(handle);
// End of Vector "private" section.
