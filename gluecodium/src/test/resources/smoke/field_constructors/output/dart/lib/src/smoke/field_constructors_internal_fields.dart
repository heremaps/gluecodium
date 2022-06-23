import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class FieldConstructorsInternalFields {
  String stringField;
  int intField;
  /// @nodoc
  @internal
  bool _boolField;
  FieldConstructorsInternalFields.withAll()
      : stringField = "nonsense", intField = 42, _boolField = true;
  FieldConstructorsInternalFields.withTrue(this.intField, this.stringField)
      : _boolField = true;
  FieldConstructorsInternalFields(this._boolField, this.intField, this.stringField);
}
// FieldConstructorsInternalFields "private" section, not exported.
final _smokeFieldconstructorsinternalfieldsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Uint8),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_FieldConstructorsInternalFields_create_handle'));
final _smokeFieldconstructorsinternalfieldsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternalFields_release_handle'));
final _smokeFieldconstructorsinternalfieldsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternalFields_get_field_stringField'));
final _smokeFieldconstructorsinternalfieldsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternalFields_get_field_intField'));
final _smokeFieldconstructorsinternalfieldsGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternalFields_get_field_boolField'));
Pointer<Void> smokeFieldconstructorsinternalfieldsToFfi(FieldConstructorsInternalFields value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _intFieldHandle = (value.intField);
  final _boolFieldHandle = booleanToFfi(value._boolField);
  final _result = _smokeFieldconstructorsinternalfieldsCreateHandle(_stringFieldHandle, _intFieldHandle, _boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}
FieldConstructorsInternalFields smokeFieldconstructorsinternalfieldsFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeFieldconstructorsinternalfieldsGetFieldstringField(handle);
  final _intFieldHandle = _smokeFieldconstructorsinternalfieldsGetFieldintField(handle);
  final _boolFieldHandle = _smokeFieldconstructorsinternalfieldsGetFieldboolField(handle);
  try {
    return FieldConstructorsInternalFields(
      booleanFromFfi(_boolFieldHandle),
      (_intFieldHandle),
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}
void smokeFieldconstructorsinternalfieldsReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorsinternalfieldsReleaseHandle(handle);
// Nullable FieldConstructorsInternalFields
final _smokeFieldconstructorsinternalfieldsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternalFields_create_handle_nullable'));
final _smokeFieldconstructorsinternalfieldsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternalFields_release_handle_nullable'));
final _smokeFieldconstructorsinternalfieldsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternalFields_get_value_nullable'));
Pointer<Void> smokeFieldconstructorsinternalfieldsToFfiNullable(FieldConstructorsInternalFields? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorsinternalfieldsToFfi(value);
  final result = _smokeFieldconstructorsinternalfieldsCreateHandleNullable(_handle);
  smokeFieldconstructorsinternalfieldsReleaseFfiHandle(_handle);
  return result;
}
FieldConstructorsInternalFields? smokeFieldconstructorsinternalfieldsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorsinternalfieldsGetValueNullable(handle);
  final result = smokeFieldconstructorsinternalfieldsFromFfi(_handle);
  smokeFieldconstructorsinternalfieldsReleaseFfiHandle(_handle);
  return result;
}
void smokeFieldconstructorsinternalfieldsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorsinternalfieldsReleaseHandleNullable(handle);
// End of FieldConstructorsInternalFields "private" section.
