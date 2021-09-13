import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class FieldConstructorWithDeprecationAndComment {
  String stringField;
  /// Some field constructor
  /// [stringField]
  @Deprecated("Shouldn't really use it")
  FieldConstructorWithDeprecationAndComment(this.stringField);
}
// FieldConstructorWithDeprecationAndComment "private" section, not exported.
final _smokeFieldconstructorwithdeprecationandcommentCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationAndComment_create_handle'));
final _smokeFieldconstructorwithdeprecationandcommentReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationAndComment_release_handle'));
final _smokeFieldconstructorwithdeprecationandcommentGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationAndComment_get_field_stringField'));
Pointer<Void> smokeFieldconstructorwithdeprecationandcommentToFfi(FieldConstructorWithDeprecationAndComment value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeFieldconstructorwithdeprecationandcommentCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
FieldConstructorWithDeprecationAndComment smokeFieldconstructorwithdeprecationandcommentFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeFieldconstructorwithdeprecationandcommentGetFieldstringField(handle);
  try {
    return FieldConstructorWithDeprecationAndComment(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeFieldconstructorwithdeprecationandcommentReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorwithdeprecationandcommentReleaseHandle(handle);
// Nullable FieldConstructorWithDeprecationAndComment
final _smokeFieldconstructorwithdeprecationandcommentCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationAndComment_create_handle_nullable'));
final _smokeFieldconstructorwithdeprecationandcommentReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationAndComment_release_handle_nullable'));
final _smokeFieldconstructorwithdeprecationandcommentGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithDeprecationAndComment_get_value_nullable'));
Pointer<Void> smokeFieldconstructorwithdeprecationandcommentToFfiNullable(FieldConstructorWithDeprecationAndComment? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorwithdeprecationandcommentToFfi(value);
  final result = _smokeFieldconstructorwithdeprecationandcommentCreateHandleNullable(_handle);
  smokeFieldconstructorwithdeprecationandcommentReleaseFfiHandle(_handle);
  return result;
}
FieldConstructorWithDeprecationAndComment? smokeFieldconstructorwithdeprecationandcommentFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorwithdeprecationandcommentGetValueNullable(handle);
  final result = smokeFieldconstructorwithdeprecationandcommentFromFfi(_handle);
  smokeFieldconstructorwithdeprecationandcommentReleaseFfiHandle(_handle);
  return result;
}
void smokeFieldconstructorwithdeprecationandcommentReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorwithdeprecationandcommentReleaseHandleNullable(handle);
// End of FieldConstructorWithDeprecationAndComment "private" section.
