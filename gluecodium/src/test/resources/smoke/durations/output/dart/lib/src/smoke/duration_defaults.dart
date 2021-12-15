import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class DurationDefaults {
  Duration dayz;
  Duration hourz;
  Duration minutez;
  Duration secondz;
  Duration milliz;
  Duration microz;
  Duration nanoz;
  DurationDefaults(this.dayz, this.hourz, this.minutez, this.secondz, this.milliz, this.microz, this.nanoz);
  DurationDefaults.withDefaults()
    : dayz = Duration(days: 28), hourz = Duration(hours: 22), minutez = Duration(minutes: 45), secondz = Duration(seconds: 42), milliz = Duration(milliseconds: 500), microz = Duration(microseconds: 665), nanoz = Duration(microseconds: (314635 / 1000.0).floor());
}
// DurationDefaults "private" section, not exported.
final _smokeDurationdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Uint64, Uint64, Uint64, Uint64, Uint64, Uint64),
    Pointer<Void> Function(int, int, int, int, int, int, int)
  >('library_smoke_DurationDefaults_create_handle'));
final _smokeDurationdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DurationDefaults_release_handle'));
final _smokeDurationdefaultsGetFielddayz = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DurationDefaults_get_field_dayz'));
final _smokeDurationdefaultsGetFieldhourz = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DurationDefaults_get_field_hourz'));
final _smokeDurationdefaultsGetFieldminutez = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DurationDefaults_get_field_minutez'));
final _smokeDurationdefaultsGetFieldsecondz = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DurationDefaults_get_field_secondz'));
final _smokeDurationdefaultsGetFieldmilliz = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DurationDefaults_get_field_milliz'));
final _smokeDurationdefaultsGetFieldmicroz = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DurationDefaults_get_field_microz'));
final _smokeDurationdefaultsGetFieldnanoz = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DurationDefaults_get_field_nanoz'));
Pointer<Void> smokeDurationdefaultsToFfi(DurationDefaults value) {
  final _dayzHandle = durationToFfi(value.dayz);
  final _hourzHandle = durationToFfi(value.hourz);
  final _minutezHandle = durationToFfi(value.minutez);
  final _secondzHandle = durationToFfi(value.secondz);
  final _millizHandle = durationToFfi(value.milliz);
  final _microzHandle = durationToFfi(value.microz);
  final _nanozHandle = durationToFfi(value.nanoz);
  final _result = _smokeDurationdefaultsCreateHandle(_dayzHandle, _hourzHandle, _minutezHandle, _secondzHandle, _millizHandle, _microzHandle, _nanozHandle);
  durationReleaseFfiHandle(_dayzHandle);
  durationReleaseFfiHandle(_hourzHandle);
  durationReleaseFfiHandle(_minutezHandle);
  durationReleaseFfiHandle(_secondzHandle);
  durationReleaseFfiHandle(_millizHandle);
  durationReleaseFfiHandle(_microzHandle);
  durationReleaseFfiHandle(_nanozHandle);
  return _result;
}
DurationDefaults smokeDurationdefaultsFromFfi(Pointer<Void> handle) {
  final _dayzHandle = _smokeDurationdefaultsGetFielddayz(handle);
  final _hourzHandle = _smokeDurationdefaultsGetFieldhourz(handle);
  final _minutezHandle = _smokeDurationdefaultsGetFieldminutez(handle);
  final _secondzHandle = _smokeDurationdefaultsGetFieldsecondz(handle);
  final _millizHandle = _smokeDurationdefaultsGetFieldmilliz(handle);
  final _microzHandle = _smokeDurationdefaultsGetFieldmicroz(handle);
  final _nanozHandle = _smokeDurationdefaultsGetFieldnanoz(handle);
  try {
    return DurationDefaults(
      durationFromFfi(_dayzHandle),
      durationFromFfi(_hourzHandle),
      durationFromFfi(_minutezHandle),
      durationFromFfi(_secondzHandle),
      durationFromFfi(_millizHandle),
      durationFromFfi(_microzHandle),
      durationFromFfi(_nanozHandle)
    );
  } finally {
    durationReleaseFfiHandle(_dayzHandle);
    durationReleaseFfiHandle(_hourzHandle);
    durationReleaseFfiHandle(_minutezHandle);
    durationReleaseFfiHandle(_secondzHandle);
    durationReleaseFfiHandle(_millizHandle);
    durationReleaseFfiHandle(_microzHandle);
    durationReleaseFfiHandle(_nanozHandle);
  }
}
void smokeDurationdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeDurationdefaultsReleaseHandle(handle);
// Nullable DurationDefaults
final _smokeDurationdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DurationDefaults_create_handle_nullable'));
final _smokeDurationdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DurationDefaults_release_handle_nullable'));
final _smokeDurationdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DurationDefaults_get_value_nullable'));
Pointer<Void> smokeDurationdefaultsToFfiNullable(DurationDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDurationdefaultsToFfi(value);
  final result = _smokeDurationdefaultsCreateHandleNullable(_handle);
  smokeDurationdefaultsReleaseFfiHandle(_handle);
  return result;
}
DurationDefaults? smokeDurationdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDurationdefaultsGetValueNullable(handle);
  final result = smokeDurationdefaultsFromFfi(_handle);
  smokeDurationdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeDurationdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDurationdefaultsReleaseHandleNullable(handle);
// End of DurationDefaults "private" section.
