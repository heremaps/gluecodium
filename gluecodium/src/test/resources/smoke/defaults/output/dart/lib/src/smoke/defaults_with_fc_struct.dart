import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/smoke/fc_struct.dart';
class DefaultsWithFcStruct {
  FcStruct structField;
  DefaultsWithFcStruct._(this.structField);
  DefaultsWithFcStruct()
      : structField = FcStruct();
}
// DefaultsWithFcStruct "private" section, not exported.
final _smokeDefaultswithfcstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultsWithFcStruct_create_handle'));
final _smokeDefaultswithfcstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultsWithFcStruct_release_handle'));
final _smokeDefaultswithfcstructGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultsWithFcStruct_get_field_structField'));
Pointer<Void> smokeDefaultswithfcstructToFfi(DefaultsWithFcStruct value) {
  final _structFieldHandle = smokeFcstructToFfi(value.structField);
  final _result = _smokeDefaultswithfcstructCreateHandle(_structFieldHandle);
  smokeFcstructReleaseFfiHandle(_structFieldHandle);
  return _result;
}
DefaultsWithFcStruct smokeDefaultswithfcstructFromFfi(Pointer<Void> handle) {
  final _structFieldHandle = _smokeDefaultswithfcstructGetFieldstructField(handle);
  try {
    return DefaultsWithFcStruct._(
      smokeFcstructFromFfi(_structFieldHandle)
    );
  } finally {
    smokeFcstructReleaseFfiHandle(_structFieldHandle);
  }
}
void smokeDefaultswithfcstructReleaseFfiHandle(Pointer<Void> handle) => _smokeDefaultswithfcstructReleaseHandle(handle);
// Nullable DefaultsWithFcStruct
final _smokeDefaultswithfcstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultsWithFcStruct_create_handle_nullable'));
final _smokeDefaultswithfcstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultsWithFcStruct_release_handle_nullable'));
final _smokeDefaultswithfcstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultsWithFcStruct_get_value_nullable'));
Pointer<Void> smokeDefaultswithfcstructToFfiNullable(DefaultsWithFcStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDefaultswithfcstructToFfi(value);
  final result = _smokeDefaultswithfcstructCreateHandleNullable(_handle);
  smokeDefaultswithfcstructReleaseFfiHandle(_handle);
  return result;
}
DefaultsWithFcStruct? smokeDefaultswithfcstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDefaultswithfcstructGetValueNullable(handle);
  final result = smokeDefaultswithfcstructFromFfi(_handle);
  smokeDefaultswithfcstructReleaseFfiHandle(_handle);
  return result;
}
void smokeDefaultswithfcstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDefaultswithfcstructReleaseHandleNullable(handle);
// End of DefaultsWithFcStruct "private" section.
