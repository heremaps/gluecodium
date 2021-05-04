import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/nullable.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_context.dart' as __lib;
final _foobar_ListOf_Nullable_Date_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_Nullable_Date_create_handle'));
final _foobar_ListOf_Nullable_Date_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_release_handle'));
final _foobar_ListOf_Nullable_Date_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_insert'));
final _foobar_ListOf_Nullable_Date_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_Nullable_Date_iterator'));
final _foobar_ListOf_Nullable_Date_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Nullable_Date_iterator_release_handle'));
final _foobar_ListOf_Nullable_Date_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_Nullable_Date_iterator_is_valid'));
final _foobar_ListOf_Nullable_Date_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Nullable_Date_iterator_increment'));
final _foobar_ListOf_Nullable_Date_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_Nullable_Date_iterator_get'));
Pointer<Void> foobar_ListOf_Nullable_Date_toFfi(List<DateTime?> value) {
  final _result = _foobar_ListOf_Nullable_Date_create_handle();
  for (final element in value) {
    final _element_handle = Date_toFfi_nullable(element);
    _foobar_ListOf_Nullable_Date_insert(_result, _element_handle);
    Date_releaseFfiHandle_nullable(_element_handle);
  }
  return _result;
}
List<DateTime?> foobar_ListOf_Nullable_Date_fromFfi(Pointer<Void> handle) {
  final result = List<DateTime?>.empty(growable: true);
  final _iterator_handle = _foobar_ListOf_Nullable_Date_iterator(handle);
  while (_foobar_ListOf_Nullable_Date_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_Nullable_Date_iterator_get(_iterator_handle);
    try {
      result.add(Date_fromFfi_nullable(_element_handle));
    } finally {
      Date_releaseFfiHandle_nullable(_element_handle);
    }
    _foobar_ListOf_Nullable_Date_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_Nullable_Date_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_Nullable_Date_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_Nullable_Date_release_handle(handle);
final _foobar_ListOf_Nullable_Date_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_create_handle_nullable'));
final _foobar_ListOf_Nullable_Date_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_release_handle_nullable'));
final _foobar_ListOf_Nullable_Date_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Nullable_Date_get_value_nullable'));
Pointer<Void> foobar_ListOf_Nullable_Date_toFfi_nullable(List<DateTime?>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_Nullable_Date_toFfi(value);
  final result = _foobar_ListOf_Nullable_Date_create_handle_nullable(_handle);
  foobar_ListOf_Nullable_Date_releaseFfiHandle(_handle);
  return result;
}
List<DateTime?>? foobar_ListOf_Nullable_Date_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_Nullable_Date_get_value_nullable(handle);
  final result = foobar_ListOf_Nullable_Date_fromFfi(_handle);
  foobar_ListOf_Nullable_Date_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_Nullable_Date_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_Nullable_Date_release_handle_nullable(handle);
final _foobar_ListOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_String_create_handle'));
final _foobar_ListOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_String_release_handle'));
final _foobar_ListOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_String_insert'));
final _foobar_ListOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_String_iterator'));
final _foobar_ListOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_String_iterator_release_handle'));
final _foobar_ListOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_String_iterator_is_valid'));
final _foobar_ListOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_String_iterator_increment'));
final _foobar_ListOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_String_iterator_get'));
Pointer<Void> foobar_ListOf_String_toFfi(List<String> value) {
  final _result = _foobar_ListOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _foobar_ListOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<String> foobar_ListOf_String_fromFfi(Pointer<Void> handle) {
  final result = List<String>.empty(growable: true);
  final _iterator_handle = _foobar_ListOf_String_iterator(handle);
  while (_foobar_ListOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_String_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_String_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_String_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_String_release_handle(handle);
final _foobar_ListOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_String_create_handle_nullable'));
final _foobar_ListOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_String_release_handle_nullable'));
final _foobar_ListOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_String_get_value_nullable'));
Pointer<Void> foobar_ListOf_String_toFfi_nullable(List<String>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_String_toFfi(value);
  final result = _foobar_ListOf_String_create_handle_nullable(_handle);
  foobar_ListOf_String_releaseFfiHandle(_handle);
  return result;
}
List<String>? foobar_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_String_get_value_nullable(handle);
  final result = foobar_ListOf_String_fromFfi(_handle);
  foobar_ListOf_String_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_String_release_handle_nullable(handle);
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_put'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_release_handle'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_is_valid'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_increment'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_key'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_toFfi(Map<int, Nullable_SomeStruct?> value) {
  final _result = _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = smoke_Nullable_SomeStruct_toFfi_nullable(entry.value);
    _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_put(_result, _key_handle, _value_handle);
    (_key_handle);
    smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_value_handle);
  }
  return _result;
}
Map<int, Nullable_SomeStruct?> foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_fromFfi(Pointer<Void> handle) {
  final result = Map<int, Nullable_SomeStruct?>();
  final _iterator_handle = _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator(handle);
  while (_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        smoke_Nullable_SomeStruct_fromFfi_nullable(_value_handle);
    } finally {
      (_key_handle);
      smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(_value_handle);
    }
    _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle(handle);
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle_nullable'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle_nullable'));
final _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_toFfi_nullable(Map<int, Nullable_SomeStruct?>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_toFfi(value);
  final result = _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_create_handle_nullable(_handle);
  foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
Map<int, Nullable_SomeStruct?>? foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_get_value_nullable(handle);
  final result = foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_fromFfi(_handle);
  foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_Nullable_smoke_Nullable_SomeStruct_release_handle_nullable(handle);
final _foobar_MapOf_Long_to_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Long_to_String_create_handle'));
final _foobar_MapOf_Long_to_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_release_handle'));
final _foobar_MapOf_Long_to_String_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int64, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_put'));
final _foobar_MapOf_Long_to_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator'));
final _foobar_MapOf_Long_to_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator_release_handle'));
final _foobar_MapOf_Long_to_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator_is_valid'));
final _foobar_MapOf_Long_to_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator_increment'));
final _foobar_MapOf_Long_to_String_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator_get_key'));
final _foobar_MapOf_Long_to_String_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Long_to_String_iterator_get_value'));
Pointer<Void> foobar_MapOf_Long_to_String_toFfi(Map<int, String> value) {
  final _result = _foobar_MapOf_Long_to_String_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = String_toFfi(entry.value);
    _foobar_MapOf_Long_to_String_put(_result, _key_handle, _value_handle);
    (_key_handle);
    String_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<int, String> foobar_MapOf_Long_to_String_fromFfi(Pointer<Void> handle) {
  final result = Map<int, String>();
  final _iterator_handle = _foobar_MapOf_Long_to_String_iterator(handle);
  while (_foobar_MapOf_Long_to_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_Long_to_String_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_Long_to_String_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        String_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      String_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_Long_to_String_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_Long_to_String_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_Long_to_String_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_Long_to_String_release_handle(handle);
final _foobar_MapOf_Long_to_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_create_handle_nullable'));
final _foobar_MapOf_Long_to_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_release_handle_nullable'));
final _foobar_MapOf_Long_to_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Long_to_String_get_value_nullable'));
Pointer<Void> foobar_MapOf_Long_to_String_toFfi_nullable(Map<int, String>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Long_to_String_toFfi(value);
  final result = _foobar_MapOf_Long_to_String_create_handle_nullable(_handle);
  foobar_MapOf_Long_to_String_releaseFfiHandle(_handle);
  return result;
}
Map<int, String>? foobar_MapOf_Long_to_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Long_to_String_get_value_nullable(handle);
  final result = foobar_MapOf_Long_to_String_fromFfi(_handle);
  foobar_MapOf_Long_to_String_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Long_to_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Long_to_String_release_handle_nullable(handle);
