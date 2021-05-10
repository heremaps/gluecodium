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
Pointer<Void> foobar_ListOf_Byte_toFfi(List<int> value) {
  final _result = _foobarListofByteCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarListofByteInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
List<int> foobar_ListOf_Byte_fromFfi(Pointer<Void> handle) {
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
void foobar_ListOf_Byte_releaseFfiHandle(Pointer<Void> handle) => _foobarListofByteReleaseHandle(handle);
final _foobar_ListOf_ByteCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Byte_create_handle_nullable'));
final _foobar_ListOf_ByteReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Byte_release_handle_nullable'));
final _foobar_ListOf_ByteGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Byte_get_value_nullable'));
Pointer<Void> foobar_ListOf_Byte_toFfi_nullable(List<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_Byte_toFfi(value);
  final result = _foobar_ListOf_ByteCreateHandleNullable(_handle);
  foobar_ListOf_Byte_releaseFfiHandle(_handle);
  return result;
}
List<int> foobar_ListOf_Byte_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_ByteGetValueNullable(handle);
  final result = foobar_ListOf_Byte_fromFfi(_handle);
  foobar_ListOf_Byte_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_Byte_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_ByteReleaseHandleNullable(handle);
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
Pointer<Void> foobar_ListOf_smoke_Rectangle_toFfi(List<math.Rectangle<int>> value) {
  final _result = _foobarListofSmokeRectangleCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_Rectangle_toFfi(element);
    _foobarListofSmokeRectangleInsert(_result, _elementHandle);
    smoke_Rectangle_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<math.Rectangle<int>> foobar_ListOf_smoke_Rectangle_fromFfi(Pointer<Void> handle) {
  final result = List<math.Rectangle<int>>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeRectangleIterator(handle);
  while (_foobarListofSmokeRectangleIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeRectangleIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_Rectangle_fromFfi(_elementHandle));
    } finally {
      smoke_Rectangle_releaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeRectangleIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeRectangleIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_smoke_Rectangle_releaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeRectangleReleaseHandle(handle);
final _foobar_ListOf_smoke_RectangleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_Rectangle_create_handle_nullable'));
final _foobar_ListOf_smoke_RectangleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_Rectangle_release_handle_nullable'));
final _foobar_ListOf_smoke_RectangleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_Rectangle_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_Rectangle_toFfi_nullable(List<math.Rectangle<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_Rectangle_toFfi(value);
  final result = _foobar_ListOf_smoke_RectangleCreateHandleNullable(_handle);
  foobar_ListOf_smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
List<math.Rectangle<int>> foobar_ListOf_smoke_Rectangle_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_RectangleGetValueNullable(handle);
  final result = foobar_ListOf_smoke_Rectangle_fromFfi(_handle);
  foobar_ListOf_smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_Rectangle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_RectangleReleaseHandleNullable(handle);
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
Pointer<Void> foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_toFfi(Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> value) {
  final _result = _foobarMapofSmokeCompressionstateToSmokeRectangleCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = smoke_CompressionState_toFfi(entry.key);
    final _valueHandle = smoke_Rectangle_toFfi(entry.value);
    _foobarMapofSmokeCompressionstateToSmokeRectanglePut(_result, _keyHandle, _valueHandle);
    smoke_CompressionState_releaseFfiHandle(_keyHandle);
    smoke_Rectangle_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_fromFfi(Pointer<Void> handle) {
  final result = Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>>();
  final _iteratorHandle = _foobarMapofSmokeCompressionstateToSmokeRectangleIterator(handle);
  while (_foobarMapofSmokeCompressionstateToSmokeRectangleIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorGetValue(_iteratorHandle);
    try {
      result[smoke_CompressionState_fromFfi(_keyHandle)] =
        smoke_Rectangle_fromFfi(_valueHandle);
    } finally {
      smoke_CompressionState_releaseFfiHandle(_keyHandle);
      smoke_Rectangle_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofSmokeCompressionstateToSmokeRectangleIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofSmokeCompressionstateToSmokeRectangleReleaseHandle(handle);
final _foobar_MapOf_smoke_CompressionState_to_smoke_RectangleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_create_handle_nullable'));
final _foobar_MapOf_smoke_CompressionState_to_smoke_RectangleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_release_handle_nullable'));
final _foobar_MapOf_smoke_CompressionState_to_smoke_RectangleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_get_value_nullable'));
Pointer<Void> foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_toFfi_nullable(Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_toFfi(value);
  final result = _foobar_MapOf_smoke_CompressionState_to_smoke_RectangleCreateHandleNullable(_handle);
  foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_smoke_CompressionState_to_smoke_RectangleGetValueNullable(handle);
  final result = foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_fromFfi(_handle);
  foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_smoke_CompressionState_to_smoke_Rectangle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_smoke_CompressionState_to_smoke_RectangleReleaseHandleNullable(handle);
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
Pointer<Void> foobar_SetOf_smoke_CompressionState_toFfi(Set<bar.HttpClientResponseCompressionState> value) {
  final _result = _foobarSetofSmokeCompressionstateCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_CompressionState_toFfi(element);
    _foobarSetofSmokeCompressionstateInsert(_result, _elementHandle);
    smoke_CompressionState_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<bar.HttpClientResponseCompressionState> foobar_SetOf_smoke_CompressionState_fromFfi(Pointer<Void> handle) {
  final result = Set<bar.HttpClientResponseCompressionState>();
  final _iteratorHandle = _foobarSetofSmokeCompressionstateIterator(handle);
  while (_foobarSetofSmokeCompressionstateIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofSmokeCompressionstateIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_CompressionState_fromFfi(_elementHandle));
    } finally {
      smoke_CompressionState_releaseFfiHandle(_elementHandle);
    }
    _foobarSetofSmokeCompressionstateIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofSmokeCompressionstateIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_SetOf_smoke_CompressionState_releaseFfiHandle(Pointer<Void> handle) => _foobarSetofSmokeCompressionstateReleaseHandle(handle);
final _foobar_SetOf_smoke_CompressionStateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_CompressionState_create_handle_nullable'));
final _foobar_SetOf_smoke_CompressionStateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_CompressionState_release_handle_nullable'));
final _foobar_SetOf_smoke_CompressionStateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_CompressionState_get_value_nullable'));
Pointer<Void> foobar_SetOf_smoke_CompressionState_toFfi_nullable(Set<bar.HttpClientResponseCompressionState> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_smoke_CompressionState_toFfi(value);
  final result = _foobar_SetOf_smoke_CompressionStateCreateHandleNullable(_handle);
  foobar_SetOf_smoke_CompressionState_releaseFfiHandle(_handle);
  return result;
}
Set<bar.HttpClientResponseCompressionState> foobar_SetOf_smoke_CompressionState_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_smoke_CompressionStateGetValueNullable(handle);
  final result = foobar_SetOf_smoke_CompressionState_fromFfi(_handle);
  foobar_SetOf_smoke_CompressionState_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_smoke_CompressionState_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_smoke_CompressionStateReleaseHandleNullable(handle);
