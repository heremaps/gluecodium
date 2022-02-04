import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class DateDefaults {
  DateTime dateTime;
  DateTime dateTimeUtc;
  DateTime beforeEpoch;
  DateDefaults(this.dateTime, this.dateTimeUtc, this.beforeEpoch);
  DateDefaults.withDefaults()
    : dateTime = DateTime.fromMillisecondsSinceEpoch(1643966117000), dateTimeUtc = DateTime.fromMillisecondsSinceEpoch(1643966117000), beforeEpoch = DateTime.fromMillisecondsSinceEpoch(-1511793883000);
}
// DateDefaults "private" section, not exported.
final _smokeDatedefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Uint64, Uint64),
    Pointer<Void> Function(int, int, int)
  >('library_smoke_DateDefaults_create_handle'));
final _smokeDatedefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DateDefaults_release_handle'));
final _smokeDatedefaultsGetFielddateTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DateDefaults_get_field_dateTime'));
final _smokeDatedefaultsGetFielddateTimeUtc = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DateDefaults_get_field_dateTimeUtc'));
final _smokeDatedefaultsGetFieldbeforeEpoch = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DateDefaults_get_field_beforeEpoch'));
Pointer<Void> smokeDatedefaultsToFfi(DateDefaults value) {
  final _dateTimeHandle = dateToFfi(value.dateTime);
  final _dateTimeUtcHandle = dateToFfi(value.dateTimeUtc);
  final _beforeEpochHandle = dateToFfi(value.beforeEpoch);
  final _result = _smokeDatedefaultsCreateHandle(_dateTimeHandle, _dateTimeUtcHandle, _beforeEpochHandle);
  dateReleaseFfiHandle(_dateTimeHandle);
  dateReleaseFfiHandle(_dateTimeUtcHandle);
  dateReleaseFfiHandle(_beforeEpochHandle);
  return _result;
}
DateDefaults smokeDatedefaultsFromFfi(Pointer<Void> handle) {
  final _dateTimeHandle = _smokeDatedefaultsGetFielddateTime(handle);
  final _dateTimeUtcHandle = _smokeDatedefaultsGetFielddateTimeUtc(handle);
  final _beforeEpochHandle = _smokeDatedefaultsGetFieldbeforeEpoch(handle);
  try {
    return DateDefaults(
      dateFromFfi(_dateTimeHandle),
      dateFromFfi(_dateTimeUtcHandle),
      dateFromFfi(_beforeEpochHandle)
    );
  } finally {
    dateReleaseFfiHandle(_dateTimeHandle);
    dateReleaseFfiHandle(_dateTimeUtcHandle);
    dateReleaseFfiHandle(_beforeEpochHandle);
  }
}
void smokeDatedefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeDatedefaultsReleaseHandle(handle);
// Nullable DateDefaults
final _smokeDatedefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DateDefaults_create_handle_nullable'));
final _smokeDatedefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DateDefaults_release_handle_nullable'));
final _smokeDatedefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DateDefaults_get_value_nullable'));
Pointer<Void> smokeDatedefaultsToFfiNullable(DateDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDatedefaultsToFfi(value);
  final result = _smokeDatedefaultsCreateHandleNullable(_handle);
  smokeDatedefaultsReleaseFfiHandle(_handle);
  return result;
}
DateDefaults? smokeDatedefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDatedefaultsGetValueNullable(handle);
  final result = smokeDatedefaultsFromFfi(_handle);
  smokeDatedefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeDatedefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDatedefaultsReleaseHandleNullable(handle);
// End of DateDefaults "private" section.
