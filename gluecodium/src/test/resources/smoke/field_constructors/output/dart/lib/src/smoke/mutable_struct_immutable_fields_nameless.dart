import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/immutable_nameless_ctor.dart';
class MutableStructImmutableFieldsNameless {
  ImmutableNamelessCtor structField;
  int intField;
  bool boolField;
  MutableStructImmutableFieldsNameless._(this.structField, this.intField, this.boolField);
  MutableStructImmutableFieldsNameless()
      : structField = ImmutableNamelessCtor(), intField = 42, boolField = true;
}
// MutableStructImmutableFieldsNameless "private" section, not exported.
final _smokeMutablestructimmutablefieldsnamelessCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Uint8),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_MutableStructImmutableFieldsNameless_create_handle'));
final _smokeMutablestructimmutablefieldsnamelessReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsNameless_release_handle'));
final _smokeMutablestructimmutablefieldsnamelessGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsNameless_get_field_structField'));
final _smokeMutablestructimmutablefieldsnamelessGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsNameless_get_field_intField'));
final _smokeMutablestructimmutablefieldsnamelessGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsNameless_get_field_boolField'));
Pointer<Void> smokeMutablestructimmutablefieldsnamelessToFfi(MutableStructImmutableFieldsNameless value) {
  final _structFieldHandle = smokeImmutablenamelessctorToFfi(value.structField);
  final _intFieldHandle = (value.intField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _result = _smokeMutablestructimmutablefieldsnamelessCreateHandle(_structFieldHandle, _intFieldHandle, _boolFieldHandle);
  smokeImmutablenamelessctorReleaseFfiHandle(_structFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}
MutableStructImmutableFieldsNameless smokeMutablestructimmutablefieldsnamelessFromFfi(Pointer<Void> handle) {
  final _structFieldHandle = _smokeMutablestructimmutablefieldsnamelessGetFieldstructField(handle);
  final _intFieldHandle = _smokeMutablestructimmutablefieldsnamelessGetFieldintField(handle);
  final _boolFieldHandle = _smokeMutablestructimmutablefieldsnamelessGetFieldboolField(handle);
  try {
    return MutableStructImmutableFieldsNameless._(
      smokeImmutablenamelessctorFromFfi(_structFieldHandle),
      (_intFieldHandle),
      booleanFromFfi(_boolFieldHandle)
    );
  } finally {
    smokeImmutablenamelessctorReleaseFfiHandle(_structFieldHandle);
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}
void smokeMutablestructimmutablefieldsnamelessReleaseFfiHandle(Pointer<Void> handle) => _smokeMutablestructimmutablefieldsnamelessReleaseHandle(handle);
// Nullable MutableStructImmutableFieldsNameless
final _smokeMutablestructimmutablefieldsnamelessCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsNameless_create_handle_nullable'));
final _smokeMutablestructimmutablefieldsnamelessReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsNameless_release_handle_nullable'));
final _smokeMutablestructimmutablefieldsnamelessGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsNameless_get_value_nullable'));
Pointer<Void> smokeMutablestructimmutablefieldsnamelessToFfiNullable(MutableStructImmutableFieldsNameless? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeMutablestructimmutablefieldsnamelessToFfi(value);
  final result = _smokeMutablestructimmutablefieldsnamelessCreateHandleNullable(_handle);
  smokeMutablestructimmutablefieldsnamelessReleaseFfiHandle(_handle);
  return result;
}
MutableStructImmutableFieldsNameless? smokeMutablestructimmutablefieldsnamelessFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeMutablestructimmutablefieldsnamelessGetValueNullable(handle);
  final result = smokeMutablestructimmutablefieldsnamelessFromFfi(_handle);
  smokeMutablestructimmutablefieldsnamelessReleaseFfiHandle(_handle);
  return result;
}
void smokeMutablestructimmutablefieldsnamelessReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeMutablestructimmutablefieldsnamelessReleaseHandleNullable(handle);
// End of MutableStructImmutableFieldsNameless "private" section.
