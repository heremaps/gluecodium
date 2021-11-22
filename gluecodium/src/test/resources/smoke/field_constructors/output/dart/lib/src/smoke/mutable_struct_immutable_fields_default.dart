import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/immutable_default_ctor.dart';
class MutableStructImmutableFieldsDefault {
  ImmutableDefaultCtor structField;
  int intField;
  bool boolField;
  MutableStructImmutableFieldsDefault._(this.structField, this.intField, this.boolField);
  MutableStructImmutableFieldsDefault()
      : structField = ImmutableDefaultCtor(), intField = 42, boolField = true;
}
// MutableStructImmutableFieldsDefault "private" section, not exported.
final _smokeMutablestructimmutablefieldsdefaultCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Uint8),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_MutableStructImmutableFieldsDefault_create_handle'));
final _smokeMutablestructimmutablefieldsdefaultReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsDefault_release_handle'));
final _smokeMutablestructimmutablefieldsdefaultGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsDefault_get_field_structField'));
final _smokeMutablestructimmutablefieldsdefaultGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsDefault_get_field_intField'));
final _smokeMutablestructimmutablefieldsdefaultGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsDefault_get_field_boolField'));
Pointer<Void> smokeMutablestructimmutablefieldsdefaultToFfi(MutableStructImmutableFieldsDefault value) {
  final _structFieldHandle = smokeImmutabledefaultctorToFfi(value.structField);
  final _intFieldHandle = (value.intField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _result = _smokeMutablestructimmutablefieldsdefaultCreateHandle(_structFieldHandle, _intFieldHandle, _boolFieldHandle);
  smokeImmutabledefaultctorReleaseFfiHandle(_structFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}
MutableStructImmutableFieldsDefault smokeMutablestructimmutablefieldsdefaultFromFfi(Pointer<Void> handle) {
  final _structFieldHandle = _smokeMutablestructimmutablefieldsdefaultGetFieldstructField(handle);
  final _intFieldHandle = _smokeMutablestructimmutablefieldsdefaultGetFieldintField(handle);
  final _boolFieldHandle = _smokeMutablestructimmutablefieldsdefaultGetFieldboolField(handle);
  try {
    return MutableStructImmutableFieldsDefault._(
      smokeImmutabledefaultctorFromFfi(_structFieldHandle),
      (_intFieldHandle),
      booleanFromFfi(_boolFieldHandle)
    );
  } finally {
    smokeImmutabledefaultctorReleaseFfiHandle(_structFieldHandle);
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}
void smokeMutablestructimmutablefieldsdefaultReleaseFfiHandle(Pointer<Void> handle) => _smokeMutablestructimmutablefieldsdefaultReleaseHandle(handle);
// Nullable MutableStructImmutableFieldsDefault
final _smokeMutablestructimmutablefieldsdefaultCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsDefault_create_handle_nullable'));
final _smokeMutablestructimmutablefieldsdefaultReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsDefault_release_handle_nullable'));
final _smokeMutablestructimmutablefieldsdefaultGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MutableStructImmutableFieldsDefault_get_value_nullable'));
Pointer<Void> smokeMutablestructimmutablefieldsdefaultToFfiNullable(MutableStructImmutableFieldsDefault? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeMutablestructimmutablefieldsdefaultToFfi(value);
  final result = _smokeMutablestructimmutablefieldsdefaultCreateHandleNullable(_handle);
  smokeMutablestructimmutablefieldsdefaultReleaseFfiHandle(_handle);
  return result;
}
MutableStructImmutableFieldsDefault? smokeMutablestructimmutablefieldsdefaultFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeMutablestructimmutablefieldsdefaultGetValueNullable(handle);
  final result = smokeMutablestructimmutablefieldsdefaultFromFfi(_handle);
  smokeMutablestructimmutablefieldsdefaultReleaseFfiHandle(_handle);
  return result;
}
void smokeMutablestructimmutablefieldsdefaultReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeMutablestructimmutablefieldsdefaultReleaseHandleNullable(handle);
// End of MutableStructImmutableFieldsDefault "private" section.
