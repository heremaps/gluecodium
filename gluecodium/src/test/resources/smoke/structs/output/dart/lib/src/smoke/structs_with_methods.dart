import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/validation_utils.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
final _copyReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_release_handle'));
final _copyReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_get_result'));
final _copyReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_get_error'));
final _copyReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_has_error'));
class Vector {
  double x;
  double y;
  Vector._(this.x, this.y);
  Vector._copy(Vector _other) : this._(_other.x, _other.y);
  Vector(double x, double y) : this._copy(_$init(x, y));
  Vector.copy(Vector other) : this._copy(_copy(other));
  Vector.create(int input) : this._copy(_create(input));
  double distanceTo(Vector other) {
    final _distanceToFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>), double Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_StructsWithMethods_Vector_distanceTo__Vector'));
    final _otherHandle = smokeStructswithmethodsVectorToFfi(other);
    final _handle = smokeStructswithmethodsVectorToFfi(this);
    final __resultHandle = _distanceToFfi(_handle, __lib.LibraryContext.isolateId, _otherHandle);
    smokeStructswithmethodsVectorReleaseFfiHandle(_handle);
    smokeStructswithmethodsVectorReleaseFfiHandle(_otherHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  Vector add(Vector other) {
    final _addFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_StructsWithMethods_Vector_add__Vector'));
    final _otherHandle = smokeStructswithmethodsVectorToFfi(other);
    final _handle = smokeStructswithmethodsVectorToFfi(this);
    final __resultHandle = _addFfi(_handle, __lib.LibraryContext.isolateId, _otherHandle);
    smokeStructswithmethodsVectorReleaseFfiHandle(_handle);
    smokeStructswithmethodsVectorReleaseFfiHandle(_otherHandle);
    try {
      return smokeStructswithmethodsVectorFromFfi(__resultHandle);
    } finally {
      smokeStructswithmethodsVectorReleaseFfiHandle(__resultHandle);
    }
  }
  static bool validate(double x, double y) {
    final _validateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Double, Double), int Function(int, double, double)>('library_smoke_StructsWithMethods_Vector_validate__Double_Double'));
    final _xHandle = (x);
    final _yHandle = (y);
    final __resultHandle = _validateFfi(__lib.LibraryContext.isolateId, _xHandle, _yHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  static Vector _$init(double x, double y) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('library_smoke_StructsWithMethods_Vector_create__Double_Double'));
    final _xHandle = (x);
    final _yHandle = (y);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _xHandle, _yHandle);
    try {
      return smokeStructswithmethodsVectorFromFfi(__resultHandle);
    } finally {
      smokeStructswithmethodsVectorReleaseFfiHandle(__resultHandle);
    }
  }
  static Vector _copy(Vector other) {
    final _copyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_StructsWithMethods_Vector_create__Vector'));
    final _otherHandle = smokeStructswithmethodsVectorToFfi(other);
    final __callResultHandle = _copyFfi(__lib.LibraryContext.isolateId, _otherHandle);
    smokeStructswithmethodsVectorReleaseFfiHandle(_otherHandle);
    if (_copyReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _copyReturnGetError(__callResultHandle);
        _copyReturnReleaseHandle(__callResultHandle);
        try {
          throw ValidationException(smokeValidationutilsValidationerrorcodeFromFfi(__errorHandle));
        } finally {
          smokeValidationutilsValidationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _copyReturnGetResult(__callResultHandle);
    _copyReturnReleaseHandle(__callResultHandle);
    try {
      return smokeStructswithmethodsVectorFromFfi(__resultHandle);
    } finally {
      smokeStructswithmethodsVectorReleaseFfiHandle(__resultHandle);
    }
  }
  static Vector _create(int input) {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint64), Pointer<Void> Function(int, int)>('library_smoke_StructsWithMethods_Vector_create__ULong'));
    final _inputHandle = (input);
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId, _inputHandle);
    try {
      return smokeStructswithmethodsVectorFromFfi(__resultHandle);
    } finally {
      smokeStructswithmethodsVectorReleaseFfiHandle(__resultHandle);
    }
  }
}
// Vector "private" section, not exported.
final _smokeStructswithmethodsVectorCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('library_smoke_StructsWithMethods_Vector_create_handle'));
final _smokeStructswithmethodsVectorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_release_handle'));
final _smokeStructswithmethodsVectorGetFieldx = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_get_field_x'));
final _smokeStructswithmethodsVectorGetFieldy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_get_field_y'));
Pointer<Void> smokeStructswithmethodsVectorToFfi(Vector value) {
  final _xHandle = (value.x);
  final _yHandle = (value.y);
  final _result = _smokeStructswithmethodsVectorCreateHandle(_xHandle, _yHandle);
  return _result;
}
Vector smokeStructswithmethodsVectorFromFfi(Pointer<Void> handle) {
  final _xHandle = _smokeStructswithmethodsVectorGetFieldx(handle);
  final _yHandle = _smokeStructswithmethodsVectorGetFieldy(handle);
  try {
    return Vector._(
      (_xHandle),
      (_yHandle)
    );
  } finally {
  }
}
void smokeStructswithmethodsVectorReleaseFfiHandle(Pointer<Void> handle) => _smokeStructswithmethodsVectorReleaseHandle(handle);
// Nullable Vector
final _smokeStructswithmethodsVectorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create_handle_nullable'));
final _smokeStructswithmethodsVectorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_release_handle_nullable'));
final _smokeStructswithmethodsVectorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_get_value_nullable'));
Pointer<Void> smokeStructswithmethodsVectorToFfiNullable(Vector value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructswithmethodsVectorToFfi(value);
  final result = _smokeStructswithmethodsVectorCreateHandleNullable(_handle);
  smokeStructswithmethodsVectorReleaseFfiHandle(_handle);
  return result;
}
Vector smokeStructswithmethodsVectorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructswithmethodsVectorGetValueNullable(handle);
  final result = smokeStructswithmethodsVectorFromFfi(_handle);
  smokeStructswithmethodsVectorReleaseFfiHandle(_handle);
  return result;
}
void smokeStructswithmethodsVectorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructswithmethodsVectorReleaseHandleNullable(handle);
// End of Vector "private" section.
