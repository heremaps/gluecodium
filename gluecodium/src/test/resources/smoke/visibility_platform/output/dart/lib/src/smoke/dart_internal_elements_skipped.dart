import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class DartInternalElementsSkipped {
  bool boolField;
  DartInternalElementsSkipped(this.boolField);
}
// DartInternalElementsSkipped "private" section, not exported.
final _smokeDartinternalelementsskippedCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_DartInternalElementsSkipped_create_handle'));
final _smokeDartinternalelementsskippedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsSkipped_release_handle'));
final _smokeDartinternalelementsskippedGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsSkipped_get_field_boolField'));
Pointer<Void> smokeDartinternalelementsskippedToFfi(DartInternalElementsSkipped value) {
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _result = _smokeDartinternalelementsskippedCreateHandle(_boolFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}
DartInternalElementsSkipped smokeDartinternalelementsskippedFromFfi(Pointer<Void> handle) {
  final _boolFieldHandle = _smokeDartinternalelementsskippedGetFieldboolField(handle);
  try {
    return DartInternalElementsSkipped(
      booleanFromFfi(_boolFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}
void smokeDartinternalelementsskippedReleaseFfiHandle(Pointer<Void> handle) => _smokeDartinternalelementsskippedReleaseHandle(handle);
// Nullable DartInternalElementsSkipped
final _smokeDartinternalelementsskippedCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsSkipped_create_handle_nullable'));
final _smokeDartinternalelementsskippedReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsSkipped_release_handle_nullable'));
final _smokeDartinternalelementsskippedGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartInternalElementsSkipped_get_value_nullable'));
Pointer<Void> smokeDartinternalelementsskippedToFfiNullable(DartInternalElementsSkipped? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartinternalelementsskippedToFfi(value);
  final result = _smokeDartinternalelementsskippedCreateHandleNullable(_handle);
  smokeDartinternalelementsskippedReleaseFfiHandle(_handle);
  return result;
}
DartInternalElementsSkipped? smokeDartinternalelementsskippedFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartinternalelementsskippedGetValueNullable(handle);
  final result = smokeDartinternalelementsskippedFromFfi(_handle);
  smokeDartinternalelementsskippedReleaseFfiHandle(_handle);
  return result;
}
void smokeDartinternalelementsskippedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartinternalelementsskippedReleaseHandleNullable(handle);
// End of DartInternalElementsSkipped "private" section.
