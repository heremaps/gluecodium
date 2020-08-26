import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/another_dummy_class.dart';
import 'package:library/src/smoke/dummy_class.dart';
import 'package:library/src/smoke/dummy_interface.dart';
import 'package:library/src/smoke/generic_types_with_compound_types.dart';
import 'package:library/src/smoke/yet_another_dummy_class.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_context.dart' as __lib;
final _foobar_ListOf_Float_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_Float_create_handle'));
final _foobar_ListOf_Float_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Float_release_handle'));
final _foobar_ListOf_Float_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Float),
    void Function(Pointer<Void>, double)
  >('library_foobar_ListOf_Float_insert'));
final _foobar_ListOf_Float_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_Float_iterator'));
final _foobar_ListOf_Float_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Float_iterator_release_handle'));
final _foobar_ListOf_Float_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_Float_iterator_is_valid'));
final _foobar_ListOf_Float_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Float_iterator_increment'));
final _foobar_ListOf_Float_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('library_foobar_ListOf_Float_iterator_get'));
Pointer<Void> foobar_ListOf_Float_toFfi(List<double> value) {
  final _result = _foobar_ListOf_Float_create_handle();
  for (final element in value) {
    final _element_handle = (element);
    _foobar_ListOf_Float_insert(_result, _element_handle);
    (_element_handle);
  }
  return _result;
}
List<double> foobar_ListOf_Float_fromFfi(Pointer<Void> handle) {
  final result = List<double>();
  final _iterator_handle = _foobar_ListOf_Float_iterator(handle);
  while (_foobar_ListOf_Float_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_Float_iterator_get(_iterator_handle);
    try {
      result.add((_element_handle));
    } finally {
      (_element_handle);
    }
    _foobar_ListOf_Float_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_Float_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_Float_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_Float_release_handle(handle);
final _foobar_ListOf_Float_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Float_create_handle_nullable'));
final _foobar_ListOf_Float_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Float_release_handle_nullable'));
final _foobar_ListOf_Float_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Float_get_value_nullable'));
Pointer<Void> foobar_ListOf_Float_toFfi_nullable(List<double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_Float_toFfi(value);
  final result = _foobar_ListOf_Float_create_handle_nullable(_handle);
  foobar_ListOf_Float_releaseFfiHandle(_handle);
  return result;
}
List<double> foobar_ListOf_Float_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_Float_get_value_nullable(handle);
  final result = foobar_ListOf_Float_fromFfi(_handle);
  foobar_ListOf_Float_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_Float_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_Float_release_handle_nullable(handle);
final _foobar_ListOf_Int_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_Int_create_handle'));
final _foobar_ListOf_Int_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Int_release_handle'));
final _foobar_ListOf_Int_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_Int_insert'));
final _foobar_ListOf_Int_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_Int_iterator'));
final _foobar_ListOf_Int_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Int_iterator_release_handle'));
final _foobar_ListOf_Int_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_Int_iterator_is_valid'));
final _foobar_ListOf_Int_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Int_iterator_increment'));
final _foobar_ListOf_Int_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_Int_iterator_get'));
Pointer<Void> foobar_ListOf_Int_toFfi(List<int> value) {
  final _result = _foobar_ListOf_Int_create_handle();
  for (final element in value) {
    final _element_handle = (element);
    _foobar_ListOf_Int_insert(_result, _element_handle);
    (_element_handle);
  }
  return _result;
}
List<int> foobar_ListOf_Int_fromFfi(Pointer<Void> handle) {
  final result = List<int>();
  final _iterator_handle = _foobar_ListOf_Int_iterator(handle);
  while (_foobar_ListOf_Int_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_Int_iterator_get(_iterator_handle);
    try {
      result.add((_element_handle));
    } finally {
      (_element_handle);
    }
    _foobar_ListOf_Int_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_Int_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_Int_release_handle(handle);
final _foobar_ListOf_Int_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Int_create_handle_nullable'));
final _foobar_ListOf_Int_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Int_release_handle_nullable'));
final _foobar_ListOf_Int_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobar_ListOf_Int_toFfi_nullable(List<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_Int_toFfi(value);
  final result = _foobar_ListOf_Int_create_handle_nullable(_handle);
  foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
List<int> foobar_ListOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_Int_get_value_nullable(handle);
  final result = foobar_ListOf_Int_fromFfi(_handle);
  foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_Int_release_handle_nullable(handle);
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
  final result = List<String>();
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
Pointer<Void> foobar_ListOf_String_toFfi_nullable(List<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_String_toFfi(value);
  final result = _foobar_ListOf_String_create_handle_nullable(_handle);
  foobar_ListOf_String_releaseFfiHandle(_handle);
  return result;
}
List<String> foobar_ListOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_String_get_value_nullable(handle);
  final result = foobar_ListOf_String_fromFfi(_handle);
  foobar_ListOf_String_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_String_release_handle_nullable(handle);
final _foobar_ListOf_UByte_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_UByte_create_handle'));
final _foobar_ListOf_UByte_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_UByte_release_handle'));
final _foobar_ListOf_UByte_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint8),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_UByte_insert'));
final _foobar_ListOf_UByte_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_UByte_iterator'));
final _foobar_ListOf_UByte_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_UByte_iterator_release_handle'));
final _foobar_ListOf_UByte_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_UByte_iterator_is_valid'));
final _foobar_ListOf_UByte_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_UByte_iterator_increment'));
final _foobar_ListOf_UByte_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_UByte_iterator_get'));
Pointer<Void> foobar_ListOf_UByte_toFfi(List<int> value) {
  final _result = _foobar_ListOf_UByte_create_handle();
  for (final element in value) {
    final _element_handle = (element);
    _foobar_ListOf_UByte_insert(_result, _element_handle);
    (_element_handle);
  }
  return _result;
}
List<int> foobar_ListOf_UByte_fromFfi(Pointer<Void> handle) {
  final result = List<int>();
  final _iterator_handle = _foobar_ListOf_UByte_iterator(handle);
  while (_foobar_ListOf_UByte_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_UByte_iterator_get(_iterator_handle);
    try {
      result.add((_element_handle));
    } finally {
      (_element_handle);
    }
    _foobar_ListOf_UByte_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_UByte_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_UByte_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_UByte_release_handle(handle);
final _foobar_ListOf_UByte_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_UByte_create_handle_nullable'));
final _foobar_ListOf_UByte_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_UByte_release_handle_nullable'));
final _foobar_ListOf_UByte_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_UByte_get_value_nullable'));
Pointer<Void> foobar_ListOf_UByte_toFfi_nullable(List<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_UByte_toFfi(value);
  final result = _foobar_ListOf_UByte_create_handle_nullable(_handle);
  foobar_ListOf_UByte_releaseFfiHandle(_handle);
  return result;
}
List<int> foobar_ListOf_UByte_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_UByte_get_value_nullable(handle);
  final result = foobar_ListOf_UByte_fromFfi(_handle);
  foobar_ListOf_UByte_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_UByte_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_UByte_release_handle_nullable(handle);
final _foobar_ListOf_foobar_ListOf_Int_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_foobar_ListOf_Int_create_handle'));
final _foobar_ListOf_foobar_ListOf_Int_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_release_handle'));
final _foobar_ListOf_foobar_ListOf_Int_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_insert'));
final _foobar_ListOf_foobar_ListOf_Int_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_ListOf_Int_iterator'));
final _foobar_ListOf_foobar_ListOf_Int_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_ListOf_Int_iterator_release_handle'));
final _foobar_ListOf_foobar_ListOf_Int_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_foobar_ListOf_Int_iterator_is_valid'));
final _foobar_ListOf_foobar_ListOf_Int_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_ListOf_Int_iterator_increment'));
final _foobar_ListOf_foobar_ListOf_Int_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_ListOf_Int_iterator_get'));
Pointer<Void> foobar_ListOf_foobar_ListOf_Int_toFfi(List<List<int>> value) {
  final _result = _foobar_ListOf_foobar_ListOf_Int_create_handle();
  for (final element in value) {
    final _element_handle = foobar_ListOf_Int_toFfi(element);
    _foobar_ListOf_foobar_ListOf_Int_insert(_result, _element_handle);
    foobar_ListOf_Int_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<List<int>> foobar_ListOf_foobar_ListOf_Int_fromFfi(Pointer<Void> handle) {
  final result = List<List<int>>();
  final _iterator_handle = _foobar_ListOf_foobar_ListOf_Int_iterator(handle);
  while (_foobar_ListOf_foobar_ListOf_Int_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_foobar_ListOf_Int_iterator_get(_iterator_handle);
    try {
      result.add(foobar_ListOf_Int_fromFfi(_element_handle));
    } finally {
      foobar_ListOf_Int_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_foobar_ListOf_Int_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_foobar_ListOf_Int_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_foobar_ListOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_foobar_ListOf_Int_release_handle(handle);
final _foobar_ListOf_foobar_ListOf_Int_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_create_handle_nullable'));
final _foobar_ListOf_foobar_ListOf_Int_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_release_handle_nullable'));
final _foobar_ListOf_foobar_ListOf_Int_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobar_ListOf_foobar_ListOf_Int_toFfi_nullable(List<List<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_foobar_ListOf_Int_toFfi(value);
  final result = _foobar_ListOf_foobar_ListOf_Int_create_handle_nullable(_handle);
  foobar_ListOf_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
List<List<int>> foobar_ListOf_foobar_ListOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_foobar_ListOf_Int_get_value_nullable(handle);
  final result = foobar_ListOf_foobar_ListOf_Int_fromFfi(_handle);
  foobar_ListOf_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_foobar_ListOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_foobar_ListOf_Int_release_handle_nullable(handle);
final _foobar_ListOf_foobar_MapOf_Int_to_Boolean_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_create_handle'));
final _foobar_ListOf_foobar_MapOf_Int_to_Boolean_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_release_handle'));
final _foobar_ListOf_foobar_MapOf_Int_to_Boolean_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_insert'));
final _foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator'));
final _foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_release_handle'));
final _foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_is_valid'));
final _foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_increment'));
final _foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_get'));
Pointer<Void> foobar_ListOf_foobar_MapOf_Int_to_Boolean_toFfi(List<Map<int, bool>> value) {
  final _result = _foobar_ListOf_foobar_MapOf_Int_to_Boolean_create_handle();
  for (final element in value) {
    final _element_handle = foobar_MapOf_Int_to_Boolean_toFfi(element);
    _foobar_ListOf_foobar_MapOf_Int_to_Boolean_insert(_result, _element_handle);
    foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<Map<int, bool>> foobar_ListOf_foobar_MapOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = List<Map<int, bool>>();
  final _iterator_handle = _foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator(handle);
  while (_foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_get(_iterator_handle);
    try {
      result.add(foobar_MapOf_Int_to_Boolean_fromFfi(_element_handle));
    } finally {
      foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_foobar_MapOf_Int_to_Boolean_release_handle(handle);
final _foobar_ListOf_foobar_MapOf_Int_to_Boolean_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_ListOf_foobar_MapOf_Int_to_Boolean_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_ListOf_foobar_MapOf_Int_to_Boolean_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_ListOf_foobar_MapOf_Int_to_Boolean_toFfi_nullable(List<Map<int, bool>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_foobar_MapOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_ListOf_foobar_MapOf_Int_to_Boolean_create_handle_nullable(_handle);
  foobar_ListOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
List<Map<int, bool>> foobar_ListOf_foobar_MapOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_foobar_MapOf_Int_to_Boolean_get_value_nullable(handle);
  final result = foobar_ListOf_foobar_MapOf_Int_to_Boolean_fromFfi(_handle);
  foobar_ListOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_foobar_MapOf_Int_to_Boolean_release_handle_nullable(handle);
final _foobar_ListOf_foobar_SetOf_Int_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_foobar_SetOf_Int_create_handle'));
final _foobar_ListOf_foobar_SetOf_Int_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_release_handle'));
final _foobar_ListOf_foobar_SetOf_Int_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_insert'));
final _foobar_ListOf_foobar_SetOf_Int_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_SetOf_Int_iterator'));
final _foobar_ListOf_foobar_SetOf_Int_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_SetOf_Int_iterator_release_handle'));
final _foobar_ListOf_foobar_SetOf_Int_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_foobar_SetOf_Int_iterator_is_valid'));
final _foobar_ListOf_foobar_SetOf_Int_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_SetOf_Int_iterator_increment'));
final _foobar_ListOf_foobar_SetOf_Int_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_SetOf_Int_iterator_get'));
Pointer<Void> foobar_ListOf_foobar_SetOf_Int_toFfi(List<Set<int>> value) {
  final _result = _foobar_ListOf_foobar_SetOf_Int_create_handle();
  for (final element in value) {
    final _element_handle = foobar_SetOf_Int_toFfi(element);
    _foobar_ListOf_foobar_SetOf_Int_insert(_result, _element_handle);
    foobar_SetOf_Int_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<Set<int>> foobar_ListOf_foobar_SetOf_Int_fromFfi(Pointer<Void> handle) {
  final result = List<Set<int>>();
  final _iterator_handle = _foobar_ListOf_foobar_SetOf_Int_iterator(handle);
  while (_foobar_ListOf_foobar_SetOf_Int_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_foobar_SetOf_Int_iterator_get(_iterator_handle);
    try {
      result.add(foobar_SetOf_Int_fromFfi(_element_handle));
    } finally {
      foobar_SetOf_Int_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_foobar_SetOf_Int_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_foobar_SetOf_Int_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_foobar_SetOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_foobar_SetOf_Int_release_handle(handle);
final _foobar_ListOf_foobar_SetOf_Int_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_create_handle_nullable'));
final _foobar_ListOf_foobar_SetOf_Int_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_release_handle_nullable'));
final _foobar_ListOf_foobar_SetOf_Int_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobar_ListOf_foobar_SetOf_Int_toFfi_nullable(List<Set<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_foobar_SetOf_Int_toFfi(value);
  final result = _foobar_ListOf_foobar_SetOf_Int_create_handle_nullable(_handle);
  foobar_ListOf_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
List<Set<int>> foobar_ListOf_foobar_SetOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_foobar_SetOf_Int_get_value_nullable(handle);
  final result = foobar_ListOf_foobar_SetOf_Int_fromFfi(_handle);
  foobar_ListOf_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_foobar_SetOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_foobar_SetOf_Int_release_handle_nullable(handle);
final _foobar_ListOf_smoke_AnotherDummyClass_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_AnotherDummyClass_create_handle'));
final _foobar_ListOf_smoke_AnotherDummyClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_release_handle'));
final _foobar_ListOf_smoke_AnotherDummyClass_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_insert'));
final _foobar_ListOf_smoke_AnotherDummyClass_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_AnotherDummyClass_iterator'));
final _foobar_ListOf_smoke_AnotherDummyClass_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_AnotherDummyClass_iterator_release_handle'));
final _foobar_ListOf_smoke_AnotherDummyClass_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_AnotherDummyClass_iterator_is_valid'));
final _foobar_ListOf_smoke_AnotherDummyClass_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_AnotherDummyClass_iterator_increment'));
final _foobar_ListOf_smoke_AnotherDummyClass_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_AnotherDummyClass_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_AnotherDummyClass_toFfi(List<AnotherDummyClass> value) {
  final _result = _foobar_ListOf_smoke_AnotherDummyClass_create_handle();
  for (final element in value) {
    final _element_handle = smoke_AnotherDummyClass_toFfi(element);
    _foobar_ListOf_smoke_AnotherDummyClass_insert(_result, _element_handle);
    smoke_AnotherDummyClass_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<AnotherDummyClass> foobar_ListOf_smoke_AnotherDummyClass_fromFfi(Pointer<Void> handle) {
  final result = List<AnotherDummyClass>();
  final _iterator_handle = _foobar_ListOf_smoke_AnotherDummyClass_iterator(handle);
  while (_foobar_ListOf_smoke_AnotherDummyClass_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_smoke_AnotherDummyClass_iterator_get(_iterator_handle);
    try {
      result.add(smoke_AnotherDummyClass_fromFfi(_element_handle));
    } finally {
      smoke_AnotherDummyClass_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_smoke_AnotherDummyClass_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_smoke_AnotherDummyClass_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_smoke_AnotherDummyClass_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_smoke_AnotherDummyClass_release_handle(handle);
final _foobar_ListOf_smoke_AnotherDummyClass_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_create_handle_nullable'));
final _foobar_ListOf_smoke_AnotherDummyClass_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_release_handle_nullable'));
final _foobar_ListOf_smoke_AnotherDummyClass_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_AnotherDummyClass_toFfi_nullable(List<AnotherDummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_AnotherDummyClass_toFfi(value);
  final result = _foobar_ListOf_smoke_AnotherDummyClass_create_handle_nullable(_handle);
  foobar_ListOf_smoke_AnotherDummyClass_releaseFfiHandle(_handle);
  return result;
}
List<AnotherDummyClass> foobar_ListOf_smoke_AnotherDummyClass_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_AnotherDummyClass_get_value_nullable(handle);
  final result = foobar_ListOf_smoke_AnotherDummyClass_fromFfi(_handle);
  foobar_ListOf_smoke_AnotherDummyClass_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_AnotherDummyClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_AnotherDummyClass_release_handle_nullable(handle);
final _foobar_ListOf_smoke_DummyClass_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_DummyClass_create_handle'));
final _foobar_ListOf_smoke_DummyClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_release_handle'));
final _foobar_ListOf_smoke_DummyClass_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_insert'));
final _foobar_ListOf_smoke_DummyClass_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyClass_iterator'));
final _foobar_ListOf_smoke_DummyClass_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyClass_iterator_release_handle'));
final _foobar_ListOf_smoke_DummyClass_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyClass_iterator_is_valid'));
final _foobar_ListOf_smoke_DummyClass_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyClass_iterator_increment'));
final _foobar_ListOf_smoke_DummyClass_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyClass_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_DummyClass_toFfi(List<DummyClass> value) {
  final _result = _foobar_ListOf_smoke_DummyClass_create_handle();
  for (final element in value) {
    final _element_handle = smoke_DummyClass_toFfi(element);
    _foobar_ListOf_smoke_DummyClass_insert(_result, _element_handle);
    smoke_DummyClass_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<DummyClass> foobar_ListOf_smoke_DummyClass_fromFfi(Pointer<Void> handle) {
  final result = List<DummyClass>();
  final _iterator_handle = _foobar_ListOf_smoke_DummyClass_iterator(handle);
  while (_foobar_ListOf_smoke_DummyClass_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_smoke_DummyClass_iterator_get(_iterator_handle);
    try {
      result.add(smoke_DummyClass_fromFfi(_element_handle));
    } finally {
      smoke_DummyClass_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_smoke_DummyClass_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_smoke_DummyClass_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_smoke_DummyClass_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_smoke_DummyClass_release_handle(handle);
final _foobar_ListOf_smoke_DummyClass_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_create_handle_nullable'));
final _foobar_ListOf_smoke_DummyClass_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_release_handle_nullable'));
final _foobar_ListOf_smoke_DummyClass_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_DummyClass_toFfi_nullable(List<DummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_DummyClass_toFfi(value);
  final result = _foobar_ListOf_smoke_DummyClass_create_handle_nullable(_handle);
  foobar_ListOf_smoke_DummyClass_releaseFfiHandle(_handle);
  return result;
}
List<DummyClass> foobar_ListOf_smoke_DummyClass_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_DummyClass_get_value_nullable(handle);
  final result = foobar_ListOf_smoke_DummyClass_fromFfi(_handle);
  foobar_ListOf_smoke_DummyClass_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_DummyClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_DummyClass_release_handle_nullable(handle);
final _foobar_ListOf_smoke_DummyInterface_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_DummyInterface_create_handle'));
final _foobar_ListOf_smoke_DummyInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_release_handle'));
final _foobar_ListOf_smoke_DummyInterface_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_insert'));
final _foobar_ListOf_smoke_DummyInterface_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyInterface_iterator'));
final _foobar_ListOf_smoke_DummyInterface_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyInterface_iterator_release_handle'));
final _foobar_ListOf_smoke_DummyInterface_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyInterface_iterator_is_valid'));
final _foobar_ListOf_smoke_DummyInterface_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyInterface_iterator_increment'));
final _foobar_ListOf_smoke_DummyInterface_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyInterface_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_DummyInterface_toFfi(List<DummyInterface> value) {
  final _result = _foobar_ListOf_smoke_DummyInterface_create_handle();
  for (final element in value) {
    final _element_handle = smoke_DummyInterface_toFfi(element);
    _foobar_ListOf_smoke_DummyInterface_insert(_result, _element_handle);
    smoke_DummyInterface_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<DummyInterface> foobar_ListOf_smoke_DummyInterface_fromFfi(Pointer<Void> handle) {
  final result = List<DummyInterface>();
  final _iterator_handle = _foobar_ListOf_smoke_DummyInterface_iterator(handle);
  while (_foobar_ListOf_smoke_DummyInterface_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_smoke_DummyInterface_iterator_get(_iterator_handle);
    try {
      result.add(smoke_DummyInterface_fromFfi(_element_handle));
    } finally {
      smoke_DummyInterface_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_smoke_DummyInterface_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_smoke_DummyInterface_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_smoke_DummyInterface_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_smoke_DummyInterface_release_handle(handle);
final _foobar_ListOf_smoke_DummyInterface_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_create_handle_nullable'));
final _foobar_ListOf_smoke_DummyInterface_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_release_handle_nullable'));
final _foobar_ListOf_smoke_DummyInterface_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_DummyInterface_toFfi_nullable(List<DummyInterface> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_DummyInterface_toFfi(value);
  final result = _foobar_ListOf_smoke_DummyInterface_create_handle_nullable(_handle);
  foobar_ListOf_smoke_DummyInterface_releaseFfiHandle(_handle);
  return result;
}
List<DummyInterface> foobar_ListOf_smoke_DummyInterface_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_DummyInterface_get_value_nullable(handle);
  final result = foobar_ListOf_smoke_DummyInterface_fromFfi(_handle);
  foobar_ListOf_smoke_DummyInterface_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_DummyInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_DummyInterface_release_handle_nullable(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_insert'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(List<GenericTypesWithCompoundTypes_BasicStruct> value) {
  final _result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle();
  for (final element in value) {
    final _element_handle = smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(element);
    _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_insert(_result, _element_handle);
    smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_BasicStruct> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_BasicStruct>();
  final _iterator_handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator(handle);
  while (_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get(_iterator_handle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(_element_handle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi_nullable(List<GenericTypesWithCompoundTypes_BasicStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(value);
  final result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_BasicStruct> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable(handle);
  final result = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(List<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  final _result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle();
  for (final element in value) {
    final _element_handle = smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(element);
    _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert(_result, _element_handle);
    smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_ExternalEnum> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_ExternalEnum>();
  final _iterator_handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(handle);
  while (_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get(_iterator_handle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_element_handle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi_nullable(List<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(value);
  final result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_ExternalEnum> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable(handle);
  final result = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_insert'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(List<GenericTypesWithCompoundTypes_ExternalStruct> value) {
  final _result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle();
  for (final element in value) {
    final _element_handle = smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(element);
    _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_insert(_result, _element_handle);
    smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_ExternalStruct> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_ExternalStruct>();
  final _iterator_handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator(handle);
  while (_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get(_iterator_handle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(_element_handle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi_nullable(List<GenericTypesWithCompoundTypes_ExternalStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(value);
  final result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_ExternalStruct> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable(handle);
  final result = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(List<GenericTypesWithCompoundTypes_SomeEnum> value) {
  final _result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle();
  for (final element in value) {
    final _element_handle = smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(element);
    _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert(_result, _element_handle);
    smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_SomeEnum> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_SomeEnum>();
  final _iterator_handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(handle);
  while (_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get(_iterator_handle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_element_handle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi_nullable(List<GenericTypesWithCompoundTypes_SomeEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(value);
  final result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_SomeEnum> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable(handle);
  final result = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable(handle);
final _foobar_ListOf_smoke_YetAnotherDummyClass_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_create_handle'));
final _foobar_ListOf_smoke_YetAnotherDummyClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_release_handle'));
final _foobar_ListOf_smoke_YetAnotherDummyClass_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_insert'));
final _foobar_ListOf_smoke_YetAnotherDummyClass_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_YetAnotherDummyClass_iterator'));
final _foobar_ListOf_smoke_YetAnotherDummyClass_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_YetAnotherDummyClass_iterator_release_handle'));
final _foobar_ListOf_smoke_YetAnotherDummyClass_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_YetAnotherDummyClass_iterator_is_valid'));
final _foobar_ListOf_smoke_YetAnotherDummyClass_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_YetAnotherDummyClass_iterator_increment'));
final _foobar_ListOf_smoke_YetAnotherDummyClass_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_YetAnotherDummyClass_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_YetAnotherDummyClass_toFfi(List<YetAnotherDummyClass> value) {
  final _result = _foobar_ListOf_smoke_YetAnotherDummyClass_create_handle();
  for (final element in value) {
    final _element_handle = smoke_YetAnotherDummyClass_toFfi(element);
    _foobar_ListOf_smoke_YetAnotherDummyClass_insert(_result, _element_handle);
    smoke_YetAnotherDummyClass_releaseFfiHandle(_element_handle);
  }
  return _result;
}
List<YetAnotherDummyClass> foobar_ListOf_smoke_YetAnotherDummyClass_fromFfi(Pointer<Void> handle) {
  final result = List<YetAnotherDummyClass>();
  final _iterator_handle = _foobar_ListOf_smoke_YetAnotherDummyClass_iterator(handle);
  while (_foobar_ListOf_smoke_YetAnotherDummyClass_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_ListOf_smoke_YetAnotherDummyClass_iterator_get(_iterator_handle);
    try {
      result.add(smoke_YetAnotherDummyClass_fromFfi(_element_handle));
    } finally {
      smoke_YetAnotherDummyClass_releaseFfiHandle(_element_handle);
    }
    _foobar_ListOf_smoke_YetAnotherDummyClass_iterator_increment(_iterator_handle);
  }
  _foobar_ListOf_smoke_YetAnotherDummyClass_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_ListOf_smoke_YetAnotherDummyClass_releaseFfiHandle(Pointer<Void> handle) => _foobar_ListOf_smoke_YetAnotherDummyClass_release_handle(handle);
final _foobar_ListOf_smoke_YetAnotherDummyClass_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_create_handle_nullable'));
final _foobar_ListOf_smoke_YetAnotherDummyClass_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_release_handle_nullable'));
final _foobar_ListOf_smoke_YetAnotherDummyClass_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_YetAnotherDummyClass_toFfi_nullable(List<YetAnotherDummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_YetAnotherDummyClass_toFfi(value);
  final result = _foobar_ListOf_smoke_YetAnotherDummyClass_create_handle_nullable(_handle);
  foobar_ListOf_smoke_YetAnotherDummyClass_releaseFfiHandle(_handle);
  return result;
}
List<YetAnotherDummyClass> foobar_ListOf_smoke_YetAnotherDummyClass_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_YetAnotherDummyClass_get_value_nullable(handle);
  final result = foobar_ListOf_smoke_YetAnotherDummyClass_fromFfi(_handle);
  foobar_ListOf_smoke_YetAnotherDummyClass_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_YetAnotherDummyClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_YetAnotherDummyClass_release_handle_nullable(handle);
final _foobar_MapOf_Float_to_Double_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Float_to_Double_create_handle'));
final _foobar_MapOf_Float_to_Double_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Float_to_Double_release_handle'));
final _foobar_MapOf_Float_to_Double_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Float, Double),
    void Function(Pointer<Void>, double, double)
  >('library_foobar_MapOf_Float_to_Double_put'));
final _foobar_MapOf_Float_to_Double_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator'));
final _foobar_MapOf_Float_to_Double_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator_release_handle'));
final _foobar_MapOf_Float_to_Double_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator_is_valid'));
final _foobar_MapOf_Float_to_Double_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator_increment'));
final _foobar_MapOf_Float_to_Double_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator_get_key'));
final _foobar_MapOf_Float_to_Double_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator_get_value'));
Pointer<Void> foobar_MapOf_Float_to_Double_toFfi(Map<double, double> value) {
  final _result = _foobar_MapOf_Float_to_Double_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = (entry.value);
    _foobar_MapOf_Float_to_Double_put(_result, _key_handle, _value_handle);
    (_key_handle);
    (_value_handle);
  }
  return _result;
}
Map<double, double> foobar_MapOf_Float_to_Double_fromFfi(Pointer<Void> handle) {
  final result = Map<double, double>();
  final _iterator_handle = _foobar_MapOf_Float_to_Double_iterator(handle);
  while (_foobar_MapOf_Float_to_Double_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_Float_to_Double_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_Float_to_Double_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        (_value_handle);
    } finally {
      (_key_handle);
      (_value_handle);
    }
    _foobar_MapOf_Float_to_Double_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_Float_to_Double_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_Float_to_Double_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_Float_to_Double_release_handle(handle);
final _foobar_MapOf_Float_to_Double_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Float_to_Double_create_handle_nullable'));
final _foobar_MapOf_Float_to_Double_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Float_to_Double_release_handle_nullable'));
final _foobar_MapOf_Float_to_Double_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Float_to_Double_get_value_nullable'));
Pointer<Void> foobar_MapOf_Float_to_Double_toFfi_nullable(Map<double, double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Float_to_Double_toFfi(value);
  final result = _foobar_MapOf_Float_to_Double_create_handle_nullable(_handle);
  foobar_MapOf_Float_to_Double_releaseFfiHandle(_handle);
  return result;
}
Map<double, double> foobar_MapOf_Float_to_Double_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Float_to_Double_get_value_nullable(handle);
  final result = foobar_MapOf_Float_to_Double_fromFfi(_handle);
  foobar_MapOf_Float_to_Double_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Float_to_Double_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Float_to_Double_release_handle_nullable(handle);
final _foobar_MapOf_Int_to_Boolean_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_Boolean_create_handle'));
final _foobar_MapOf_Int_to_Boolean_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Boolean_release_handle'));
final _foobar_MapOf_Int_to_Boolean_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Uint8),
    void Function(Pointer<Void>, int, int)
  >('library_foobar_MapOf_Int_to_Boolean_put'));
final _foobar_MapOf_Int_to_Boolean_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator'));
final _foobar_MapOf_Int_to_Boolean_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator_release_handle'));
final _foobar_MapOf_Int_to_Boolean_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator_is_valid'));
final _foobar_MapOf_Int_to_Boolean_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator_increment'));
final _foobar_MapOf_Int_to_Boolean_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator_get_key'));
final _foobar_MapOf_Int_to_Boolean_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_Boolean_toFfi(Map<int, bool> value) {
  final _result = _foobar_MapOf_Int_to_Boolean_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = Boolean_toFfi(entry.value);
    _foobar_MapOf_Int_to_Boolean_put(_result, _key_handle, _value_handle);
    (_key_handle);
    Boolean_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<int, bool> foobar_MapOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<int, bool>();
  final _iterator_handle = _foobar_MapOf_Int_to_Boolean_iterator(handle);
  while (_foobar_MapOf_Int_to_Boolean_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_Int_to_Boolean_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_Int_to_Boolean_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        Boolean_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      Boolean_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_Int_to_Boolean_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_Int_to_Boolean_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_Int_to_Boolean_release_handle(handle);
final _foobar_MapOf_Int_to_Boolean_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_Int_to_Boolean_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_Int_to_Boolean_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_Boolean_toFfi_nullable(Map<int, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_Int_to_Boolean_create_handle_nullable(_handle);
  foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<int, bool> foobar_MapOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_Boolean_get_value_nullable(handle);
  final result = foobar_MapOf_Int_to_Boolean_fromFfi(_handle);
  foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_Boolean_release_handle_nullable(handle);
final _foobar_MapOf_Int_to_foobar_ListOf_Int_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_create_handle'));
final _foobar_MapOf_Int_to_foobar_ListOf_Int_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_release_handle'));
final _foobar_MapOf_Int_to_foobar_ListOf_Int_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_put'));
final _foobar_MapOf_Int_to_foobar_ListOf_Int_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator'));
final _foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_release_handle'));
final _foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_is_valid'));
final _foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_increment'));
final _foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_get_key'));
final _foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_foobar_ListOf_Int_toFfi(Map<int, List<int>> value) {
  final _result = _foobar_MapOf_Int_to_foobar_ListOf_Int_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = foobar_ListOf_Int_toFfi(entry.value);
    _foobar_MapOf_Int_to_foobar_ListOf_Int_put(_result, _key_handle, _value_handle);
    (_key_handle);
    foobar_ListOf_Int_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<int, List<int>> foobar_MapOf_Int_to_foobar_ListOf_Int_fromFfi(Pointer<Void> handle) {
  final result = Map<int, List<int>>();
  final _iterator_handle = _foobar_MapOf_Int_to_foobar_ListOf_Int_iterator(handle);
  while (_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        foobar_ListOf_Int_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      foobar_ListOf_Int_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_Int_to_foobar_ListOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_Int_to_foobar_ListOf_Int_release_handle(handle);
final _foobar_MapOf_Int_to_foobar_ListOf_Int_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_create_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_ListOf_Int_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_release_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_ListOf_Int_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_foobar_ListOf_Int_toFfi_nullable(Map<int, List<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_foobar_ListOf_Int_toFfi(value);
  final result = _foobar_MapOf_Int_to_foobar_ListOf_Int_create_handle_nullable(_handle);
  foobar_MapOf_Int_to_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
Map<int, List<int>> foobar_MapOf_Int_to_foobar_ListOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_foobar_ListOf_Int_get_value_nullable(handle);
  final result = foobar_MapOf_Int_to_foobar_ListOf_Int_fromFfi(_handle);
  foobar_MapOf_Int_to_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_foobar_ListOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_foobar_ListOf_Int_release_handle_nullable(handle);
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_create_handle'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_release_handle'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_put'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_release_handle'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_is_valid'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_increment'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_get_key'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_toFfi(Map<int, Map<int, bool>> value) {
  final _result = _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = foobar_MapOf_Int_to_Boolean_toFfi(entry.value);
    _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_put(_result, _key_handle, _value_handle);
    (_key_handle);
    foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<int, Map<int, bool>> foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<int, Map<int, bool>>();
  final _iterator_handle = _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator(handle);
  while (_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        foobar_MapOf_Int_to_Boolean_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_release_handle(handle);
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_toFfi_nullable(Map<int, Map<int, bool>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_create_handle_nullable(_handle);
  foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<int, Map<int, bool>> foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_get_value_nullable(handle);
  final result = foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_fromFfi(_handle);
  foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_release_handle_nullable(handle);
final _foobar_MapOf_Int_to_foobar_SetOf_Int_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_create_handle'));
final _foobar_MapOf_Int_to_foobar_SetOf_Int_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_release_handle'));
final _foobar_MapOf_Int_to_foobar_SetOf_Int_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_put'));
final _foobar_MapOf_Int_to_foobar_SetOf_Int_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator'));
final _foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_release_handle'));
final _foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_is_valid'));
final _foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_increment'));
final _foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_get_key'));
final _foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_foobar_SetOf_Int_toFfi(Map<int, Set<int>> value) {
  final _result = _foobar_MapOf_Int_to_foobar_SetOf_Int_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = foobar_SetOf_Int_toFfi(entry.value);
    _foobar_MapOf_Int_to_foobar_SetOf_Int_put(_result, _key_handle, _value_handle);
    (_key_handle);
    foobar_SetOf_Int_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<int, Set<int>> foobar_MapOf_Int_to_foobar_SetOf_Int_fromFfi(Pointer<Void> handle) {
  final result = Map<int, Set<int>>();
  final _iterator_handle = _foobar_MapOf_Int_to_foobar_SetOf_Int_iterator(handle);
  while (_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        foobar_SetOf_Int_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      foobar_SetOf_Int_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_Int_to_foobar_SetOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_Int_to_foobar_SetOf_Int_release_handle(handle);
final _foobar_MapOf_Int_to_foobar_SetOf_Int_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_create_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_SetOf_Int_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_release_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_SetOf_Int_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_foobar_SetOf_Int_toFfi_nullable(Map<int, Set<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_foobar_SetOf_Int_toFfi(value);
  final result = _foobar_MapOf_Int_to_foobar_SetOf_Int_create_handle_nullable(_handle);
  foobar_MapOf_Int_to_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
Map<int, Set<int>> foobar_MapOf_Int_to_foobar_SetOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_foobar_SetOf_Int_get_value_nullable(handle);
  final result = foobar_MapOf_Int_to_foobar_SetOf_Int_fromFfi(_handle);
  foobar_MapOf_Int_to_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_foobar_SetOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_foobar_SetOf_Int_release_handle_nullable(handle);
final _foobar_MapOf_Int_to_smoke_DummyClass_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_create_handle'));
final _foobar_MapOf_Int_to_smoke_DummyClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_release_handle'));
final _foobar_MapOf_Int_to_smoke_DummyClass_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_put'));
final _foobar_MapOf_Int_to_smoke_DummyClass_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator'));
final _foobar_MapOf_Int_to_smoke_DummyClass_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator_release_handle'));
final _foobar_MapOf_Int_to_smoke_DummyClass_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator_is_valid'));
final _foobar_MapOf_Int_to_smoke_DummyClass_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator_increment'));
final _foobar_MapOf_Int_to_smoke_DummyClass_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator_get_key'));
final _foobar_MapOf_Int_to_smoke_DummyClass_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_smoke_DummyClass_toFfi(Map<int, DummyClass> value) {
  final _result = _foobar_MapOf_Int_to_smoke_DummyClass_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = smoke_DummyClass_toFfi(entry.value);
    _foobar_MapOf_Int_to_smoke_DummyClass_put(_result, _key_handle, _value_handle);
    (_key_handle);
    smoke_DummyClass_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<int, DummyClass> foobar_MapOf_Int_to_smoke_DummyClass_fromFfi(Pointer<Void> handle) {
  final result = Map<int, DummyClass>();
  final _iterator_handle = _foobar_MapOf_Int_to_smoke_DummyClass_iterator(handle);
  while (_foobar_MapOf_Int_to_smoke_DummyClass_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_Int_to_smoke_DummyClass_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_Int_to_smoke_DummyClass_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        smoke_DummyClass_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      smoke_DummyClass_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_Int_to_smoke_DummyClass_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_Int_to_smoke_DummyClass_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_DummyClass_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_Int_to_smoke_DummyClass_release_handle(handle);
final _foobar_MapOf_Int_to_smoke_DummyClass_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_create_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_DummyClass_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_release_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_DummyClass_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_smoke_DummyClass_toFfi_nullable(Map<int, DummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_smoke_DummyClass_toFfi(value);
  final result = _foobar_MapOf_Int_to_smoke_DummyClass_create_handle_nullable(_handle);
  foobar_MapOf_Int_to_smoke_DummyClass_releaseFfiHandle(_handle);
  return result;
}
Map<int, DummyClass> foobar_MapOf_Int_to_smoke_DummyClass_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_smoke_DummyClass_get_value_nullable(handle);
  final result = foobar_MapOf_Int_to_smoke_DummyClass_fromFfi(_handle);
  foobar_MapOf_Int_to_smoke_DummyClass_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_DummyClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_smoke_DummyClass_release_handle_nullable(handle);
final _foobar_MapOf_Int_to_smoke_DummyInterface_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_create_handle'));
final _foobar_MapOf_Int_to_smoke_DummyInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_release_handle'));
final _foobar_MapOf_Int_to_smoke_DummyInterface_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_put'));
final _foobar_MapOf_Int_to_smoke_DummyInterface_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator'));
final _foobar_MapOf_Int_to_smoke_DummyInterface_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator_release_handle'));
final _foobar_MapOf_Int_to_smoke_DummyInterface_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator_is_valid'));
final _foobar_MapOf_Int_to_smoke_DummyInterface_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator_increment'));
final _foobar_MapOf_Int_to_smoke_DummyInterface_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator_get_key'));
final _foobar_MapOf_Int_to_smoke_DummyInterface_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_smoke_DummyInterface_toFfi(Map<int, DummyInterface> value) {
  final _result = _foobar_MapOf_Int_to_smoke_DummyInterface_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = smoke_DummyInterface_toFfi(entry.value);
    _foobar_MapOf_Int_to_smoke_DummyInterface_put(_result, _key_handle, _value_handle);
    (_key_handle);
    smoke_DummyInterface_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<int, DummyInterface> foobar_MapOf_Int_to_smoke_DummyInterface_fromFfi(Pointer<Void> handle) {
  final result = Map<int, DummyInterface>();
  final _iterator_handle = _foobar_MapOf_Int_to_smoke_DummyInterface_iterator(handle);
  while (_foobar_MapOf_Int_to_smoke_DummyInterface_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_Int_to_smoke_DummyInterface_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_Int_to_smoke_DummyInterface_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        smoke_DummyInterface_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      smoke_DummyInterface_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_Int_to_smoke_DummyInterface_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_Int_to_smoke_DummyInterface_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_Int_to_smoke_DummyInterface_release_handle(handle);
final _foobar_MapOf_Int_to_smoke_DummyInterface_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_create_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_DummyInterface_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_release_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_DummyInterface_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_smoke_DummyInterface_toFfi_nullable(Map<int, DummyInterface> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_smoke_DummyInterface_toFfi(value);
  final result = _foobar_MapOf_Int_to_smoke_DummyInterface_create_handle_nullable(_handle);
  foobar_MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle(_handle);
  return result;
}
Map<int, DummyInterface> foobar_MapOf_Int_to_smoke_DummyInterface_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_smoke_DummyInterface_get_value_nullable(handle);
  final result = foobar_MapOf_Int_to_smoke_DummyInterface_fromFfi(_handle);
  foobar_MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_smoke_DummyInterface_release_handle_nullable(handle);
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Uint32),
    void Function(Pointer<Void>, int, int)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_put'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get_key'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(Map<int, GenericTypesWithCompoundTypes_ExternalEnum> value) {
  final _result = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(entry.value);
    _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_put(_result, _key_handle, _value_handle);
    (_key_handle);
    smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<int, GenericTypesWithCompoundTypes_ExternalEnum> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(Pointer<Void> handle) {
  final result = Map<int, GenericTypesWithCompoundTypes_ExternalEnum>();
  final _iterator_handle = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(handle);
  while (_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(handle);
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi_nullable(Map<int, GenericTypesWithCompoundTypes_ExternalEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(value);
  final result = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable(_handle);
  foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
Map<int, GenericTypesWithCompoundTypes_ExternalEnum> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable(handle);
  final result = foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_handle);
  foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable(handle);
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Uint32),
    void Function(Pointer<Void>, int, int)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_put'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get_key'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(Map<int, GenericTypesWithCompoundTypes_SomeEnum> value) {
  final _result = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(entry.value);
    _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_put(_result, _key_handle, _value_handle);
    (_key_handle);
    smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<int, GenericTypesWithCompoundTypes_SomeEnum> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(Pointer<Void> handle) {
  final result = Map<int, GenericTypesWithCompoundTypes_SomeEnum>();
  final _iterator_handle = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(handle);
  while (_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(handle);
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi_nullable(Map<int, GenericTypesWithCompoundTypes_SomeEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(value);
  final result = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable(_handle);
  foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
Map<int, GenericTypesWithCompoundTypes_SomeEnum> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable(handle);
  final result = foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_handle);
  foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable(handle);
final _foobar_MapOf_String_to_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_String_to_String_create_handle'));
final _foobar_MapOf_String_to_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_release_handle'));
final _foobar_MapOf_String_to_String_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_put'));
final _foobar_MapOf_String_to_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator'));
final _foobar_MapOf_String_to_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator_release_handle'));
final _foobar_MapOf_String_to_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator_is_valid'));
final _foobar_MapOf_String_to_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator_increment'));
final _foobar_MapOf_String_to_String_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator_get_key'));
final _foobar_MapOf_String_to_String_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator_get_value'));
Pointer<Void> foobar_MapOf_String_to_String_toFfi(Map<String, String> value) {
  final _result = _foobar_MapOf_String_to_String_create_handle();
  for (final entry in value.entries) {
    final _key_handle = String_toFfi(entry.key);
    final _value_handle = String_toFfi(entry.value);
    _foobar_MapOf_String_to_String_put(_result, _key_handle, _value_handle);
    String_releaseFfiHandle(_key_handle);
    String_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<String, String> foobar_MapOf_String_to_String_fromFfi(Pointer<Void> handle) {
  final result = Map<String, String>();
  final _iterator_handle = _foobar_MapOf_String_to_String_iterator(handle);
  while (_foobar_MapOf_String_to_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_String_to_String_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_String_to_String_iterator_get_value(_iterator_handle);
    try {
      result[String_fromFfi(_key_handle)] =
        String_fromFfi(_value_handle);
    } finally {
      String_releaseFfiHandle(_key_handle);
      String_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_String_to_String_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_String_to_String_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_String_to_String_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_String_to_String_release_handle(handle);
final _foobar_MapOf_String_to_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_create_handle_nullable'));
final _foobar_MapOf_String_to_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_release_handle_nullable'));
final _foobar_MapOf_String_to_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_get_value_nullable'));
Pointer<Void> foobar_MapOf_String_to_String_toFfi_nullable(Map<String, String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_String_to_String_toFfi(value);
  final result = _foobar_MapOf_String_to_String_create_handle_nullable(_handle);
  foobar_MapOf_String_to_String_releaseFfiHandle(_handle);
  return result;
}
Map<String, String> foobar_MapOf_String_to_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_String_to_String_get_value_nullable(handle);
  final result = foobar_MapOf_String_to_String_fromFfi(_handle);
  foobar_MapOf_String_to_String_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_String_to_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_String_to_String_release_handle_nullable(handle);
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_put'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get_key'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get_value'));
Pointer<Void> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(Map<String, GenericTypesWithCompoundTypes_BasicStruct> value) {
  final _result = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle();
  for (final entry in value.entries) {
    final _key_handle = String_toFfi(entry.key);
    final _value_handle = smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(entry.value);
    _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_put(_result, _key_handle, _value_handle);
    String_releaseFfiHandle(_key_handle);
    smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<String, GenericTypesWithCompoundTypes_BasicStruct> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(Pointer<Void> handle) {
  final result = Map<String, GenericTypesWithCompoundTypes_BasicStruct>();
  final _iterator_handle = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator(handle);
  while (_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get_value(_iterator_handle);
    try {
      result[String_fromFfi(_key_handle)] =
        smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(_value_handle);
    } finally {
      String_releaseFfiHandle(_key_handle);
      smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle(handle);
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable'));
Pointer<Void> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi_nullable(Map<String, GenericTypesWithCompoundTypes_BasicStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(value);
  final result = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable(_handle);
  foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
Map<String, GenericTypesWithCompoundTypes_BasicStruct> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable(handle);
  final result = foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(_handle);
  foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable(handle);
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_put'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get_key'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get_value'));
Pointer<Void> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(Map<String, GenericTypesWithCompoundTypes_ExternalStruct> value) {
  final _result = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle();
  for (final entry in value.entries) {
    final _key_handle = String_toFfi(entry.key);
    final _value_handle = smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(entry.value);
    _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_put(_result, _key_handle, _value_handle);
    String_releaseFfiHandle(_key_handle);
    smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<String, GenericTypesWithCompoundTypes_ExternalStruct> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(Pointer<Void> handle) {
  final result = Map<String, GenericTypesWithCompoundTypes_ExternalStruct>();
  final _iterator_handle = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator(handle);
  while (_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get_value(_iterator_handle);
    try {
      result[String_fromFfi(_key_handle)] =
        smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(_value_handle);
    } finally {
      String_releaseFfiHandle(_key_handle);
      smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle(handle);
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable'));
Pointer<Void> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi_nullable(Map<String, GenericTypesWithCompoundTypes_ExternalStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(value);
  final result = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable(_handle);
  foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
Map<String, GenericTypesWithCompoundTypes_ExternalStruct> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable(handle);
  final result = foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(_handle);
  foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable(handle);
final _foobar_MapOf_UByte_to_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_UByte_to_String_create_handle'));
final _foobar_MapOf_UByte_to_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_release_handle'));
final _foobar_MapOf_UByte_to_String_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint8, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_put'));
final _foobar_MapOf_UByte_to_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator'));
final _foobar_MapOf_UByte_to_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator_release_handle'));
final _foobar_MapOf_UByte_to_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator_is_valid'));
final _foobar_MapOf_UByte_to_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator_increment'));
final _foobar_MapOf_UByte_to_String_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator_get_key'));
final _foobar_MapOf_UByte_to_String_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator_get_value'));
Pointer<Void> foobar_MapOf_UByte_to_String_toFfi(Map<int, String> value) {
  final _result = _foobar_MapOf_UByte_to_String_create_handle();
  for (final entry in value.entries) {
    final _key_handle = (entry.key);
    final _value_handle = String_toFfi(entry.value);
    _foobar_MapOf_UByte_to_String_put(_result, _key_handle, _value_handle);
    (_key_handle);
    String_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<int, String> foobar_MapOf_UByte_to_String_fromFfi(Pointer<Void> handle) {
  final result = Map<int, String>();
  final _iterator_handle = _foobar_MapOf_UByte_to_String_iterator(handle);
  while (_foobar_MapOf_UByte_to_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_UByte_to_String_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_UByte_to_String_iterator_get_value(_iterator_handle);
    try {
      result[(_key_handle)] =
        String_fromFfi(_value_handle);
    } finally {
      (_key_handle);
      String_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_UByte_to_String_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_UByte_to_String_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_UByte_to_String_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_UByte_to_String_release_handle(handle);
final _foobar_MapOf_UByte_to_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_create_handle_nullable'));
final _foobar_MapOf_UByte_to_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_release_handle_nullable'));
final _foobar_MapOf_UByte_to_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_get_value_nullable'));
Pointer<Void> foobar_MapOf_UByte_to_String_toFfi_nullable(Map<int, String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_UByte_to_String_toFfi(value);
  final result = _foobar_MapOf_UByte_to_String_create_handle_nullable(_handle);
  foobar_MapOf_UByte_to_String_releaseFfiHandle(_handle);
  return result;
}
Map<int, String> foobar_MapOf_UByte_to_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_UByte_to_String_get_value_nullable(handle);
  final result = foobar_MapOf_UByte_to_String_fromFfi(_handle);
  foobar_MapOf_UByte_to_String_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_UByte_to_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_UByte_to_String_release_handle_nullable(handle);
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_create_handle'));
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_release_handle'));
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Uint8),
    void Function(Pointer<Void>, Pointer<Void>, int)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_put'));
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator'));
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_release_handle'));
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_is_valid'));
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_increment'));
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_get_key'));
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_foobar_ListOf_Int_to_Boolean_toFfi(Map<List<int>, bool> value) {
  final _result = _foobar_MapOf_foobar_ListOf_Int_to_Boolean_create_handle();
  for (final entry in value.entries) {
    final _key_handle = foobar_ListOf_Int_toFfi(entry.key);
    final _value_handle = Boolean_toFfi(entry.value);
    _foobar_MapOf_foobar_ListOf_Int_to_Boolean_put(_result, _key_handle, _value_handle);
    foobar_ListOf_Int_releaseFfiHandle(_key_handle);
    Boolean_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<List<int>, bool> foobar_MapOf_foobar_ListOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<List<int>, bool>();
  final _iterator_handle = _foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator(handle);
  while (_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_get_value(_iterator_handle);
    try {
      result[foobar_ListOf_Int_fromFfi(_key_handle)] =
        Boolean_fromFfi(_value_handle);
    } finally {
      foobar_ListOf_Int_releaseFfiHandle(_key_handle);
      Boolean_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_foobar_ListOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_foobar_ListOf_Int_to_Boolean_release_handle(handle);
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_foobar_ListOf_Int_to_Boolean_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_foobar_ListOf_Int_to_Boolean_toFfi_nullable(Map<List<int>, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_foobar_ListOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_foobar_ListOf_Int_to_Boolean_create_handle_nullable(_handle);
  foobar_MapOf_foobar_ListOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<List<int>, bool> foobar_MapOf_foobar_ListOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_foobar_ListOf_Int_to_Boolean_get_value_nullable(handle);
  final result = foobar_MapOf_foobar_ListOf_Int_to_Boolean_fromFfi(_handle);
  foobar_MapOf_foobar_ListOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_foobar_ListOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_foobar_ListOf_Int_to_Boolean_release_handle_nullable(handle);
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_create_handle'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_release_handle'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Uint8),
    void Function(Pointer<Void>, Pointer<Void>, int)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_put'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_release_handle'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_is_valid'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_increment'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_get_key'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_toFfi(Map<Map<int, bool>, bool> value) {
  final _result = _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_create_handle();
  for (final entry in value.entries) {
    final _key_handle = foobar_MapOf_Int_to_Boolean_toFfi(entry.key);
    final _value_handle = Boolean_toFfi(entry.value);
    _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_put(_result, _key_handle, _value_handle);
    foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_key_handle);
    Boolean_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<Map<int, bool>, bool> foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<Map<int, bool>, bool>();
  final _iterator_handle = _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator(handle);
  while (_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_get_value(_iterator_handle);
    try {
      result[foobar_MapOf_Int_to_Boolean_fromFfi(_key_handle)] =
        Boolean_fromFfi(_value_handle);
    } finally {
      foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_key_handle);
      Boolean_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_release_handle(handle);
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_toFfi_nullable(Map<Map<int, bool>, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_create_handle_nullable(_handle);
  foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<Map<int, bool>, bool> foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_get_value_nullable(handle);
  final result = foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_fromFfi(_handle);
  foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_release_handle_nullable(handle);
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_create_handle'));
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_release_handle'));
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Uint8),
    void Function(Pointer<Void>, Pointer<Void>, int)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_put'));
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator'));
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_release_handle'));
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_is_valid'));
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_increment'));
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_get_key'));
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_foobar_SetOf_Int_to_Boolean_toFfi(Map<Set<int>, bool> value) {
  final _result = _foobar_MapOf_foobar_SetOf_Int_to_Boolean_create_handle();
  for (final entry in value.entries) {
    final _key_handle = foobar_SetOf_Int_toFfi(entry.key);
    final _value_handle = Boolean_toFfi(entry.value);
    _foobar_MapOf_foobar_SetOf_Int_to_Boolean_put(_result, _key_handle, _value_handle);
    foobar_SetOf_Int_releaseFfiHandle(_key_handle);
    Boolean_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<Set<int>, bool> foobar_MapOf_foobar_SetOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<Set<int>, bool>();
  final _iterator_handle = _foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator(handle);
  while (_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_get_value(_iterator_handle);
    try {
      result[foobar_SetOf_Int_fromFfi(_key_handle)] =
        Boolean_fromFfi(_value_handle);
    } finally {
      foobar_SetOf_Int_releaseFfiHandle(_key_handle);
      Boolean_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_foobar_SetOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_foobar_SetOf_Int_to_Boolean_release_handle(handle);
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_foobar_SetOf_Int_to_Boolean_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_foobar_SetOf_Int_to_Boolean_toFfi_nullable(Map<Set<int>, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_foobar_SetOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_foobar_SetOf_Int_to_Boolean_create_handle_nullable(_handle);
  foobar_MapOf_foobar_SetOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<Set<int>, bool> foobar_MapOf_foobar_SetOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_foobar_SetOf_Int_to_Boolean_get_value_nullable(handle);
  final result = foobar_MapOf_foobar_SetOf_Int_to_Boolean_fromFfi(_handle);
  foobar_MapOf_foobar_SetOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_foobar_SetOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_foobar_SetOf_Int_to_Boolean_release_handle_nullable(handle);
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_create_handle'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_release_handle'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32, Uint8),
    void Function(Pointer<Void>, int, int)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_put'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_release_handle'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_is_valid'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_increment'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_get_key'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_toFfi(Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> value) {
  final _result = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_create_handle();
  for (final entry in value.entries) {
    final _key_handle = smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(entry.key);
    final _value_handle = Boolean_toFfi(entry.value);
    _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_put(_result, _key_handle, _value_handle);
    smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_key_handle);
    Boolean_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<GenericTypesWithCompoundTypes_ExternalEnum, bool>();
  final _iterator_handle = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator(handle);
  while (_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_get_value(_iterator_handle);
    try {
      result[smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_key_handle)] =
        Boolean_fromFfi(_value_handle);
    } finally {
      smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_key_handle);
      Boolean_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_release_handle(handle);
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_toFfi_nullable(Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_create_handle_nullable(_handle);
  foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_get_value_nullable(handle);
  final result = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_fromFfi(_handle);
  foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_release_handle_nullable(handle);
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_create_handle'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_release_handle'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_put = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32, Uint8),
    void Function(Pointer<Void>, int, int)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_put'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_release_handle'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_is_valid'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_increment'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_get_key = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_get_key'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_get_value = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_toFfi(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> value) {
  final _result = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_create_handle();
  for (final entry in value.entries) {
    final _key_handle = smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(entry.key);
    final _value_handle = Boolean_toFfi(entry.value);
    _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_put(_result, _key_handle, _value_handle);
    smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_key_handle);
    Boolean_releaseFfiHandle(_value_handle);
  }
  return _result;
}
Map<GenericTypesWithCompoundTypes_SomeEnum, bool> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<GenericTypesWithCompoundTypes_SomeEnum, bool>();
  final _iterator_handle = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator(handle);
  while (_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _key_handle = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_get_key(_iterator_handle);
    final _value_handle = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_get_value(_iterator_handle);
    try {
      result[smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_key_handle)] =
        Boolean_fromFfi(_value_handle);
    } finally {
      smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_key_handle);
      Boolean_releaseFfiHandle(_value_handle);
    }
    _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_increment(_iterator_handle);
  }
  _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_release_handle(handle);
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_toFfi_nullable(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_create_handle_nullable(_handle);
  foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<GenericTypesWithCompoundTypes_SomeEnum, bool> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_get_value_nullable(handle);
  final result = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_fromFfi(_handle);
  foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_release_handle_nullable(handle);
final _foobar_SetOf_Float_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_Float_create_handle'));
final _foobar_SetOf_Float_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Float_release_handle'));
final _foobar_SetOf_Float_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Float),
    void Function(Pointer<Void>, double)
  >('library_foobar_SetOf_Float_insert'));
final _foobar_SetOf_Float_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_Float_iterator'));
final _foobar_SetOf_Float_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_Float_iterator_release_handle'));
final _foobar_SetOf_Float_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_Float_iterator_is_valid'));
final _foobar_SetOf_Float_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_Float_iterator_increment'));
final _foobar_SetOf_Float_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('library_foobar_SetOf_Float_iterator_get'));
Pointer<Void> foobar_SetOf_Float_toFfi(Set<double> value) {
  final _result = _foobar_SetOf_Float_create_handle();
  for (final element in value) {
    final _element_handle = (element);
    _foobar_SetOf_Float_insert(_result, _element_handle);
    (_element_handle);
  }
  return _result;
}
Set<double> foobar_SetOf_Float_fromFfi(Pointer<Void> handle) {
  final result = Set<double>();
  final _iterator_handle = _foobar_SetOf_Float_iterator(handle);
  while (_foobar_SetOf_Float_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_SetOf_Float_iterator_get(_iterator_handle);
    try {
      result.add((_element_handle));
    } finally {
      (_element_handle);
    }
    _foobar_SetOf_Float_iterator_increment(_iterator_handle);
  }
  _foobar_SetOf_Float_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_SetOf_Float_releaseFfiHandle(Pointer<Void> handle) => _foobar_SetOf_Float_release_handle(handle);
final _foobar_SetOf_Float_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Float_create_handle_nullable'));
final _foobar_SetOf_Float_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Float_release_handle_nullable'));
final _foobar_SetOf_Float_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Float_get_value_nullable'));
Pointer<Void> foobar_SetOf_Float_toFfi_nullable(Set<double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_Float_toFfi(value);
  final result = _foobar_SetOf_Float_create_handle_nullable(_handle);
  foobar_SetOf_Float_releaseFfiHandle(_handle);
  return result;
}
Set<double> foobar_SetOf_Float_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_Float_get_value_nullable(handle);
  final result = foobar_SetOf_Float_fromFfi(_handle);
  foobar_SetOf_Float_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_Float_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_Float_release_handle_nullable(handle);
final _foobar_SetOf_Int_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_Int_create_handle'));
final _foobar_SetOf_Int_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Int_release_handle'));
final _foobar_SetOf_Int_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32),
    void Function(Pointer<Void>, int)
  >('library_foobar_SetOf_Int_insert'));
final _foobar_SetOf_Int_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_Int_iterator'));
final _foobar_SetOf_Int_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_Int_iterator_release_handle'));
final _foobar_SetOf_Int_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_Int_iterator_is_valid'));
final _foobar_SetOf_Int_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_Int_iterator_increment'));
final _foobar_SetOf_Int_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_SetOf_Int_iterator_get'));
Pointer<Void> foobar_SetOf_Int_toFfi(Set<int> value) {
  final _result = _foobar_SetOf_Int_create_handle();
  for (final element in value) {
    final _element_handle = (element);
    _foobar_SetOf_Int_insert(_result, _element_handle);
    (_element_handle);
  }
  return _result;
}
Set<int> foobar_SetOf_Int_fromFfi(Pointer<Void> handle) {
  final result = Set<int>();
  final _iterator_handle = _foobar_SetOf_Int_iterator(handle);
  while (_foobar_SetOf_Int_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_SetOf_Int_iterator_get(_iterator_handle);
    try {
      result.add((_element_handle));
    } finally {
      (_element_handle);
    }
    _foobar_SetOf_Int_iterator_increment(_iterator_handle);
  }
  _foobar_SetOf_Int_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_SetOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobar_SetOf_Int_release_handle(handle);
final _foobar_SetOf_Int_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Int_create_handle_nullable'));
final _foobar_SetOf_Int_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Int_release_handle_nullable'));
final _foobar_SetOf_Int_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobar_SetOf_Int_toFfi_nullable(Set<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_Int_toFfi(value);
  final result = _foobar_SetOf_Int_create_handle_nullable(_handle);
  foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
Set<int> foobar_SetOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_Int_get_value_nullable(handle);
  final result = foobar_SetOf_Int_fromFfi(_handle);
  foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_Int_release_handle_nullable(handle);
final _foobar_SetOf_String_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_String_create_handle'));
final _foobar_SetOf_String_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_String_release_handle'));
final _foobar_SetOf_String_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_SetOf_String_insert'));
final _foobar_SetOf_String_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_String_iterator'));
final _foobar_SetOf_String_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_String_iterator_release_handle'));
final _foobar_SetOf_String_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_String_iterator_is_valid'));
final _foobar_SetOf_String_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_String_iterator_increment'));
final _foobar_SetOf_String_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_String_iterator_get'));
Pointer<Void> foobar_SetOf_String_toFfi(Set<String> value) {
  final _result = _foobar_SetOf_String_create_handle();
  for (final element in value) {
    final _element_handle = String_toFfi(element);
    _foobar_SetOf_String_insert(_result, _element_handle);
    String_releaseFfiHandle(_element_handle);
  }
  return _result;
}
Set<String> foobar_SetOf_String_fromFfi(Pointer<Void> handle) {
  final result = Set<String>();
  final _iterator_handle = _foobar_SetOf_String_iterator(handle);
  while (_foobar_SetOf_String_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_SetOf_String_iterator_get(_iterator_handle);
    try {
      result.add(String_fromFfi(_element_handle));
    } finally {
      String_releaseFfiHandle(_element_handle);
    }
    _foobar_SetOf_String_iterator_increment(_iterator_handle);
  }
  _foobar_SetOf_String_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_SetOf_String_releaseFfiHandle(Pointer<Void> handle) => _foobar_SetOf_String_release_handle(handle);
final _foobar_SetOf_String_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_String_create_handle_nullable'));
final _foobar_SetOf_String_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_String_release_handle_nullable'));
final _foobar_SetOf_String_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_String_get_value_nullable'));
Pointer<Void> foobar_SetOf_String_toFfi_nullable(Set<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_String_toFfi(value);
  final result = _foobar_SetOf_String_create_handle_nullable(_handle);
  foobar_SetOf_String_releaseFfiHandle(_handle);
  return result;
}
Set<String> foobar_SetOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_String_get_value_nullable(handle);
  final result = foobar_SetOf_String_fromFfi(_handle);
  foobar_SetOf_String_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_String_release_handle_nullable(handle);
final _foobar_SetOf_UByte_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_UByte_create_handle'));
final _foobar_SetOf_UByte_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_UByte_release_handle'));
final _foobar_SetOf_UByte_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint8),
    void Function(Pointer<Void>, int)
  >('library_foobar_SetOf_UByte_insert'));
final _foobar_SetOf_UByte_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_UByte_iterator'));
final _foobar_SetOf_UByte_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_UByte_iterator_release_handle'));
final _foobar_SetOf_UByte_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_UByte_iterator_is_valid'));
final _foobar_SetOf_UByte_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_UByte_iterator_increment'));
final _foobar_SetOf_UByte_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_SetOf_UByte_iterator_get'));
Pointer<Void> foobar_SetOf_UByte_toFfi(Set<int> value) {
  final _result = _foobar_SetOf_UByte_create_handle();
  for (final element in value) {
    final _element_handle = (element);
    _foobar_SetOf_UByte_insert(_result, _element_handle);
    (_element_handle);
  }
  return _result;
}
Set<int> foobar_SetOf_UByte_fromFfi(Pointer<Void> handle) {
  final result = Set<int>();
  final _iterator_handle = _foobar_SetOf_UByte_iterator(handle);
  while (_foobar_SetOf_UByte_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_SetOf_UByte_iterator_get(_iterator_handle);
    try {
      result.add((_element_handle));
    } finally {
      (_element_handle);
    }
    _foobar_SetOf_UByte_iterator_increment(_iterator_handle);
  }
  _foobar_SetOf_UByte_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_SetOf_UByte_releaseFfiHandle(Pointer<Void> handle) => _foobar_SetOf_UByte_release_handle(handle);
final _foobar_SetOf_UByte_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_UByte_create_handle_nullable'));
final _foobar_SetOf_UByte_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_UByte_release_handle_nullable'));
final _foobar_SetOf_UByte_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_UByte_get_value_nullable'));
Pointer<Void> foobar_SetOf_UByte_toFfi_nullable(Set<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_UByte_toFfi(value);
  final result = _foobar_SetOf_UByte_create_handle_nullable(_handle);
  foobar_SetOf_UByte_releaseFfiHandle(_handle);
  return result;
}
Set<int> foobar_SetOf_UByte_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_UByte_get_value_nullable(handle);
  final result = foobar_SetOf_UByte_fromFfi(_handle);
  foobar_SetOf_UByte_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_UByte_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_UByte_release_handle_nullable(handle);
final _foobar_SetOf_foobar_ListOf_Int_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_foobar_ListOf_Int_create_handle'));
final _foobar_SetOf_foobar_ListOf_Int_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_release_handle'));
final _foobar_SetOf_foobar_ListOf_Int_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_insert'));
final _foobar_SetOf_foobar_ListOf_Int_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_ListOf_Int_iterator'));
final _foobar_SetOf_foobar_ListOf_Int_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_ListOf_Int_iterator_release_handle'));
final _foobar_SetOf_foobar_ListOf_Int_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_foobar_ListOf_Int_iterator_is_valid'));
final _foobar_SetOf_foobar_ListOf_Int_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_ListOf_Int_iterator_increment'));
final _foobar_SetOf_foobar_ListOf_Int_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_ListOf_Int_iterator_get'));
Pointer<Void> foobar_SetOf_foobar_ListOf_Int_toFfi(Set<List<int>> value) {
  final _result = _foobar_SetOf_foobar_ListOf_Int_create_handle();
  for (final element in value) {
    final _element_handle = foobar_ListOf_Int_toFfi(element);
    _foobar_SetOf_foobar_ListOf_Int_insert(_result, _element_handle);
    foobar_ListOf_Int_releaseFfiHandle(_element_handle);
  }
  return _result;
}
Set<List<int>> foobar_SetOf_foobar_ListOf_Int_fromFfi(Pointer<Void> handle) {
  final result = Set<List<int>>();
  final _iterator_handle = _foobar_SetOf_foobar_ListOf_Int_iterator(handle);
  while (_foobar_SetOf_foobar_ListOf_Int_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_SetOf_foobar_ListOf_Int_iterator_get(_iterator_handle);
    try {
      result.add(foobar_ListOf_Int_fromFfi(_element_handle));
    } finally {
      foobar_ListOf_Int_releaseFfiHandle(_element_handle);
    }
    _foobar_SetOf_foobar_ListOf_Int_iterator_increment(_iterator_handle);
  }
  _foobar_SetOf_foobar_ListOf_Int_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_SetOf_foobar_ListOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobar_SetOf_foobar_ListOf_Int_release_handle(handle);
final _foobar_SetOf_foobar_ListOf_Int_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_create_handle_nullable'));
final _foobar_SetOf_foobar_ListOf_Int_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_release_handle_nullable'));
final _foobar_SetOf_foobar_ListOf_Int_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobar_SetOf_foobar_ListOf_Int_toFfi_nullable(Set<List<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_foobar_ListOf_Int_toFfi(value);
  final result = _foobar_SetOf_foobar_ListOf_Int_create_handle_nullable(_handle);
  foobar_SetOf_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
Set<List<int>> foobar_SetOf_foobar_ListOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_foobar_ListOf_Int_get_value_nullable(handle);
  final result = foobar_SetOf_foobar_ListOf_Int_fromFfi(_handle);
  foobar_SetOf_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_foobar_ListOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_foobar_ListOf_Int_release_handle_nullable(handle);
final _foobar_SetOf_foobar_MapOf_Int_to_Boolean_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_create_handle'));
final _foobar_SetOf_foobar_MapOf_Int_to_Boolean_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_release_handle'));
final _foobar_SetOf_foobar_MapOf_Int_to_Boolean_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_insert'));
final _foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator'));
final _foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_release_handle'));
final _foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_is_valid'));
final _foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_increment'));
final _foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_get'));
Pointer<Void> foobar_SetOf_foobar_MapOf_Int_to_Boolean_toFfi(Set<Map<int, bool>> value) {
  final _result = _foobar_SetOf_foobar_MapOf_Int_to_Boolean_create_handle();
  for (final element in value) {
    final _element_handle = foobar_MapOf_Int_to_Boolean_toFfi(element);
    _foobar_SetOf_foobar_MapOf_Int_to_Boolean_insert(_result, _element_handle);
    foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_element_handle);
  }
  return _result;
}
Set<Map<int, bool>> foobar_SetOf_foobar_MapOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Set<Map<int, bool>>();
  final _iterator_handle = _foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator(handle);
  while (_foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_get(_iterator_handle);
    try {
      result.add(foobar_MapOf_Int_to_Boolean_fromFfi(_element_handle));
    } finally {
      foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_element_handle);
    }
    _foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_increment(_iterator_handle);
  }
  _foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_SetOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobar_SetOf_foobar_MapOf_Int_to_Boolean_release_handle(handle);
final _foobar_SetOf_foobar_MapOf_Int_to_Boolean_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_SetOf_foobar_MapOf_Int_to_Boolean_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_SetOf_foobar_MapOf_Int_to_Boolean_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_SetOf_foobar_MapOf_Int_to_Boolean_toFfi_nullable(Set<Map<int, bool>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_foobar_MapOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_SetOf_foobar_MapOf_Int_to_Boolean_create_handle_nullable(_handle);
  foobar_SetOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Set<Map<int, bool>> foobar_SetOf_foobar_MapOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_foobar_MapOf_Int_to_Boolean_get_value_nullable(handle);
  final result = foobar_SetOf_foobar_MapOf_Int_to_Boolean_fromFfi(_handle);
  foobar_SetOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_foobar_MapOf_Int_to_Boolean_release_handle_nullable(handle);
final _foobar_SetOf_foobar_SetOf_Int_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_foobar_SetOf_Int_create_handle'));
final _foobar_SetOf_foobar_SetOf_Int_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_release_handle'));
final _foobar_SetOf_foobar_SetOf_Int_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_insert'));
final _foobar_SetOf_foobar_SetOf_Int_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_SetOf_Int_iterator'));
final _foobar_SetOf_foobar_SetOf_Int_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_SetOf_Int_iterator_release_handle'));
final _foobar_SetOf_foobar_SetOf_Int_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_foobar_SetOf_Int_iterator_is_valid'));
final _foobar_SetOf_foobar_SetOf_Int_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_SetOf_Int_iterator_increment'));
final _foobar_SetOf_foobar_SetOf_Int_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_SetOf_Int_iterator_get'));
Pointer<Void> foobar_SetOf_foobar_SetOf_Int_toFfi(Set<Set<int>> value) {
  final _result = _foobar_SetOf_foobar_SetOf_Int_create_handle();
  for (final element in value) {
    final _element_handle = foobar_SetOf_Int_toFfi(element);
    _foobar_SetOf_foobar_SetOf_Int_insert(_result, _element_handle);
    foobar_SetOf_Int_releaseFfiHandle(_element_handle);
  }
  return _result;
}
Set<Set<int>> foobar_SetOf_foobar_SetOf_Int_fromFfi(Pointer<Void> handle) {
  final result = Set<Set<int>>();
  final _iterator_handle = _foobar_SetOf_foobar_SetOf_Int_iterator(handle);
  while (_foobar_SetOf_foobar_SetOf_Int_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_SetOf_foobar_SetOf_Int_iterator_get(_iterator_handle);
    try {
      result.add(foobar_SetOf_Int_fromFfi(_element_handle));
    } finally {
      foobar_SetOf_Int_releaseFfiHandle(_element_handle);
    }
    _foobar_SetOf_foobar_SetOf_Int_iterator_increment(_iterator_handle);
  }
  _foobar_SetOf_foobar_SetOf_Int_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_SetOf_foobar_SetOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobar_SetOf_foobar_SetOf_Int_release_handle(handle);
final _foobar_SetOf_foobar_SetOf_Int_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_create_handle_nullable'));
final _foobar_SetOf_foobar_SetOf_Int_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_release_handle_nullable'));
final _foobar_SetOf_foobar_SetOf_Int_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobar_SetOf_foobar_SetOf_Int_toFfi_nullable(Set<Set<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_foobar_SetOf_Int_toFfi(value);
  final result = _foobar_SetOf_foobar_SetOf_Int_create_handle_nullable(_handle);
  foobar_SetOf_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
Set<Set<int>> foobar_SetOf_foobar_SetOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_foobar_SetOf_Int_get_value_nullable(handle);
  final result = foobar_SetOf_foobar_SetOf_Int_fromFfi(_handle);
  foobar_SetOf_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_foobar_SetOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_foobar_SetOf_Int_release_handle_nullable(handle);
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get'));
Pointer<Void> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(Set<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  final _result = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle();
  for (final element in value) {
    final _element_handle = smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(element);
    _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert(_result, _element_handle);
    smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_element_handle);
  }
  return _result;
}
Set<GenericTypesWithCompoundTypes_ExternalEnum> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(Pointer<Void> handle) {
  final result = Set<GenericTypesWithCompoundTypes_ExternalEnum>();
  final _iterator_handle = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator(handle);
  while (_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get(_iterator_handle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_element_handle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_element_handle);
    }
    _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment(_iterator_handle);
  }
  _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(Pointer<Void> handle) => _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle(handle);
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable'));
Pointer<Void> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi_nullable(Set<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(value);
  final result = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable(_handle);
  foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
Set<GenericTypesWithCompoundTypes_ExternalEnum> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable(handle);
  final result = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_handle);
  foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable(handle);
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get'));
Pointer<Void> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(Set<GenericTypesWithCompoundTypes_SomeEnum> value) {
  final _result = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle();
  for (final element in value) {
    final _element_handle = smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(element);
    _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert(_result, _element_handle);
    smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_element_handle);
  }
  return _result;
}
Set<GenericTypesWithCompoundTypes_SomeEnum> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(Pointer<Void> handle) {
  final result = Set<GenericTypesWithCompoundTypes_SomeEnum>();
  final _iterator_handle = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator(handle);
  while (_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid(handle, _iterator_handle) != 0) {
    final _element_handle = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get(_iterator_handle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_element_handle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_element_handle);
    }
    _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment(_iterator_handle);
  }
  _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle(_iterator_handle);
  return result;
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(Pointer<Void> handle) => _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle(handle);
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable'));
Pointer<Void> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi_nullable(Set<GenericTypesWithCompoundTypes_SomeEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(value);
  final result = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable(_handle);
  foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
Set<GenericTypesWithCompoundTypes_SomeEnum> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable(handle);
  final result = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_handle);
  foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable(handle);
