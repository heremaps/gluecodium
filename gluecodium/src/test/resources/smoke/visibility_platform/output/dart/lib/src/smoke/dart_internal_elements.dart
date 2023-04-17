import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class DartInternalElements {
  /// @nodoc
  String _stringField;
  DartInternalElements(this._stringField);
}
// DartInternalElements "private" section, not exported.
final _smokeDartinternalelementsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElements_create_handle'));
final _smokeDartinternalelementsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartInternalElements_release_handle'));
final _smokeDartinternalelementsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElements_get_field_stringField'));
Pointer<Void> smokeDartinternalelementsToFfi(DartInternalElements value) {
  final _stringFieldHandle = stringToFfi(value._stringField);
  final _result = _smokeDartinternalelementsCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
DartInternalElements smokeDartinternalelementsFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeDartinternalelementsGetFieldstringField(handle);
  try {
    return DartInternalElements(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeDartinternalelementsReleaseFfiHandle(Pointer<Void> handle) => _smokeDartinternalelementsReleaseHandle(handle);
// Nullable DartInternalElements
final _smokeDartinternalelementsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElements_create_handle_nullable'));
final _smokeDartinternalelementsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartInternalElements_release_handle_nullable'));
final _smokeDartinternalelementsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElements_get_value_nullable'));
Pointer<Void> smokeDartinternalelementsToFfiNullable(DartInternalElements? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartinternalelementsToFfi(value);
  final result = _smokeDartinternalelementsCreateHandleNullable(_handle);
  smokeDartinternalelementsReleaseFfiHandle(_handle);
  return result;
}
DartInternalElements? smokeDartinternalelementsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartinternalelementsGetValueNullable(handle);
  final result = smokeDartinternalelementsFromFfi(_handle);
  smokeDartinternalelementsReleaseFfiHandle(_handle);
  return result;
}
void smokeDartinternalelementsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartinternalelementsReleaseHandleNullable(handle);
// End of DartInternalElements "private" section.
