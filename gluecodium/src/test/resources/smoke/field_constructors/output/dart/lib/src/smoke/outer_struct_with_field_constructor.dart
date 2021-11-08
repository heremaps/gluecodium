import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
class OuterStructWithFieldConstructor {
  OuterStructWithFieldConstructor_InnerStructWithDefaults outerStructField;
  OuterStructWithFieldConstructor(this.outerStructField);
}
class OuterStructWithFieldConstructor_InnerStructWithDefaults {
  double innerStructField;
  OuterStructWithFieldConstructor_InnerStructWithDefaults(this.innerStructField);
  OuterStructWithFieldConstructor_InnerStructWithDefaults.withDefaults()
    : innerStructField = 1.0;
}
// OuterStructWithFieldConstructor_InnerStructWithDefaults "private" section, not exported.
final _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_create_handle'));
final _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_release_handle'));
final _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsGetFieldinnerStructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_get_field_innerStructField'));
Pointer<Void> smokeOuterstructwithfieldconstructorInnerstructwithdefaultsToFfi(OuterStructWithFieldConstructor_InnerStructWithDefaults value) {
  final _innerStructFieldHandle = (value.innerStructField);
  final _result = _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsCreateHandle(_innerStructFieldHandle);
  return _result;
}
OuterStructWithFieldConstructor_InnerStructWithDefaults smokeOuterstructwithfieldconstructorInnerstructwithdefaultsFromFfi(Pointer<Void> handle) {
  final _innerStructFieldHandle = _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsGetFieldinnerStructField(handle);
  try {
    return OuterStructWithFieldConstructor_InnerStructWithDefaults(
      (_innerStructFieldHandle)
    );
  } finally {
  }
}
void smokeOuterstructwithfieldconstructorInnerstructwithdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsReleaseHandle(handle);
// Nullable OuterStructWithFieldConstructor_InnerStructWithDefaults
final _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_create_handle_nullable'));
final _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_release_handle_nullable'));
final _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithFieldConstructor_InnerStructWithDefaults_get_value_nullable'));
Pointer<Void> smokeOuterstructwithfieldconstructorInnerstructwithdefaultsToFfiNullable(OuterStructWithFieldConstructor_InnerStructWithDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuterstructwithfieldconstructorInnerstructwithdefaultsToFfi(value);
  final result = _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsCreateHandleNullable(_handle);
  smokeOuterstructwithfieldconstructorInnerstructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
OuterStructWithFieldConstructor_InnerStructWithDefaults? smokeOuterstructwithfieldconstructorInnerstructwithdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsGetValueNullable(handle);
  final result = smokeOuterstructwithfieldconstructorInnerstructwithdefaultsFromFfi(_handle);
  smokeOuterstructwithfieldconstructorInnerstructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeOuterstructwithfieldconstructorInnerstructwithdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructwithfieldconstructorInnerstructwithdefaultsReleaseHandleNullable(handle);
// End of OuterStructWithFieldConstructor_InnerStructWithDefaults "private" section.
// OuterStructWithFieldConstructor "private" section, not exported.
final _smokeOuterstructwithfieldconstructorCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithFieldConstructor_create_handle'));
final _smokeOuterstructwithfieldconstructorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStructWithFieldConstructor_release_handle'));
final _smokeOuterstructwithfieldconstructorGetFieldouterStructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithFieldConstructor_get_field_outerStructField'));
Pointer<Void> smokeOuterstructwithfieldconstructorToFfi(OuterStructWithFieldConstructor value) {
  final _outerStructFieldHandle = smokeOuterstructwithfieldconstructorInnerstructwithdefaultsToFfi(value.outerStructField);
  final _result = _smokeOuterstructwithfieldconstructorCreateHandle(_outerStructFieldHandle);
  smokeOuterstructwithfieldconstructorInnerstructwithdefaultsReleaseFfiHandle(_outerStructFieldHandle);
  return _result;
}
OuterStructWithFieldConstructor smokeOuterstructwithfieldconstructorFromFfi(Pointer<Void> handle) {
  final _outerStructFieldHandle = _smokeOuterstructwithfieldconstructorGetFieldouterStructField(handle);
  try {
    return OuterStructWithFieldConstructor(
      smokeOuterstructwithfieldconstructorInnerstructwithdefaultsFromFfi(_outerStructFieldHandle)
    );
  } finally {
    smokeOuterstructwithfieldconstructorInnerstructwithdefaultsReleaseFfiHandle(_outerStructFieldHandle);
  }
}
void smokeOuterstructwithfieldconstructorReleaseFfiHandle(Pointer<Void> handle) => _smokeOuterstructwithfieldconstructorReleaseHandle(handle);
// Nullable OuterStructWithFieldConstructor
final _smokeOuterstructwithfieldconstructorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithFieldConstructor_create_handle_nullable'));
final _smokeOuterstructwithfieldconstructorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterStructWithFieldConstructor_release_handle_nullable'));
final _smokeOuterstructwithfieldconstructorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterStructWithFieldConstructor_get_value_nullable'));
Pointer<Void> smokeOuterstructwithfieldconstructorToFfiNullable(OuterStructWithFieldConstructor? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeOuterstructwithfieldconstructorToFfi(value);
  final result = _smokeOuterstructwithfieldconstructorCreateHandleNullable(_handle);
  smokeOuterstructwithfieldconstructorReleaseFfiHandle(_handle);
  return result;
}
OuterStructWithFieldConstructor? smokeOuterstructwithfieldconstructorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeOuterstructwithfieldconstructorGetValueNullable(handle);
  final result = smokeOuterstructwithfieldconstructorFromFfi(_handle);
  smokeOuterstructwithfieldconstructorReleaseFfiHandle(_handle);
  return result;
}
void smokeOuterstructwithfieldconstructorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterstructwithfieldconstructorReleaseHandleNullable(handle);
// End of OuterStructWithFieldConstructor "private" section.
