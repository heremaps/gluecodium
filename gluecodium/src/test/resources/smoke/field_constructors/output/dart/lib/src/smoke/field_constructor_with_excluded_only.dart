import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class FieldConstructorWithExcludedOnly {
  String stringField;
  /// [stringField]
  /// @nodoc
  FieldConstructorWithExcludedOnly(this.stringField);
}
// FieldConstructorWithExcludedOnly "private" section, not exported.
final _smokeFieldconstructorwithexcludedonlyCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcludedOnly_create_handle'));
final _smokeFieldconstructorwithexcludedonlyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcludedOnly_release_handle'));
final _smokeFieldconstructorwithexcludedonlyGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcludedOnly_get_field_stringField'));
Pointer<Void> smokeFieldconstructorwithexcludedonlyToFfi(FieldConstructorWithExcludedOnly value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeFieldconstructorwithexcludedonlyCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
FieldConstructorWithExcludedOnly smokeFieldconstructorwithexcludedonlyFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeFieldconstructorwithexcludedonlyGetFieldstringField(handle);
  try {
    return FieldConstructorWithExcludedOnly(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeFieldconstructorwithexcludedonlyReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorwithexcludedonlyReleaseHandle(handle);
// Nullable FieldConstructorWithExcludedOnly
final _smokeFieldconstructorwithexcludedonlyCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcludedOnly_create_handle_nullable'));
final _smokeFieldconstructorwithexcludedonlyReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcludedOnly_release_handle_nullable'));
final _smokeFieldconstructorwithexcludedonlyGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcludedOnly_get_value_nullable'));
Pointer<Void> smokeFieldconstructorwithexcludedonlyToFfiNullable(FieldConstructorWithExcludedOnly? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorwithexcludedonlyToFfi(value);
  final result = _smokeFieldconstructorwithexcludedonlyCreateHandleNullable(_handle);
  smokeFieldconstructorwithexcludedonlyReleaseFfiHandle(_handle);
  return result;
}
FieldConstructorWithExcludedOnly? smokeFieldconstructorwithexcludedonlyFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorwithexcludedonlyGetValueNullable(handle);
  final result = smokeFieldconstructorwithexcludedonlyFromFfi(_handle);
  smokeFieldconstructorwithexcludedonlyReleaseFfiHandle(_handle);
  return result;
}
void smokeFieldconstructorwithexcludedonlyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorwithexcludedonlyReleaseHandleNullable(handle);
// End of FieldConstructorWithExcludedOnly "private" section.
