import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class SkipField {
  String field;
  SkipField(this.field);
}
// SkipField "private" section, not exported.
final _smokeSkipfieldCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipField_create_handle'));
final _smokeSkipfieldReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipField_release_handle'));
final _smokeSkipfieldGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipField_get_field_field'));
Pointer<Void> smokeSkipfieldToFfi(SkipField value) {
  final _fieldHandle = stringToFfi(value.field);
  final _result = _smokeSkipfieldCreateHandle(_fieldHandle);
  stringReleaseFfiHandle(_fieldHandle);
  return _result;
}
SkipField smokeSkipfieldFromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeSkipfieldGetFieldfield(handle);
  try {
    return SkipField(
      stringFromFfi(_fieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_fieldHandle);
  }
}
void smokeSkipfieldReleaseFfiHandle(Pointer<Void> handle) => _smokeSkipfieldReleaseHandle(handle);
// Nullable SkipField
final _smokeSkipfieldCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipField_create_handle_nullable'));
final _smokeSkipfieldReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipField_release_handle_nullable'));
final _smokeSkipfieldGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipField_get_value_nullable'));
Pointer<Void> smokeSkipfieldToFfiNullable(SkipField? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeSkipfieldToFfi(value);
  final result = _smokeSkipfieldCreateHandleNullable(_handle);
  smokeSkipfieldReleaseFfiHandle(_handle);
  return result;
}
SkipField? smokeSkipfieldFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeSkipfieldGetValueNullable(handle);
  final result = smokeSkipfieldFromFfi(_handle);
  smokeSkipfieldReleaseFfiHandle(_handle);
  return result;
}
void smokeSkipfieldReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkipfieldReleaseHandleNullable(handle);
// End of SkipField "private" section.
