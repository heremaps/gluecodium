import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/another_dummy_class.dart';
import 'package:library/src/smoke/dummy_class.dart';
import 'package:library/src/smoke/dummy_interface.dart';
import 'package:library/src/smoke/generic_types_with_compound_types.dart';
import 'package:library/src/smoke/unreasonably_lazy_class.dart';
import 'package:library/src/smoke/very_big_struct.dart';
import 'package:library/src/smoke/yet_another_dummy_class.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
final _foobarListofFloatCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_Float_create_handle'));
final _foobarListofFloatReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Float_release_handle'));
final _foobarListofFloatInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Float),
    void Function(Pointer<Void>, double)
  >('library_foobar_ListOf_Float_insert'));
final _foobarListofFloatIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_Float_iterator'));
final _foobarListofFloatIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Float_iterator_release_handle'));
final _foobarListofFloatIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_Float_iterator_is_valid'));
final _foobarListofFloatIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Float_iterator_increment'));
final _foobarListofFloatIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('library_foobar_ListOf_Float_iterator_get'));
Pointer<Void> foobar_ListOf_Float_toFfi(List<double> value) {
  final _result = _foobarListofFloatCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarListofFloatInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
List<double> foobar_ListOf_Float_fromFfi(Pointer<Void> handle) {
  final result = List<double>.empty(growable: true);
  final _iteratorHandle = _foobarListofFloatIterator(handle);
  while (_foobarListofFloatIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofFloatIteratorGet(_iteratorHandle);
    try {
      result.add((_elementHandle));
    } finally {
      (_elementHandle);
    }
    _foobarListofFloatIteratorIncrement(_iteratorHandle);
  }
  _foobarListofFloatIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_Float_releaseFfiHandle(Pointer<Void> handle) => _foobarListofFloatReleaseHandle(handle);
final _foobar_ListOf_FloatCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Float_create_handle_nullable'));
final _foobar_ListOf_FloatReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Float_release_handle_nullable'));
final _foobar_ListOf_FloatGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Float_get_value_nullable'));
Pointer<Void> foobar_ListOf_Float_toFfi_nullable(List<double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_Float_toFfi(value);
  final result = _foobar_ListOf_FloatCreateHandleNullable(_handle);
  foobar_ListOf_Float_releaseFfiHandle(_handle);
  return result;
}
List<double> foobar_ListOf_Float_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_FloatGetValueNullable(handle);
  final result = foobar_ListOf_Float_fromFfi(_handle);
  foobar_ListOf_Float_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_Float_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_FloatReleaseHandleNullable(handle);
final _foobarListofIntCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_Int_create_handle'));
final _foobarListofIntReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Int_release_handle'));
final _foobarListofIntInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_Int_insert'));
final _foobarListofIntIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_Int_iterator'));
final _foobarListofIntIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Int_iterator_release_handle'));
final _foobarListofIntIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_Int_iterator_is_valid'));
final _foobarListofIntIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_Int_iterator_increment'));
final _foobarListofIntIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_Int_iterator_get'));
Pointer<Void> foobar_ListOf_Int_toFfi(List<int> value) {
  final _result = _foobarListofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarListofIntInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
List<int> foobar_ListOf_Int_fromFfi(Pointer<Void> handle) {
  final result = List<int>.empty(growable: true);
  final _iteratorHandle = _foobarListofIntIterator(handle);
  while (_foobarListofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofIntIteratorGet(_iteratorHandle);
    try {
      result.add((_elementHandle));
    } finally {
      (_elementHandle);
    }
    _foobarListofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarListofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobarListofIntReleaseHandle(handle);
final _foobar_ListOf_IntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Int_create_handle_nullable'));
final _foobar_ListOf_IntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Int_release_handle_nullable'));
final _foobar_ListOf_IntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobar_ListOf_Int_toFfi_nullable(List<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_Int_toFfi(value);
  final result = _foobar_ListOf_IntCreateHandleNullable(_handle);
  foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
List<int> foobar_ListOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_IntGetValueNullable(handle);
  final result = foobar_ListOf_Int_fromFfi(_handle);
  foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_IntReleaseHandleNullable(handle);
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
final _foobarListofUbyteCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_UByte_create_handle'));
final _foobarListofUbyteReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_UByte_release_handle'));
final _foobarListofUbyteInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint8),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_UByte_insert'));
final _foobarListofUbyteIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_UByte_iterator'));
final _foobarListofUbyteIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_UByte_iterator_release_handle'));
final _foobarListofUbyteIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_UByte_iterator_is_valid'));
final _foobarListofUbyteIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_UByte_iterator_increment'));
final _foobarListofUbyteIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_UByte_iterator_get'));
Pointer<Void> foobar_ListOf_UByte_toFfi(List<int> value) {
  final _result = _foobarListofUbyteCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarListofUbyteInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
List<int> foobar_ListOf_UByte_fromFfi(Pointer<Void> handle) {
  final result = List<int>.empty(growable: true);
  final _iteratorHandle = _foobarListofUbyteIterator(handle);
  while (_foobarListofUbyteIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofUbyteIteratorGet(_iteratorHandle);
    try {
      result.add((_elementHandle));
    } finally {
      (_elementHandle);
    }
    _foobarListofUbyteIteratorIncrement(_iteratorHandle);
  }
  _foobarListofUbyteIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_UByte_releaseFfiHandle(Pointer<Void> handle) => _foobarListofUbyteReleaseHandle(handle);
final _foobar_ListOf_UByteCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_UByte_create_handle_nullable'));
final _foobar_ListOf_UByteReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_UByte_release_handle_nullable'));
final _foobar_ListOf_UByteGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_UByte_get_value_nullable'));
Pointer<Void> foobar_ListOf_UByte_toFfi_nullable(List<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_UByte_toFfi(value);
  final result = _foobar_ListOf_UByteCreateHandleNullable(_handle);
  foobar_ListOf_UByte_releaseFfiHandle(_handle);
  return result;
}
List<int> foobar_ListOf_UByte_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_UByteGetValueNullable(handle);
  final result = foobar_ListOf_UByte_fromFfi(_handle);
  foobar_ListOf_UByte_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_UByte_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_UByteReleaseHandleNullable(handle);
final _foobarListofFoobarListofIntCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_foobar_ListOf_Int_create_handle'));
final _foobarListofFoobarListofIntReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_release_handle'));
final _foobarListofFoobarListofIntInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_insert'));
final _foobarListofFoobarListofIntIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_ListOf_Int_iterator'));
final _foobarListofFoobarListofIntIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_ListOf_Int_iterator_release_handle'));
final _foobarListofFoobarListofIntIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_foobar_ListOf_Int_iterator_is_valid'));
final _foobarListofFoobarListofIntIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_ListOf_Int_iterator_increment'));
final _foobarListofFoobarListofIntIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_ListOf_Int_iterator_get'));
Pointer<Void> foobar_ListOf_foobar_ListOf_Int_toFfi(List<List<int>> value) {
  final _result = _foobarListofFoobarListofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = foobar_ListOf_Int_toFfi(element);
    _foobarListofFoobarListofIntInsert(_result, _elementHandle);
    foobar_ListOf_Int_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<List<int>> foobar_ListOf_foobar_ListOf_Int_fromFfi(Pointer<Void> handle) {
  final result = List<List<int>>.empty(growable: true);
  final _iteratorHandle = _foobarListofFoobarListofIntIterator(handle);
  while (_foobarListofFoobarListofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofFoobarListofIntIteratorGet(_iteratorHandle);
    try {
      result.add(foobar_ListOf_Int_fromFfi(_elementHandle));
    } finally {
      foobar_ListOf_Int_releaseFfiHandle(_elementHandle);
    }
    _foobarListofFoobarListofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarListofFoobarListofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_foobar_ListOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobarListofFoobarListofIntReleaseHandle(handle);
final _foobar_ListOf_foobar_ListOf_IntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_create_handle_nullable'));
final _foobar_ListOf_foobar_ListOf_IntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_release_handle_nullable'));
final _foobar_ListOf_foobar_ListOf_IntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobar_ListOf_foobar_ListOf_Int_toFfi_nullable(List<List<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_foobar_ListOf_Int_toFfi(value);
  final result = _foobar_ListOf_foobar_ListOf_IntCreateHandleNullable(_handle);
  foobar_ListOf_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
List<List<int>> foobar_ListOf_foobar_ListOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_foobar_ListOf_IntGetValueNullable(handle);
  final result = foobar_ListOf_foobar_ListOf_Int_fromFfi(_handle);
  foobar_ListOf_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_foobar_ListOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_foobar_ListOf_IntReleaseHandleNullable(handle);
final _foobarListofFoobarMapofIntToBooleanCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_create_handle'));
final _foobarListofFoobarMapofIntToBooleanReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_release_handle'));
final _foobarListofFoobarMapofIntToBooleanInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_insert'));
final _foobarListofFoobarMapofIntToBooleanIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator'));
final _foobarListofFoobarMapofIntToBooleanIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_release_handle'));
final _foobarListofFoobarMapofIntToBooleanIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_is_valid'));
final _foobarListofFoobarMapofIntToBooleanIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_increment'));
final _foobarListofFoobarMapofIntToBooleanIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_iterator_get'));
Pointer<Void> foobar_ListOf_foobar_MapOf_Int_to_Boolean_toFfi(List<Map<int, bool>> value) {
  final _result = _foobarListofFoobarMapofIntToBooleanCreateHandle();
  for (final element in value) {
    final _elementHandle = foobar_MapOf_Int_to_Boolean_toFfi(element);
    _foobarListofFoobarMapofIntToBooleanInsert(_result, _elementHandle);
    foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<Map<int, bool>> foobar_ListOf_foobar_MapOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = List<Map<int, bool>>.empty(growable: true);
  final _iteratorHandle = _foobarListofFoobarMapofIntToBooleanIterator(handle);
  while (_foobarListofFoobarMapofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofFoobarMapofIntToBooleanIteratorGet(_iteratorHandle);
    try {
      result.add(foobar_MapOf_Int_to_Boolean_fromFfi(_elementHandle));
    } finally {
      foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_elementHandle);
    }
    _foobarListofFoobarMapofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarListofFoobarMapofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobarListofFoobarMapofIntToBooleanReleaseHandle(handle);
final _foobar_ListOf_foobar_MapOf_Int_to_BooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_ListOf_foobar_MapOf_Int_to_BooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_ListOf_foobar_MapOf_Int_to_BooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_ListOf_foobar_MapOf_Int_to_Boolean_toFfi_nullable(List<Map<int, bool>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_foobar_MapOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_ListOf_foobar_MapOf_Int_to_BooleanCreateHandleNullable(_handle);
  foobar_ListOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
List<Map<int, bool>> foobar_ListOf_foobar_MapOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_foobar_MapOf_Int_to_BooleanGetValueNullable(handle);
  final result = foobar_ListOf_foobar_MapOf_Int_to_Boolean_fromFfi(_handle);
  foobar_ListOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_foobar_MapOf_Int_to_BooleanReleaseHandleNullable(handle);
final _foobarListofFoobarSetofIntCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_foobar_SetOf_Int_create_handle'));
final _foobarListofFoobarSetofIntReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_release_handle'));
final _foobarListofFoobarSetofIntInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_insert'));
final _foobarListofFoobarSetofIntIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_SetOf_Int_iterator'));
final _foobarListofFoobarSetofIntIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_SetOf_Int_iterator_release_handle'));
final _foobarListofFoobarSetofIntIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_foobar_SetOf_Int_iterator_is_valid'));
final _foobarListofFoobarSetofIntIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_SetOf_Int_iterator_increment'));
final _foobarListofFoobarSetofIntIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_foobar_SetOf_Int_iterator_get'));
Pointer<Void> foobar_ListOf_foobar_SetOf_Int_toFfi(List<Set<int>> value) {
  final _result = _foobarListofFoobarSetofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = foobar_SetOf_Int_toFfi(element);
    _foobarListofFoobarSetofIntInsert(_result, _elementHandle);
    foobar_SetOf_Int_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<Set<int>> foobar_ListOf_foobar_SetOf_Int_fromFfi(Pointer<Void> handle) {
  final result = List<Set<int>>.empty(growable: true);
  final _iteratorHandle = _foobarListofFoobarSetofIntIterator(handle);
  while (_foobarListofFoobarSetofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofFoobarSetofIntIteratorGet(_iteratorHandle);
    try {
      result.add(foobar_SetOf_Int_fromFfi(_elementHandle));
    } finally {
      foobar_SetOf_Int_releaseFfiHandle(_elementHandle);
    }
    _foobarListofFoobarSetofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarListofFoobarSetofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_foobar_SetOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobarListofFoobarSetofIntReleaseHandle(handle);
final _foobar_ListOf_foobar_SetOf_IntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_create_handle_nullable'));
final _foobar_ListOf_foobar_SetOf_IntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_release_handle_nullable'));
final _foobar_ListOf_foobar_SetOf_IntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobar_ListOf_foobar_SetOf_Int_toFfi_nullable(List<Set<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_foobar_SetOf_Int_toFfi(value);
  final result = _foobar_ListOf_foobar_SetOf_IntCreateHandleNullable(_handle);
  foobar_ListOf_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
List<Set<int>> foobar_ListOf_foobar_SetOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_foobar_SetOf_IntGetValueNullable(handle);
  final result = foobar_ListOf_foobar_SetOf_Int_fromFfi(_handle);
  foobar_ListOf_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_foobar_SetOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_foobar_SetOf_IntReleaseHandleNullable(handle);
final _foobarListofSmokeAnotherdummyclassCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_AnotherDummyClass_create_handle'));
final _foobarListofSmokeAnotherdummyclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_release_handle'));
final _foobarListofSmokeAnotherdummyclassInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_insert'));
final _foobarListofSmokeAnotherdummyclassIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_AnotherDummyClass_iterator'));
final _foobarListofSmokeAnotherdummyclassIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_AnotherDummyClass_iterator_release_handle'));
final _foobarListofSmokeAnotherdummyclassIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_AnotherDummyClass_iterator_is_valid'));
final _foobarListofSmokeAnotherdummyclassIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_AnotherDummyClass_iterator_increment'));
final _foobarListofSmokeAnotherdummyclassIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_AnotherDummyClass_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_AnotherDummyClass_toFfi(List<AnotherDummyClass> value) {
  final _result = _foobarListofSmokeAnotherdummyclassCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_AnotherDummyClass_toFfi(element);
    _foobarListofSmokeAnotherdummyclassInsert(_result, _elementHandle);
    smoke_AnotherDummyClass_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<AnotherDummyClass> foobar_ListOf_smoke_AnotherDummyClass_fromFfi(Pointer<Void> handle) {
  final result = List<AnotherDummyClass>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeAnotherdummyclassIterator(handle);
  while (_foobarListofSmokeAnotherdummyclassIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeAnotherdummyclassIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_AnotherDummyClass_fromFfi(_elementHandle));
    } finally {
      smoke_AnotherDummyClass_releaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeAnotherdummyclassIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeAnotherdummyclassIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_smoke_AnotherDummyClass_releaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeAnotherdummyclassReleaseHandle(handle);
final _foobar_ListOf_smoke_AnotherDummyClassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_create_handle_nullable'));
final _foobar_ListOf_smoke_AnotherDummyClassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_release_handle_nullable'));
final _foobar_ListOf_smoke_AnotherDummyClassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_AnotherDummyClass_toFfi_nullable(List<AnotherDummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_AnotherDummyClass_toFfi(value);
  final result = _foobar_ListOf_smoke_AnotherDummyClassCreateHandleNullable(_handle);
  foobar_ListOf_smoke_AnotherDummyClass_releaseFfiHandle(_handle);
  return result;
}
List<AnotherDummyClass> foobar_ListOf_smoke_AnotherDummyClass_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_AnotherDummyClassGetValueNullable(handle);
  final result = foobar_ListOf_smoke_AnotherDummyClass_fromFfi(_handle);
  foobar_ListOf_smoke_AnotherDummyClass_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_AnotherDummyClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_AnotherDummyClassReleaseHandleNullable(handle);
final _foobarListofSmokeDummyclassCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_DummyClass_create_handle'));
final _foobarListofSmokeDummyclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_release_handle'));
final _foobarListofSmokeDummyclassInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_insert'));
final _foobarListofSmokeDummyclassIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyClass_iterator'));
final _foobarListofSmokeDummyclassIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyClass_iterator_release_handle'));
final _foobarListofSmokeDummyclassIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyClass_iterator_is_valid'));
final _foobarListofSmokeDummyclassIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyClass_iterator_increment'));
final _foobarListofSmokeDummyclassIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyClass_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_DummyClass_toFfi(List<DummyClass> value) {
  final _result = _foobarListofSmokeDummyclassCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_DummyClass_toFfi(element);
    _foobarListofSmokeDummyclassInsert(_result, _elementHandle);
    smoke_DummyClass_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<DummyClass> foobar_ListOf_smoke_DummyClass_fromFfi(Pointer<Void> handle) {
  final result = List<DummyClass>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeDummyclassIterator(handle);
  while (_foobarListofSmokeDummyclassIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeDummyclassIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_DummyClass_fromFfi(_elementHandle));
    } finally {
      smoke_DummyClass_releaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeDummyclassIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeDummyclassIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_smoke_DummyClass_releaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeDummyclassReleaseHandle(handle);
final _foobar_ListOf_smoke_DummyClassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_create_handle_nullable'));
final _foobar_ListOf_smoke_DummyClassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_release_handle_nullable'));
final _foobar_ListOf_smoke_DummyClassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_DummyClass_toFfi_nullable(List<DummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_DummyClass_toFfi(value);
  final result = _foobar_ListOf_smoke_DummyClassCreateHandleNullable(_handle);
  foobar_ListOf_smoke_DummyClass_releaseFfiHandle(_handle);
  return result;
}
List<DummyClass> foobar_ListOf_smoke_DummyClass_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_DummyClassGetValueNullable(handle);
  final result = foobar_ListOf_smoke_DummyClass_fromFfi(_handle);
  foobar_ListOf_smoke_DummyClass_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_DummyClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_DummyClassReleaseHandleNullable(handle);
final _foobarListofSmokeDummyinterfaceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_DummyInterface_create_handle'));
final _foobarListofSmokeDummyinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_release_handle'));
final _foobarListofSmokeDummyinterfaceInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_insert'));
final _foobarListofSmokeDummyinterfaceIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyInterface_iterator'));
final _foobarListofSmokeDummyinterfaceIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyInterface_iterator_release_handle'));
final _foobarListofSmokeDummyinterfaceIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyInterface_iterator_is_valid'));
final _foobarListofSmokeDummyinterfaceIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyInterface_iterator_increment'));
final _foobarListofSmokeDummyinterfaceIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DummyInterface_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_DummyInterface_toFfi(List<DummyInterface> value) {
  final _result = _foobarListofSmokeDummyinterfaceCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_DummyInterface_toFfi(element);
    _foobarListofSmokeDummyinterfaceInsert(_result, _elementHandle);
    smoke_DummyInterface_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<DummyInterface> foobar_ListOf_smoke_DummyInterface_fromFfi(Pointer<Void> handle) {
  final result = List<DummyInterface>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeDummyinterfaceIterator(handle);
  while (_foobarListofSmokeDummyinterfaceIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeDummyinterfaceIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_DummyInterface_fromFfi(_elementHandle));
    } finally {
      smoke_DummyInterface_releaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeDummyinterfaceIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeDummyinterfaceIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_smoke_DummyInterface_releaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeDummyinterfaceReleaseHandle(handle);
final _foobar_ListOf_smoke_DummyInterfaceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_create_handle_nullable'));
final _foobar_ListOf_smoke_DummyInterfaceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_release_handle_nullable'));
final _foobar_ListOf_smoke_DummyInterfaceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_DummyInterface_toFfi_nullable(List<DummyInterface> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_DummyInterface_toFfi(value);
  final result = _foobar_ListOf_smoke_DummyInterfaceCreateHandleNullable(_handle);
  foobar_ListOf_smoke_DummyInterface_releaseFfiHandle(_handle);
  return result;
}
List<DummyInterface> foobar_ListOf_smoke_DummyInterface_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_DummyInterfaceGetValueNullable(handle);
  final result = foobar_ListOf_smoke_DummyInterface_fromFfi(_handle);
  foobar_ListOf_smoke_DummyInterface_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_DummyInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_DummyInterfaceReleaseHandleNullable(handle);
final _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_insert'));
final _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator'));
final _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid'));
final _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment'));
final _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(List<GenericTypesWithCompoundTypes_BasicStruct> value) {
  final _result = _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(element);
    _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructInsert(_result, _elementHandle);
    smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_BasicStruct> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_BasicStruct>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIterator(handle);
  while (_foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(_elementHandle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructReleaseHandle(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi_nullable(List<GenericTypesWithCompoundTypes_BasicStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(value);
  final result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStructCreateHandleNullable(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_BasicStruct> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStructGetValueNullable(handle);
  final result = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStructReleaseHandleNullable(handle);
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(List<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  final _result = _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(element);
    _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumInsert(_result, _elementHandle);
    smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_ExternalEnum> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_ExternalEnum>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIterator(handle);
  while (_foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_elementHandle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandle(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi_nullable(List<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(value);
  final result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumCreateHandleNullable(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_ExternalEnum> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumGetValueNullable(handle);
  final result = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumReleaseHandleNullable(handle);
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_insert'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(List<GenericTypesWithCompoundTypes_ExternalStruct> value) {
  final _result = _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(element);
    _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructInsert(_result, _elementHandle);
    smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_ExternalStruct> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_ExternalStruct>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIterator(handle);
  while (_foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(_elementHandle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructReleaseHandle(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi_nullable(List<GenericTypesWithCompoundTypes_ExternalStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(value);
  final result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStructCreateHandleNullable(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_ExternalStruct> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStructGetValueNullable(handle);
  final result = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStructReleaseHandleNullable(handle);
final _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert'));
final _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator'));
final _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle'));
final _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid'));
final _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment'));
final _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(List<GenericTypesWithCompoundTypes_SomeEnum> value) {
  final _result = _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(element);
    _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumInsert(_result, _elementHandle);
    smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_SomeEnum> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_SomeEnum>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIterator(handle);
  while (_foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_elementHandle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandle(handle);
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable'));
final _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi_nullable(List<GenericTypesWithCompoundTypes_SomeEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(value);
  final result = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnumCreateHandleNullable(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_SomeEnum> foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnumGetValueNullable(handle);
  final result = foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_handle);
  foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnumReleaseHandleNullable(handle);
final _foobarListofSmokeUnreasonablylazyclassCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_UnreasonablyLazyClass_create_handle'));
final _foobarListofSmokeUnreasonablylazyclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_UnreasonablyLazyClass_release_handle'));
final _foobarListofSmokeUnreasonablylazyclassInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_UnreasonablyLazyClass_insert'));
final _foobarListofSmokeUnreasonablylazyclassIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_UnreasonablyLazyClass_iterator'));
final _foobarListofSmokeUnreasonablylazyclassIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_UnreasonablyLazyClass_iterator_release_handle'));
final _foobarListofSmokeUnreasonablylazyclassIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_UnreasonablyLazyClass_iterator_is_valid'));
final _foobarListofSmokeUnreasonablylazyclassIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_UnreasonablyLazyClass_iterator_increment'));
final _foobarListofSmokeUnreasonablylazyclassIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_UnreasonablyLazyClass_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_UnreasonablyLazyClass_toFfi(List<UnreasonablyLazyClass> value) {
  final _result = _foobarListofSmokeUnreasonablylazyclassCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_UnreasonablyLazyClass_toFfi(element);
    _foobarListofSmokeUnreasonablylazyclassInsert(_result, _elementHandle);
    smoke_UnreasonablyLazyClass_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<UnreasonablyLazyClass> foobar_ListOf_smoke_UnreasonablyLazyClass_fromFfi(Pointer<Void> handle) {
  final result = List<UnreasonablyLazyClass>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeUnreasonablylazyclassIterator(handle);
  while (_foobarListofSmokeUnreasonablylazyclassIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeUnreasonablylazyclassIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_UnreasonablyLazyClass_fromFfi(_elementHandle));
    } finally {
      smoke_UnreasonablyLazyClass_releaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeUnreasonablylazyclassIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeUnreasonablylazyclassIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_smoke_UnreasonablyLazyClass_releaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeUnreasonablylazyclassReleaseHandle(handle);
final _foobar_ListOf_smoke_UnreasonablyLazyClassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_UnreasonablyLazyClass_create_handle_nullable'));
final _foobar_ListOf_smoke_UnreasonablyLazyClassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_UnreasonablyLazyClass_release_handle_nullable'));
final _foobar_ListOf_smoke_UnreasonablyLazyClassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_UnreasonablyLazyClass_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_UnreasonablyLazyClass_toFfi_nullable(List<UnreasonablyLazyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_UnreasonablyLazyClass_toFfi(value);
  final result = _foobar_ListOf_smoke_UnreasonablyLazyClassCreateHandleNullable(_handle);
  foobar_ListOf_smoke_UnreasonablyLazyClass_releaseFfiHandle(_handle);
  return result;
}
List<UnreasonablyLazyClass> foobar_ListOf_smoke_UnreasonablyLazyClass_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_UnreasonablyLazyClassGetValueNullable(handle);
  final result = foobar_ListOf_smoke_UnreasonablyLazyClass_fromFfi(_handle);
  foobar_ListOf_smoke_UnreasonablyLazyClass_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_UnreasonablyLazyClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_UnreasonablyLazyClassReleaseHandleNullable(handle);
final _foobarListofSmokeVerybigstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_VeryBigStruct_create_handle'));
final _foobarListofSmokeVerybigstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_VeryBigStruct_release_handle'));
final _foobarListofSmokeVerybigstructInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_VeryBigStruct_insert'));
final _foobarListofSmokeVerybigstructIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_VeryBigStruct_iterator'));
final _foobarListofSmokeVerybigstructIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_VeryBigStruct_iterator_release_handle'));
final _foobarListofSmokeVerybigstructIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_VeryBigStruct_iterator_is_valid'));
final _foobarListofSmokeVerybigstructIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_VeryBigStruct_iterator_increment'));
final _foobarListofSmokeVerybigstructIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_VeryBigStruct_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_VeryBigStruct_toFfi(List<VeryBigStruct> value) {
  final _result = _foobarListofSmokeVerybigstructCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_VeryBigStruct_toFfi(element);
    _foobarListofSmokeVerybigstructInsert(_result, _elementHandle);
    smoke_VeryBigStruct_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<VeryBigStruct> foobar_ListOf_smoke_VeryBigStruct_fromFfi(Pointer<Void> handle) {
  final result = List<VeryBigStruct>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeVerybigstructIterator(handle);
  while (_foobarListofSmokeVerybigstructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeVerybigstructIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_VeryBigStruct_fromFfi(_elementHandle));
    } finally {
      smoke_VeryBigStruct_releaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeVerybigstructIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeVerybigstructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_smoke_VeryBigStruct_releaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeVerybigstructReleaseHandle(handle);
final _foobar_ListOf_smoke_VeryBigStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_VeryBigStruct_create_handle_nullable'));
final _foobar_ListOf_smoke_VeryBigStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_VeryBigStruct_release_handle_nullable'));
final _foobar_ListOf_smoke_VeryBigStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_VeryBigStruct_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_VeryBigStruct_toFfi_nullable(List<VeryBigStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_VeryBigStruct_toFfi(value);
  final result = _foobar_ListOf_smoke_VeryBigStructCreateHandleNullable(_handle);
  foobar_ListOf_smoke_VeryBigStruct_releaseFfiHandle(_handle);
  return result;
}
List<VeryBigStruct> foobar_ListOf_smoke_VeryBigStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_VeryBigStructGetValueNullable(handle);
  final result = foobar_ListOf_smoke_VeryBigStruct_fromFfi(_handle);
  foobar_ListOf_smoke_VeryBigStruct_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_VeryBigStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_VeryBigStructReleaseHandleNullable(handle);
final _foobarListofSmokeYetanotherdummyclassCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_create_handle'));
final _foobarListofSmokeYetanotherdummyclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_release_handle'));
final _foobarListofSmokeYetanotherdummyclassInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_insert'));
final _foobarListofSmokeYetanotherdummyclassIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_YetAnotherDummyClass_iterator'));
final _foobarListofSmokeYetanotherdummyclassIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_YetAnotherDummyClass_iterator_release_handle'));
final _foobarListofSmokeYetanotherdummyclassIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_YetAnotherDummyClass_iterator_is_valid'));
final _foobarListofSmokeYetanotherdummyclassIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_YetAnotherDummyClass_iterator_increment'));
final _foobarListofSmokeYetanotherdummyclassIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_YetAnotherDummyClass_iterator_get'));
Pointer<Void> foobar_ListOf_smoke_YetAnotherDummyClass_toFfi(List<YetAnotherDummyClass> value) {
  final _result = _foobarListofSmokeYetanotherdummyclassCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_YetAnotherDummyClass_toFfi(element);
    _foobarListofSmokeYetanotherdummyclassInsert(_result, _elementHandle);
    smoke_YetAnotherDummyClass_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<YetAnotherDummyClass> foobar_ListOf_smoke_YetAnotherDummyClass_fromFfi(Pointer<Void> handle) {
  final result = List<YetAnotherDummyClass>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeYetanotherdummyclassIterator(handle);
  while (_foobarListofSmokeYetanotherdummyclassIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeYetanotherdummyclassIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_YetAnotherDummyClass_fromFfi(_elementHandle));
    } finally {
      smoke_YetAnotherDummyClass_releaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeYetanotherdummyclassIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeYetanotherdummyclassIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_ListOf_smoke_YetAnotherDummyClass_releaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeYetanotherdummyclassReleaseHandle(handle);
final _foobar_ListOf_smoke_YetAnotherDummyClassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_create_handle_nullable'));
final _foobar_ListOf_smoke_YetAnotherDummyClassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_release_handle_nullable'));
final _foobar_ListOf_smoke_YetAnotherDummyClassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_get_value_nullable'));
Pointer<Void> foobar_ListOf_smoke_YetAnotherDummyClass_toFfi_nullable(List<YetAnotherDummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_ListOf_smoke_YetAnotherDummyClass_toFfi(value);
  final result = _foobar_ListOf_smoke_YetAnotherDummyClassCreateHandleNullable(_handle);
  foobar_ListOf_smoke_YetAnotherDummyClass_releaseFfiHandle(_handle);
  return result;
}
List<YetAnotherDummyClass> foobar_ListOf_smoke_YetAnotherDummyClass_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_ListOf_smoke_YetAnotherDummyClassGetValueNullable(handle);
  final result = foobar_ListOf_smoke_YetAnotherDummyClass_fromFfi(_handle);
  foobar_ListOf_smoke_YetAnotherDummyClass_releaseFfiHandle(_handle);
  return result;
}
void foobar_ListOf_smoke_YetAnotherDummyClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_ListOf_smoke_YetAnotherDummyClassReleaseHandleNullable(handle);
final _foobarMapofFloatToDoubleCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Float_to_Double_create_handle'));
final _foobarMapofFloatToDoubleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Float_to_Double_release_handle'));
final _foobarMapofFloatToDoublePut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Float, Double),
    void Function(Pointer<Void>, double, double)
  >('library_foobar_MapOf_Float_to_Double_put'));
final _foobarMapofFloatToDoubleIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator'));
final _foobarMapofFloatToDoubleIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator_release_handle'));
final _foobarMapofFloatToDoubleIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator_is_valid'));
final _foobarMapofFloatToDoubleIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator_increment'));
final _foobarMapofFloatToDoubleIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator_get_key'));
final _foobarMapofFloatToDoubleIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('library_foobar_MapOf_Float_to_Double_iterator_get_value'));
Pointer<Void> foobar_MapOf_Float_to_Double_toFfi(Map<double, double> value) {
  final _result = _foobarMapofFloatToDoubleCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = (entry.value);
    _foobarMapofFloatToDoublePut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    (_valueHandle);
  }
  return _result;
}
Map<double, double> foobar_MapOf_Float_to_Double_fromFfi(Pointer<Void> handle) {
  final result = Map<double, double>();
  final _iteratorHandle = _foobarMapofFloatToDoubleIterator(handle);
  while (_foobarMapofFloatToDoubleIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofFloatToDoubleIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofFloatToDoubleIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        (_valueHandle);
    } finally {
      (_keyHandle);
      (_valueHandle);
    }
    _foobarMapofFloatToDoubleIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofFloatToDoubleIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_Float_to_Double_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofFloatToDoubleReleaseHandle(handle);
final _foobar_MapOf_Float_to_DoubleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Float_to_Double_create_handle_nullable'));
final _foobar_MapOf_Float_to_DoubleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Float_to_Double_release_handle_nullable'));
final _foobar_MapOf_Float_to_DoubleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Float_to_Double_get_value_nullable'));
Pointer<Void> foobar_MapOf_Float_to_Double_toFfi_nullable(Map<double, double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Float_to_Double_toFfi(value);
  final result = _foobar_MapOf_Float_to_DoubleCreateHandleNullable(_handle);
  foobar_MapOf_Float_to_Double_releaseFfiHandle(_handle);
  return result;
}
Map<double, double> foobar_MapOf_Float_to_Double_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Float_to_DoubleGetValueNullable(handle);
  final result = foobar_MapOf_Float_to_Double_fromFfi(_handle);
  foobar_MapOf_Float_to_Double_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Float_to_Double_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Float_to_DoubleReleaseHandleNullable(handle);
final _foobarMapofIntToBooleanCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_Boolean_create_handle'));
final _foobarMapofIntToBooleanReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Boolean_release_handle'));
final _foobarMapofIntToBooleanPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Uint8),
    void Function(Pointer<Void>, int, int)
  >('library_foobar_MapOf_Int_to_Boolean_put'));
final _foobarMapofIntToBooleanIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator'));
final _foobarMapofIntToBooleanIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator_release_handle'));
final _foobarMapofIntToBooleanIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator_is_valid'));
final _foobarMapofIntToBooleanIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator_increment'));
final _foobarMapofIntToBooleanIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator_get_key'));
final _foobarMapofIntToBooleanIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_Boolean_toFfi(Map<int, bool> value) {
  final _result = _foobarMapofIntToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = Boolean_toFfi(entry.value);
    _foobarMapofIntToBooleanPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    Boolean_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, bool> foobar_MapOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<int, bool>();
  final _iteratorHandle = _foobarMapofIntToBooleanIterator(handle);
  while (_foobarMapofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        Boolean_fromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      Boolean_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToBooleanReleaseHandle(handle);
final _foobar_MapOf_Int_to_BooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_Int_to_BooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_Int_to_BooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_Boolean_toFfi_nullable(Map<int, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_Int_to_BooleanCreateHandleNullable(_handle);
  foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<int, bool> foobar_MapOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_BooleanGetValueNullable(handle);
  final result = foobar_MapOf_Int_to_Boolean_fromFfi(_handle);
  foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_BooleanReleaseHandleNullable(handle);
final _foobarMapofIntToFoobarListofIntCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_create_handle'));
final _foobarMapofIntToFoobarListofIntReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_release_handle'));
final _foobarMapofIntToFoobarListofIntPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_put'));
final _foobarMapofIntToFoobarListofIntIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator'));
final _foobarMapofIntToFoobarListofIntIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_release_handle'));
final _foobarMapofIntToFoobarListofIntIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_is_valid'));
final _foobarMapofIntToFoobarListofIntIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_increment'));
final _foobarMapofIntToFoobarListofIntIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_get_key'));
final _foobarMapofIntToFoobarListofIntIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_ListOf_Int_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_foobar_ListOf_Int_toFfi(Map<int, List<int>> value) {
  final _result = _foobarMapofIntToFoobarListofIntCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = foobar_ListOf_Int_toFfi(entry.value);
    _foobarMapofIntToFoobarListofIntPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    foobar_ListOf_Int_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, List<int>> foobar_MapOf_Int_to_foobar_ListOf_Int_fromFfi(Pointer<Void> handle) {
  final result = Map<int, List<int>>();
  final _iteratorHandle = _foobarMapofIntToFoobarListofIntIterator(handle);
  while (_foobarMapofIntToFoobarListofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToFoobarListofIntIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToFoobarListofIntIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        foobar_ListOf_Int_fromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      foobar_ListOf_Int_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToFoobarListofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToFoobarListofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_Int_to_foobar_ListOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToFoobarListofIntReleaseHandle(handle);
final _foobar_MapOf_Int_to_foobar_ListOf_IntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_create_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_ListOf_IntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_release_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_ListOf_IntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_foobar_ListOf_Int_toFfi_nullable(Map<int, List<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_foobar_ListOf_Int_toFfi(value);
  final result = _foobar_MapOf_Int_to_foobar_ListOf_IntCreateHandleNullable(_handle);
  foobar_MapOf_Int_to_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
Map<int, List<int>> foobar_MapOf_Int_to_foobar_ListOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_foobar_ListOf_IntGetValueNullable(handle);
  final result = foobar_MapOf_Int_to_foobar_ListOf_Int_fromFfi(_handle);
  foobar_MapOf_Int_to_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_foobar_ListOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_foobar_ListOf_IntReleaseHandleNullable(handle);
final _foobarMapofIntToFoobarMapofIntToBooleanCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_create_handle'));
final _foobarMapofIntToFoobarMapofIntToBooleanReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_release_handle'));
final _foobarMapofIntToFoobarMapofIntToBooleanPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_put'));
final _foobarMapofIntToFoobarMapofIntToBooleanIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator'));
final _foobarMapofIntToFoobarMapofIntToBooleanIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_release_handle'));
final _foobarMapofIntToFoobarMapofIntToBooleanIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_is_valid'));
final _foobarMapofIntToFoobarMapofIntToBooleanIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_increment'));
final _foobarMapofIntToFoobarMapofIntToBooleanIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_get_key'));
final _foobarMapofIntToFoobarMapofIntToBooleanIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_toFfi(Map<int, Map<int, bool>> value) {
  final _result = _foobarMapofIntToFoobarMapofIntToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = foobar_MapOf_Int_to_Boolean_toFfi(entry.value);
    _foobarMapofIntToFoobarMapofIntToBooleanPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, Map<int, bool>> foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<int, Map<int, bool>>();
  final _iteratorHandle = _foobarMapofIntToFoobarMapofIntToBooleanIterator(handle);
  while (_foobarMapofIntToFoobarMapofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToFoobarMapofIntToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToFoobarMapofIntToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        foobar_MapOf_Int_to_Boolean_fromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToFoobarMapofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToFoobarMapofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToFoobarMapofIntToBooleanReleaseHandle(handle);
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_BooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_BooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_MapOf_Int_to_BooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_toFfi_nullable(Map<int, Map<int, bool>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_Int_to_foobar_MapOf_Int_to_BooleanCreateHandleNullable(_handle);
  foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<int, Map<int, bool>> foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_foobar_MapOf_Int_to_BooleanGetValueNullable(handle);
  final result = foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_fromFfi(_handle);
  foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_foobar_MapOf_Int_to_BooleanReleaseHandleNullable(handle);
final _foobarMapofIntToFoobarSetofIntCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_create_handle'));
final _foobarMapofIntToFoobarSetofIntReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_release_handle'));
final _foobarMapofIntToFoobarSetofIntPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_put'));
final _foobarMapofIntToFoobarSetofIntIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator'));
final _foobarMapofIntToFoobarSetofIntIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_release_handle'));
final _foobarMapofIntToFoobarSetofIntIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_is_valid'));
final _foobarMapofIntToFoobarSetofIntIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_increment'));
final _foobarMapofIntToFoobarSetofIntIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_get_key'));
final _foobarMapofIntToFoobarSetofIntIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_foobar_SetOf_Int_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_foobar_SetOf_Int_toFfi(Map<int, Set<int>> value) {
  final _result = _foobarMapofIntToFoobarSetofIntCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = foobar_SetOf_Int_toFfi(entry.value);
    _foobarMapofIntToFoobarSetofIntPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    foobar_SetOf_Int_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, Set<int>> foobar_MapOf_Int_to_foobar_SetOf_Int_fromFfi(Pointer<Void> handle) {
  final result = Map<int, Set<int>>();
  final _iteratorHandle = _foobarMapofIntToFoobarSetofIntIterator(handle);
  while (_foobarMapofIntToFoobarSetofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToFoobarSetofIntIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToFoobarSetofIntIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        foobar_SetOf_Int_fromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      foobar_SetOf_Int_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToFoobarSetofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToFoobarSetofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_Int_to_foobar_SetOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToFoobarSetofIntReleaseHandle(handle);
final _foobar_MapOf_Int_to_foobar_SetOf_IntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_create_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_SetOf_IntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_release_handle_nullable'));
final _foobar_MapOf_Int_to_foobar_SetOf_IntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_foobar_SetOf_Int_toFfi_nullable(Map<int, Set<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_foobar_SetOf_Int_toFfi(value);
  final result = _foobar_MapOf_Int_to_foobar_SetOf_IntCreateHandleNullable(_handle);
  foobar_MapOf_Int_to_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
Map<int, Set<int>> foobar_MapOf_Int_to_foobar_SetOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_foobar_SetOf_IntGetValueNullable(handle);
  final result = foobar_MapOf_Int_to_foobar_SetOf_Int_fromFfi(_handle);
  foobar_MapOf_Int_to_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_foobar_SetOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_foobar_SetOf_IntReleaseHandleNullable(handle);
final _foobarMapofIntToSmokeDummyclassCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_create_handle'));
final _foobarMapofIntToSmokeDummyclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_release_handle'));
final _foobarMapofIntToSmokeDummyclassPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_put'));
final _foobarMapofIntToSmokeDummyclassIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator'));
final _foobarMapofIntToSmokeDummyclassIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator_release_handle'));
final _foobarMapofIntToSmokeDummyclassIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator_is_valid'));
final _foobarMapofIntToSmokeDummyclassIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator_increment'));
final _foobarMapofIntToSmokeDummyclassIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator_get_key'));
final _foobarMapofIntToSmokeDummyclassIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyClass_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_smoke_DummyClass_toFfi(Map<int, DummyClass> value) {
  final _result = _foobarMapofIntToSmokeDummyclassCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = smoke_DummyClass_toFfi(entry.value);
    _foobarMapofIntToSmokeDummyclassPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    smoke_DummyClass_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, DummyClass> foobar_MapOf_Int_to_smoke_DummyClass_fromFfi(Pointer<Void> handle) {
  final result = Map<int, DummyClass>();
  final _iteratorHandle = _foobarMapofIntToSmokeDummyclassIterator(handle);
  while (_foobarMapofIntToSmokeDummyclassIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToSmokeDummyclassIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToSmokeDummyclassIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        smoke_DummyClass_fromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      smoke_DummyClass_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToSmokeDummyclassIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToSmokeDummyclassIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_Int_to_smoke_DummyClass_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToSmokeDummyclassReleaseHandle(handle);
final _foobar_MapOf_Int_to_smoke_DummyClassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_create_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_DummyClassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_release_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_DummyClassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_smoke_DummyClass_toFfi_nullable(Map<int, DummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_smoke_DummyClass_toFfi(value);
  final result = _foobar_MapOf_Int_to_smoke_DummyClassCreateHandleNullable(_handle);
  foobar_MapOf_Int_to_smoke_DummyClass_releaseFfiHandle(_handle);
  return result;
}
Map<int, DummyClass> foobar_MapOf_Int_to_smoke_DummyClass_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_smoke_DummyClassGetValueNullable(handle);
  final result = foobar_MapOf_Int_to_smoke_DummyClass_fromFfi(_handle);
  foobar_MapOf_Int_to_smoke_DummyClass_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_DummyClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_smoke_DummyClassReleaseHandleNullable(handle);
final _foobarMapofIntToSmokeDummyinterfaceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_create_handle'));
final _foobarMapofIntToSmokeDummyinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_release_handle'));
final _foobarMapofIntToSmokeDummyinterfacePut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_put'));
final _foobarMapofIntToSmokeDummyinterfaceIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator'));
final _foobarMapofIntToSmokeDummyinterfaceIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator_release_handle'));
final _foobarMapofIntToSmokeDummyinterfaceIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator_is_valid'));
final _foobarMapofIntToSmokeDummyinterfaceIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator_increment'));
final _foobarMapofIntToSmokeDummyinterfaceIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator_get_key'));
final _foobarMapofIntToSmokeDummyinterfaceIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_DummyInterface_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_smoke_DummyInterface_toFfi(Map<int, DummyInterface> value) {
  final _result = _foobarMapofIntToSmokeDummyinterfaceCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = smoke_DummyInterface_toFfi(entry.value);
    _foobarMapofIntToSmokeDummyinterfacePut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    smoke_DummyInterface_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, DummyInterface> foobar_MapOf_Int_to_smoke_DummyInterface_fromFfi(Pointer<Void> handle) {
  final result = Map<int, DummyInterface>();
  final _iteratorHandle = _foobarMapofIntToSmokeDummyinterfaceIterator(handle);
  while (_foobarMapofIntToSmokeDummyinterfaceIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToSmokeDummyinterfaceIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToSmokeDummyinterfaceIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        smoke_DummyInterface_fromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      smoke_DummyInterface_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToSmokeDummyinterfaceIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToSmokeDummyinterfaceIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToSmokeDummyinterfaceReleaseHandle(handle);
final _foobar_MapOf_Int_to_smoke_DummyInterfaceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_create_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_DummyInterfaceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_release_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_DummyInterfaceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_smoke_DummyInterface_toFfi_nullable(Map<int, DummyInterface> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_smoke_DummyInterface_toFfi(value);
  final result = _foobar_MapOf_Int_to_smoke_DummyInterfaceCreateHandleNullable(_handle);
  foobar_MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle(_handle);
  return result;
}
Map<int, DummyInterface> foobar_MapOf_Int_to_smoke_DummyInterface_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_smoke_DummyInterfaceGetValueNullable(handle);
  final result = foobar_MapOf_Int_to_smoke_DummyInterface_fromFfi(_handle);
  foobar_MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_DummyInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_smoke_DummyInterfaceReleaseHandleNullable(handle);
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Uint32),
    void Function(Pointer<Void>, int, int)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_put'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get_key'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(Map<int, GenericTypesWithCompoundTypes_ExternalEnum> value) {
  final _result = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(entry.value);
    _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, GenericTypesWithCompoundTypes_ExternalEnum> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(Pointer<Void> handle) {
  final result = Map<int, GenericTypesWithCompoundTypes_ExternalEnum>();
  final _iteratorHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIterator(handle);
  while (_foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandle(handle);
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi_nullable(Map<int, GenericTypesWithCompoundTypes_ExternalEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(value);
  final result = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnumCreateHandleNullable(_handle);
  foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
Map<int, GenericTypesWithCompoundTypes_ExternalEnum> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnumGetValueNullable(handle);
  final result = foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_handle);
  foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnumReleaseHandleNullable(handle);
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Uint32),
    void Function(Pointer<Void>, int, int)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_put'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get_key'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get_value'));
Pointer<Void> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(Map<int, GenericTypesWithCompoundTypes_SomeEnum> value) {
  final _result = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(entry.value);
    _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, GenericTypesWithCompoundTypes_SomeEnum> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(Pointer<Void> handle) {
  final result = Map<int, GenericTypesWithCompoundTypes_SomeEnum>();
  final _iteratorHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIterator(handle);
  while (_foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandle(handle);
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable'));
final _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable'));
Pointer<Void> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi_nullable(Map<int, GenericTypesWithCompoundTypes_SomeEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(value);
  final result = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnumCreateHandleNullable(_handle);
  foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
Map<int, GenericTypesWithCompoundTypes_SomeEnum> foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnumGetValueNullable(handle);
  final result = foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_handle);
  foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnumReleaseHandleNullable(handle);
final _foobarMapofStringToStringCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_String_to_String_create_handle'));
final _foobarMapofStringToStringReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_release_handle'));
final _foobarMapofStringToStringPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_put'));
final _foobarMapofStringToStringIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator'));
final _foobarMapofStringToStringIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator_release_handle'));
final _foobarMapofStringToStringIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator_is_valid'));
final _foobarMapofStringToStringIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator_increment'));
final _foobarMapofStringToStringIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator_get_key'));
final _foobarMapofStringToStringIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_String_iterator_get_value'));
Pointer<Void> foobar_MapOf_String_to_String_toFfi(Map<String, String> value) {
  final _result = _foobarMapofStringToStringCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = String_toFfi(entry.key);
    final _valueHandle = String_toFfi(entry.value);
    _foobarMapofStringToStringPut(_result, _keyHandle, _valueHandle);
    String_releaseFfiHandle(_keyHandle);
    String_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<String, String> foobar_MapOf_String_to_String_fromFfi(Pointer<Void> handle) {
  final result = Map<String, String>();
  final _iteratorHandle = _foobarMapofStringToStringIterator(handle);
  while (_foobarMapofStringToStringIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofStringToStringIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofStringToStringIteratorGetValue(_iteratorHandle);
    try {
      result[String_fromFfi(_keyHandle)] =
        String_fromFfi(_valueHandle);
    } finally {
      String_releaseFfiHandle(_keyHandle);
      String_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofStringToStringIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofStringToStringIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_String_to_String_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofStringToStringReleaseHandle(handle);
final _foobar_MapOf_String_to_StringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_create_handle_nullable'));
final _foobar_MapOf_String_to_StringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_release_handle_nullable'));
final _foobar_MapOf_String_to_StringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_get_value_nullable'));
Pointer<Void> foobar_MapOf_String_to_String_toFfi_nullable(Map<String, String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_String_to_String_toFfi(value);
  final result = _foobar_MapOf_String_to_StringCreateHandleNullable(_handle);
  foobar_MapOf_String_to_String_releaseFfiHandle(_handle);
  return result;
}
Map<String, String> foobar_MapOf_String_to_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_String_to_StringGetValueNullable(handle);
  final result = foobar_MapOf_String_to_String_fromFfi(_handle);
  foobar_MapOf_String_to_String_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_String_to_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_String_to_StringReleaseHandleNullable(handle);
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_put'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_release_handle'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_is_valid'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_increment'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get_key'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_iterator_get_value'));
Pointer<Void> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(Map<String, GenericTypesWithCompoundTypes_BasicStruct> value) {
  final _result = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = String_toFfi(entry.key);
    final _valueHandle = smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(entry.value);
    _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructPut(_result, _keyHandle, _valueHandle);
    String_releaseFfiHandle(_keyHandle);
    smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<String, GenericTypesWithCompoundTypes_BasicStruct> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(Pointer<Void> handle) {
  final result = Map<String, GenericTypesWithCompoundTypes_BasicStruct>();
  final _iteratorHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIterator(handle);
  while (_foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorGetValue(_iteratorHandle);
    try {
      result[String_fromFfi(_keyHandle)] =
        smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(_valueHandle);
    } finally {
      String_releaseFfiHandle(_keyHandle);
      smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructReleaseHandle(handle);
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable'));
Pointer<Void> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi_nullable(Map<String, GenericTypesWithCompoundTypes_BasicStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_toFfi(value);
  final result = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStructCreateHandleNullable(_handle);
  foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
Map<String, GenericTypesWithCompoundTypes_BasicStruct> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStructGetValueNullable(handle);
  final result = foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_fromFfi(_handle);
  foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStructReleaseHandleNullable(handle);
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_put'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_release_handle'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_is_valid'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_increment'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get_key'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_iterator_get_value'));
Pointer<Void> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(Map<String, GenericTypesWithCompoundTypes_ExternalStruct> value) {
  final _result = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = String_toFfi(entry.key);
    final _valueHandle = smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(entry.value);
    _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructPut(_result, _keyHandle, _valueHandle);
    String_releaseFfiHandle(_keyHandle);
    smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<String, GenericTypesWithCompoundTypes_ExternalStruct> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(Pointer<Void> handle) {
  final result = Map<String, GenericTypesWithCompoundTypes_ExternalStruct>();
  final _iteratorHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIterator(handle);
  while (_foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorGetValue(_iteratorHandle);
    try {
      result[String_fromFfi(_keyHandle)] =
        smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(_valueHandle);
    } finally {
      String_releaseFfiHandle(_keyHandle);
      smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructReleaseHandle(handle);
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable'));
final _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable'));
Pointer<Void> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi_nullable(Map<String, GenericTypesWithCompoundTypes_ExternalStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_toFfi(value);
  final result = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStructCreateHandleNullable(_handle);
  foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
Map<String, GenericTypesWithCompoundTypes_ExternalStruct> foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStructGetValueNullable(handle);
  final result = foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_fromFfi(_handle);
  foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStructReleaseHandleNullable(handle);
final _foobarMapofUbyteToStringCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_UByte_to_String_create_handle'));
final _foobarMapofUbyteToStringReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_release_handle'));
final _foobarMapofUbyteToStringPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint8, Pointer<Void>),
    void Function(Pointer<Void>, int, Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_put'));
final _foobarMapofUbyteToStringIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator'));
final _foobarMapofUbyteToStringIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator_release_handle'));
final _foobarMapofUbyteToStringIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator_is_valid'));
final _foobarMapofUbyteToStringIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator_increment'));
final _foobarMapofUbyteToStringIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator_get_key'));
final _foobarMapofUbyteToStringIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_UByte_to_String_iterator_get_value'));
Pointer<Void> foobar_MapOf_UByte_to_String_toFfi(Map<int, String> value) {
  final _result = _foobarMapofUbyteToStringCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = String_toFfi(entry.value);
    _foobarMapofUbyteToStringPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    String_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, String> foobar_MapOf_UByte_to_String_fromFfi(Pointer<Void> handle) {
  final result = Map<int, String>();
  final _iteratorHandle = _foobarMapofUbyteToStringIterator(handle);
  while (_foobarMapofUbyteToStringIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofUbyteToStringIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofUbyteToStringIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        String_fromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      String_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofUbyteToStringIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofUbyteToStringIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_UByte_to_String_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofUbyteToStringReleaseHandle(handle);
final _foobar_MapOf_UByte_to_StringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_create_handle_nullable'));
final _foobar_MapOf_UByte_to_StringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_release_handle_nullable'));
final _foobar_MapOf_UByte_to_StringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_get_value_nullable'));
Pointer<Void> foobar_MapOf_UByte_to_String_toFfi_nullable(Map<int, String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_UByte_to_String_toFfi(value);
  final result = _foobar_MapOf_UByte_to_StringCreateHandleNullable(_handle);
  foobar_MapOf_UByte_to_String_releaseFfiHandle(_handle);
  return result;
}
Map<int, String> foobar_MapOf_UByte_to_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_UByte_to_StringGetValueNullable(handle);
  final result = foobar_MapOf_UByte_to_String_fromFfi(_handle);
  foobar_MapOf_UByte_to_String_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_UByte_to_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_UByte_to_StringReleaseHandleNullable(handle);
final _foobarMapofFoobarListofIntToBooleanCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_create_handle'));
final _foobarMapofFoobarListofIntToBooleanReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_release_handle'));
final _foobarMapofFoobarListofIntToBooleanPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Uint8),
    void Function(Pointer<Void>, Pointer<Void>, int)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_put'));
final _foobarMapofFoobarListofIntToBooleanIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator'));
final _foobarMapofFoobarListofIntToBooleanIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_release_handle'));
final _foobarMapofFoobarListofIntToBooleanIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_is_valid'));
final _foobarMapofFoobarListofIntToBooleanIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_increment'));
final _foobarMapofFoobarListofIntToBooleanIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_get_key'));
final _foobarMapofFoobarListofIntToBooleanIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_foobar_ListOf_Int_to_Boolean_toFfi(Map<List<int>, bool> value) {
  final _result = _foobarMapofFoobarListofIntToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = foobar_ListOf_Int_toFfi(entry.key);
    final _valueHandle = Boolean_toFfi(entry.value);
    _foobarMapofFoobarListofIntToBooleanPut(_result, _keyHandle, _valueHandle);
    foobar_ListOf_Int_releaseFfiHandle(_keyHandle);
    Boolean_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<List<int>, bool> foobar_MapOf_foobar_ListOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<List<int>, bool>();
  final _iteratorHandle = _foobarMapofFoobarListofIntToBooleanIterator(handle);
  while (_foobarMapofFoobarListofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofFoobarListofIntToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofFoobarListofIntToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[foobar_ListOf_Int_fromFfi(_keyHandle)] =
        Boolean_fromFfi(_valueHandle);
    } finally {
      foobar_ListOf_Int_releaseFfiHandle(_keyHandle);
      Boolean_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofFoobarListofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofFoobarListofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_foobar_ListOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofFoobarListofIntToBooleanReleaseHandle(handle);
final _foobar_MapOf_foobar_ListOf_Int_to_BooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_foobar_ListOf_Int_to_BooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_foobar_ListOf_Int_to_BooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_foobar_ListOf_Int_to_Boolean_toFfi_nullable(Map<List<int>, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_foobar_ListOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_foobar_ListOf_Int_to_BooleanCreateHandleNullable(_handle);
  foobar_MapOf_foobar_ListOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<List<int>, bool> foobar_MapOf_foobar_ListOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_foobar_ListOf_Int_to_BooleanGetValueNullable(handle);
  final result = foobar_MapOf_foobar_ListOf_Int_to_Boolean_fromFfi(_handle);
  foobar_MapOf_foobar_ListOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_foobar_ListOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_foobar_ListOf_Int_to_BooleanReleaseHandleNullable(handle);
final _foobarMapofFoobarMapofIntToBooleanToBooleanCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_create_handle'));
final _foobarMapofFoobarMapofIntToBooleanToBooleanReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_release_handle'));
final _foobarMapofFoobarMapofIntToBooleanToBooleanPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Uint8),
    void Function(Pointer<Void>, Pointer<Void>, int)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_put'));
final _foobarMapofFoobarMapofIntToBooleanToBooleanIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator'));
final _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_release_handle'));
final _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_is_valid'));
final _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_increment'));
final _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_get_key'));
final _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_toFfi(Map<Map<int, bool>, bool> value) {
  final _result = _foobarMapofFoobarMapofIntToBooleanToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = foobar_MapOf_Int_to_Boolean_toFfi(entry.key);
    final _valueHandle = Boolean_toFfi(entry.value);
    _foobarMapofFoobarMapofIntToBooleanToBooleanPut(_result, _keyHandle, _valueHandle);
    foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_keyHandle);
    Boolean_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<Map<int, bool>, bool> foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<Map<int, bool>, bool>();
  final _iteratorHandle = _foobarMapofFoobarMapofIntToBooleanToBooleanIterator(handle);
  while (_foobarMapofFoobarMapofIntToBooleanToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[foobar_MapOf_Int_to_Boolean_fromFfi(_keyHandle)] =
        Boolean_fromFfi(_valueHandle);
    } finally {
      foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_keyHandle);
      Boolean_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofFoobarMapofIntToBooleanToBooleanReleaseHandle(handle);
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_BooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_BooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_BooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_toFfi_nullable(Map<Map<int, bool>, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_BooleanCreateHandleNullable(_handle);
  foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<Map<int, bool>, bool> foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_BooleanGetValueNullable(handle);
  final result = foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_fromFfi(_handle);
  foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_BooleanReleaseHandleNullable(handle);
final _foobarMapofFoobarSetofIntToBooleanCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_create_handle'));
final _foobarMapofFoobarSetofIntToBooleanReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_release_handle'));
final _foobarMapofFoobarSetofIntToBooleanPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>, Uint8),
    void Function(Pointer<Void>, Pointer<Void>, int)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_put'));
final _foobarMapofFoobarSetofIntToBooleanIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator'));
final _foobarMapofFoobarSetofIntToBooleanIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_release_handle'));
final _foobarMapofFoobarSetofIntToBooleanIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_is_valid'));
final _foobarMapofFoobarSetofIntToBooleanIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_increment'));
final _foobarMapofFoobarSetofIntToBooleanIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_get_key'));
final _foobarMapofFoobarSetofIntToBooleanIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_foobar_SetOf_Int_to_Boolean_toFfi(Map<Set<int>, bool> value) {
  final _result = _foobarMapofFoobarSetofIntToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = foobar_SetOf_Int_toFfi(entry.key);
    final _valueHandle = Boolean_toFfi(entry.value);
    _foobarMapofFoobarSetofIntToBooleanPut(_result, _keyHandle, _valueHandle);
    foobar_SetOf_Int_releaseFfiHandle(_keyHandle);
    Boolean_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<Set<int>, bool> foobar_MapOf_foobar_SetOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<Set<int>, bool>();
  final _iteratorHandle = _foobarMapofFoobarSetofIntToBooleanIterator(handle);
  while (_foobarMapofFoobarSetofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofFoobarSetofIntToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofFoobarSetofIntToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[foobar_SetOf_Int_fromFfi(_keyHandle)] =
        Boolean_fromFfi(_valueHandle);
    } finally {
      foobar_SetOf_Int_releaseFfiHandle(_keyHandle);
      Boolean_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofFoobarSetofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofFoobarSetofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_foobar_SetOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofFoobarSetofIntToBooleanReleaseHandle(handle);
final _foobar_MapOf_foobar_SetOf_Int_to_BooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_foobar_SetOf_Int_to_BooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_foobar_SetOf_Int_to_BooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_foobar_SetOf_Int_to_Boolean_toFfi_nullable(Map<Set<int>, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_foobar_SetOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_foobar_SetOf_Int_to_BooleanCreateHandleNullable(_handle);
  foobar_MapOf_foobar_SetOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<Set<int>, bool> foobar_MapOf_foobar_SetOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_foobar_SetOf_Int_to_BooleanGetValueNullable(handle);
  final result = foobar_MapOf_foobar_SetOf_Int_to_Boolean_fromFfi(_handle);
  foobar_MapOf_foobar_SetOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_foobar_SetOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_foobar_SetOf_Int_to_BooleanReleaseHandleNullable(handle);
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_create_handle'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_release_handle'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32, Uint8),
    void Function(Pointer<Void>, int, int)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_put'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_release_handle'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_is_valid'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_increment'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_get_key'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_toFfi(Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> value) {
  final _result = _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(entry.key);
    final _valueHandle = Boolean_toFfi(entry.value);
    _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanPut(_result, _keyHandle, _valueHandle);
    smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_keyHandle);
    Boolean_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<GenericTypesWithCompoundTypes_ExternalEnum, bool>();
  final _iteratorHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIterator(handle);
  while (_foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_keyHandle)] =
        Boolean_fromFfi(_valueHandle);
    } finally {
      smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_keyHandle);
      Boolean_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanReleaseHandle(handle);
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_BooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_BooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_BooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_toFfi_nullable(Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_BooleanCreateHandleNullable(_handle);
  foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_BooleanGetValueNullable(handle);
  final result = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_fromFfi(_handle);
  foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_BooleanReleaseHandleNullable(handle);
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_create_handle'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_release_handle'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanPut = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32, Uint8),
    void Function(Pointer<Void>, int, int)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_put'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_release_handle'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_is_valid'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_increment'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorGetKey = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_get_key'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_iterator_get_value'));
Pointer<Void> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_toFfi(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> value) {
  final _result = _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(entry.key);
    final _valueHandle = Boolean_toFfi(entry.value);
    _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanPut(_result, _keyHandle, _valueHandle);
    smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_keyHandle);
    Boolean_releaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<GenericTypesWithCompoundTypes_SomeEnum, bool> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Map<GenericTypesWithCompoundTypes_SomeEnum, bool>();
  final _iteratorHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIterator(handle);
  while (_foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_keyHandle)] =
        Boolean_fromFfi(_valueHandle);
    } finally {
      smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_keyHandle);
      Boolean_releaseFfiHandle(_valueHandle);
    }
    _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanReleaseHandle(handle);
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_BooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_create_handle_nullable'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_BooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_release_handle_nullable'));
final _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_BooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_toFfi_nullable(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_toFfi(value);
  final result = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_BooleanCreateHandleNullable(_handle);
  foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Map<GenericTypesWithCompoundTypes_SomeEnum, bool> foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_BooleanGetValueNullable(handle);
  final result = foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_fromFfi(_handle);
  foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_BooleanReleaseHandleNullable(handle);
final _foobarSetofFloatCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_Float_create_handle'));
final _foobarSetofFloatReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Float_release_handle'));
final _foobarSetofFloatInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Float),
    void Function(Pointer<Void>, double)
  >('library_foobar_SetOf_Float_insert'));
final _foobarSetofFloatIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_Float_iterator'));
final _foobarSetofFloatIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_Float_iterator_release_handle'));
final _foobarSetofFloatIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_Float_iterator_is_valid'));
final _foobarSetofFloatIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_Float_iterator_increment'));
final _foobarSetofFloatIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
>('library_foobar_SetOf_Float_iterator_get'));
Pointer<Void> foobar_SetOf_Float_toFfi(Set<double> value) {
  final _result = _foobarSetofFloatCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarSetofFloatInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
Set<double> foobar_SetOf_Float_fromFfi(Pointer<Void> handle) {
  final result = Set<double>();
  final _iteratorHandle = _foobarSetofFloatIterator(handle);
  while (_foobarSetofFloatIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofFloatIteratorGet(_iteratorHandle);
    try {
      result.add((_elementHandle));
    } finally {
      (_elementHandle);
    }
    _foobarSetofFloatIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofFloatIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_SetOf_Float_releaseFfiHandle(Pointer<Void> handle) => _foobarSetofFloatReleaseHandle(handle);
final _foobar_SetOf_FloatCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Float_create_handle_nullable'));
final _foobar_SetOf_FloatReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Float_release_handle_nullable'));
final _foobar_SetOf_FloatGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Float_get_value_nullable'));
Pointer<Void> foobar_SetOf_Float_toFfi_nullable(Set<double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_Float_toFfi(value);
  final result = _foobar_SetOf_FloatCreateHandleNullable(_handle);
  foobar_SetOf_Float_releaseFfiHandle(_handle);
  return result;
}
Set<double> foobar_SetOf_Float_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_FloatGetValueNullable(handle);
  final result = foobar_SetOf_Float_fromFfi(_handle);
  foobar_SetOf_Float_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_Float_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_FloatReleaseHandleNullable(handle);
final _foobarSetofIntCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_Int_create_handle'));
final _foobarSetofIntReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Int_release_handle'));
final _foobarSetofIntInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32),
    void Function(Pointer<Void>, int)
  >('library_foobar_SetOf_Int_insert'));
final _foobarSetofIntIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_Int_iterator'));
final _foobarSetofIntIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_Int_iterator_release_handle'));
final _foobarSetofIntIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_Int_iterator_is_valid'));
final _foobarSetofIntIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_Int_iterator_increment'));
final _foobarSetofIntIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_SetOf_Int_iterator_get'));
Pointer<Void> foobar_SetOf_Int_toFfi(Set<int> value) {
  final _result = _foobarSetofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarSetofIntInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
Set<int> foobar_SetOf_Int_fromFfi(Pointer<Void> handle) {
  final result = Set<int>();
  final _iteratorHandle = _foobarSetofIntIterator(handle);
  while (_foobarSetofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofIntIteratorGet(_iteratorHandle);
    try {
      result.add((_elementHandle));
    } finally {
      (_elementHandle);
    }
    _foobarSetofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_SetOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobarSetofIntReleaseHandle(handle);
final _foobar_SetOf_IntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Int_create_handle_nullable'));
final _foobar_SetOf_IntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Int_release_handle_nullable'));
final _foobar_SetOf_IntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobar_SetOf_Int_toFfi_nullable(Set<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_Int_toFfi(value);
  final result = _foobar_SetOf_IntCreateHandleNullable(_handle);
  foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
Set<int> foobar_SetOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_IntGetValueNullable(handle);
  final result = foobar_SetOf_Int_fromFfi(_handle);
  foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_IntReleaseHandleNullable(handle);
final _foobarSetofStringCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_String_create_handle'));
final _foobarSetofStringReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_String_release_handle'));
final _foobarSetofStringInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_SetOf_String_insert'));
final _foobarSetofStringIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_String_iterator'));
final _foobarSetofStringIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_String_iterator_release_handle'));
final _foobarSetofStringIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_String_iterator_is_valid'));
final _foobarSetofStringIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_String_iterator_increment'));
final _foobarSetofStringIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_String_iterator_get'));
Pointer<Void> foobar_SetOf_String_toFfi(Set<String> value) {
  final _result = _foobarSetofStringCreateHandle();
  for (final element in value) {
    final _elementHandle = String_toFfi(element);
    _foobarSetofStringInsert(_result, _elementHandle);
    String_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<String> foobar_SetOf_String_fromFfi(Pointer<Void> handle) {
  final result = Set<String>();
  final _iteratorHandle = _foobarSetofStringIterator(handle);
  while (_foobarSetofStringIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofStringIteratorGet(_iteratorHandle);
    try {
      result.add(String_fromFfi(_elementHandle));
    } finally {
      String_releaseFfiHandle(_elementHandle);
    }
    _foobarSetofStringIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofStringIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_SetOf_String_releaseFfiHandle(Pointer<Void> handle) => _foobarSetofStringReleaseHandle(handle);
final _foobar_SetOf_StringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_String_create_handle_nullable'));
final _foobar_SetOf_StringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_String_release_handle_nullable'));
final _foobar_SetOf_StringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_String_get_value_nullable'));
Pointer<Void> foobar_SetOf_String_toFfi_nullable(Set<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_String_toFfi(value);
  final result = _foobar_SetOf_StringCreateHandleNullable(_handle);
  foobar_SetOf_String_releaseFfiHandle(_handle);
  return result;
}
Set<String> foobar_SetOf_String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_StringGetValueNullable(handle);
  final result = foobar_SetOf_String_fromFfi(_handle);
  foobar_SetOf_String_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_String_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_StringReleaseHandleNullable(handle);
final _foobarSetofUbyteCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_UByte_create_handle'));
final _foobarSetofUbyteReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_UByte_release_handle'));
final _foobarSetofUbyteInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint8),
    void Function(Pointer<Void>, int)
  >('library_foobar_SetOf_UByte_insert'));
final _foobarSetofUbyteIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_UByte_iterator'));
final _foobarSetofUbyteIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_UByte_iterator_release_handle'));
final _foobarSetofUbyteIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_UByte_iterator_is_valid'));
final _foobarSetofUbyteIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_UByte_iterator_increment'));
final _foobarSetofUbyteIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_SetOf_UByte_iterator_get'));
Pointer<Void> foobar_SetOf_UByte_toFfi(Set<int> value) {
  final _result = _foobarSetofUbyteCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarSetofUbyteInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
Set<int> foobar_SetOf_UByte_fromFfi(Pointer<Void> handle) {
  final result = Set<int>();
  final _iteratorHandle = _foobarSetofUbyteIterator(handle);
  while (_foobarSetofUbyteIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofUbyteIteratorGet(_iteratorHandle);
    try {
      result.add((_elementHandle));
    } finally {
      (_elementHandle);
    }
    _foobarSetofUbyteIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofUbyteIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_SetOf_UByte_releaseFfiHandle(Pointer<Void> handle) => _foobarSetofUbyteReleaseHandle(handle);
final _foobar_SetOf_UByteCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_UByte_create_handle_nullable'));
final _foobar_SetOf_UByteReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_UByte_release_handle_nullable'));
final _foobar_SetOf_UByteGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_UByte_get_value_nullable'));
Pointer<Void> foobar_SetOf_UByte_toFfi_nullable(Set<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_UByte_toFfi(value);
  final result = _foobar_SetOf_UByteCreateHandleNullable(_handle);
  foobar_SetOf_UByte_releaseFfiHandle(_handle);
  return result;
}
Set<int> foobar_SetOf_UByte_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_UByteGetValueNullable(handle);
  final result = foobar_SetOf_UByte_fromFfi(_handle);
  foobar_SetOf_UByte_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_UByte_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_UByteReleaseHandleNullable(handle);
final _foobarSetofFoobarListofIntCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_foobar_ListOf_Int_create_handle'));
final _foobarSetofFoobarListofIntReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_release_handle'));
final _foobarSetofFoobarListofIntInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_insert'));
final _foobarSetofFoobarListofIntIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_ListOf_Int_iterator'));
final _foobarSetofFoobarListofIntIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_ListOf_Int_iterator_release_handle'));
final _foobarSetofFoobarListofIntIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_foobar_ListOf_Int_iterator_is_valid'));
final _foobarSetofFoobarListofIntIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_ListOf_Int_iterator_increment'));
final _foobarSetofFoobarListofIntIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_ListOf_Int_iterator_get'));
Pointer<Void> foobar_SetOf_foobar_ListOf_Int_toFfi(Set<List<int>> value) {
  final _result = _foobarSetofFoobarListofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = foobar_ListOf_Int_toFfi(element);
    _foobarSetofFoobarListofIntInsert(_result, _elementHandle);
    foobar_ListOf_Int_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<List<int>> foobar_SetOf_foobar_ListOf_Int_fromFfi(Pointer<Void> handle) {
  final result = Set<List<int>>();
  final _iteratorHandle = _foobarSetofFoobarListofIntIterator(handle);
  while (_foobarSetofFoobarListofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofFoobarListofIntIteratorGet(_iteratorHandle);
    try {
      result.add(foobar_ListOf_Int_fromFfi(_elementHandle));
    } finally {
      foobar_ListOf_Int_releaseFfiHandle(_elementHandle);
    }
    _foobarSetofFoobarListofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofFoobarListofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_SetOf_foobar_ListOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobarSetofFoobarListofIntReleaseHandle(handle);
final _foobar_SetOf_foobar_ListOf_IntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_create_handle_nullable'));
final _foobar_SetOf_foobar_ListOf_IntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_release_handle_nullable'));
final _foobar_SetOf_foobar_ListOf_IntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobar_SetOf_foobar_ListOf_Int_toFfi_nullable(Set<List<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_foobar_ListOf_Int_toFfi(value);
  final result = _foobar_SetOf_foobar_ListOf_IntCreateHandleNullable(_handle);
  foobar_SetOf_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
Set<List<int>> foobar_SetOf_foobar_ListOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_foobar_ListOf_IntGetValueNullable(handle);
  final result = foobar_SetOf_foobar_ListOf_Int_fromFfi(_handle);
  foobar_SetOf_foobar_ListOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_foobar_ListOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_foobar_ListOf_IntReleaseHandleNullable(handle);
final _foobarSetofFoobarMapofIntToBooleanCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_create_handle'));
final _foobarSetofFoobarMapofIntToBooleanReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_release_handle'));
final _foobarSetofFoobarMapofIntToBooleanInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_insert'));
final _foobarSetofFoobarMapofIntToBooleanIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator'));
final _foobarSetofFoobarMapofIntToBooleanIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_release_handle'));
final _foobarSetofFoobarMapofIntToBooleanIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_is_valid'));
final _foobarSetofFoobarMapofIntToBooleanIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_increment'));
final _foobarSetofFoobarMapofIntToBooleanIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_iterator_get'));
Pointer<Void> foobar_SetOf_foobar_MapOf_Int_to_Boolean_toFfi(Set<Map<int, bool>> value) {
  final _result = _foobarSetofFoobarMapofIntToBooleanCreateHandle();
  for (final element in value) {
    final _elementHandle = foobar_MapOf_Int_to_Boolean_toFfi(element);
    _foobarSetofFoobarMapofIntToBooleanInsert(_result, _elementHandle);
    foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<Map<int, bool>> foobar_SetOf_foobar_MapOf_Int_to_Boolean_fromFfi(Pointer<Void> handle) {
  final result = Set<Map<int, bool>>();
  final _iteratorHandle = _foobarSetofFoobarMapofIntToBooleanIterator(handle);
  while (_foobarSetofFoobarMapofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofFoobarMapofIntToBooleanIteratorGet(_iteratorHandle);
    try {
      result.add(foobar_MapOf_Int_to_Boolean_fromFfi(_elementHandle));
    } finally {
      foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_elementHandle);
    }
    _foobarSetofFoobarMapofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofFoobarMapofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_SetOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(Pointer<Void> handle) => _foobarSetofFoobarMapofIntToBooleanReleaseHandle(handle);
final _foobar_SetOf_foobar_MapOf_Int_to_BooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobar_SetOf_foobar_MapOf_Int_to_BooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobar_SetOf_foobar_MapOf_Int_to_BooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobar_SetOf_foobar_MapOf_Int_to_Boolean_toFfi_nullable(Set<Map<int, bool>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_foobar_MapOf_Int_to_Boolean_toFfi(value);
  final result = _foobar_SetOf_foobar_MapOf_Int_to_BooleanCreateHandleNullable(_handle);
  foobar_SetOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
Set<Map<int, bool>> foobar_SetOf_foobar_MapOf_Int_to_Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_foobar_MapOf_Int_to_BooleanGetValueNullable(handle);
  final result = foobar_SetOf_foobar_MapOf_Int_to_Boolean_fromFfi(_handle);
  foobar_SetOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_foobar_MapOf_Int_to_Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_foobar_MapOf_Int_to_BooleanReleaseHandleNullable(handle);
final _foobarSetofFoobarSetofIntCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_foobar_SetOf_Int_create_handle'));
final _foobarSetofFoobarSetofIntReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_release_handle'));
final _foobarSetofFoobarSetofIntInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_insert'));
final _foobarSetofFoobarSetofIntIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_SetOf_Int_iterator'));
final _foobarSetofFoobarSetofIntIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_SetOf_Int_iterator_release_handle'));
final _foobarSetofFoobarSetofIntIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_foobar_SetOf_Int_iterator_is_valid'));
final _foobarSetofFoobarSetofIntIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_SetOf_Int_iterator_increment'));
final _foobarSetofFoobarSetofIntIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_foobar_SetOf_Int_iterator_get'));
Pointer<Void> foobar_SetOf_foobar_SetOf_Int_toFfi(Set<Set<int>> value) {
  final _result = _foobarSetofFoobarSetofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = foobar_SetOf_Int_toFfi(element);
    _foobarSetofFoobarSetofIntInsert(_result, _elementHandle);
    foobar_SetOf_Int_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<Set<int>> foobar_SetOf_foobar_SetOf_Int_fromFfi(Pointer<Void> handle) {
  final result = Set<Set<int>>();
  final _iteratorHandle = _foobarSetofFoobarSetofIntIterator(handle);
  while (_foobarSetofFoobarSetofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofFoobarSetofIntIteratorGet(_iteratorHandle);
    try {
      result.add(foobar_SetOf_Int_fromFfi(_elementHandle));
    } finally {
      foobar_SetOf_Int_releaseFfiHandle(_elementHandle);
    }
    _foobarSetofFoobarSetofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofFoobarSetofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_SetOf_foobar_SetOf_Int_releaseFfiHandle(Pointer<Void> handle) => _foobarSetofFoobarSetofIntReleaseHandle(handle);
final _foobar_SetOf_foobar_SetOf_IntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_create_handle_nullable'));
final _foobar_SetOf_foobar_SetOf_IntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_release_handle_nullable'));
final _foobar_SetOf_foobar_SetOf_IntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobar_SetOf_foobar_SetOf_Int_toFfi_nullable(Set<Set<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_foobar_SetOf_Int_toFfi(value);
  final result = _foobar_SetOf_foobar_SetOf_IntCreateHandleNullable(_handle);
  foobar_SetOf_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
Set<Set<int>> foobar_SetOf_foobar_SetOf_Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_foobar_SetOf_IntGetValueNullable(handle);
  final result = foobar_SetOf_foobar_SetOf_Int_fromFfi(_handle);
  foobar_SetOf_foobar_SetOf_Int_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_foobar_SetOf_Int_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_foobar_SetOf_IntReleaseHandleNullable(handle);
final _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_insert'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_release_handle'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_is_valid'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_increment'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_iterator_get'));
Pointer<Void> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(Set<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  final _result = _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(element);
    _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumInsert(_result, _elementHandle);
    smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<GenericTypesWithCompoundTypes_ExternalEnum> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(Pointer<Void> handle) {
  final result = Set<GenericTypesWithCompoundTypes_ExternalEnum>();
  final _iteratorHandle = _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIterator(handle);
  while (_foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_elementHandle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_elementHandle);
    }
    _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(Pointer<Void> handle) => _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandle(handle);
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable'));
Pointer<Void> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi_nullable(Set<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_toFfi(value);
  final result = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumCreateHandleNullable(_handle);
  foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
Set<GenericTypesWithCompoundTypes_ExternalEnum> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumGetValueNullable(handle);
  final result = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_fromFfi(_handle);
  foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnumReleaseHandleNullable(handle);
final _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_insert'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_release_handle'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_is_valid'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_increment'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_iterator_get'));
Pointer<Void> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(Set<GenericTypesWithCompoundTypes_SomeEnum> value) {
  final _result = _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(element);
    _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumInsert(_result, _elementHandle);
    smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<GenericTypesWithCompoundTypes_SomeEnum> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(Pointer<Void> handle) {
  final result = Set<GenericTypesWithCompoundTypes_SomeEnum>();
  final _iteratorHandle = _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIterator(handle);
  while (_foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_elementHandle));
    } finally {
      smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_elementHandle);
    }
    _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(Pointer<Void> handle) => _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandle(handle);
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable'));
final _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable'));
Pointer<Void> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi_nullable(Set<GenericTypesWithCompoundTypes_SomeEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_toFfi(value);
  final result = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnumCreateHandleNullable(_handle);
  foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
Set<GenericTypesWithCompoundTypes_SomeEnum> foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnumGetValueNullable(handle);
  final result = foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_fromFfi(_handle);
  foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnumReleaseHandleNullable(handle);
