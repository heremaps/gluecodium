import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class FieldConstructorWithExcluded {
  /// Some field
  String stringField;
  /// Some field constructor
  /// [stringField] Some field
  /// @nodoc
  FieldConstructorWithExcluded(this.stringField);
}
// FieldConstructorWithExcluded "private" section, not exported.
final _smokeFieldconstructorwithexcludedCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcluded_create_handle'));
final _smokeFieldconstructorwithexcludedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcluded_release_handle'));
final _smokeFieldconstructorwithexcludedGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcluded_get_field_stringField'));
Pointer<Void> smokeFieldconstructorwithexcludedToFfi(FieldConstructorWithExcluded value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeFieldconstructorwithexcludedCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
FieldConstructorWithExcluded smokeFieldconstructorwithexcludedFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeFieldconstructorwithexcludedGetFieldstringField(handle);
  try {
    return FieldConstructorWithExcluded(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeFieldconstructorwithexcludedReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorwithexcludedReleaseHandle(handle);
// Nullable FieldConstructorWithExcluded
final _smokeFieldconstructorwithexcludedCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcluded_create_handle_nullable'));
final _smokeFieldconstructorwithexcludedReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcluded_release_handle_nullable'));
final _smokeFieldconstructorwithexcludedGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithExcluded_get_value_nullable'));
Pointer<Void> smokeFieldconstructorwithexcludedToFfiNullable(FieldConstructorWithExcluded? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorwithexcludedToFfi(value);
  final result = _smokeFieldconstructorwithexcludedCreateHandleNullable(_handle);
  smokeFieldconstructorwithexcludedReleaseFfiHandle(_handle);
  return result;
}
FieldConstructorWithExcluded? smokeFieldconstructorwithexcludedFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorwithexcludedGetValueNullable(handle);
  final result = smokeFieldconstructorwithexcludedFromFfi(_handle);
  smokeFieldconstructorwithexcludedReleaseFfiHandle(_handle);
  return result;
}
void smokeFieldconstructorwithexcludedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorwithexcludedReleaseHandleNullable(handle);
// End of FieldConstructorWithExcluded "private" section.
