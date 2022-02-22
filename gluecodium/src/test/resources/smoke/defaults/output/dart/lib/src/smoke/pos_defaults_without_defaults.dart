import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class PosDefaultsWithoutDefaults {
  String stringField;
  PosDefaultsWithoutDefaults(this.stringField);
}
// PosDefaultsWithoutDefaults "private" section, not exported.
final _smokePosdefaultswithoutdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithoutDefaults_create_handle'));
final _smokePosdefaultswithoutdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithoutDefaults_release_handle'));
final _smokePosdefaultswithoutdefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithoutDefaults_get_field_stringField'));
Pointer<Void> smokePosdefaultswithoutdefaultsToFfi(PosDefaultsWithoutDefaults value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokePosdefaultswithoutdefaultsCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
PosDefaultsWithoutDefaults smokePosdefaultswithoutdefaultsFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokePosdefaultswithoutdefaultsGetFieldstringField(handle);
  try {
    return PosDefaultsWithoutDefaults(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokePosdefaultswithoutdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokePosdefaultswithoutdefaultsReleaseHandle(handle);
// Nullable PosDefaultsWithoutDefaults
final _smokePosdefaultswithoutdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithoutDefaults_create_handle_nullable'));
final _smokePosdefaultswithoutdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithoutDefaults_release_handle_nullable'));
final _smokePosdefaultswithoutdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithoutDefaults_get_value_nullable'));
Pointer<Void> smokePosdefaultswithoutdefaultsToFfiNullable(PosDefaultsWithoutDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePosdefaultswithoutdefaultsToFfi(value);
  final result = _smokePosdefaultswithoutdefaultsCreateHandleNullable(_handle);
  smokePosdefaultswithoutdefaultsReleaseFfiHandle(_handle);
  return result;
}
PosDefaultsWithoutDefaults? smokePosdefaultswithoutdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePosdefaultswithoutdefaultsGetValueNullable(handle);
  final result = smokePosdefaultswithoutdefaultsFromFfi(_handle);
  smokePosdefaultswithoutdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokePosdefaultswithoutdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePosdefaultswithoutdefaultsReleaseHandleNullable(handle);
// End of PosDefaultsWithoutDefaults "private" section.
