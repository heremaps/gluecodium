import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/validation_utils.dart';
import 'package:meta/meta.dart';
class StructsWithMethods {
}
final _copysmokeStructswithmethodsVectorCreateVectorReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_release_handle'));
final _copysmokeStructswithmethodsVectorCreateVectorReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_get_result'));
final _copysmokeStructswithmethodsVectorCreateVectorReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_get_error'));
final _copysmokeStructswithmethodsVectorCreateVectorReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_Vector_create__Vector_return_has_error'));
class StructsWithMethods_Vector {
  double x;
  double y;
  StructsWithMethods_Vector._(this.x, this.y);
  factory StructsWithMethods_Vector(double x, double y) => $prototype.$init(x, y);
  factory StructsWithMethods_Vector.copy(StructsWithMethods_Vector other) => $prototype.copy(other);
  factory StructsWithMethods_Vector.create(int input) => $prototype.create(input);
  double distanceTo(StructsWithMethods_Vector other) => $prototype.distanceTo(this, other);
  StructsWithMethods_Vector add(StructsWithMethods_Vector other) => $prototype.add(this, other);
  static bool validate(double x, double y) => $prototype.validate(x, y);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = StructsWithMethods_Vector$Impl();
}
// StructsWithMethods_Vector "private" section, not exported.
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
/// @nodoc
@visibleForTesting
class StructsWithMethods_Vector$Impl {
  double distanceTo(StructsWithMethods_Vector $that, StructsWithMethods_Vector other) {
    final _distanceToFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>), double Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_StructsWithMethods_Vector_distanceTo__Vector'));
    final _otherHandle = smokeStructswithmethodsVectorToFfi(other);
    final _handle = smokeStructswithmethodsVectorToFfi($that);
    final __resultHandle = _distanceToFfi(_handle, __lib.LibraryContext.isolateId, _otherHandle);
    smokeStructswithmethodsVectorReleaseFfiHandle(_handle);
    smokeStructswithmethodsVectorReleaseFfiHandle(_otherHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  StructsWithMethods_Vector add(StructsWithMethods_Vector $that, StructsWithMethods_Vector other) {
    final _addFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_StructsWithMethods_Vector_add__Vector'));
    final _otherHandle = smokeStructswithmethodsVectorToFfi(other);
    final _handle = smokeStructswithmethodsVectorToFfi($that);
    final __resultHandle = _addFfi(_handle, __lib.LibraryContext.isolateId, _otherHandle);
    smokeStructswithmethodsVectorReleaseFfiHandle(_handle);
    smokeStructswithmethodsVectorReleaseFfiHandle(_otherHandle);
    try {
      return smokeStructswithmethodsVectorFromFfi(__resultHandle);
    } finally {
      smokeStructswithmethodsVectorReleaseFfiHandle(__resultHandle);
    }
  }
  bool validate(double x, double y) {
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
  StructsWithMethods_Vector $init(double x, double y) {
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
  StructsWithMethods_Vector copy(StructsWithMethods_Vector other) {
    final _copyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_StructsWithMethods_Vector_create__Vector'));
    final _otherHandle = smokeStructswithmethodsVectorToFfi(other);
    final __callResultHandle = _copyFfi(__lib.LibraryContext.isolateId, _otherHandle);
    smokeStructswithmethodsVectorReleaseFfiHandle(_otherHandle);
    if (_copysmokeStructswithmethodsVectorCreateVectorReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _copysmokeStructswithmethodsVectorCreateVectorReturnGetError(__callResultHandle);
        _copysmokeStructswithmethodsVectorCreateVectorReturnReleaseHandle(__callResultHandle);
        try {
          throw ValidationUtils_ValidationException(smokeValidationutilsValidationerrorcodeFromFfi(__errorHandle));
        } finally {
          smokeValidationutilsValidationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _copysmokeStructswithmethodsVectorCreateVectorReturnGetResult(__callResultHandle);
    _copysmokeStructswithmethodsVectorCreateVectorReturnReleaseHandle(__callResultHandle);
    try {
      return smokeStructswithmethodsVectorFromFfi(__resultHandle);
    } finally {
      smokeStructswithmethodsVectorReleaseFfiHandle(__resultHandle);
    }
  }
  StructsWithMethods_Vector create(int input) {
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
Pointer<Void> smokeStructswithmethodsVectorToFfi(StructsWithMethods_Vector value) {
  final _xHandle = (value.x);
  final _yHandle = (value.y);
  final _result = _smokeStructswithmethodsVectorCreateHandle(_xHandle, _yHandle);
  return _result;
}
StructsWithMethods_Vector smokeStructswithmethodsVectorFromFfi(Pointer<Void> handle) {
  final _xHandle = _smokeStructswithmethodsVectorGetFieldx(handle);
  final _yHandle = _smokeStructswithmethodsVectorGetFieldy(handle);
  try {
    return StructsWithMethods_Vector._(
      (_xHandle),
      (_yHandle)
    );
  } finally {
  }
}
void smokeStructswithmethodsVectorReleaseFfiHandle(Pointer<Void> handle) => _smokeStructswithmethodsVectorReleaseHandle(handle);
// Nullable StructsWithMethods_Vector
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
Pointer<Void> smokeStructswithmethodsVectorToFfiNullable(StructsWithMethods_Vector? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructswithmethodsVectorToFfi(value);
  final result = _smokeStructswithmethodsVectorCreateHandleNullable(_handle);
  smokeStructswithmethodsVectorReleaseFfiHandle(_handle);
  return result;
}
StructsWithMethods_Vector? smokeStructswithmethodsVectorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructswithmethodsVectorGetValueNullable(handle);
  final result = smokeStructswithmethodsVectorFromFfi(_handle);
  smokeStructswithmethodsVectorReleaseFfiHandle(_handle);
  return result;
}
void smokeStructswithmethodsVectorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructswithmethodsVectorReleaseHandleNullable(handle);
// End of StructsWithMethods_Vector "private" section.
// StructsWithMethods "private" section, not exported.
final _smokeStructswithmethodsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_smoke_StructsWithMethods_create_handle'));
final _smokeStructswithmethodsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_release_handle'));
Pointer<Void> smokeStructswithmethodsToFfi(StructsWithMethods value) {
  final _result = _smokeStructswithmethodsCreateHandle();
  return _result;
}
StructsWithMethods smokeStructswithmethodsFromFfi(Pointer<Void> handle) {
  try {
    return StructsWithMethods(
    );
  } finally {
  }
}
void smokeStructswithmethodsReleaseFfiHandle(Pointer<Void> handle) => _smokeStructswithmethodsReleaseHandle(handle);
// Nullable StructsWithMethods
final _smokeStructswithmethodsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_create_handle_nullable'));
final _smokeStructswithmethodsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_release_handle_nullable'));
final _smokeStructswithmethodsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructsWithMethods_get_value_nullable'));
Pointer<Void> smokeStructswithmethodsToFfiNullable(StructsWithMethods? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructswithmethodsToFfi(value);
  final result = _smokeStructswithmethodsCreateHandleNullable(_handle);
  smokeStructswithmethodsReleaseFfiHandle(_handle);
  return result;
}
StructsWithMethods? smokeStructswithmethodsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructswithmethodsGetValueNullable(handle);
  final result = smokeStructswithmethodsFromFfi(_handle);
  smokeStructswithmethodsReleaseFfiHandle(_handle);
  return result;
}
void smokeStructswithmethodsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructswithmethodsReleaseHandleNullable(handle);
// End of StructsWithMethods "private" section.