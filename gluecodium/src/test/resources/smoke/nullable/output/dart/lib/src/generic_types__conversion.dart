import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/nullable.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
final _foobarListofNullableDateCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_Nullable_Date_create_handle'));
final _foobarListofNullableDateReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_release_handle'));
final _foobarListofNullableDateInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_insert'));
final _foobarListofNullableDateIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_Nullable_Date_iterator'));
final _foobarListofNullableDateIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Nullable_Date_iterator_release_handle'));
final _foobarListofNullableDateIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_Nullable_Date_iterator_is_valid'));
final _foobarListofNullableDateIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Nullable_Date_iterator_increment'));
final _foobarListofNullableDateIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_Nullable_Date_iterator_get'));
Pointer<Void> foobarListofNullableDateToFfi(List<DateTime> value) {
  final _result = _foobarListofNullableDateCreateHandle();
  for (final element in value) {
    final _elementHandle = dateToFfiNullable(element);
    _foobarListofNullableDateInsert(_result, _elementHandle);
    dateReleaseFfiHandleNullable(_elementHandle);
  }
  return _result;
}
List<DateTime> foobarListofNullableDateFromFfi(Pointer<Void> handle) {
  final result = List<DateTime>.empty(growable: true);
  final _iteratorHandle = _foobarListofNullableDateIterator(handle);
  while (_foobarListofNullableDateIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofNullableDateIteratorGet(_iteratorHandle);
    try {
      result.add(dateFromFfiNullable(_elementHandle));
    } finally {
      dateReleaseFfiHandleNullable(_elementHandle);
    }
    _foobarListofNullableDateIteratorIncrement(_iteratorHandle);
  }
  _foobarListofNullableDateIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofNullableDateReleaseFfiHandle(Pointer<Void> handle) => _foobarListofNullableDateReleaseHandle(handle);
final _foobarListofNullableDateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_create_handle_nullable'));
final _foobarListofNullableDateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_release_handle_nullable'));
final _foobarListofNullableDateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_get_value_nullable'));
Pointer<Void> foobarListofNullableDateToFfiNullable(List<DateTime> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofNullableDateToFfi(value);
  final result = _foobarListofNullableDateCreateHandleNullable(_handle);
  foobarListofNullableDateReleaseFfiHandle(_handle);
  return result;
}
List<DateTime> foobarListofNullableDateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofNullableDateGetValueNullable(handle);
  final result = foobarListofNullableDateFromFfi(_handle);
  foobarListofNullableDateReleaseFfiHandle(_handle);
  return result;
}
void foobarListofNullableDateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofNullableDateReleaseHandleNullable(handle);
final _foobarListofStringCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_String_create_handle'));
final _foobarListofStringReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_String_release_handle'));
final _foobarListofStringInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_String_insert'));
final _foobarListofStringIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_String_iterator'));
final _foobarListofStringIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_String_iterator_release_handle'));
final _foobarListofStringIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_String_iterator_is_valid'));
final _foobarListofStringIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_String_iterator_increment'));
final _foobarListofStringIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_String_iterator_get'));
Pointer<Void> foobarListofStringToFfi(List<String> value) {
  final _result = _foobarListofStringCreateHandle();
  for (final element in value) {
    final _elementHandle = stringToFfi(element);
    _foobarListofStringInsert(_result, _elementHandle);
    stringReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<String> foobarListofStringFromFfi(Pointer<Void> handle) {
  final result = List<String>.empty(growable: true);
  final _iteratorHandle = _foobarListofStringIterator(handle);
  while (_foobarListofStringIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofStringIteratorGet(_iteratorHandle);
    try {
      result.add(stringFromFfi(_elementHandle));
    } finally {
      stringReleaseFfiHandle(_elementHandle);
    }
    _foobarListofStringIteratorIncrement(_iteratorHandle);
  }
  _foobarListofStringIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofStringReleaseFfiHandle(Pointer<Void> handle) => _foobarListofStringReleaseHandle(handle);
final _foobarListofStringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_String_create_handle_nullable'));
final _foobarListofStringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_String_release_handle_nullable'));
final _foobarListofStringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_String_get_value_nullable'));
Pointer<Void> foobarListofStringToFfiNullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofStringToFfi(value);
  final result = _foobarListofStringCreateHandleNullable(_handle);
  foobarListofStringReleaseFfiHandle(_handle);
  return result;
}
List<String> foobarListofStringFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofStringGetValueNullable(handle);
  final result = foobarListofStringFromFfi(_handle);
  foobarListofStringReleaseFfiHandle(_handle);
  return result;
}
void foobarListofStringReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofStringReleaseHandleNullable(handle);
final _foobarMapofIntToNullableSmokeNullableSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle'));
final _foobarMapofIntToNullableSmokeNullableSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle'));
final _foobarMapofIntToNullableSmokeNullableSomestructPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_put'));
final _foobarMapofIntToNullableSmokeNullableSomestructIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator'));
final _foobarMapofIntToNullableSmokeNullableSomestructIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_release_handle'));
final _foobarMapofIntToNullableSmokeNullableSomestructIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_is_valid'));
final _foobarMapofIntToNullableSmokeNullableSomestructIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_increment'));
final _foobarMapofIntToNullableSmokeNullableSomestructIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_key'));
final _foobarMapofIntToNullableSmokeNullableSomestructIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_value'));
Pointer<Void> foobarMapofIntToNullableSmokeNullableSomestructToFfi(Map<int, Nullable_SomeStruct> value) {
  final _result = _foobarMapofIntToNullableSmokeNullableSomestructCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = smokeNullableSomestructToFfiNullable(entry.value);
    _foobarMapofIntToNullableSmokeNullableSomestructPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    smokeNullableSomestructReleaseFfiHandleNullable(_valueHandle);
  }
  return _result;
}
Map<int, Nullable_SomeStruct> foobarMapofIntToNullableSmokeNullableSomestructFromFfi(Pointer<Void> handle) {
  final result = Map<int, Nullable_SomeStruct>();
  final _iteratorHandle = _foobarMapofIntToNullableSmokeNullableSomestructIterator(handle);
  while (_foobarMapofIntToNullableSmokeNullableSomestructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToNullableSmokeNullableSomestructIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToNullableSmokeNullableSomestructIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        smokeNullableSomestructFromFfiNullable(_valueHandle);
    } finally {
      (_keyHandle);
      smokeNullableSomestructReleaseFfiHandleNullable(_valueHandle);
    }
    _foobarMapofIntToNullableSmokeNullableSomestructIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToNullableSmokeNullableSomestructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofIntToNullableSmokeNullableSomestructReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToNullableSmokeNullableSomestructReleaseHandle(handle);
final _foobarMapofIntToNullableSmokeNullableSomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle_nullable'));
final _foobarMapofIntToNullableSmokeNullableSomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle_nullable'));
final _foobarMapofIntToNullableSmokeNullableSomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_get_value_nullable'));
Pointer<Void> foobarMapofIntToNullableSmokeNullableSomestructToFfiNullable(Map<int, Nullable_SomeStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofIntToNullableSmokeNullableSomestructToFfi(value);
  final result = _foobarMapofIntToNullableSmokeNullableSomestructCreateHandleNullable(_handle);
  foobarMapofIntToNullableSmokeNullableSomestructReleaseFfiHandle(_handle);
  return result;
}
Map<int, Nullable_SomeStruct> foobarMapofIntToNullableSmokeNullableSomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofIntToNullableSmokeNullableSomestructGetValueNullable(handle);
  final result = foobarMapofIntToNullableSmokeNullableSomestructFromFfi(_handle);
  foobarMapofIntToNullableSmokeNullableSomestructReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofIntToNullableSmokeNullableSomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofIntToNullableSmokeNullableSomestructReleaseHandleNullable(handle);
final _foobarMapofLongToStringCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Long_to_String_create_handle'));
final _foobarMapofLongToStringReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_release_handle'));
final _foobarMapofLongToStringPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int64, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_put'));
final _foobarMapofLongToStringIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator'));
final _foobarMapofLongToStringIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator_release_handle'));
final _foobarMapofLongToStringIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator_is_valid'));
final _foobarMapofLongToStringIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator_increment'));
final _foobarMapofLongToStringIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator_get_key'));
final _foobarMapofLongToStringIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator_get_value'));
Pointer<Void> foobarMapofLongToStringToFfi(Map<int, String> value) {
  final _result = _foobarMapofLongToStringCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = stringToFfi(entry.value);
    _foobarMapofLongToStringPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, String> foobarMapofLongToStringFromFfi(Pointer<Void> handle) {
  final result = Map<int, String>();
  final _iteratorHandle = _foobarMapofLongToStringIterator(handle);
  while (_foobarMapofLongToStringIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofLongToStringIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofLongToStringIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        stringFromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      stringReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofLongToStringIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofLongToStringIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofLongToStringReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofLongToStringReleaseHandle(handle);
final _foobarMapofLongToStringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_create_handle_nullable'));
final _foobarMapofLongToStringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_release_handle_nullable'));
final _foobarMapofLongToStringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_get_value_nullable'));
Pointer<Void> foobarMapofLongToStringToFfiNullable(Map<int, String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofLongToStringToFfi(value);
  final result = _foobarMapofLongToStringCreateHandleNullable(_handle);
  foobarMapofLongToStringReleaseFfiHandle(_handle);
  return result;
}
Map<int, String> foobarMapofLongToStringFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofLongToStringGetValueNullable(handle);
  final result = foobarMapofLongToStringFromFfi(_handle);
  foobarMapofLongToStringReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofLongToStringReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofLongToStringReleaseHandleNullable(handle);
