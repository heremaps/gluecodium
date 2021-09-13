import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
@immutable
class ImmutableStructNoClash {
  final String stringField;
  final int intField;
  final bool boolField;
  const ImmutableStructNoClash(this.stringField, this.intField, this.boolField);
  const ImmutableStructNoClash.withAll()
      : stringField = "nonsense", intField = 42, boolField = true;
}
// ImmutableStructNoClash "private" section, not exported.
final _smokeImmutablestructnoclashCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Uint8),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_ImmutableStructNoClash_create_handle'));
final _smokeImmutablestructnoclashReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ImmutableStructNoClash_release_handle'));
final _smokeImmutablestructnoclashGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ImmutableStructNoClash_get_field_stringField'));
final _smokeImmutablestructnoclashGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ImmutableStructNoClash_get_field_intField'));
final _smokeImmutablestructnoclashGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ImmutableStructNoClash_get_field_boolField'));
Pointer<Void> smokeImmutablestructnoclashToFfi(ImmutableStructNoClash value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _intFieldHandle = (value.intField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _result = _smokeImmutablestructnoclashCreateHandle(_stringFieldHandle, _intFieldHandle, _boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}
ImmutableStructNoClash smokeImmutablestructnoclashFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeImmutablestructnoclashGetFieldstringField(handle);
  final _intFieldHandle = _smokeImmutablestructnoclashGetFieldintField(handle);
  final _boolFieldHandle = _smokeImmutablestructnoclashGetFieldboolField(handle);
  try {
    return ImmutableStructNoClash(
      stringFromFfi(_stringFieldHandle),
      (_intFieldHandle),
      booleanFromFfi(_boolFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}
void smokeImmutablestructnoclashReleaseFfiHandle(Pointer<Void> handle) => _smokeImmutablestructnoclashReleaseHandle(handle);
// Nullable ImmutableStructNoClash
final _smokeImmutablestructnoclashCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ImmutableStructNoClash_create_handle_nullable'));
final _smokeImmutablestructnoclashReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ImmutableStructNoClash_release_handle_nullable'));
final _smokeImmutablestructnoclashGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ImmutableStructNoClash_get_value_nullable'));
Pointer<Void> smokeImmutablestructnoclashToFfiNullable(ImmutableStructNoClash? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeImmutablestructnoclashToFfi(value);
  final result = _smokeImmutablestructnoclashCreateHandleNullable(_handle);
  smokeImmutablestructnoclashReleaseFfiHandle(_handle);
  return result;
}
ImmutableStructNoClash? smokeImmutablestructnoclashFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeImmutablestructnoclashGetValueNullable(handle);
  final result = smokeImmutablestructnoclashFromFfi(_handle);
  smokeImmutablestructnoclashReleaseFfiHandle(_handle);
  return result;
}
void smokeImmutablestructnoclashReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeImmutablestructnoclashReleaseHandleNullable(handle);
// End of ImmutableStructNoClash "private" section.
