import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
abstract class Dates {
  DateTime dateMethod(DateTime input);
  DateTime? nullableDateMethod(DateTime? input);
  DateTime get dateProperty;
  set dateProperty(DateTime value);
  Set<DateTime> get dateSet;
  set dateSet(Set<DateTime> value);
}
class Dates_DateStruct {
  DateTime dateField;
  DateTime? nullableDateField;
  Dates_DateStruct._(this.dateField, this.nullableDateField);
  Dates_DateStruct(DateTime dateField)
    : dateField = dateField, nullableDateField = null;
}
// Dates_DateStruct "private" section, not exported.
final _smokeDatesDatestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_Dates_DateStruct_create_handle'));
final _smokeDatesDatestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Dates_DateStruct_release_handle'));
final _smokeDatesDatestructGetFielddateField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Dates_DateStruct_get_field_dateField'));
final _smokeDatesDatestructGetFieldnullableDateField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Dates_DateStruct_get_field_nullableDateField'));
Pointer<Void> smokeDatesDatestructToFfi(Dates_DateStruct value) {
  final _dateFieldHandle = dateToFfi(value.dateField);
  final _nullableDateFieldHandle = dateToFfiNullable(value.nullableDateField);
  final _result = _smokeDatesDatestructCreateHandle(_dateFieldHandle, _nullableDateFieldHandle);
  dateReleaseFfiHandle(_dateFieldHandle);
  dateReleaseFfiHandleNullable(_nullableDateFieldHandle);
  return _result;
}
Dates_DateStruct smokeDatesDatestructFromFfi(Pointer<Void> handle) {
  final _dateFieldHandle = _smokeDatesDatestructGetFielddateField(handle);
  final _nullableDateFieldHandle = _smokeDatesDatestructGetFieldnullableDateField(handle);
  try {
    return Dates_DateStruct._(
      dateFromFfi(_dateFieldHandle),
      dateFromFfiNullable(_nullableDateFieldHandle)
    );
  } finally {
    dateReleaseFfiHandle(_dateFieldHandle);
    dateReleaseFfiHandleNullable(_nullableDateFieldHandle);
  }
}
void smokeDatesDatestructReleaseFfiHandle(Pointer<Void> handle) => _smokeDatesDatestructReleaseHandle(handle);
// Nullable Dates_DateStruct
final _smokeDatesDatestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Dates_DateStruct_create_handle_nullable'));
final _smokeDatesDatestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Dates_DateStruct_release_handle_nullable'));
final _smokeDatesDatestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Dates_DateStruct_get_value_nullable'));
Pointer<Void> smokeDatesDatestructToFfiNullable(Dates_DateStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDatesDatestructToFfi(value);
  final result = _smokeDatesDatestructCreateHandleNullable(_handle);
  smokeDatesDatestructReleaseFfiHandle(_handle);
  return result;
}
Dates_DateStruct? smokeDatesDatestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDatesDatestructGetValueNullable(handle);
  final result = smokeDatesDatestructFromFfi(_handle);
  smokeDatesDatestructReleaseFfiHandle(_handle);
  return result;
}
void smokeDatesDatestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDatesDatestructReleaseHandleNullable(handle);
// End of Dates_DateStruct "private" section.
// Dates "private" section, not exported.
final _smokeDatesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Dates_register_finalizer'));
final _smokeDatesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Dates_copy_handle'));
final _smokeDatesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Dates_release_handle'));
class Dates$Impl extends __lib.NativeBase implements Dates {
  Dates$Impl(Pointer<Void> handle) : super(handle);
  @override
  DateTime dateMethod(DateTime input) {
    final _dateMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32, Uint64), int Function(Pointer<Void>, int, int)>('library_smoke_Dates_dateMethod__Date'));
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
    final _nullableDateMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Dates_nullableDateMethod__Date_'));
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
  DateTime get dateProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Dates_dateProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfi(__resultHandle);
    } finally {
      dateReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set dateProperty(DateTime value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint64), void Function(Pointer<Void>, int, int)>('library_smoke_Dates_dateProperty_set__Date'));
    final _valueHandle = dateToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    dateReleaseFfiHandle(_valueHandle);
  }
  @override
  Set<DateTime> get dateSet {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Dates_dateSet_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarSetofDateFromFfi(__resultHandle);
    } finally {
      foobarSetofDateReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set dateSet(Set<DateTime> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Dates_dateSet_set__SetOf_Date'));
    final _valueHandle = foobarSetofDateToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarSetofDateReleaseFfiHandle(_valueHandle);
  }
}
Pointer<Void> smokeDatesToFfi(Dates value) =>
  _smokeDatesCopyHandle((value as __lib.NativeBase).handle);
Dates smokeDatesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Dates) return instance;
  final _copiedHandle = _smokeDatesCopyHandle(handle);
  final result = Dates$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeDatesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeDatesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeDatesReleaseHandle(handle);
Pointer<Void> smokeDatesToFfiNullable(Dates? value) =>
  value != null ? smokeDatesToFfi(value) : Pointer<Void>.fromAddress(0);
Dates? smokeDatesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeDatesFromFfi(handle) : null;
void smokeDatesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDatesReleaseHandle(handle);
// End of Dates "private" section.
