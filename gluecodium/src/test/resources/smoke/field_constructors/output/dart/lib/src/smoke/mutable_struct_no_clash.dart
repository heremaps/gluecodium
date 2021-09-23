import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class MutableStructNoClash {
  String stringField;
  int intField;
  bool boolField;
  MutableStructNoClash._(this.stringField, this.intField, this.boolField);
  MutableStructNoClash.withAll()
      : stringField = "nonsense", intField = 42, boolField = true;
}
// MutableStructNoClash "private" section, not exported.
final _smokeMutablestructnoclashCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Uint8),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_MutableStructNoClash_create_handle'));
final _smokeMutablestructnoclashReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MutableStructNoClash_release_handle'));
final _smokeMutablestructnoclashGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructNoClash_get_field_stringField'));
final _smokeMutablestructnoclashGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_MutableStructNoClash_get_field_intField'));
final _smokeMutablestructnoclashGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_MutableStructNoClash_get_field_boolField'));
Pointer<Void> smokeMutablestructnoclashToFfi(MutableStructNoClash value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _intFieldHandle = (value.intField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _result = _smokeMutablestructnoclashCreateHandle(_stringFieldHandle, _intFieldHandle, _boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}
MutableStructNoClash smokeMutablestructnoclashFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeMutablestructnoclashGetFieldstringField(handle);
  final _intFieldHandle = _smokeMutablestructnoclashGetFieldintField(handle);
  final _boolFieldHandle = _smokeMutablestructnoclashGetFieldboolField(handle);
  try {
    return MutableStructNoClash._(
      stringFromFfi(_stringFieldHandle),
      (_intFieldHandle),
      booleanFromFfi(_boolFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}
void smokeMutablestructnoclashReleaseFfiHandle(Pointer<Void> handle) => _smokeMutablestructnoclashReleaseHandle(handle);
// Nullable MutableStructNoClash
final _smokeMutablestructnoclashCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructNoClash_create_handle_nullable'));
final _smokeMutablestructnoclashReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MutableStructNoClash_release_handle_nullable'));
final _smokeMutablestructnoclashGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructNoClash_get_value_nullable'));
Pointer<Void> smokeMutablestructnoclashToFfiNullable(MutableStructNoClash? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeMutablestructnoclashToFfi(value);
  final result = _smokeMutablestructnoclashCreateHandleNullable(_handle);
  smokeMutablestructnoclashReleaseFfiHandle(_handle);
  return result;
}
MutableStructNoClash? smokeMutablestructnoclashFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeMutablestructnoclashGetValueNullable(handle);
  final result = smokeMutablestructnoclashFromFfi(_handle);
  smokeMutablestructnoclashReleaseFfiHandle(_handle);
  return result;
}
void smokeMutablestructnoclashReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeMutablestructnoclashReleaseHandleNullable(handle);
// End of MutableStructNoClash "private" section.
