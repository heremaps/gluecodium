import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class FieldConstructorsAllDefaults {
  String stringField;
  int intField;
  bool boolField;
  FieldConstructorsAllDefaults.withAll()
      : stringField = "nonsense", intField = 42, boolField = true;
  FieldConstructorsAllDefaults.withTrueNonsense(this.intField)
      : stringField = "nonsense", boolField = true;
  FieldConstructorsAllDefaults.withTrue(this.intField, this.stringField)
      : boolField = true;
  FieldConstructorsAllDefaults(this.boolField, this.intField, this.stringField);
}
// FieldConstructorsAllDefaults "private" section, not exported.
final _smokeFieldconstructorsalldefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Uint8),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_FieldConstructorsAllDefaults_create_handle'));
final _smokeFieldconstructorsalldefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsAllDefaults_release_handle'));
final _smokeFieldconstructorsalldefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsAllDefaults_get_field_stringField'));
final _smokeFieldconstructorsalldefaultsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsAllDefaults_get_field_intField'));
final _smokeFieldconstructorsalldefaultsGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsAllDefaults_get_field_boolField'));
Pointer<Void> smokeFieldconstructorsalldefaultsToFfi(FieldConstructorsAllDefaults value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _intFieldHandle = (value.intField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _result = _smokeFieldconstructorsalldefaultsCreateHandle(_stringFieldHandle, _intFieldHandle, _boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}
FieldConstructorsAllDefaults smokeFieldconstructorsalldefaultsFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeFieldconstructorsalldefaultsGetFieldstringField(handle);
  final _intFieldHandle = _smokeFieldconstructorsalldefaultsGetFieldintField(handle);
  final _boolFieldHandle = _smokeFieldconstructorsalldefaultsGetFieldboolField(handle);
  try {
    return FieldConstructorsAllDefaults(
      booleanFromFfi(_boolFieldHandle),
      (_intFieldHandle),
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}
void smokeFieldconstructorsalldefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorsalldefaultsReleaseHandle(handle);
// Nullable FieldConstructorsAllDefaults
final _smokeFieldconstructorsalldefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsAllDefaults_create_handle_nullable'));
final _smokeFieldconstructorsalldefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsAllDefaults_release_handle_nullable'));
final _smokeFieldconstructorsalldefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsAllDefaults_get_value_nullable'));
Pointer<Void> smokeFieldconstructorsalldefaultsToFfiNullable(FieldConstructorsAllDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorsalldefaultsToFfi(value);
  final result = _smokeFieldconstructorsalldefaultsCreateHandleNullable(_handle);
  smokeFieldconstructorsalldefaultsReleaseFfiHandle(_handle);
  return result;
}
FieldConstructorsAllDefaults? smokeFieldconstructorsalldefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorsalldefaultsGetValueNullable(handle);
  final result = smokeFieldconstructorsalldefaultsFromFfi(_handle);
  smokeFieldconstructorsalldefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeFieldconstructorsalldefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorsalldefaultsReleaseHandleNullable(handle);
// End of FieldConstructorsAllDefaults "private" section.
