import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class PrivateFieldsMore {
  String publicField;
  String _privateField;
  String _anotherPrivateField;
  PrivateFieldsMore._(this.publicField, this._privateField, this._anotherPrivateField);
  PrivateFieldsMore(this.publicField, this._privateField)
      : _anotherPrivateField = "more nonsense";
}
// PrivateFieldsMore "private" section, not exported.
final _smokePrivatefieldsmoreCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_PrivateFieldsMore_create_handle'));
final _smokePrivatefieldsmoreReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PrivateFieldsMore_release_handle'));
final _smokePrivatefieldsmoreGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PrivateFieldsMore_get_field_publicField'));
final _smokePrivatefieldsmoreGetFieldprivateField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PrivateFieldsMore_get_field_privateField'));
final _smokePrivatefieldsmoreGetFieldanotherPrivateField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PrivateFieldsMore_get_field_anotherPrivateField'));
Pointer<Void> smokePrivatefieldsmoreToFfi(PrivateFieldsMore value) {
  final _publicFieldHandle = stringToFfi(value.publicField);
  final _privateFieldHandle = stringToFfi(value._privateField);
  final _anotherPrivateFieldHandle = stringToFfi(value._anotherPrivateField);
  final _result = _smokePrivatefieldsmoreCreateHandle(_publicFieldHandle, _privateFieldHandle, _anotherPrivateFieldHandle);
  stringReleaseFfiHandle(_publicFieldHandle);
  stringReleaseFfiHandle(_privateFieldHandle);
  stringReleaseFfiHandle(_anotherPrivateFieldHandle);
  return _result;
}
PrivateFieldsMore smokePrivatefieldsmoreFromFfi(Pointer<Void> handle) {
  final _publicFieldHandle = _smokePrivatefieldsmoreGetFieldpublicField(handle);
  final _privateFieldHandle = _smokePrivatefieldsmoreGetFieldprivateField(handle);
  final _anotherPrivateFieldHandle = _smokePrivatefieldsmoreGetFieldanotherPrivateField(handle);
  try {
    return PrivateFieldsMore._(
      stringFromFfi(_publicFieldHandle),
      stringFromFfi(_privateFieldHandle),
      stringFromFfi(_anotherPrivateFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_publicFieldHandle);
    stringReleaseFfiHandle(_privateFieldHandle);
    stringReleaseFfiHandle(_anotherPrivateFieldHandle);
  }
}
void smokePrivatefieldsmoreReleaseFfiHandle(Pointer<Void> handle) => _smokePrivatefieldsmoreReleaseHandle(handle);
// Nullable PrivateFieldsMore
final _smokePrivatefieldsmoreCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PrivateFieldsMore_create_handle_nullable'));
final _smokePrivatefieldsmoreReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PrivateFieldsMore_release_handle_nullable'));
final _smokePrivatefieldsmoreGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PrivateFieldsMore_get_value_nullable'));
Pointer<Void> smokePrivatefieldsmoreToFfiNullable(PrivateFieldsMore? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePrivatefieldsmoreToFfi(value);
  final result = _smokePrivatefieldsmoreCreateHandleNullable(_handle);
  smokePrivatefieldsmoreReleaseFfiHandle(_handle);
  return result;
}
PrivateFieldsMore? smokePrivatefieldsmoreFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePrivatefieldsmoreGetValueNullable(handle);
  final result = smokePrivatefieldsmoreFromFfi(_handle);
  smokePrivatefieldsmoreReleaseFfiHandle(_handle);
  return result;
}
void smokePrivatefieldsmoreReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePrivatefieldsmoreReleaseHandleNullable(handle);
// End of PrivateFieldsMore "private" section.
