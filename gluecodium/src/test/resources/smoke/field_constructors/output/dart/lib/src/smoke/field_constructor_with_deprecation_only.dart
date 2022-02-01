import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class FieldConstructorWithDeprecationOnly {
  String stringField;
  @Deprecated("Shouldn't really use it")
  FieldConstructorWithDeprecationOnly(this.stringField);
}
// FieldConstructorWithDeprecationOnly "private" section, not exported.
final _smokeFieldconstructorwithdeprecationonlyCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationOnly_create_handle'));
final _smokeFieldconstructorwithdeprecationonlyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationOnly_release_handle'));
final _smokeFieldconstructorwithdeprecationonlyGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationOnly_get_field_stringField'));
Pointer<Void> smokeFieldconstructorwithdeprecationonlyToFfi(FieldConstructorWithDeprecationOnly value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeFieldconstructorwithdeprecationonlyCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
FieldConstructorWithDeprecationOnly smokeFieldconstructorwithdeprecationonlyFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeFieldconstructorwithdeprecationonlyGetFieldstringField(handle);
  try {
    return FieldConstructorWithDeprecationOnly(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeFieldconstructorwithdeprecationonlyReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorwithdeprecationonlyReleaseHandle(handle);
// Nullable FieldConstructorWithDeprecationOnly
final _smokeFieldconstructorwithdeprecationonlyCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationOnly_create_handle_nullable'));
final _smokeFieldconstructorwithdeprecationonlyReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationOnly_release_handle_nullable'));
final _smokeFieldconstructorwithdeprecationonlyGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationOnly_get_value_nullable'));
Pointer<Void> smokeFieldconstructorwithdeprecationonlyToFfiNullable(FieldConstructorWithDeprecationOnly? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorwithdeprecationonlyToFfi(value);
  final result = _smokeFieldconstructorwithdeprecationonlyCreateHandleNullable(_handle);
  smokeFieldconstructorwithdeprecationonlyReleaseFfiHandle(_handle);
  return result;
}
FieldConstructorWithDeprecationOnly? smokeFieldconstructorwithdeprecationonlyFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorwithdeprecationonlyGetValueNullable(handle);
  final result = smokeFieldconstructorwithdeprecationonlyFromFfi(_handle);
  smokeFieldconstructorwithdeprecationonlyReleaseFfiHandle(_handle);
  return result;
}
void smokeFieldconstructorwithdeprecationonlyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorwithdeprecationonlyReleaseHandleNullable(handle);
// End of FieldConstructorWithDeprecationOnly "private" section.
