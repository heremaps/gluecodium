import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/immutable_struct_no_clash.dart';
class MutableStructImmutableFields {
  ImmutableStructNoClash structField;
  int intField;
  bool boolField;
  MutableStructImmutableFields._(this.structField, this.intField, this.boolField);
  MutableStructImmutableFields()
      : structField = ImmutableStructNoClash.withAll(), intField = 42, boolField = true;
}
// MutableStructImmutableFields "private" section, not exported.
final _smokeMutablestructimmutablefieldsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Uint8),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_MutableStructImmutableFields_create_handle'));
final _smokeMutablestructimmutablefieldsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFields_release_handle'));
final _smokeMutablestructimmutablefieldsGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFields_get_field_structField'));
final _smokeMutablestructimmutablefieldsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFields_get_field_intField'));
final _smokeMutablestructimmutablefieldsGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFields_get_field_boolField'));
Pointer<Void> smokeMutablestructimmutablefieldsToFfi(MutableStructImmutableFields value) {
  final _structFieldHandle = smokeImmutablestructnoclashToFfi(value.structField);
  final _intFieldHandle = (value.intField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _result = _smokeMutablestructimmutablefieldsCreateHandle(_structFieldHandle, _intFieldHandle, _boolFieldHandle);
  smokeImmutablestructnoclashReleaseFfiHandle(_structFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}
MutableStructImmutableFields smokeMutablestructimmutablefieldsFromFfi(Pointer<Void> handle) {
  final _structFieldHandle = _smokeMutablestructimmutablefieldsGetFieldstructField(handle);
  final _intFieldHandle = _smokeMutablestructimmutablefieldsGetFieldintField(handle);
  final _boolFieldHandle = _smokeMutablestructimmutablefieldsGetFieldboolField(handle);
  try {
    return MutableStructImmutableFields._(
      smokeImmutablestructnoclashFromFfi(_structFieldHandle),
      (_intFieldHandle),
      booleanFromFfi(_boolFieldHandle)
    );
  } finally {
    smokeImmutablestructnoclashReleaseFfiHandle(_structFieldHandle);
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}
void smokeMutablestructimmutablefieldsReleaseFfiHandle(Pointer<Void> handle) => _smokeMutablestructimmutablefieldsReleaseHandle(handle);
// Nullable MutableStructImmutableFields
final _smokeMutablestructimmutablefieldsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFields_create_handle_nullable'));
final _smokeMutablestructimmutablefieldsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFields_release_handle_nullable'));
final _smokeMutablestructimmutablefieldsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFields_get_value_nullable'));
Pointer<Void> smokeMutablestructimmutablefieldsToFfiNullable(MutableStructImmutableFields? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeMutablestructimmutablefieldsToFfi(value);
  final result = _smokeMutablestructimmutablefieldsCreateHandleNullable(_handle);
  smokeMutablestructimmutablefieldsReleaseFfiHandle(_handle);
  return result;
}
MutableStructImmutableFields? smokeMutablestructimmutablefieldsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeMutablestructimmutablefieldsGetValueNullable(handle);
  final result = smokeMutablestructimmutablefieldsFromFfi(_handle);
  smokeMutablestructimmutablefieldsReleaseFfiHandle(_handle);
  return result;
}
void smokeMutablestructimmutablefieldsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeMutablestructimmutablefieldsReleaseHandleNullable(handle);
// End of MutableStructImmutableFields "private" section.
