import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class DartInternalElementsRev {
  /// @nodoc
  String _stringField;
  DartInternalElementsRev(this._stringField);
}
// DartInternalElementsRev "private" section, not exported.
final _smokeDartinternalelementsrevCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsRev_create_handle'));
final _smokeDartinternalelementsrevReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsRev_release_handle'));
final _smokeDartinternalelementsrevGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsRev_get_field_stringField'));
Pointer<Void> smokeDartinternalelementsrevToFfi(DartInternalElementsRev value) {
  final _stringFieldHandle = stringToFfi(value._stringField);
  final _result = _smokeDartinternalelementsrevCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
DartInternalElementsRev smokeDartinternalelementsrevFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeDartinternalelementsrevGetFieldstringField(handle);
  try {
    return DartInternalElementsRev(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeDartinternalelementsrevReleaseFfiHandle(Pointer<Void> handle) => _smokeDartinternalelementsrevReleaseHandle(handle);
// Nullable DartInternalElementsRev
final _smokeDartinternalelementsrevCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsRev_create_handle_nullable'));
final _smokeDartinternalelementsrevReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsRev_release_handle_nullable'));
final _smokeDartinternalelementsrevGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsRev_get_value_nullable'));
Pointer<Void> smokeDartinternalelementsrevToFfiNullable(DartInternalElementsRev? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartinternalelementsrevToFfi(value);
  final result = _smokeDartinternalelementsrevCreateHandleNullable(_handle);
  smokeDartinternalelementsrevReleaseFfiHandle(_handle);
  return result;
}
DartInternalElementsRev? smokeDartinternalelementsrevFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartinternalelementsrevGetValueNullable(handle);
  final result = smokeDartinternalelementsrevFromFfi(_handle);
  smokeDartinternalelementsrevReleaseFfiHandle(_handle);
  return result;
}
void smokeDartinternalelementsrevReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartinternalelementsrevReleaseHandleNullable(handle);
// End of DartInternalElementsRev "private" section.
