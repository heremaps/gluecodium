import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
/// Foo Bar this is a comment
class DartDeprecatedPosDefaults {
  int intField;
  String stringField;
  /// buzz fizz
  /// [intField]
  /// [stringField]
  @Deprecated("Sorry, this is deprecated.")
  DartDeprecatedPosDefaults(String stringField, [int intField = 42])
    : intField = intField, stringField = stringField;
  DartDeprecatedPosDefaults.withDefaults(String stringField)
    : intField = 42, stringField = stringField;
}
// DartDeprecatedPosDefaults "private" section, not exported.
final _smokeDartdeprecatedposdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaults_create_handle'));
final _smokeDartdeprecatedposdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaults_release_handle'));
final _smokeDartdeprecatedposdefaultsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaults_get_field_intField'));
final _smokeDartdeprecatedposdefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaults_get_field_stringField'));
Pointer<Void> smokeDartdeprecatedposdefaultsToFfi(DartDeprecatedPosDefaults value) {
  final _intFieldHandle = (value.intField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeDartdeprecatedposdefaultsCreateHandle(_intFieldHandle, _stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
DartDeprecatedPosDefaults smokeDartdeprecatedposdefaultsFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeDartdeprecatedposdefaultsGetFieldintField(handle);
  final _stringFieldHandle = _smokeDartdeprecatedposdefaultsGetFieldstringField(handle);
  try {
    return DartDeprecatedPosDefaults(
      stringFromFfi(_stringFieldHandle),
      (_intFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeDartdeprecatedposdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeDartdeprecatedposdefaultsReleaseHandle(handle);
// Nullable DartDeprecatedPosDefaults
final _smokeDartdeprecatedposdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaults_create_handle_nullable'));
final _smokeDartdeprecatedposdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaults_release_handle_nullable'));
final _smokeDartdeprecatedposdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartDeprecatedPosDefaults_get_value_nullable'));
Pointer<Void> smokeDartdeprecatedposdefaultsToFfiNullable(DartDeprecatedPosDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartdeprecatedposdefaultsToFfi(value);
  final result = _smokeDartdeprecatedposdefaultsCreateHandleNullable(_handle);
  smokeDartdeprecatedposdefaultsReleaseFfiHandle(_handle);
  return result;
}
DartDeprecatedPosDefaults? smokeDartdeprecatedposdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartdeprecatedposdefaultsGetValueNullable(handle);
  final result = smokeDartdeprecatedposdefaultsFromFfi(_handle);
  smokeDartdeprecatedposdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeDartdeprecatedposdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartdeprecatedposdefaultsReleaseHandleNullable(handle);
// End of DartDeprecatedPosDefaults "private" section.
