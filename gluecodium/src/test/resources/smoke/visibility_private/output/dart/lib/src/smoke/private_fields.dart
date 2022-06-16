import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class PrivateFields {
  String publicField;
  String _privateField;
  PrivateFields(this.publicField)
      : _privateField = "nonsense";
  PrivateFields.withPrivate(this.publicField, this._privateField);
}
// PrivateFields "private" section, not exported.
final _smokePrivatefieldsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_PrivateFields_create_handle'));
final _smokePrivatefieldsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PrivateFields_release_handle'));
final _smokePrivatefieldsGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PrivateFields_get_field_publicField'));
final _smokePrivatefieldsGetFieldprivateField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PrivateFields_get_field_privateField'));
Pointer<Void> smokePrivatefieldsToFfi(PrivateFields value) {
  final _publicFieldHandle = stringToFfi(value.publicField);
  final _privateFieldHandle = stringToFfi(value._privateField);
  final _result = _smokePrivatefieldsCreateHandle(_publicFieldHandle, _privateFieldHandle);
  stringReleaseFfiHandle(_publicFieldHandle);
  stringReleaseFfiHandle(_privateFieldHandle);
  return _result;
}
PrivateFields smokePrivatefieldsFromFfi(Pointer<Void> handle) {
  final _publicFieldHandle = _smokePrivatefieldsGetFieldpublicField(handle);
  final _privateFieldHandle = _smokePrivatefieldsGetFieldprivateField(handle);
  try {
    return PrivateFields.withPrivate(
      stringFromFfi(_publicFieldHandle),
      stringFromFfi(_privateFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_publicFieldHandle);
    stringReleaseFfiHandle(_privateFieldHandle);
  }
}
void smokePrivatefieldsReleaseFfiHandle(Pointer<Void> handle) => _smokePrivatefieldsReleaseHandle(handle);
// Nullable PrivateFields
final _smokePrivatefieldsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PrivateFields_create_handle_nullable'));
final _smokePrivatefieldsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PrivateFields_release_handle_nullable'));
final _smokePrivatefieldsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PrivateFields_get_value_nullable'));
Pointer<Void> smokePrivatefieldsToFfiNullable(PrivateFields? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePrivatefieldsToFfi(value);
  final result = _smokePrivatefieldsCreateHandleNullable(_handle);
  smokePrivatefieldsReleaseFfiHandle(_handle);
  return result;
}
PrivateFields? smokePrivatefieldsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePrivatefieldsGetValueNullable(handle);
  final result = smokePrivatefieldsFromFfi(_handle);
  smokePrivatefieldsReleaseFfiHandle(_handle);
  return result;
}
void smokePrivatefieldsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePrivatefieldsReleaseHandleNullable(handle);
// End of PrivateFields "private" section.
