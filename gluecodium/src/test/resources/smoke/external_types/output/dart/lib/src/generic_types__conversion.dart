import 'dart:math' as math;
import 'package:foo/bar.dart' as bar;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/http_client_response_compression_state.dart';
import 'package:library/src/smoke/rectangle_int_.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
final _foobarListofByteCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_Byte_create_handle'));
final _foobarListofByteReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Byte_release_handle'));
final _foobarListofByteInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int8),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_Byte_insert'));
final _foobarListofByteIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_Byte_iterator'));
final _foobarListofByteIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Byte_iterator_release_handle'));
final _foobarListofByteIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_Byte_iterator_is_valid'));
final _foobarListofByteIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Byte_iterator_increment'));
final _foobarListofByteIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_Byte_iterator_get'));
Pointer<Void> foobarListofByteToFfi(List<int> value) {
  final _result = _foobarListofByteCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarListofByteInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
List<int> foobarListofByteFromFfi(Pointer<Void> handle) {
  final result = List<int>.empty(growable: true);
  final _iteratorHandle = _foobarListofByteIterator(handle);
  while (_foobarListofByteIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofByteIteratorGet(_iteratorHandle);
    try {
      result.add((_elementHandle));
    } finally {
      (_elementHandle);
    }
    _foobarListofByteIteratorIncrement(_iteratorHandle);
  }
  _foobarListofByteIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofByteReleaseFfiHandle(Pointer<Void> handle) => _foobarListofByteReleaseHandle(handle);
final _foobarListofByteCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Byte_create_handle_nullable'));
final _foobarListofByteReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Byte_release_handle_nullable'));
final _foobarListofByteGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Byte_get_value_nullable'));
Pointer<Void> foobarListofByteToFfiNullable(List<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofByteToFfi(value);
  final result = _foobarListofByteCreateHandleNullable(_handle);
  foobarListofByteReleaseFfiHandle(_handle);
  return result;
}
List<int> foobarListofByteFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofByteGetValueNullable(handle);
  final result = foobarListofByteFromFfi(_handle);
  foobarListofByteReleaseFfiHandle(_handle);
  return result;
}
void foobarListofByteReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofByteReleaseHandleNullable(handle);
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
final _foobarListofSmokeRectangleCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_Rectangle_create_handle'));
final _foobarListofSmokeRectangleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_Rectangle_release_handle'));
final _foobarListofSmokeRectangleInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_Rectangle_insert'));
final _foobarListofSmokeRectangleIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_Rectangle_iterator'));
final _foobarListofSmokeRectangleIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_Rectangle_iterator_release_handle'));
final _foobarListofSmokeRectangleIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_Rectangle_iterator_is_valid'));
final _foobarListofSmokeRectangleIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_Rectangle_iterator_increment'));
final _foobarListofSmokeRectangleIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_Rectangle_iterator_get'));
Pointer<Void> foobarListofSmokeRectangleToFfi(List<math.Rectangle<int>> value) {
  final _result = _foobarListofSmokeRectangleCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeRectangleToFfi(element);
    _foobarListofSmokeRectangleInsert(_result, _elementHandle);
    smokeRectangleReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<math.Rectangle<int>> foobarListofSmokeRectangleFromFfi(Pointer<Void> handle) {
  final result = List<math.Rectangle<int>>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeRectangleIterator(handle);
  while (_foobarListofSmokeRectangleIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeRectangleIteratorGet(_iteratorHandle);
    try {
      result.add(smokeRectangleFromFfi(_elementHandle));
    } finally {
      smokeRectangleReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeRectangleIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeRectangleIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeRectangleReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeRectangleReleaseHandle(handle);
final _foobarListofSmokeRectangleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_Rectangle_create_handle_nullable'));
final _foobarListofSmokeRectangleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_Rectangle_release_handle_nullable'));
final _foobarListofSmokeRectangleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_Rectangle_get_value_nullable'));
Pointer<Void> foobarListofSmokeRectangleToFfiNullable(List<math.Rectangle<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeRectangleToFfi(value);
  final result = _foobarListofSmokeRectangleCreateHandleNullable(_handle);
  foobarListofSmokeRectangleReleaseFfiHandle(_handle);
  return result;
}
List<math.Rectangle<int>> foobarListofSmokeRectangleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeRectangleGetValueNullable(handle);
  final result = foobarListofSmokeRectangleFromFfi(_handle);
  foobarListofSmokeRectangleReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeRectangleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeRectangleReleaseHandleNullable(handle);
final _foobarMapofSmokeCompressionstateToSmokeRectangleCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_create_handle'));
final _foobarMapofSmokeCompressionstateToSmokeRectangleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_release_handle'));
final _foobarMapofSmokeCompressionstateToSmokeRectanglePut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_put'));
final _foobarMapofSmokeCompressionstateToSmokeRectangleIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator'));
final _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_release_handle'));
final _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_is_valid'));
final _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_increment'));
final _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_get_key'));
final _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_get_value'));
Pointer<Void> foobarMapofSmokeCompressionstateToSmokeRectangleToFfi(Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> value) {
  final _result = _foobarMapofSmokeCompressionstateToSmokeRectangleCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = smokeCompressionstateToFfi(entry.key);
    final _valueHandle = smokeRectangleToFfi(entry.value);
    _foobarMapofSmokeCompressionstateToSmokeRectanglePut(_result, _keyHandle, _valueHandle);
    smokeCompressionstateReleaseFfiHandle(_keyHandle);
    smokeRectangleReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> foobarMapofSmokeCompressionstateToSmokeRectangleFromFfi(Pointer<Void> handle) {
  final result = Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>>();
  final _iteratorHandle = _foobarMapofSmokeCompressionstateToSmokeRectangleIterator(handle);
  while (_foobarMapofSmokeCompressionstateToSmokeRectangleIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorGetValue(_iteratorHandle);
    try {
      result[smokeCompressionstateFromFfi(_keyHandle)] =
        smokeRectangleFromFfi(_valueHandle);
    } finally {
      smokeCompressionstateReleaseFfiHandle(_keyHandle);
      smokeRectangleReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofSmokeCompressionstateToSmokeRectangleReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofSmokeCompressionstateToSmokeRectangleReleaseHandle(handle);
final _foobarMapofSmokeCompressionstateToSmokeRectangleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_create_handle_nullable'));
final _foobarMapofSmokeCompressionstateToSmokeRectangleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_release_handle_nullable'));
final _foobarMapofSmokeCompressionstateToSmokeRectangleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_get_value_nullable'));
Pointer<Void> foobarMapofSmokeCompressionstateToSmokeRectangleToFfiNullable(Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofSmokeCompressionstateToSmokeRectangleToFfi(value);
  final result = _foobarMapofSmokeCompressionstateToSmokeRectangleCreateHandleNullable(_handle);
  foobarMapofSmokeCompressionstateToSmokeRectangleReleaseFfiHandle(_handle);
  return result;
}
Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> foobarMapofSmokeCompressionstateToSmokeRectangleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofSmokeCompressionstateToSmokeRectangleGetValueNullable(handle);
  final result = foobarMapofSmokeCompressionstateToSmokeRectangleFromFfi(_handle);
  foobarMapofSmokeCompressionstateToSmokeRectangleReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofSmokeCompressionstateToSmokeRectangleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofSmokeCompressionstateToSmokeRectangleReleaseHandleNullable(handle);
final _foobarSetofSmokeCompressionstateCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_smoke_CompressionState_create_handle'));
final _foobarSetofSmokeCompressionstateReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_CompressionState_release_handle'));
final _foobarSetofSmokeCompressionstateInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_foobar_SetOf_smoke_CompressionState_insert'));
final _foobarSetofSmokeCompressionstateIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_CompressionState_iterator'));
final _foobarSetofSmokeCompressionstateIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_CompressionState_iterator_release_handle'));
final _foobarSetofSmokeCompressionstateIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_smoke_CompressionState_iterator_is_valid'));
final _foobarSetofSmokeCompressionstateIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_CompressionState_iterator_increment'));
final _foobarSetofSmokeCompressionstateIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_CompressionState_iterator_get'));
Pointer<Void> foobarSetofSmokeCompressionstateToFfi(Set<bar.HttpClientResponseCompressionState> value) {
  final _result = _foobarSetofSmokeCompressionstateCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeCompressionstateToFfi(element);
    _foobarSetofSmokeCompressionstateInsert(_result, _elementHandle);
    smokeCompressionstateReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<bar.HttpClientResponseCompressionState> foobarSetofSmokeCompressionstateFromFfi(Pointer<Void> handle) {
  final result = Set<bar.HttpClientResponseCompressionState>();
  final _iteratorHandle = _foobarSetofSmokeCompressionstateIterator(handle);
  while (_foobarSetofSmokeCompressionstateIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofSmokeCompressionstateIteratorGet(_iteratorHandle);
    try {
      result.add(smokeCompressionstateFromFfi(_elementHandle));
    } finally {
      smokeCompressionstateReleaseFfiHandle(_elementHandle);
    }
    _foobarSetofSmokeCompressionstateIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofSmokeCompressionstateIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarSetofSmokeCompressionstateReleaseFfiHandle(Pointer<Void> handle) => _foobarSetofSmokeCompressionstateReleaseHandle(handle);
final _foobarSetofSmokeCompressionstateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_CompressionState_create_handle_nullable'));
final _foobarSetofSmokeCompressionstateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_CompressionState_release_handle_nullable'));
final _foobarSetofSmokeCompressionstateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_CompressionState_get_value_nullable'));
Pointer<Void> foobarSetofSmokeCompressionstateToFfiNullable(Set<bar.HttpClientResponseCompressionState> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarSetofSmokeCompressionstateToFfi(value);
  final result = _foobarSetofSmokeCompressionstateCreateHandleNullable(_handle);
  foobarSetofSmokeCompressionstateReleaseFfiHandle(_handle);
  return result;
}
Set<bar.HttpClientResponseCompressionState> foobarSetofSmokeCompressionstateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarSetofSmokeCompressionstateGetValueNullable(handle);
  final result = foobarSetofSmokeCompressionstateFromFfi(_handle);
  foobarSetofSmokeCompressionstateReleaseFfiHandle(_handle);
  return result;
}
void foobarSetofSmokeCompressionstateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarSetofSmokeCompressionstateReleaseHandleNullable(handle);
