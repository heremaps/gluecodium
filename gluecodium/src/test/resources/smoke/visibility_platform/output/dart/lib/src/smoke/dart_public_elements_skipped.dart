import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class DartPublicElementsSkipped {
  bool boolField;
  DartPublicElementsSkipped(this.boolField);
}
// DartPublicElementsSkipped "private" section, not exported.
final _smokeDartpublicelementsskippedCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_DartPublicElementsSkipped_create_handle'));
final _smokeDartpublicelementsskippedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartPublicElementsSkipped_release_handle'));
final _smokeDartpublicelementsskippedGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DartPublicElementsSkipped_get_field_boolField'));
Pointer<Void> smokeDartpublicelementsskippedToFfi(DartPublicElementsSkipped value) {
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _result = _smokeDartpublicelementsskippedCreateHandle(_boolFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}
DartPublicElementsSkipped smokeDartpublicelementsskippedFromFfi(Pointer<Void> handle) {
  final _boolFieldHandle = _smokeDartpublicelementsskippedGetFieldboolField(handle);
  try {
    return DartPublicElementsSkipped(
      booleanFromFfi(_boolFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}
void smokeDartpublicelementsskippedReleaseFfiHandle(Pointer<Void> handle) => _smokeDartpublicelementsskippedReleaseHandle(handle);
// Nullable DartPublicElementsSkipped
final _smokeDartpublicelementsskippedCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartPublicElementsSkipped_create_handle_nullable'));
final _smokeDartpublicelementsskippedReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartPublicElementsSkipped_release_handle_nullable'));
final _smokeDartpublicelementsskippedGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartPublicElementsSkipped_get_value_nullable'));
Pointer<Void> smokeDartpublicelementsskippedToFfiNullable(DartPublicElementsSkipped? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartpublicelementsskippedToFfi(value);
  final result = _smokeDartpublicelementsskippedCreateHandleNullable(_handle);
  smokeDartpublicelementsskippedReleaseFfiHandle(_handle);
  return result;
}
DartPublicElementsSkipped? smokeDartpublicelementsskippedFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartpublicelementsskippedGetValueNullable(handle);
  final result = smokeDartpublicelementsskippedFromFfi(_handle);
  smokeDartpublicelementsskippedReleaseFfiHandle(_handle);
  return result;
}
void smokeDartpublicelementsskippedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartpublicelementsskippedReleaseHandleNullable(handle);
// End of DartPublicElementsSkipped "private" section.
