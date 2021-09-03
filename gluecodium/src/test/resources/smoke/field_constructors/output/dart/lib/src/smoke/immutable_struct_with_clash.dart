import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
@immutable
class ImmutableStructWithClash {
  final String stringField;
  final int intField;
  final bool boolField;
  const ImmutableStructWithClash.withAll()
      : stringField = "nonsense", intField = 42, boolField = true;
  const ImmutableStructWithClash(this.boolField, this.intField, this.stringField);
}
// ImmutableStructWithClash "private" section, not exported.
final _smokeImmutablestructwithclashCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Uint8),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_ImmutableStructWithClash_create_handle'));
final _smokeImmutablestructwithclashReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ImmutableStructWithClash_release_handle'));
final _smokeImmutablestructwithclashGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ImmutableStructWithClash_get_field_stringField'));
final _smokeImmutablestructwithclashGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ImmutableStructWithClash_get_field_intField'));
final _smokeImmutablestructwithclashGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ImmutableStructWithClash_get_field_boolField'));
Pointer<Void> smokeImmutablestructwithclashToFfi(ImmutableStructWithClash value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _intFieldHandle = (value.intField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _result = _smokeImmutablestructwithclashCreateHandle(_stringFieldHandle, _intFieldHandle, _boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}
ImmutableStructWithClash smokeImmutablestructwithclashFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeImmutablestructwithclashGetFieldstringField(handle);
  final _intFieldHandle = _smokeImmutablestructwithclashGetFieldintField(handle);
  final _boolFieldHandle = _smokeImmutablestructwithclashGetFieldboolField(handle);
  try {
    return ImmutableStructWithClash(
      booleanFromFfi(_boolFieldHandle),
      (_intFieldHandle),
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}
void smokeImmutablestructwithclashReleaseFfiHandle(Pointer<Void> handle) => _smokeImmutablestructwithclashReleaseHandle(handle);
// Nullable ImmutableStructWithClash
final _smokeImmutablestructwithclashCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ImmutableStructWithClash_create_handle_nullable'));
final _smokeImmutablestructwithclashReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ImmutableStructWithClash_release_handle_nullable'));
final _smokeImmutablestructwithclashGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ImmutableStructWithClash_get_value_nullable'));
Pointer<Void> smokeImmutablestructwithclashToFfiNullable(ImmutableStructWithClash? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeImmutablestructwithclashToFfi(value);
  final result = _smokeImmutablestructwithclashCreateHandleNullable(_handle);
  smokeImmutablestructwithclashReleaseFfiHandle(_handle);
  return result;
}
ImmutableStructWithClash? smokeImmutablestructwithclashFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeImmutablestructwithclashGetValueNullable(handle);
  final result = smokeImmutablestructwithclashFromFfi(_handle);
  smokeImmutablestructwithclashReleaseFfiHandle(_handle);
  return result;
}
void smokeImmutablestructwithclashReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeImmutablestructwithclashReleaseHandleNullable(handle);
// End of ImmutableStructWithClash "private" section.
