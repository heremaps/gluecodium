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
Pointer<Void> foobar_ListOf_Nullable_Date_toFfi(List<DateTime> value) {
  final _result = _foobarListofNullableDateCreateHandle();
  for (final element in value) {
    final _elementHandle = Date_toFfi_nullable(element);
    _foobarListofNullableDateInsert(_result, _elementHandle);
    Date_releaseFfiHandle_nullable(_elementHandle);
  }
  return _result;
}
List<DateTime> foobar_ListOf_Nullable_Date_fromFfi(Pointer<Void> handle) {
  final result = List<DateTime>.empty(growable: true);
  final _iteratorHandle = _foobarListofNullableDateIterator(handle);
  while (_foobarListofNullableDateIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofNullableDateIteratorGet(_iteratorHandle);
    try {
      result.add(Date_fromFfi_nullable(_elementHandle));
    } finally {
      Date_releaseFfiHandle_nullable(_elementHandle);
    }
    _foobarListofNullableDateIteratorIncrement(_iteratorHandle);
  }
  _foobarListofNullableDateIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_Nullable_Date_releaseFfiHandle(Pointer<Void> handle) => _foobarListofNullableDateReleaseHandle(handle);
final _foobar_ListOf_Nullable_DateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_create_handle_nullable'));
final _foobar_ListOf_Nullable_DateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_release_handle_nullable'));
final _foobar_ListOf_Nullable_DateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_get_value_nullable'));
Pointer<Void> foobar_ListOf_Nullable_Date_toFfi_nullable(List<DateTime> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_Nullable_Date_toFfi(value);
  final result = _foobar_ListOf_Nullable_DateCreateHandleNullable(_handle);
  foobar_ListOf_Nullable_Date_releaseFfiHandle(_handle);
  return result;
}
List<DateTime> foobar_ListOf_Nullable_Date_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_Nullable_DateGetValueNullable(handle);
  final result = foobar_ListOf_Nullable_Date_fromFfi(_handle);
  foobar_ListOf_Nullable_Date_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_Nullable_Date_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_Nullable_DateReleaseHandleNullable(handle);
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
Pointer<Void> foobar_ListOf_String_toFfi(List<String> value) {
  final _result = _foobarListofStringCreateHandle();
  for (final element in value) {
    final _elementHandle = String_toFfi(element);
    _foobarListofStringInsert(_result, _elementHandle);
    String_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<String> foobar_ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>.empty(growable: true);
  final _iteratorHandle = _foobarListofStringIterator(handle);
  while (_foobarListofStringIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofStringIteratorGet(_iteratorHandle);
    try {
      result.add(String_fromFfi(_elementHandle));
    } finally {
      String_releaseFfiHandle(_elementHandle);
    }
    _foobarListofStringIteratorIncrement(_iteratorHandle);
  }
  _foobarListofStringIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _foobarListofStringReleaseHandle(handle);
final _foobar_ListOf_StringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_String_create_handle_nullable'));
final _foobar_ListOf_StringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_String_release_handle_nullable'));
final _foobar_ListOf_StringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_String_get_value_nullable'));
Pointer<Void> foobar_ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_String_toFfi(value);
  final result = _foobar_ListOf_StringCreateHandleNullable(_handle);
  foobar_ListOf_String_releaseFfiHandle(_handle);
  return result;
}
List<String> foobar_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_StringGetValueNullable(handle);
  final result = foobar_ListOf_String_fromFfi(_handle);
  foobar_ListOf_String_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_StringReleaseHandleNullable(handle);
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
Pointer<Void> foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_toFfi(Map<int, Nullable_SomeStruct> value) {
  final _result = _foobarMapofIntToNullableSmokeNullableSomestructCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = smoke_Nullable_SomeStruct_toFfi_nullable(entry.value);
    _foobarMapofIntToNullableSmokeNullableSomestructPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_valueHandle);
  }
  return _result;
}
Map<int, Nullable_SomeStruct> foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_fromFfi(Pointer<Void> handle) {
  final result = Map<int, Nullable_SomeStruct>();
  final _iteratorHandle = _foobarMapofIntToNullableSmokeNullableSomestructIterator(handle);
  while (_foobarMapofIntToNullableSmokeNullableSomestructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToNullableSmokeNullableSomestructIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToNullableSmokeNullableSomestructIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        smoke_Nullable_SomeStruct_fromFfi_nullable(_valueHandle);
    } finally {
      (_keyHandle);
      smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_valueHandle);
    }
    _foobarMapofIntToNullableSmokeNullableSomestructIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToNullableSmokeNullableSomestructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToNullableSmokeNullableSomestructReleaseHandle(handle);
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle_nullable'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle_nullable'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_toFfi_nullable(Map<int, Nullable_SomeStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_toFfi(value);
  final result = _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStructCreateHandleNullable(_handle);
  foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
Map<int, Nullable_SomeStruct> foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStructGetValueNullable(handle);
  final result = foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_fromFfi(_handle);
  foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStructReleaseHandleNullable(handle);
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
Pointer<Void> foobar_MapOf_Long_to_String_toFfi(Map<int, String> value) {
  final _result = _foobarMapofLongToStringCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = String_toFfi(entry.value);
    _foobarMapofLongToStringPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    String_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, String> foobar_MapOf_Long_to_String_fromFfi(Pointer<Void> handle) {
  final result = Map<int, String>();
  final _iteratorHandle = _foobarMapofLongToStringIterator(handle);
  while (_foobarMapofLongToStringIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofLongToStringIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofLongToStringIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        String_fromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      String_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofLongToStringIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofLongToStringIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_Long_to_String_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofLongToStringReleaseHandle(handle);
final _foobar_MapOf_Long_to_StringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_create_handle_nullable'));
final _foobar_MapOf_Long_to_StringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_release_handle_nullable'));
final _foobar_MapOf_Long_to_StringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_get_value_nullable'));
Pointer<Void> foobar_MapOf_Long_to_String_toFfi_nullable(Map<int, String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Long_to_String_toFfi(value);
  final result = _foobar_MapOf_Long_to_StringCreateHandleNullable(_handle);
  foobar_MapOf_Long_to_String_releaseFfiHandle(_handle);
  return result;
}
Map<int, String> foobar_MapOf_Long_to_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Long_to_StringGetValueNullable(handle);
  final result = foobar_MapOf_Long_to_String_fromFfi(_handle);
  foobar_MapOf_Long_to_String_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Long_to_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Long_to_StringReleaseHandleNullable(handle);
