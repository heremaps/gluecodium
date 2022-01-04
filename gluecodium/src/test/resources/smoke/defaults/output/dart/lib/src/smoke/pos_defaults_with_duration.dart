import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class PosDefaultsWithDuration {
  Duration durationField;
  Duration nanosField;
  PosDefaultsWithDuration([Duration durationField = const Duration(seconds: 42), Duration nanosField = const Duration(microseconds: 28)])
    : durationField = durationField, nanosField = nanosField;
  PosDefaultsWithDuration.withDefaults()
    : durationField = const Duration(seconds: 42), nanosField = const Duration(microseconds: 28);
}
// PosDefaultsWithDuration "private" section, not exported.
final _smokePosdefaultswithdurationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Uint64),
    Pointer<Void> Function(int, int)
  >('library_smoke_PosDefaultsWithDuration_create_handle'));
final _smokePosdefaultswithdurationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithDuration_release_handle'));
final _smokePosdefaultswithdurationGetFielddurationField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithDuration_get_field_durationField'));
final _smokePosdefaultswithdurationGetFieldnanosField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithDuration_get_field_nanosField'));
Pointer<Void> smokePosdefaultswithdurationToFfi(PosDefaultsWithDuration value) {
  final _durationFieldHandle = durationToFfi(value.durationField);
  final _nanosFieldHandle = durationToFfi(value.nanosField);
  final _result = _smokePosdefaultswithdurationCreateHandle(_durationFieldHandle, _nanosFieldHandle);
  durationReleaseFfiHandle(_durationFieldHandle);
  durationReleaseFfiHandle(_nanosFieldHandle);
  return _result;
}
PosDefaultsWithDuration smokePosdefaultswithdurationFromFfi(Pointer<Void> handle) {
  final _durationFieldHandle = _smokePosdefaultswithdurationGetFielddurationField(handle);
  final _nanosFieldHandle = _smokePosdefaultswithdurationGetFieldnanosField(handle);
  try {
    return PosDefaultsWithDuration(
      durationFromFfi(_durationFieldHandle),
      durationFromFfi(_nanosFieldHandle)
    );
  } finally {
    durationReleaseFfiHandle(_durationFieldHandle);
    durationReleaseFfiHandle(_nanosFieldHandle);
  }
}
void smokePosdefaultswithdurationReleaseFfiHandle(Pointer<Void> handle) => _smokePosdefaultswithdurationReleaseHandle(handle);
// Nullable PosDefaultsWithDuration
final _smokePosdefaultswithdurationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithDuration_create_handle_nullable'));
final _smokePosdefaultswithdurationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithDuration_release_handle_nullable'));
final _smokePosdefaultswithdurationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithDuration_get_value_nullable'));
Pointer<Void> smokePosdefaultswithdurationToFfiNullable(PosDefaultsWithDuration? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePosdefaultswithdurationToFfi(value);
  final result = _smokePosdefaultswithdurationCreateHandleNullable(_handle);
  smokePosdefaultswithdurationReleaseFfiHandle(_handle);
  return result;
}
PosDefaultsWithDuration? smokePosdefaultswithdurationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePosdefaultswithdurationGetValueNullable(handle);
  final result = smokePosdefaultswithdurationFromFfi(_handle);
  smokePosdefaultswithdurationReleaseFfiHandle(_handle);
  return result;
}
void smokePosdefaultswithdurationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePosdefaultswithdurationReleaseHandleNullable(handle);
// End of PosDefaultsWithDuration "private" section.
