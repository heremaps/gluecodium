import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/date_alias.dart';
class DateDefaultsAliased {
  DateAlias dateTime;
  DateAlias dateTimeUtc;
  DateAlias beforeEpoch;
  DateAlias exactlyEpoch;
  DateDefaultsAliased._(this.dateTime, this.dateTimeUtc, this.beforeEpoch, this.exactlyEpoch);
  DateDefaultsAliased()
    : dateTime = DateTime.fromMillisecondsSinceEpoch(1643966117000), dateTimeUtc = DateTime.fromMillisecondsSinceEpoch(1643966117000), beforeEpoch = DateTime.fromMillisecondsSinceEpoch(-1511793883000), exactlyEpoch = DateTime.fromMillisecondsSinceEpoch(0);
}
// DateDefaultsAliased "private" section, not exported.
final _smokeDatedefaultsaliasedCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Uint64, Uint64, Uint64),
    Pointer<Void> Function(int, int, int, int)
  >('library_smoke_DateDefaultsAliased_create_handle'));
final _smokeDatedefaultsaliasedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DateDefaultsAliased_release_handle'));
final _smokeDatedefaultsaliasedGetFielddateTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DateDefaultsAliased_get_field_dateTime'));
final _smokeDatedefaultsaliasedGetFielddateTimeUtc = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DateDefaultsAliased_get_field_dateTimeUtc'));
final _smokeDatedefaultsaliasedGetFieldbeforeEpoch = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DateDefaultsAliased_get_field_beforeEpoch'));
final _smokeDatedefaultsaliasedGetFieldexactlyEpoch = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DateDefaultsAliased_get_field_exactlyEpoch'));
Pointer<Void> smokeDatedefaultsaliasedToFfi(DateDefaultsAliased value) {
  final _dateTimeHandle = dateToFfi(value.dateTime);
  final _dateTimeUtcHandle = dateToFfi(value.dateTimeUtc);
  final _beforeEpochHandle = dateToFfi(value.beforeEpoch);
  final _exactlyEpochHandle = dateToFfi(value.exactlyEpoch);
  final _result = _smokeDatedefaultsaliasedCreateHandle(_dateTimeHandle, _dateTimeUtcHandle, _beforeEpochHandle, _exactlyEpochHandle);
  dateReleaseFfiHandle(_dateTimeHandle);
  dateReleaseFfiHandle(_dateTimeUtcHandle);
  dateReleaseFfiHandle(_beforeEpochHandle);
  dateReleaseFfiHandle(_exactlyEpochHandle);
  return _result;
}
DateDefaultsAliased smokeDatedefaultsaliasedFromFfi(Pointer<Void> handle) {
  final _dateTimeHandle = _smokeDatedefaultsaliasedGetFielddateTime(handle);
  final _dateTimeUtcHandle = _smokeDatedefaultsaliasedGetFielddateTimeUtc(handle);
  final _beforeEpochHandle = _smokeDatedefaultsaliasedGetFieldbeforeEpoch(handle);
  final _exactlyEpochHandle = _smokeDatedefaultsaliasedGetFieldexactlyEpoch(handle);
  try {
    return DateDefaultsAliased._(
      dateFromFfi(_dateTimeHandle),
      dateFromFfi(_dateTimeUtcHandle),
      dateFromFfi(_beforeEpochHandle),
      dateFromFfi(_exactlyEpochHandle)
    );
  } finally {
    dateReleaseFfiHandle(_dateTimeHandle);
    dateReleaseFfiHandle(_dateTimeUtcHandle);
    dateReleaseFfiHandle(_beforeEpochHandle);
    dateReleaseFfiHandle(_exactlyEpochHandle);
  }
}
void smokeDatedefaultsaliasedReleaseFfiHandle(Pointer<Void> handle) => _smokeDatedefaultsaliasedReleaseHandle(handle);
// Nullable DateDefaultsAliased
final _smokeDatedefaultsaliasedCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DateDefaultsAliased_create_handle_nullable'));
final _smokeDatedefaultsaliasedReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DateDefaultsAliased_release_handle_nullable'));
final _smokeDatedefaultsaliasedGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DateDefaultsAliased_get_value_nullable'));
Pointer<Void> smokeDatedefaultsaliasedToFfiNullable(DateDefaultsAliased? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDatedefaultsaliasedToFfi(value);
  final result = _smokeDatedefaultsaliasedCreateHandleNullable(_handle);
  smokeDatedefaultsaliasedReleaseFfiHandle(_handle);
  return result;
}
DateDefaultsAliased? smokeDatedefaultsaliasedFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDatedefaultsaliasedGetValueNullable(handle);
  final result = smokeDatedefaultsaliasedFromFfi(_handle);
  smokeDatedefaultsaliasedReleaseFfiHandle(_handle);
  return result;
}
void smokeDatedefaultsaliasedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDatedefaultsaliasedReleaseHandleNullable(handle);
// End of DateDefaultsAliased "private" section.
