import 'dart:math' as math;
import 'package:foo/bar.dart' as bar;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/http_client_response_compression_state.dart';
import 'package:library/src/smoke/rectangle_int_.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_context.dart' as __lib;
final _ListOf_Byte_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_ListOf_Byte_create_handle'));
final _ListOf_Byte_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_ListOf_Byte_release_handle'));
final _ListOf_Byte_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int8),
    void Function(Pointer<Void>, int)
  >('library_ListOf_Byte_insert'));
final _ListOf_Byte_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_ListOf_Byte_iterator'));
final _ListOf_Byte_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_ListOf_Byte_iterator_release_handle'));
final _ListOf_Byte_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_ListOf_Byte_iterator_is_valid'));
final _ListOf_Byte_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_ListOf_Byte_iterator_increment'));
final _ListOf_Byte_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_ListOf_Byte_iterator_get'));
Pointer<Void> ListOf_Byte_toFfi(List<int> value) {
  final _result = _ListOf_Byte_create_handle();
  for (final element in value) {
    final _element_handle = (element);
    _ListOf_Byte_insert(_result, _element_handle);
    (_element_handle);
  }
  return _result;
}
List<int> ListOf_Byte_fromFfi(Pointer<Void> handle) {
  final result = List<int>();
  final _iterator_handle = _ListOf_Byte_iterator(handle);
  while (_ListOf_Byte_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _ListOf_Byte_iterator_get(_iterator_handle);
    try {
      result.add((_element_handle));
    } finally {
      (_element_handle);
    }
    _ListOf_Byte_iterator_increment(_iterator_handle);
  }
  _ListOf_Byte_iterator_release_handle(_iterator_handle);
  return result;
}
void ListOf_Byte_releaseFfiHandle(Pointer<Void> handle) => _ListOf_Byte_release_handle(handle);
final _ListOf_Byte_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_ListOf_Byte_create_handle_nullable'));
final _ListOf_Byte_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_ListOf_Byte_release_handle_nullable'));
final _ListOf_Byte_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_ListOf_Byte_get_value_nullable'));
Pointer<Void> ListOf_Byte_toFfi_nullable(List<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = ListOf_Byte_toFfi(value);
  final result = _ListOf_Byte_create_handle_nullable(_handle);
  ListOf_Byte_releaseFfiHandle(_handle);
  return result;
}
List<int> ListOf_Byte_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _ListOf_Byte_get_value_nullable(handle);
  final result = ListOf_Byte_fromFfi(_handle);
  ListOf_Byte_releaseFfiHandle(_handle);
  return result;
}
void ListOf_Byte_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _ListOf_Byte_release_handle_nullable(handle);
final _ListOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_ListOf_String_create_handle'));
final _ListOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_ListOf_String_release_handle'));
final _ListOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_ListOf_String_insert'));
final _ListOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_ListOf_String_iterator'));
final _ListOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_ListOf_String_iterator_release_handle'));
final _ListOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_ListOf_String_iterator_is_valid'));
final _ListOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_ListOf_String_iterator_increment'));
final _ListOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_ListOf_String_iterator_get'));
Pointer<Void> ListOf_String_toFfi(List<String> value) {
  final _result = _ListOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _ListOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<String> ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>();
  final _iterator_handle = _ListOf_String_iterator(handle);
  while (_ListOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _ListOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _ListOf_String_iterator_increment(_iterator_handle);
  }
  _ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}
void ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _ListOf_String_release_handle(handle);
final _ListOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_ListOf_String_create_handle_nullable'));
final _ListOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_ListOf_String_release_handle_nullable'));
final _ListOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_ListOf_String_get_value_nullable'));
Pointer<Void> ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = ListOf_String_toFfi(value);
  final result = _ListOf_String_create_handle_nullable(_handle);
  ListOf_String_releaseFfiHandle(_handle);
  return result;
}
List<String> ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _ListOf_String_get_value_nullable(handle);
  final result = ListOf_String_fromFfi(_handle);
  ListOf_String_releaseFfiHandle(_handle);
  return result;
}
void ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _ListOf_String_release_handle_nullable(handle);
final _ListOf_smoke_Rectangle_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_ListOf_smoke_Rectangle_create_handle'));
final _ListOf_smoke_Rectangle_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_ListOf_smoke_Rectangle_release_handle'));
final _ListOf_smoke_Rectangle_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_ListOf_smoke_Rectangle_insert'));
final _ListOf_smoke_Rectangle_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_ListOf_smoke_Rectangle_iterator'));
final _ListOf_smoke_Rectangle_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_ListOf_smoke_Rectangle_iterator_release_handle'));
final _ListOf_smoke_Rectangle_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_ListOf_smoke_Rectangle_iterator_is_valid'));
final _ListOf_smoke_Rectangle_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_ListOf_smoke_Rectangle_iterator_increment'));
final _ListOf_smoke_Rectangle_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_ListOf_smoke_Rectangle_iterator_get'));
Pointer<Void> ListOf_smoke_Rectangle_toFfi(List<math.Rectangle<int>> value) {
  final _result = _ListOf_smoke_Rectangle_create_handle();
  for (final element in value) {
    final _element_handle = smoke_Rectangle_toFfi(element);
    _ListOf_smoke_Rectangle_insert(_result, _element_handle);
    smoke_Rectangle_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<math.Rectangle<int>> ListOf_smoke_Rectangle_fromFfi(Pointer<Void> handle) {
  final result = List<math.Rectangle<int>>();
  final _iterator_handle = _ListOf_smoke_Rectangle_iterator(handle);
  while (_ListOf_smoke_Rectangle_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _ListOf_smoke_Rectangle_iterator_get(_iterator_handle);
    try {
      result.add(smoke_Rectangle_fromFfi(_element_handle));
    } finally {
      smoke_Rectangle_releaseFfiHandle(_element_handle);
    }
    _ListOf_smoke_Rectangle_iterator_increment(_iterator_handle);
  }
  _ListOf_smoke_Rectangle_iterator_release_handle(_iterator_handle);
  return result;
}
void ListOf_smoke_Rectangle_releaseFfiHandle(Pointer<Void> handle) => _ListOf_smoke_Rectangle_release_handle(handle);
final _ListOf_smoke_Rectangle_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_ListOf_smoke_Rectangle_create_handle_nullable'));
final _ListOf_smoke_Rectangle_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_ListOf_smoke_Rectangle_release_handle_nullable'));
final _ListOf_smoke_Rectangle_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_ListOf_smoke_Rectangle_get_value_nullable'));
Pointer<Void> ListOf_smoke_Rectangle_toFfi_nullable(List<math.Rectangle<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = ListOf_smoke_Rectangle_toFfi(value);
  final result = _ListOf_smoke_Rectangle_create_handle_nullable(_handle);
  ListOf_smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
List<math.Rectangle<int>> ListOf_smoke_Rectangle_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _ListOf_smoke_Rectangle_get_value_nullable(handle);
  final result = ListOf_smoke_Rectangle_fromFfi(_handle);
  ListOf_smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
void ListOf_smoke_Rectangle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _ListOf_smoke_Rectangle_release_handle_nullable(handle);
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_create_handle'));
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_release_handle'));
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_put'));
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator'));
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_release_handle'));
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_is_valid'));
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_increment'));
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_get_key'));
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_get_value'));
Pointer<Void> MapOf_smoke_CompressionState_to_smoke_Rectangle_toFfi(Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> value) {
  final _result = _MapOf_smoke_CompressionState_to_smoke_Rectangle_create_handle();
  for (final entry in value.entries) {
    final _key_handle = smoke_CompressionState_toFfi(entry.key);
    final _value_handle = smoke_Rectangle_toFfi(entry.value);
    _MapOf_smoke_CompressionState_to_smoke_Rectangle_put(_result, _key_handle, _value_handle);
    smoke_CompressionState_releaseFfiHandle(_key_handle);
    smoke_Rectangle_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> MapOf_smoke_CompressionState_to_smoke_Rectangle_fromFfi(Pointer<Void> handle) {
  final result = Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>>();
  final _iterator_handle = _MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator(handle);
  while (_MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_get_key(_iterator_handle);
    final _value_handle = _MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_get_value(_iterator_handle);
    try {
      result[smoke_CompressionState_fromFfi(_key_handle)] =
        smoke_Rectangle_fromFfi(_value_handle);
    } finally {
      smoke_CompressionState_releaseFfiHandle(_key_handle);
      smoke_Rectangle_releaseFfiHandle(_value_handle);
    }
    _MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_increment(_iterator_handle);
  }
  _MapOf_smoke_CompressionState_to_smoke_Rectangle_iterator_release_handle(_iterator_handle);
  return result;
}
void MapOf_smoke_CompressionState_to_smoke_Rectangle_releaseFfiHandle(Pointer<Void> handle) => _MapOf_smoke_CompressionState_to_smoke_Rectangle_release_handle(handle);
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_create_handle_nullable'));
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_release_handle_nullable'));
final _MapOf_smoke_CompressionState_to_smoke_Rectangle_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_MapOf_smoke_CompressionState_to_smoke_Rectangle_get_value_nullable'));
Pointer<Void> MapOf_smoke_CompressionState_to_smoke_Rectangle_toFfi_nullable(Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = MapOf_smoke_CompressionState_to_smoke_Rectangle_toFfi(value);
  final result = _MapOf_smoke_CompressionState_to_smoke_Rectangle_create_handle_nullable(_handle);
  MapOf_smoke_CompressionState_to_smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> MapOf_smoke_CompressionState_to_smoke_Rectangle_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _MapOf_smoke_CompressionState_to_smoke_Rectangle_get_value_nullable(handle);
  final result = MapOf_smoke_CompressionState_to_smoke_Rectangle_fromFfi(_handle);
  MapOf_smoke_CompressionState_to_smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
void MapOf_smoke_CompressionState_to_smoke_Rectangle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _MapOf_smoke_CompressionState_to_smoke_Rectangle_release_handle_nullable(handle);
final _SetOf_smoke_Rectangle_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_SetOf_smoke_Rectangle_create_handle'));
final _SetOf_smoke_Rectangle_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_SetOf_smoke_Rectangle_release_handle'));
final _SetOf_smoke_Rectangle_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_SetOf_smoke_Rectangle_insert'));
final _SetOf_smoke_Rectangle_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_SetOf_smoke_Rectangle_iterator'));
final _SetOf_smoke_Rectangle_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_SetOf_smoke_Rectangle_iterator_release_handle'));
final _SetOf_smoke_Rectangle_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_SetOf_smoke_Rectangle_iterator_is_valid'));
final _SetOf_smoke_Rectangle_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_SetOf_smoke_Rectangle_iterator_increment'));
final _SetOf_smoke_Rectangle_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_SetOf_smoke_Rectangle_iterator_get'));
Pointer<Void> SetOf_smoke_Rectangle_toFfi(Set<math.Rectangle<int>> value) {
  final _result = _SetOf_smoke_Rectangle_create_handle();
  for (final element in value) {
    final _element_handle = smoke_Rectangle_toFfi(element);
    _SetOf_smoke_Rectangle_insert(_result, _element_handle);
    smoke_Rectangle_releaseFfiHandle(_element_handle);
  }
  return _result;
}
Set<math.Rectangle<int>> SetOf_smoke_Rectangle_fromFfi(Pointer<Void> handle) {
  final result = Set<math.Rectangle<int>>();
  final _iterator_handle = _SetOf_smoke_Rectangle_iterator(handle);
  while (_SetOf_smoke_Rectangle_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _SetOf_smoke_Rectangle_iterator_get(_iterator_handle);
    try {
      result.add(smoke_Rectangle_fromFfi(_element_handle));
    } finally {
      smoke_Rectangle_releaseFfiHandle(_element_handle);
    }
    _SetOf_smoke_Rectangle_iterator_increment(_iterator_handle);
  }
  _SetOf_smoke_Rectangle_iterator_release_handle(_iterator_handle);
  return result;
}
void SetOf_smoke_Rectangle_releaseFfiHandle(Pointer<Void> handle) => _SetOf_smoke_Rectangle_release_handle(handle);
final _SetOf_smoke_Rectangle_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_SetOf_smoke_Rectangle_create_handle_nullable'));
final _SetOf_smoke_Rectangle_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_SetOf_smoke_Rectangle_release_handle_nullable'));
final _SetOf_smoke_Rectangle_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_SetOf_smoke_Rectangle_get_value_nullable'));
Pointer<Void> SetOf_smoke_Rectangle_toFfi_nullable(Set<math.Rectangle<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = SetOf_smoke_Rectangle_toFfi(value);
  final result = _SetOf_smoke_Rectangle_create_handle_nullable(_handle);
  SetOf_smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
Set<math.Rectangle<int>> SetOf_smoke_Rectangle_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _SetOf_smoke_Rectangle_get_value_nullable(handle);
  final result = SetOf_smoke_Rectangle_fromFfi(_handle);
  SetOf_smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
void SetOf_smoke_Rectangle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _SetOf_smoke_Rectangle_release_handle_nullable(handle);
