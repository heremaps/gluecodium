import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
abstract class DatesSteady {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  DateTime dateMethod(DateTime input);
  DateTime? nullableDateMethod(DateTime? input);
  List<DateTime> dateListMethod(List<DateTime> input);
}
class DatesSteady_DateStruct {
  DateTime dateField;
  DateTime? nullableDateField;
  DatesSteady_DateStruct(this.dateField, this.nullableDateField);
}
// DatesSteady_DateStruct "private" section, not exported.
final _smokeDatessteadyDatestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_DatesSteady_DateStruct_create_handle'));
final _smokeDatessteadyDatestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DatesSteady_DateStruct_release_handle'));
final _smokeDatessteadyDatestructGetFielddateField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DatesSteady_DateStruct_get_field_dateField'));
final _smokeDatessteadyDatestructGetFieldnullableDateField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DatesSteady_DateStruct_get_field_nullableDateField'));
Pointer<Void> smokeDatessteadyDatestructToFfi(DatesSteady_DateStruct value) {
  final _dateFieldHandle = dateToFfi(value.dateField);
  final _nullableDateFieldHandle = dateToFfiNullable(value.nullableDateField);
  final _result = _smokeDatessteadyDatestructCreateHandle(_dateFieldHandle, _nullableDateFieldHandle);
  dateReleaseFfiHandle(_dateFieldHandle);
  dateReleaseFfiHandleNullable(_nullableDateFieldHandle);
  return _result;
}
DatesSteady_DateStruct smokeDatessteadyDatestructFromFfi(Pointer<Void> handle) {
  final _dateFieldHandle = _smokeDatessteadyDatestructGetFielddateField(handle);
  final _nullableDateFieldHandle = _smokeDatessteadyDatestructGetFieldnullableDateField(handle);
  try {
    return DatesSteady_DateStruct(
      dateFromFfi(_dateFieldHandle),
      dateFromFfiNullable(_nullableDateFieldHandle)
    );
  } finally {
    dateReleaseFfiHandle(_dateFieldHandle);
    dateReleaseFfiHandleNullable(_nullableDateFieldHandle);
  }
}
void smokeDatessteadyDatestructReleaseFfiHandle(Pointer<Void> handle) => _smokeDatessteadyDatestructReleaseHandle(handle);
// Nullable DatesSteady_DateStruct
final _smokeDatessteadyDatestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DatesSteady_DateStruct_create_handle_nullable'));
final _smokeDatessteadyDatestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DatesSteady_DateStruct_release_handle_nullable'));
final _smokeDatessteadyDatestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DatesSteady_DateStruct_get_value_nullable'));
Pointer<Void> smokeDatessteadyDatestructToFfiNullable(DatesSteady_DateStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDatessteadyDatestructToFfi(value);
  final result = _smokeDatessteadyDatestructCreateHandleNullable(_handle);
  smokeDatessteadyDatestructReleaseFfiHandle(_handle);
  return result;
}
DatesSteady_DateStruct? smokeDatessteadyDatestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDatessteadyDatestructGetValueNullable(handle);
  final result = smokeDatessteadyDatestructFromFfi(_handle);
  smokeDatessteadyDatestructReleaseFfiHandle(_handle);
  return result;
}
void smokeDatessteadyDatestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDatessteadyDatestructReleaseHandleNullable(handle);
// End of DatesSteady_DateStruct "private" section.
// DatesSteady "private" section, not exported.
final _smokeDatessteadyRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_DatesSteady_register_finalizer'));
final _smokeDatessteadyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DatesSteady_copy_handle'));
final _smokeDatessteadyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DatesSteady_release_handle'));
class DatesSteady$Impl extends __lib.NativeBase implements DatesSteady {
  DatesSteady$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  DateTime dateMethod(DateTime input) {
    final _dateMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32, Uint64), int Function(Pointer<Void>, int, int)>('library_smoke_DatesSteady_dateMethod__Date'));
    final _inputHandle = dateToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _dateMethodFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    dateReleaseFfiHandle(_inputHandle);
    try {
      return dateFromFfi(__resultHandle);
    } finally {
      dateReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  DateTime? nullableDateMethod(DateTime? input) {
    final _nullableDateMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DatesSteady_nullableDateMethod__Date_'));
    final _inputHandle = dateToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _nullableDateMethodFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    dateReleaseFfiHandleNullable(_inputHandle);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  List<DateTime> dateListMethod(List<DateTime> input) {
    final _dateListMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DatesSteady_dateListMethod__ListOf_Date_std_2chrono_2steady_1clock_2time_1point'));
    final _inputHandle = foobarListofDateStd2chrono2steady1clock2time1pointToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _dateListMethodFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    foobarListofDateStd2chrono2steady1clock2time1pointReleaseFfiHandle(_inputHandle);
    try {
      return foobarListofDateStd2chrono2steady1clock2time1pointFromFfi(__resultHandle);
    } finally {
      foobarListofDateStd2chrono2steady1clock2time1pointReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeDatessteadyToFfi(DatesSteady value) =>
  _smokeDatessteadyCopyHandle((value as __lib.NativeBase).handle);
DatesSteady smokeDatessteadyFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DatesSteady) return instance;
  final _copiedHandle = _smokeDatessteadyCopyHandle(handle);
  final result = DatesSteady$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeDatessteadyRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeDatessteadyReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeDatessteadyReleaseHandle(handle);
Pointer<Void> smokeDatessteadyToFfiNullable(DatesSteady? value) =>
  value != null ? smokeDatessteadyToFfi(value) : Pointer<Void>.fromAddress(0);
DatesSteady? smokeDatessteadyFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeDatessteadyFromFfi(handle) : null;
void smokeDatessteadyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDatessteadyReleaseHandle(handle);
// End of DatesSteady "private" section.
