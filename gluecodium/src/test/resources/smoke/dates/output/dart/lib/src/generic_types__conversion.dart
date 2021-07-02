import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
final _foobarListofDateCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_Date_create_handle'));
final _foobarListofDateReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Date_release_handle'));
final _foobarListofDateInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint64),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_Date_insert'));
final _foobarListofDateIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_Date_iterator'));
final _foobarListofDateIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Date_iterator_release_handle'));
final _foobarListofDateIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_Date_iterator_is_valid'));
final _foobarListofDateIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Date_iterator_increment'));
final _foobarListofDateIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_Date_iterator_get'));
Pointer<Void> foobarListofDateToFfi(List<DateTime> value) {
  final _result = _foobarListofDateCreateHandle();
  for (final element in value) {
    final _elementHandle = dateToFfi(element);
    _foobarListofDateInsert(_result, _elementHandle);
    dateReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<DateTime> foobarListofDateFromFfi(Pointer<Void> handle) {
  final result = List<DateTime>.empty(growable: true);
  final _iteratorHandle = _foobarListofDateIterator(handle);
  while (_foobarListofDateIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofDateIteratorGet(_iteratorHandle);
    try {
      result.add(dateFromFfi(_elementHandle));
    } finally {
      dateReleaseFfiHandle(_elementHandle);
    }
    _foobarListofDateIteratorIncrement(_iteratorHandle);
  }
  _foobarListofDateIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofDateReleaseFfiHandle(Pointer<Void> handle) => _foobarListofDateReleaseHandle(handle);
final _foobarListofDateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Date_create_handle_nullable'));
final _foobarListofDateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Date_release_handle_nullable'));
final _foobarListofDateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Date_get_value_nullable'));
Pointer<Void> foobarListofDateToFfiNullable(List<DateTime>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofDateToFfi(value);
  final result = _foobarListofDateCreateHandleNullable(_handle);
  foobarListofDateReleaseFfiHandle(_handle);
  return result;
}
List<DateTime>? foobarListofDateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofDateGetValueNullable(handle);
  final result = foobarListofDateFromFfi(_handle);
  foobarListofDateReleaseFfiHandle(_handle);
  return result;
}
void foobarListofDateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofDateReleaseHandleNullable(handle);
final _foobarListofDateStd2chrono2steady1clock2time1pointCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_create_handle'));
final _foobarListofDateStd2chrono2steady1clock2time1pointReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_release_handle'));
final _foobarListofDateStd2chrono2steady1clock2time1pointInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint64),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_insert'));
final _foobarListofDateStd2chrono2steady1clock2time1pointIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_iterator'));
final _foobarListofDateStd2chrono2steady1clock2time1pointIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_iterator_release_handle'));
final _foobarListofDateStd2chrono2steady1clock2time1pointIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_iterator_is_valid'));
final _foobarListofDateStd2chrono2steady1clock2time1pointIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_iterator_increment'));
final _foobarListofDateStd2chrono2steady1clock2time1pointIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_iterator_get'));
Pointer<Void> foobarListofDateStd2chrono2steady1clock2time1pointToFfi(List<DateTime> value) {
  final _result = _foobarListofDateStd2chrono2steady1clock2time1pointCreateHandle();
  for (final element in value) {
    final _elementHandle = dateToFfi(element);
    _foobarListofDateStd2chrono2steady1clock2time1pointInsert(_result, _elementHandle);
    dateReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<DateTime> foobarListofDateStd2chrono2steady1clock2time1pointFromFfi(Pointer<Void> handle) {
  final result = List<DateTime>.empty(growable: true);
  final _iteratorHandle = _foobarListofDateStd2chrono2steady1clock2time1pointIterator(handle);
  while (_foobarListofDateStd2chrono2steady1clock2time1pointIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofDateStd2chrono2steady1clock2time1pointIteratorGet(_iteratorHandle);
    try {
      result.add(dateFromFfi(_elementHandle));
    } finally {
      dateReleaseFfiHandle(_elementHandle);
    }
    _foobarListofDateStd2chrono2steady1clock2time1pointIteratorIncrement(_iteratorHandle);
  }
  _foobarListofDateStd2chrono2steady1clock2time1pointIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofDateStd2chrono2steady1clock2time1pointReleaseFfiHandle(Pointer<Void> handle) => _foobarListofDateStd2chrono2steady1clock2time1pointReleaseHandle(handle);
final _foobarListofDateStd2chrono2steady1clock2time1pointCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_create_handle_nullable'));
final _foobarListofDateStd2chrono2steady1clock2time1pointReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_release_handle_nullable'));
final _foobarListofDateStd2chrono2steady1clock2time1pointGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Date_std_2chrono_2steady_1clock_2time_1point_get_value_nullable'));
Pointer<Void> foobarListofDateStd2chrono2steady1clock2time1pointToFfiNullable(List<DateTime>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofDateStd2chrono2steady1clock2time1pointToFfi(value);
  final result = _foobarListofDateStd2chrono2steady1clock2time1pointCreateHandleNullable(_handle);
  foobarListofDateStd2chrono2steady1clock2time1pointReleaseFfiHandle(_handle);
  return result;
}
List<DateTime>? foobarListofDateStd2chrono2steady1clock2time1pointFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofDateStd2chrono2steady1clock2time1pointGetValueNullable(handle);
  final result = foobarListofDateStd2chrono2steady1clock2time1pointFromFfi(_handle);
  foobarListofDateStd2chrono2steady1clock2time1pointReleaseFfiHandle(_handle);
  return result;
}
void foobarListofDateStd2chrono2steady1clock2time1pointReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofDateStd2chrono2steady1clock2time1pointReleaseHandleNullable(handle);
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_create_handle'));
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_release_handle'));
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint64, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_put'));
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator'));
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator_release_handle'));
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator_is_valid'));
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator_increment'));
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator_get_key'));
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_iterator_get_value'));
Pointer<Void> foobarMapofDateStd2chrono2steady1clock2time1pointToStringToFfi(Map<DateTime, String> value) {
  final _result = _foobarMapofDateStd2chrono2steady1clock2time1pointToStringCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = dateToFfi(entry.key);
    final _valueHandle = stringToFfi(entry.value);
    _foobarMapofDateStd2chrono2steady1clock2time1pointToStringPut(_result, _keyHandle, _valueHandle);
    dateReleaseFfiHandle(_keyHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<DateTime, String> foobarMapofDateStd2chrono2steady1clock2time1pointToStringFromFfi(Pointer<Void> handle) {
  final result = Map<DateTime, String>();
  final _iteratorHandle = _foobarMapofDateStd2chrono2steady1clock2time1pointToStringIterator(handle);
  while (_foobarMapofDateStd2chrono2steady1clock2time1pointToStringIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofDateStd2chrono2steady1clock2time1pointToStringIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofDateStd2chrono2steady1clock2time1pointToStringIteratorGetValue(_iteratorHandle);
    try {
      result[dateFromFfi(_keyHandle)] =
        stringFromFfi(_valueHandle);
    } finally {
      dateReleaseFfiHandle(_keyHandle);
      stringReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofDateStd2chrono2steady1clock2time1pointToStringIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofDateStd2chrono2steady1clock2time1pointToStringIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofDateStd2chrono2steady1clock2time1pointToStringReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofDateStd2chrono2steady1clock2time1pointToStringReleaseHandle(handle);
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_create_handle_nullable'));
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_release_handle_nullable'));
final _foobarMapofDateStd2chrono2steady1clock2time1pointToStringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Date_std_2chrono_2steady_1clock_2time_1point_to_String_get_value_nullable'));
Pointer<Void> foobarMapofDateStd2chrono2steady1clock2time1pointToStringToFfiNullable(Map<DateTime, String>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofDateStd2chrono2steady1clock2time1pointToStringToFfi(value);
  final result = _foobarMapofDateStd2chrono2steady1clock2time1pointToStringCreateHandleNullable(_handle);
  foobarMapofDateStd2chrono2steady1clock2time1pointToStringReleaseFfiHandle(_handle);
  return result;
}
Map<DateTime, String>? foobarMapofDateStd2chrono2steady1clock2time1pointToStringFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofDateStd2chrono2steady1clock2time1pointToStringGetValueNullable(handle);
  final result = foobarMapofDateStd2chrono2steady1clock2time1pointToStringFromFfi(_handle);
  foobarMapofDateStd2chrono2steady1clock2time1pointToStringReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofDateStd2chrono2steady1clock2time1pointToStringReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofDateStd2chrono2steady1clock2time1pointToStringReleaseHandleNullable(handle);
final _foobarMapofStringToDateCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_String_to_Date_create_handle'));
final _foobarMapofStringToDateReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_Date_release_handle'));
final _foobarMapofStringToDatePut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Uint64),
    void Function(Pointer<Void>, Pointer<Void>, int)
  >('library_foobar_MapOf_String_to_Date_put'));
final _foobarMapofStringToDateIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_Date_iterator'));
final _foobarMapofStringToDateIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_Date_iterator_release_handle'));
final _foobarMapofStringToDateIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_String_to_Date_iterator_is_valid'));
final _foobarMapofStringToDateIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_Date_iterator_increment'));
final _foobarMapofStringToDateIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_Date_iterator_get_key'));
final _foobarMapofStringToDateIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_Date_iterator_get_value'));
Pointer<Void> foobarMapofStringToDateToFfi(Map<String, DateTime> value) {
  final _result = _foobarMapofStringToDateCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = stringToFfi(entry.key);
    final _valueHandle = dateToFfi(entry.value);
    _foobarMapofStringToDatePut(_result, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);
    dateReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<String, DateTime> foobarMapofStringToDateFromFfi(Pointer<Void> handle) {
  final result = Map<String, DateTime>();
  final _iteratorHandle = _foobarMapofStringToDateIterator(handle);
  while (_foobarMapofStringToDateIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofStringToDateIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofStringToDateIteratorGetValue(_iteratorHandle);
    try {
      result[stringFromFfi(_keyHandle)] =
        dateFromFfi(_valueHandle);
    } finally {
      stringReleaseFfiHandle(_keyHandle);
      dateReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofStringToDateIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofStringToDateIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofStringToDateReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofStringToDateReleaseHandle(handle);
final _foobarMapofStringToDateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_Date_create_handle_nullable'));
final _foobarMapofStringToDateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_Date_release_handle_nullable'));
final _foobarMapofStringToDateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_Date_get_value_nullable'));
Pointer<Void> foobarMapofStringToDateToFfiNullable(Map<String, DateTime>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofStringToDateToFfi(value);
  final result = _foobarMapofStringToDateCreateHandleNullable(_handle);
  foobarMapofStringToDateReleaseFfiHandle(_handle);
  return result;
}
Map<String, DateTime>? foobarMapofStringToDateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofStringToDateGetValueNullable(handle);
  final result = foobarMapofStringToDateFromFfi(_handle);
  foobarMapofStringToDateReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofStringToDateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofStringToDateReleaseHandleNullable(handle);
final _foobarSetofDateCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_Date_create_handle'));
final _foobarSetofDateReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Date_release_handle'));
final _foobarSetofDateInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint64),
    void Function(Pointer<Void>, int)
  >('library_foobar_SetOf_Date_insert'));
final _foobarSetofDateIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_Date_iterator'));
final _foobarSetofDateIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_Date_iterator_release_handle'));
final _foobarSetofDateIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_Date_iterator_is_valid'));
final _foobarSetofDateIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_Date_iterator_increment'));
final _foobarSetofDateIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_SetOf_Date_iterator_get'));
Pointer<Void> foobarSetofDateToFfi(Set<DateTime> value) {
  final _result = _foobarSetofDateCreateHandle();
  for (final element in value) {
    final _elementHandle = dateToFfi(element);
    _foobarSetofDateInsert(_result, _elementHandle);
    dateReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<DateTime> foobarSetofDateFromFfi(Pointer<Void> handle) {
  final result = Set<DateTime>();
  final _iteratorHandle = _foobarSetofDateIterator(handle);
  while (_foobarSetofDateIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofDateIteratorGet(_iteratorHandle);
    try {
      result.add(dateFromFfi(_elementHandle));
    } finally {
      dateReleaseFfiHandle(_elementHandle);
    }
    _foobarSetofDateIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofDateIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarSetofDateReleaseFfiHandle(Pointer<Void> handle) => _foobarSetofDateReleaseHandle(handle);
final _foobarSetofDateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Date_create_handle_nullable'));
final _foobarSetofDateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Date_release_handle_nullable'));
final _foobarSetofDateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Date_get_value_nullable'));
Pointer<Void> foobarSetofDateToFfiNullable(Set<DateTime>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarSetofDateToFfi(value);
  final result = _foobarSetofDateCreateHandleNullable(_handle);
  foobarSetofDateReleaseFfiHandle(_handle);
  return result;
}
Set<DateTime>? foobarSetofDateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarSetofDateGetValueNullable(handle);
  final result = foobarSetofDateFromFfi(_handle);
  foobarSetofDateReleaseFfiHandle(_handle);
  return result;
}
void foobarSetofDateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarSetofDateReleaseHandleNullable(handle);
