import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/smoke/Nullable.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _ListOf_Nullable_Date_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('ListOf_Nullable_Date_create_handle');
final _ListOf_Nullable_Date_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('ListOf_Nullable_Date_release_handle');
final _ListOf_Nullable_Date_insert = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('ListOf_Nullable_Date_insert');
final _ListOf_Nullable_Date_iterator = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('ListOf_Nullable_Date_iterator');
final _ListOf_Nullable_Date_iterator_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('ListOf_Nullable_Date_iterator_release_handle');
final _ListOf_Nullable_Date_iterator_is_valid = __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('ListOf_Nullable_Date_iterator_is_valid');
final _ListOf_Nullable_Date_iterator_increment = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('ListOf_Nullable_Date_iterator_increment');
final _ListOf_Nullable_Date_iterator_get = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('ListOf_Nullable_Date_iterator_get');
Pointer<Void> ListOf_Nullable_Date_toFfi(List<DateTime> value) {
  final _result = _ListOf_Nullable_Date_create_handle();
  for (final element in value) {
    final _element_handle = Date_toFfi_nullable(element);
    _ListOf_Nullable_Date_insert(_result, _element_handle);
    Date_releaseFfiHandle_nullable(_element_handle);
  }
  return _result;
}
List<DateTime> ListOf_Nullable_Date_fromFfi(Pointer<Void> handle) {
  final result = List<DateTime>();
  final _iterator_handle = _ListOf_Nullable_Date_iterator(handle);
  while (_ListOf_Nullable_Date_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _ListOf_Nullable_Date_iterator_get(_iterator_handle);
    result.add(Date_fromFfi_nullable(_element_handle));
    Date_releaseFfiHandle_nullable(_element_handle);
    _ListOf_Nullable_Date_iterator_increment(_iterator_handle);
  }
  _ListOf_Nullable_Date_iterator_release_handle(_iterator_handle);
  return result;
}
void ListOf_Nullable_Date_releaseFfiHandle(Pointer<Void> handle) => _ListOf_Nullable_Date_release_handle(handle);
final _ListOf_Nullable_Date_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('ListOf_Nullable_Date_create_handle_nullable');
final _ListOf_Nullable_Date_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('ListOf_Nullable_Date_release_handle_nullable');
final _ListOf_Nullable_Date_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('ListOf_Nullable_Date_get_value_nullable');
Pointer<Void> ListOf_Nullable_Date_toFfi_nullable(List<DateTime> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = ListOf_Nullable_Date_toFfi(value);
  final result = _ListOf_Nullable_Date_create_handle_nullable(_handle);
  ListOf_Nullable_Date_releaseFfiHandle(_handle);
  return result;
}
List<DateTime> ListOf_Nullable_Date_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _ListOf_Nullable_Date_get_value_nullable(handle);
  final result = ListOf_Nullable_Date_fromFfi(_handle);
  ListOf_Nullable_Date_releaseFfiHandle(_handle);
  return result;
}
void ListOf_Nullable_Date_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _ListOf_Nullable_Date_release_handle_nullable(handle);
final _ListOf_String_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('ListOf_String_create_handle');
final _ListOf_String_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('ListOf_String_release_handle');
final _ListOf_String_insert = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('ListOf_String_insert');
final _ListOf_String_iterator = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('ListOf_String_iterator');
final _ListOf_String_iterator_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('ListOf_String_iterator_release_handle');
final _ListOf_String_iterator_is_valid = __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('ListOf_String_iterator_is_valid');
final _ListOf_String_iterator_increment = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('ListOf_String_iterator_increment');
final _ListOf_String_iterator_get = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('ListOf_String_iterator_get');
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
    result.add(String_fromFfi(_element_handle));
    String_releaseFfiHandle(_element_handle);
    _ListOf_String_iterator_increment(_iterator_handle);
  }
  _ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}
void ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _ListOf_String_release_handle(handle);
final _ListOf_String_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('ListOf_String_create_handle_nullable');
final _ListOf_String_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('ListOf_String_release_handle_nullable');
final _ListOf_String_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('ListOf_String_get_value_nullable');
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
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle');
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle');
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_put = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_put');
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator');
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_release_handle');
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_is_valid = __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_is_valid');
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_increment = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_increment');
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_key = __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_key');
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_value = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_value');
Pointer<Void> MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_toFfi(Map<int, Nullable_SomeStruct> value) {
  final _result = _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = smoke_Nullable_SomeStruct_toFfi_nullable(entry.value);
    _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_put(_result, _key_handle, _value_handle);
    (_key_handle);
    smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_value_handle);
  }
  return _result;
}
Map<int, Nullable_SomeStruct> MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_fromFfi(Pointer<Void> handle) {
  final result = Map<int, Nullable_SomeStruct>();
  final _iterator_handle = _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator(handle);
  while (_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_key(_iterator_handle);
    final _value_handle = _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_value(_iterator_handle);
    result[(_key_handle)] =
      smoke_Nullable_SomeStruct_fromFfi_nullable(_value_handle);
    (_key_handle);
    smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_value_handle);
    _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_increment(_iterator_handle);
  }
  _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_release_handle(_iterator_handle);
  return result;
}
void MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle(handle);
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle_nullable');
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle_nullable');
final _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_get_value_nullable');
Pointer<Void> MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_toFfi_nullable(Map<int, Nullable_SomeStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_toFfi(value);
  final result = _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle_nullable(_handle);
  MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
Map<int, Nullable_SomeStruct> MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_get_value_nullable(handle);
  final result = MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_fromFfi(_handle);
  MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle_nullable(handle);
final _MapOf_Long_to_String_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('MapOf_Long_to_String_create_handle');
final _MapOf_Long_to_String_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('MapOf_Long_to_String_release_handle');
final _MapOf_Long_to_String_put = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int64, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('MapOf_Long_to_String_put');
final _MapOf_Long_to_String_iterator = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('MapOf_Long_to_String_iterator');
final _MapOf_Long_to_String_iterator_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('MapOf_Long_to_String_iterator_release_handle');
final _MapOf_Long_to_String_iterator_is_valid = __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('MapOf_Long_to_String_iterator_is_valid');
final _MapOf_Long_to_String_iterator_increment = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('MapOf_Long_to_String_iterator_increment');
final _MapOf_Long_to_String_iterator_get_key = __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('MapOf_Long_to_String_iterator_get_key');
final _MapOf_Long_to_String_iterator_get_value = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('MapOf_Long_to_String_iterator_get_value');
Pointer<Void> MapOf_Long_to_String_toFfi(Map<int, String> value) {
  final _result = _MapOf_Long_to_String_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = String_toFfi(entry.value);
    _MapOf_Long_to_String_put(_result, _key_handle, _value_handle);
    (_key_handle);
    String_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<int, String> MapOf_Long_to_String_fromFfi(Pointer<Void> handle) {
  final result = Map<int, String>();
  final _iterator_handle = _MapOf_Long_to_String_iterator(handle);
  while (_MapOf_Long_to_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _MapOf_Long_to_String_iterator_get_key(_iterator_handle);
    final _value_handle = _MapOf_Long_to_String_iterator_get_value(_iterator_handle);
    result[(_key_handle)] =
      String_fromFfi(_value_handle);
    (_key_handle);
    String_releaseFfiHandle(_value_handle);
    _MapOf_Long_to_String_iterator_increment(_iterator_handle);
  }
  _MapOf_Long_to_String_iterator_release_handle(_iterator_handle);
  return result;
}
void MapOf_Long_to_String_releaseFfiHandle(Pointer<Void> handle) => _MapOf_Long_to_String_release_handle(handle);
final _MapOf_Long_to_String_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('MapOf_Long_to_String_create_handle_nullable');
final _MapOf_Long_to_String_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('MapOf_Long_to_String_release_handle_nullable');
final _MapOf_Long_to_String_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('MapOf_Long_to_String_get_value_nullable');
Pointer<Void> MapOf_Long_to_String_toFfi_nullable(Map<int, String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = MapOf_Long_to_String_toFfi(value);
  final result = _MapOf_Long_to_String_create_handle_nullable(_handle);
  MapOf_Long_to_String_releaseFfiHandle(_handle);
  return result;
}
Map<int, String> MapOf_Long_to_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _MapOf_Long_to_String_get_value_nullable(handle);
  final result = MapOf_Long_to_String_fromFfi(_handle);
  MapOf_Long_to_String_releaseFfiHandle(_handle);
  return result;
}
void MapOf_Long_to_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _MapOf_Long_to_String_release_handle_nullable(handle);
