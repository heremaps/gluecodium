import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class DartInternalElementsEnabled {
  bool boolField;
  /// @nodoc
  String _stringField;
  DartInternalElementsEnabled(this.boolField, this._stringField);
}
// DartInternalElementsEnabled "private" section, not exported.
final _smokeDartinternalelementsenabledCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_DartInternalElementsEnabled_create_handle'));
final _smokeDartinternalelementsenabledReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsEnabled_release_handle'));
final _smokeDartinternalelementsenabledGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsEnabled_get_field_boolField'));
final _smokeDartinternalelementsenabledGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsEnabled_get_field_stringField'));
Pointer<Void> smokeDartinternalelementsenabledToFfi(DartInternalElementsEnabled value) {
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _stringFieldHandle = stringToFfi(value._stringField);
  final _result = _smokeDartinternalelementsenabledCreateHandle(_boolFieldHandle, _stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
DartInternalElementsEnabled smokeDartinternalelementsenabledFromFfi(Pointer<Void> handle) {
  final _boolFieldHandle = _smokeDartinternalelementsenabledGetFieldboolField(handle);
  final _stringFieldHandle = _smokeDartinternalelementsenabledGetFieldstringField(handle);
  try {
    return DartInternalElementsEnabled(
      booleanFromFfi(_boolFieldHandle),
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_boolFieldHandle);
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeDartinternalelementsenabledReleaseFfiHandle(Pointer<Void> handle) => _smokeDartinternalelementsenabledReleaseHandle(handle);
// Nullable DartInternalElementsEnabled
final _smokeDartinternalelementsenabledCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsEnabled_create_handle_nullable'));
final _smokeDartinternalelementsenabledReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsEnabled_release_handle_nullable'));
final _smokeDartinternalelementsenabledGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsEnabled_get_value_nullable'));
Pointer<Void> smokeDartinternalelementsenabledToFfiNullable(DartInternalElementsEnabled? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartinternalelementsenabledToFfi(value);
  final result = _smokeDartinternalelementsenabledCreateHandleNullable(_handle);
  smokeDartinternalelementsenabledReleaseFfiHandle(_handle);
  return result;
}
DartInternalElementsEnabled? smokeDartinternalelementsenabledFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartinternalelementsenabledGetValueNullable(handle);
  final result = smokeDartinternalelementsenabledFromFfi(_handle);
  smokeDartinternalelementsenabledReleaseFfiHandle(_handle);
  return result;
}
void smokeDartinternalelementsenabledReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartinternalelementsenabledReleaseHandleNullable(handle);
// End of DartInternalElementsEnabled "private" section.
