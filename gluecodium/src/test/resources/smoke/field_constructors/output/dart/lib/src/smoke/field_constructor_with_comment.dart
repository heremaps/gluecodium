import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
/// SomeStruct
class FieldConstructorWithComment {
  /// Some field
  String stringField;
  /// Some field constructor
  /// [stringField] Some field
  FieldConstructorWithComment(this.stringField);
}
// FieldConstructorWithComment "private" section, not exported.
final _smokeFieldconstructorwithcommentCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithComment_create_handle'));
final _smokeFieldconstructorwithcommentReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithComment_release_handle'));
final _smokeFieldconstructorwithcommentGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithComment_get_field_stringField'));
Pointer<Void> smokeFieldconstructorwithcommentToFfi(FieldConstructorWithComment value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeFieldconstructorwithcommentCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
FieldConstructorWithComment smokeFieldconstructorwithcommentFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeFieldconstructorwithcommentGetFieldstringField(handle);
  try {
    return FieldConstructorWithComment(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeFieldconstructorwithcommentReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorwithcommentReleaseHandle(handle);
// Nullable FieldConstructorWithComment
final _smokeFieldconstructorwithcommentCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithComment_create_handle_nullable'));
final _smokeFieldconstructorwithcommentReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithComment_release_handle_nullable'));
final _smokeFieldconstructorwithcommentGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithComment_get_value_nullable'));
Pointer<Void> smokeFieldconstructorwithcommentToFfiNullable(FieldConstructorWithComment? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorwithcommentToFfi(value);
  final result = _smokeFieldconstructorwithcommentCreateHandleNullable(_handle);
  smokeFieldconstructorwithcommentReleaseFfiHandle(_handle);
  return result;
}
FieldConstructorWithComment? smokeFieldconstructorwithcommentFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorwithcommentGetValueNullable(handle);
  final result = smokeFieldconstructorwithcommentFromFfi(_handle);
  smokeFieldconstructorwithcommentReleaseFfiHandle(_handle);
  return result;
}
void smokeFieldconstructorwithcommentReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorwithcommentReleaseHandleNullable(handle);
// End of FieldConstructorWithComment "private" section.
