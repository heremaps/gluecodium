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
Pointer<Void> foobarListofFloatToFfi(List<double> value) {
  final _result = _foobarListofFloatCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarListofFloatInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
List<double> foobarListofFloatFromFfi(Pointer<Void> handle) {
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
void foobarListofFloatReleaseFfiHandle(Pointer<Void> handle) => _foobarListofFloatReleaseHandle(handle);
final _foobarListofFloatCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Float_create_handle_nullable'));
final _foobarListofFloatReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Float_release_handle_nullable'));
final _foobarListofFloatGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Float_get_value_nullable'));
Pointer<Void> foobarListofFloatToFfiNullable(List<double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofFloatToFfi(value);
  final result = _foobarListofFloatCreateHandleNullable(_handle);
  foobarListofFloatReleaseFfiHandle(_handle);
  return result;
}
List<double> foobarListofFloatFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofFloatGetValueNullable(handle);
  final result = foobarListofFloatFromFfi(_handle);
  foobarListofFloatReleaseFfiHandle(_handle);
  return result;
}
void foobarListofFloatReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofFloatReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofIntToFfi(List<int> value) {
  final _result = _foobarListofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarListofIntInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
List<int> foobarListofIntFromFfi(Pointer<Void> handle) {
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
void foobarListofIntReleaseFfiHandle(Pointer<Void> handle) => _foobarListofIntReleaseHandle(handle);
final _foobarListofIntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Int_create_handle_nullable'));
final _foobarListofIntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_Int_release_handle_nullable'));
final _foobarListofIntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobarListofIntToFfiNullable(List<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofIntToFfi(value);
  final result = _foobarListofIntCreateHandleNullable(_handle);
  foobarListofIntReleaseFfiHandle(_handle);
  return result;
}
List<int> foobarListofIntFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofIntGetValueNullable(handle);
  final result = foobarListofIntFromFfi(_handle);
  foobarListofIntReleaseFfiHandle(_handle);
  return result;
}
void foobarListofIntReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofIntReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofUbyteToFfi(List<int> value) {
  final _result = _foobarListofUbyteCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarListofUbyteInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
List<int> foobarListofUbyteFromFfi(Pointer<Void> handle) {
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
void foobarListofUbyteReleaseFfiHandle(Pointer<Void> handle) => _foobarListofUbyteReleaseHandle(handle);
final _foobarListofUbyteCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_UByte_create_handle_nullable'));
final _foobarListofUbyteReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_UByte_release_handle_nullable'));
final _foobarListofUbyteGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_UByte_get_value_nullable'));
Pointer<Void> foobarListofUbyteToFfiNullable(List<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofUbyteToFfi(value);
  final result = _foobarListofUbyteCreateHandleNullable(_handle);
  foobarListofUbyteReleaseFfiHandle(_handle);
  return result;
}
List<int> foobarListofUbyteFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofUbyteGetValueNullable(handle);
  final result = foobarListofUbyteFromFfi(_handle);
  foobarListofUbyteReleaseFfiHandle(_handle);
  return result;
}
void foobarListofUbyteReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofUbyteReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofFoobarListofIntToFfi(List<List<int>> value) {
  final _result = _foobarListofFoobarListofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = foobarListofIntToFfi(element);
    _foobarListofFoobarListofIntInsert(_result, _elementHandle);
    foobarListofIntReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<List<int>> foobarListofFoobarListofIntFromFfi(Pointer<Void> handle) {
  final result = List<List<int>>.empty(growable: true);
  final _iteratorHandle = _foobarListofFoobarListofIntIterator(handle);
  while (_foobarListofFoobarListofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofFoobarListofIntIteratorGet(_iteratorHandle);
    try {
      result.add(foobarListofIntFromFfi(_elementHandle));
    } finally {
      foobarListofIntReleaseFfiHandle(_elementHandle);
    }
    _foobarListofFoobarListofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarListofFoobarListofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofFoobarListofIntReleaseFfiHandle(Pointer<Void> handle) => _foobarListofFoobarListofIntReleaseHandle(handle);
final _foobarListofFoobarListofIntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_create_handle_nullable'));
final _foobarListofFoobarListofIntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_release_handle_nullable'));
final _foobarListofFoobarListofIntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobarListofFoobarListofIntToFfiNullable(List<List<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofFoobarListofIntToFfi(value);
  final result = _foobarListofFoobarListofIntCreateHandleNullable(_handle);
  foobarListofFoobarListofIntReleaseFfiHandle(_handle);
  return result;
}
List<List<int>> foobarListofFoobarListofIntFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofFoobarListofIntGetValueNullable(handle);
  final result = foobarListofFoobarListofIntFromFfi(_handle);
  foobarListofFoobarListofIntReleaseFfiHandle(_handle);
  return result;
}
void foobarListofFoobarListofIntReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofFoobarListofIntReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofFoobarMapofIntToBooleanToFfi(List<Map<int, bool>> value) {
  final _result = _foobarListofFoobarMapofIntToBooleanCreateHandle();
  for (final element in value) {
    final _elementHandle = foobarMapofIntToBooleanToFfi(element);
    _foobarListofFoobarMapofIntToBooleanInsert(_result, _elementHandle);
    foobarMapofIntToBooleanReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<Map<int, bool>> foobarListofFoobarMapofIntToBooleanFromFfi(Pointer<Void> handle) {
  final result = List<Map<int, bool>>.empty(growable: true);
  final _iteratorHandle = _foobarListofFoobarMapofIntToBooleanIterator(handle);
  while (_foobarListofFoobarMapofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofFoobarMapofIntToBooleanIteratorGet(_iteratorHandle);
    try {
      result.add(foobarMapofIntToBooleanFromFfi(_elementHandle));
    } finally {
      foobarMapofIntToBooleanReleaseFfiHandle(_elementHandle);
    }
    _foobarListofFoobarMapofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarListofFoobarMapofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofFoobarMapofIntToBooleanReleaseFfiHandle(Pointer<Void> handle) => _foobarListofFoobarMapofIntToBooleanReleaseHandle(handle);
final _foobarListofFoobarMapofIntToBooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobarListofFoobarMapofIntToBooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobarListofFoobarMapofIntToBooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobarListofFoobarMapofIntToBooleanToFfiNullable(List<Map<int, bool>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofFoobarMapofIntToBooleanToFfi(value);
  final result = _foobarListofFoobarMapofIntToBooleanCreateHandleNullable(_handle);
  foobarListofFoobarMapofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
List<Map<int, bool>> foobarListofFoobarMapofIntToBooleanFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofFoobarMapofIntToBooleanGetValueNullable(handle);
  final result = foobarListofFoobarMapofIntToBooleanFromFfi(_handle);
  foobarListofFoobarMapofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
void foobarListofFoobarMapofIntToBooleanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofFoobarMapofIntToBooleanReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofFoobarSetofIntToFfi(List<Set<int>> value) {
  final _result = _foobarListofFoobarSetofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = foobarSetofIntToFfi(element);
    _foobarListofFoobarSetofIntInsert(_result, _elementHandle);
    foobarSetofIntReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<Set<int>> foobarListofFoobarSetofIntFromFfi(Pointer<Void> handle) {
  final result = List<Set<int>>.empty(growable: true);
  final _iteratorHandle = _foobarListofFoobarSetofIntIterator(handle);
  while (_foobarListofFoobarSetofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofFoobarSetofIntIteratorGet(_iteratorHandle);
    try {
      result.add(foobarSetofIntFromFfi(_elementHandle));
    } finally {
      foobarSetofIntReleaseFfiHandle(_elementHandle);
    }
    _foobarListofFoobarSetofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarListofFoobarSetofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofFoobarSetofIntReleaseFfiHandle(Pointer<Void> handle) => _foobarListofFoobarSetofIntReleaseHandle(handle);
final _foobarListofFoobarSetofIntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_create_handle_nullable'));
final _foobarListofFoobarSetofIntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_release_handle_nullable'));
final _foobarListofFoobarSetofIntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobarListofFoobarSetofIntToFfiNullable(List<Set<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofFoobarSetofIntToFfi(value);
  final result = _foobarListofFoobarSetofIntCreateHandleNullable(_handle);
  foobarListofFoobarSetofIntReleaseFfiHandle(_handle);
  return result;
}
List<Set<int>> foobarListofFoobarSetofIntFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofFoobarSetofIntGetValueNullable(handle);
  final result = foobarListofFoobarSetofIntFromFfi(_handle);
  foobarListofFoobarSetofIntReleaseFfiHandle(_handle);
  return result;
}
void foobarListofFoobarSetofIntReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofFoobarSetofIntReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofSmokeAnotherdummyclassToFfi(List<AnotherDummyClass> value) {
  final _result = _foobarListofSmokeAnotherdummyclassCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeAnotherdummyclassToFfi(element);
    _foobarListofSmokeAnotherdummyclassInsert(_result, _elementHandle);
    smokeAnotherdummyclassReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<AnotherDummyClass> foobarListofSmokeAnotherdummyclassFromFfi(Pointer<Void> handle) {
  final result = List<AnotherDummyClass>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeAnotherdummyclassIterator(handle);
  while (_foobarListofSmokeAnotherdummyclassIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeAnotherdummyclassIteratorGet(_iteratorHandle);
    try {
      result.add(smokeAnotherdummyclassFromFfi(_elementHandle));
    } finally {
      smokeAnotherdummyclassReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeAnotherdummyclassIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeAnotherdummyclassIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeAnotherdummyclassReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeAnotherdummyclassReleaseHandle(handle);
final _foobarListofSmokeAnotherdummyclassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_create_handle_nullable'));
final _foobarListofSmokeAnotherdummyclassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_release_handle_nullable'));
final _foobarListofSmokeAnotherdummyclassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_AnotherDummyClass_get_value_nullable'));
Pointer<Void> foobarListofSmokeAnotherdummyclassToFfiNullable(List<AnotherDummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeAnotherdummyclassToFfi(value);
  final result = _foobarListofSmokeAnotherdummyclassCreateHandleNullable(_handle);
  foobarListofSmokeAnotherdummyclassReleaseFfiHandle(_handle);
  return result;
}
List<AnotherDummyClass> foobarListofSmokeAnotherdummyclassFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeAnotherdummyclassGetValueNullable(handle);
  final result = foobarListofSmokeAnotherdummyclassFromFfi(_handle);
  foobarListofSmokeAnotherdummyclassReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeAnotherdummyclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeAnotherdummyclassReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofSmokeDummyclassToFfi(List<DummyClass> value) {
  final _result = _foobarListofSmokeDummyclassCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeDummyclassToFfi(element);
    _foobarListofSmokeDummyclassInsert(_result, _elementHandle);
    smokeDummyclassReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<DummyClass> foobarListofSmokeDummyclassFromFfi(Pointer<Void> handle) {
  final result = List<DummyClass>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeDummyclassIterator(handle);
  while (_foobarListofSmokeDummyclassIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeDummyclassIteratorGet(_iteratorHandle);
    try {
      result.add(smokeDummyclassFromFfi(_elementHandle));
    } finally {
      smokeDummyclassReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeDummyclassIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeDummyclassIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeDummyclassReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeDummyclassReleaseHandle(handle);
final _foobarListofSmokeDummyclassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_create_handle_nullable'));
final _foobarListofSmokeDummyclassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_release_handle_nullable'));
final _foobarListofSmokeDummyclassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyClass_get_value_nullable'));
Pointer<Void> foobarListofSmokeDummyclassToFfiNullable(List<DummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeDummyclassToFfi(value);
  final result = _foobarListofSmokeDummyclassCreateHandleNullable(_handle);
  foobarListofSmokeDummyclassReleaseFfiHandle(_handle);
  return result;
}
List<DummyClass> foobarListofSmokeDummyclassFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeDummyclassGetValueNullable(handle);
  final result = foobarListofSmokeDummyclassFromFfi(_handle);
  foobarListofSmokeDummyclassReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeDummyclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeDummyclassReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofSmokeDummyinterfaceToFfi(List<DummyInterface> value) {
  final _result = _foobarListofSmokeDummyinterfaceCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeDummyinterfaceToFfi(element);
    _foobarListofSmokeDummyinterfaceInsert(_result, _elementHandle);
    smokeDummyinterfaceReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<DummyInterface> foobarListofSmokeDummyinterfaceFromFfi(Pointer<Void> handle) {
  final result = List<DummyInterface>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeDummyinterfaceIterator(handle);
  while (_foobarListofSmokeDummyinterfaceIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeDummyinterfaceIteratorGet(_iteratorHandle);
    try {
      result.add(smokeDummyinterfaceFromFfi(_elementHandle));
    } finally {
      smokeDummyinterfaceReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeDummyinterfaceIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeDummyinterfaceIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeDummyinterfaceReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeDummyinterfaceReleaseHandle(handle);
final _foobarListofSmokeDummyinterfaceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_create_handle_nullable'));
final _foobarListofSmokeDummyinterfaceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_release_handle_nullable'));
final _foobarListofSmokeDummyinterfaceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DummyInterface_get_value_nullable'));
Pointer<Void> foobarListofSmokeDummyinterfaceToFfiNullable(List<DummyInterface> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeDummyinterfaceToFfi(value);
  final result = _foobarListofSmokeDummyinterfaceCreateHandleNullable(_handle);
  foobarListofSmokeDummyinterfaceReleaseFfiHandle(_handle);
  return result;
}
List<DummyInterface> foobarListofSmokeDummyinterfaceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeDummyinterfaceGetValueNullable(handle);
  final result = foobarListofSmokeDummyinterfaceFromFfi(_handle);
  foobarListofSmokeDummyinterfaceReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeDummyinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeDummyinterfaceReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofSmokeGenerictypeswithcompoundtypesBasicstructToFfi(List<GenericTypesWithCompoundTypes_BasicStruct> value) {
  final _result = _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeGenerictypeswithcompoundtypesBasicstructToFfi(element);
    _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructInsert(_result, _elementHandle);
    smokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_BasicStruct> foobarListofSmokeGenerictypeswithcompoundtypesBasicstructFromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_BasicStruct>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIterator(handle);
  while (_foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorGet(_iteratorHandle);
    try {
      result.add(smokeGenerictypeswithcompoundtypesBasicstructFromFfi(_elementHandle));
    } finally {
      smokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructReleaseHandle(handle);
final _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable'));
final _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable'));
final _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable'));
Pointer<Void> foobarListofSmokeGenerictypeswithcompoundtypesBasicstructToFfiNullable(List<GenericTypesWithCompoundTypes_BasicStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeGenerictypeswithcompoundtypesBasicstructToFfi(value);
  final result = _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructCreateHandleNullable(_handle);
  foobarListofSmokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_BasicStruct> foobarListofSmokeGenerictypeswithcompoundtypesBasicstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructGetValueNullable(handle);
  final result = foobarListofSmokeGenerictypeswithcompoundtypesBasicstructFromFfi(_handle);
  foobarListofSmokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeGenerictypeswithcompoundtypesBasicstructReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofSmokeGenerictypeswithcompoundtypesExternalenumToFfi(List<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  final _result = _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeGenerictypeswithcompoundtypesExternalenumToFfi(element);
    _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumInsert(_result, _elementHandle);
    smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_ExternalEnum> foobarListofSmokeGenerictypeswithcompoundtypesExternalenumFromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_ExternalEnum>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIterator(handle);
  while (_foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorGet(_iteratorHandle);
    try {
      result.add(smokeGenerictypeswithcompoundtypesExternalenumFromFfi(_elementHandle));
    } finally {
      smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandle(handle);
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable'));
Pointer<Void> foobarListofSmokeGenerictypeswithcompoundtypesExternalenumToFfiNullable(List<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeGenerictypeswithcompoundtypesExternalenumToFfi(value);
  final result = _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumCreateHandleNullable(_handle);
  foobarListofSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_ExternalEnum> foobarListofSmokeGenerictypeswithcompoundtypesExternalenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumGetValueNullable(handle);
  final result = foobarListofSmokeGenerictypeswithcompoundtypesExternalenumFromFfi(_handle);
  foobarListofSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofSmokeGenerictypeswithcompoundtypesExternalstructToFfi(List<GenericTypesWithCompoundTypes_ExternalStruct> value) {
  final _result = _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeGenerictypeswithcompoundtypesExternalstructToFfi(element);
    _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructInsert(_result, _elementHandle);
    smokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_ExternalStruct> foobarListofSmokeGenerictypeswithcompoundtypesExternalstructFromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_ExternalStruct>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIterator(handle);
  while (_foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorGet(_iteratorHandle);
    try {
      result.add(smokeGenerictypeswithcompoundtypesExternalstructFromFfi(_elementHandle));
    } finally {
      smokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructReleaseHandle(handle);
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable'));
final _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable'));
Pointer<Void> foobarListofSmokeGenerictypeswithcompoundtypesExternalstructToFfiNullable(List<GenericTypesWithCompoundTypes_ExternalStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeGenerictypeswithcompoundtypesExternalstructToFfi(value);
  final result = _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructCreateHandleNullable(_handle);
  foobarListofSmokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_ExternalStruct> foobarListofSmokeGenerictypeswithcompoundtypesExternalstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructGetValueNullable(handle);
  final result = foobarListofSmokeGenerictypeswithcompoundtypesExternalstructFromFfi(_handle);
  foobarListofSmokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeGenerictypeswithcompoundtypesExternalstructReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofSmokeGenerictypeswithcompoundtypesSomeenumToFfi(List<GenericTypesWithCompoundTypes_SomeEnum> value) {
  final _result = _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeGenerictypeswithcompoundtypesSomeenumToFfi(element);
    _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumInsert(_result, _elementHandle);
    smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<GenericTypesWithCompoundTypes_SomeEnum> foobarListofSmokeGenerictypeswithcompoundtypesSomeenumFromFfi(Pointer<Void> handle) {
  final result = List<GenericTypesWithCompoundTypes_SomeEnum>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIterator(handle);
  while (_foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorGet(_iteratorHandle);
    try {
      result.add(smokeGenerictypeswithcompoundtypesSomeenumFromFfi(_elementHandle));
    } finally {
      smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandle(handle);
final _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable'));
final _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable'));
final _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable'));
Pointer<Void> foobarListofSmokeGenerictypeswithcompoundtypesSomeenumToFfiNullable(List<GenericTypesWithCompoundTypes_SomeEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeGenerictypeswithcompoundtypesSomeenumToFfi(value);
  final result = _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumCreateHandleNullable(_handle);
  foobarListofSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_handle);
  return result;
}
List<GenericTypesWithCompoundTypes_SomeEnum> foobarListofSmokeGenerictypeswithcompoundtypesSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumGetValueNullable(handle);
  final result = foobarListofSmokeGenerictypeswithcompoundtypesSomeenumFromFfi(_handle);
  foobarListofSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofSmokeUnreasonablylazyclassToFfi(List<UnreasonablyLazyClass> value) {
  final _result = _foobarListofSmokeUnreasonablylazyclassCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeUnreasonablylazyclassToFfi(element);
    _foobarListofSmokeUnreasonablylazyclassInsert(_result, _elementHandle);
    smokeUnreasonablylazyclassReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<UnreasonablyLazyClass> foobarListofSmokeUnreasonablylazyclassFromFfi(Pointer<Void> handle) {
  final result = List<UnreasonablyLazyClass>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeUnreasonablylazyclassIterator(handle);
  while (_foobarListofSmokeUnreasonablylazyclassIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeUnreasonablylazyclassIteratorGet(_iteratorHandle);
    try {
      result.add(smokeUnreasonablylazyclassFromFfi(_elementHandle));
    } finally {
      smokeUnreasonablylazyclassReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeUnreasonablylazyclassIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeUnreasonablylazyclassIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeUnreasonablylazyclassReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeUnreasonablylazyclassReleaseHandle(handle);
final _foobarListofSmokeUnreasonablylazyclassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_UnreasonablyLazyClass_create_handle_nullable'));
final _foobarListofSmokeUnreasonablylazyclassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_UnreasonablyLazyClass_release_handle_nullable'));
final _foobarListofSmokeUnreasonablylazyclassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_UnreasonablyLazyClass_get_value_nullable'));
Pointer<Void> foobarListofSmokeUnreasonablylazyclassToFfiNullable(List<UnreasonablyLazyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeUnreasonablylazyclassToFfi(value);
  final result = _foobarListofSmokeUnreasonablylazyclassCreateHandleNullable(_handle);
  foobarListofSmokeUnreasonablylazyclassReleaseFfiHandle(_handle);
  return result;
}
List<UnreasonablyLazyClass> foobarListofSmokeUnreasonablylazyclassFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeUnreasonablylazyclassGetValueNullable(handle);
  final result = foobarListofSmokeUnreasonablylazyclassFromFfi(_handle);
  foobarListofSmokeUnreasonablylazyclassReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeUnreasonablylazyclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeUnreasonablylazyclassReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofSmokeVerybigstructToFfi(List<VeryBigStruct> value) {
  final _result = _foobarListofSmokeVerybigstructCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeVerybigstructToFfi(element);
    _foobarListofSmokeVerybigstructInsert(_result, _elementHandle);
    smokeVerybigstructReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<VeryBigStruct> foobarListofSmokeVerybigstructFromFfi(Pointer<Void> handle) {
  final result = List<VeryBigStruct>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeVerybigstructIterator(handle);
  while (_foobarListofSmokeVerybigstructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeVerybigstructIteratorGet(_iteratorHandle);
    try {
      result.add(smokeVerybigstructFromFfi(_elementHandle));
    } finally {
      smokeVerybigstructReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeVerybigstructIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeVerybigstructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeVerybigstructReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeVerybigstructReleaseHandle(handle);
final _foobarListofSmokeVerybigstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_VeryBigStruct_create_handle_nullable'));
final _foobarListofSmokeVerybigstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_VeryBigStruct_release_handle_nullable'));
final _foobarListofSmokeVerybigstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_VeryBigStruct_get_value_nullable'));
Pointer<Void> foobarListofSmokeVerybigstructToFfiNullable(List<VeryBigStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeVerybigstructToFfi(value);
  final result = _foobarListofSmokeVerybigstructCreateHandleNullable(_handle);
  foobarListofSmokeVerybigstructReleaseFfiHandle(_handle);
  return result;
}
List<VeryBigStruct> foobarListofSmokeVerybigstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeVerybigstructGetValueNullable(handle);
  final result = foobarListofSmokeVerybigstructFromFfi(_handle);
  foobarListofSmokeVerybigstructReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeVerybigstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeVerybigstructReleaseHandleNullable(handle);
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
Pointer<Void> foobarListofSmokeYetanotherdummyclassToFfi(List<YetAnotherDummyClass> value) {
  final _result = _foobarListofSmokeYetanotherdummyclassCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeYetanotherdummyclassToFfi(element);
    _foobarListofSmokeYetanotherdummyclassInsert(_result, _elementHandle);
    smokeYetanotherdummyclassReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<YetAnotherDummyClass> foobarListofSmokeYetanotherdummyclassFromFfi(Pointer<Void> handle) {
  final result = List<YetAnotherDummyClass>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeYetanotherdummyclassIterator(handle);
  while (_foobarListofSmokeYetanotherdummyclassIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeYetanotherdummyclassIteratorGet(_iteratorHandle);
    try {
      result.add(smokeYetanotherdummyclassFromFfi(_elementHandle));
    } finally {
      smokeYetanotherdummyclassReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeYetanotherdummyclassIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeYetanotherdummyclassIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeYetanotherdummyclassReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeYetanotherdummyclassReleaseHandle(handle);
final _foobarListofSmokeYetanotherdummyclassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_create_handle_nullable'));
final _foobarListofSmokeYetanotherdummyclassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_release_handle_nullable'));
final _foobarListofSmokeYetanotherdummyclassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_YetAnotherDummyClass_get_value_nullable'));
Pointer<Void> foobarListofSmokeYetanotherdummyclassToFfiNullable(List<YetAnotherDummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeYetanotherdummyclassToFfi(value);
  final result = _foobarListofSmokeYetanotherdummyclassCreateHandleNullable(_handle);
  foobarListofSmokeYetanotherdummyclassReleaseFfiHandle(_handle);
  return result;
}
List<YetAnotherDummyClass> foobarListofSmokeYetanotherdummyclassFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeYetanotherdummyclassGetValueNullable(handle);
  final result = foobarListofSmokeYetanotherdummyclassFromFfi(_handle);
  foobarListofSmokeYetanotherdummyclassReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeYetanotherdummyclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeYetanotherdummyclassReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofFloatToDoubleToFfi(Map<double, double> value) {
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
Map<double, double> foobarMapofFloatToDoubleFromFfi(Pointer<Void> handle) {
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
void foobarMapofFloatToDoubleReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofFloatToDoubleReleaseHandle(handle);
final _foobarMapofFloatToDoubleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Float_to_Double_create_handle_nullable'));
final _foobarMapofFloatToDoubleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Float_to_Double_release_handle_nullable'));
final _foobarMapofFloatToDoubleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Float_to_Double_get_value_nullable'));
Pointer<Void> foobarMapofFloatToDoubleToFfiNullable(Map<double, double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofFloatToDoubleToFfi(value);
  final result = _foobarMapofFloatToDoubleCreateHandleNullable(_handle);
  foobarMapofFloatToDoubleReleaseFfiHandle(_handle);
  return result;
}
Map<double, double> foobarMapofFloatToDoubleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofFloatToDoubleGetValueNullable(handle);
  final result = foobarMapofFloatToDoubleFromFfi(_handle);
  foobarMapofFloatToDoubleReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofFloatToDoubleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofFloatToDoubleReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofIntToBooleanToFfi(Map<int, bool> value) {
  final _result = _foobarMapofIntToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = booleanToFfi(entry.value);
    _foobarMapofIntToBooleanPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    booleanReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, bool> foobarMapofIntToBooleanFromFfi(Pointer<Void> handle) {
  final result = Map<int, bool>();
  final _iteratorHandle = _foobarMapofIntToBooleanIterator(handle);
  while (_foobarMapofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        booleanFromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      booleanReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofIntToBooleanReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToBooleanReleaseHandle(handle);
final _foobarMapofIntToBooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobarMapofIntToBooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobarMapofIntToBooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobarMapofIntToBooleanToFfiNullable(Map<int, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofIntToBooleanToFfi(value);
  final result = _foobarMapofIntToBooleanCreateHandleNullable(_handle);
  foobarMapofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
Map<int, bool> foobarMapofIntToBooleanFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofIntToBooleanGetValueNullable(handle);
  final result = foobarMapofIntToBooleanFromFfi(_handle);
  foobarMapofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofIntToBooleanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofIntToBooleanReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofIntToFoobarListofIntToFfi(Map<int, List<int>> value) {
  final _result = _foobarMapofIntToFoobarListofIntCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = foobarListofIntToFfi(entry.value);
    _foobarMapofIntToFoobarListofIntPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    foobarListofIntReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, List<int>> foobarMapofIntToFoobarListofIntFromFfi(Pointer<Void> handle) {
  final result = Map<int, List<int>>();
  final _iteratorHandle = _foobarMapofIntToFoobarListofIntIterator(handle);
  while (_foobarMapofIntToFoobarListofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToFoobarListofIntIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToFoobarListofIntIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        foobarListofIntFromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      foobarListofIntReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToFoobarListofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToFoobarListofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofIntToFoobarListofIntReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToFoobarListofIntReleaseHandle(handle);
final _foobarMapofIntToFoobarListofIntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_create_handle_nullable'));
final _foobarMapofIntToFoobarListofIntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_release_handle_nullable'));
final _foobarMapofIntToFoobarListofIntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobarMapofIntToFoobarListofIntToFfiNullable(Map<int, List<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofIntToFoobarListofIntToFfi(value);
  final result = _foobarMapofIntToFoobarListofIntCreateHandleNullable(_handle);
  foobarMapofIntToFoobarListofIntReleaseFfiHandle(_handle);
  return result;
}
Map<int, List<int>> foobarMapofIntToFoobarListofIntFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofIntToFoobarListofIntGetValueNullable(handle);
  final result = foobarMapofIntToFoobarListofIntFromFfi(_handle);
  foobarMapofIntToFoobarListofIntReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofIntToFoobarListofIntReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofIntToFoobarListofIntReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofIntToFoobarMapofIntToBooleanToFfi(Map<int, Map<int, bool>> value) {
  final _result = _foobarMapofIntToFoobarMapofIntToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = foobarMapofIntToBooleanToFfi(entry.value);
    _foobarMapofIntToFoobarMapofIntToBooleanPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    foobarMapofIntToBooleanReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, Map<int, bool>> foobarMapofIntToFoobarMapofIntToBooleanFromFfi(Pointer<Void> handle) {
  final result = Map<int, Map<int, bool>>();
  final _iteratorHandle = _foobarMapofIntToFoobarMapofIntToBooleanIterator(handle);
  while (_foobarMapofIntToFoobarMapofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToFoobarMapofIntToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToFoobarMapofIntToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        foobarMapofIntToBooleanFromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      foobarMapofIntToBooleanReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToFoobarMapofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToFoobarMapofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofIntToFoobarMapofIntToBooleanReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToFoobarMapofIntToBooleanReleaseHandle(handle);
final _foobarMapofIntToFoobarMapofIntToBooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobarMapofIntToFoobarMapofIntToBooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobarMapofIntToFoobarMapofIntToBooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobarMapofIntToFoobarMapofIntToBooleanToFfiNullable(Map<int, Map<int, bool>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofIntToFoobarMapofIntToBooleanToFfi(value);
  final result = _foobarMapofIntToFoobarMapofIntToBooleanCreateHandleNullable(_handle);
  foobarMapofIntToFoobarMapofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
Map<int, Map<int, bool>> foobarMapofIntToFoobarMapofIntToBooleanFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofIntToFoobarMapofIntToBooleanGetValueNullable(handle);
  final result = foobarMapofIntToFoobarMapofIntToBooleanFromFfi(_handle);
  foobarMapofIntToFoobarMapofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofIntToFoobarMapofIntToBooleanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofIntToFoobarMapofIntToBooleanReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofIntToFoobarSetofIntToFfi(Map<int, Set<int>> value) {
  final _result = _foobarMapofIntToFoobarSetofIntCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = foobarSetofIntToFfi(entry.value);
    _foobarMapofIntToFoobarSetofIntPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    foobarSetofIntReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, Set<int>> foobarMapofIntToFoobarSetofIntFromFfi(Pointer<Void> handle) {
  final result = Map<int, Set<int>>();
  final _iteratorHandle = _foobarMapofIntToFoobarSetofIntIterator(handle);
  while (_foobarMapofIntToFoobarSetofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToFoobarSetofIntIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToFoobarSetofIntIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        foobarSetofIntFromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      foobarSetofIntReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToFoobarSetofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToFoobarSetofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofIntToFoobarSetofIntReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToFoobarSetofIntReleaseHandle(handle);
final _foobarMapofIntToFoobarSetofIntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_create_handle_nullable'));
final _foobarMapofIntToFoobarSetofIntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_release_handle_nullable'));
final _foobarMapofIntToFoobarSetofIntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobarMapofIntToFoobarSetofIntToFfiNullable(Map<int, Set<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofIntToFoobarSetofIntToFfi(value);
  final result = _foobarMapofIntToFoobarSetofIntCreateHandleNullable(_handle);
  foobarMapofIntToFoobarSetofIntReleaseFfiHandle(_handle);
  return result;
}
Map<int, Set<int>> foobarMapofIntToFoobarSetofIntFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofIntToFoobarSetofIntGetValueNullable(handle);
  final result = foobarMapofIntToFoobarSetofIntFromFfi(_handle);
  foobarMapofIntToFoobarSetofIntReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofIntToFoobarSetofIntReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofIntToFoobarSetofIntReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofIntToSmokeDummyclassToFfi(Map<int, DummyClass> value) {
  final _result = _foobarMapofIntToSmokeDummyclassCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = smokeDummyclassToFfi(entry.value);
    _foobarMapofIntToSmokeDummyclassPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    smokeDummyclassReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, DummyClass> foobarMapofIntToSmokeDummyclassFromFfi(Pointer<Void> handle) {
  final result = Map<int, DummyClass>();
  final _iteratorHandle = _foobarMapofIntToSmokeDummyclassIterator(handle);
  while (_foobarMapofIntToSmokeDummyclassIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToSmokeDummyclassIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToSmokeDummyclassIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        smokeDummyclassFromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      smokeDummyclassReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToSmokeDummyclassIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToSmokeDummyclassIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofIntToSmokeDummyclassReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToSmokeDummyclassReleaseHandle(handle);
final _foobarMapofIntToSmokeDummyclassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_create_handle_nullable'));
final _foobarMapofIntToSmokeDummyclassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_release_handle_nullable'));
final _foobarMapofIntToSmokeDummyclassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyClass_get_value_nullable'));
Pointer<Void> foobarMapofIntToSmokeDummyclassToFfiNullable(Map<int, DummyClass> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofIntToSmokeDummyclassToFfi(value);
  final result = _foobarMapofIntToSmokeDummyclassCreateHandleNullable(_handle);
  foobarMapofIntToSmokeDummyclassReleaseFfiHandle(_handle);
  return result;
}
Map<int, DummyClass> foobarMapofIntToSmokeDummyclassFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofIntToSmokeDummyclassGetValueNullable(handle);
  final result = foobarMapofIntToSmokeDummyclassFromFfi(_handle);
  foobarMapofIntToSmokeDummyclassReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofIntToSmokeDummyclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofIntToSmokeDummyclassReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofIntToSmokeDummyinterfaceToFfi(Map<int, DummyInterface> value) {
  final _result = _foobarMapofIntToSmokeDummyinterfaceCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = smokeDummyinterfaceToFfi(entry.value);
    _foobarMapofIntToSmokeDummyinterfacePut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    smokeDummyinterfaceReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, DummyInterface> foobarMapofIntToSmokeDummyinterfaceFromFfi(Pointer<Void> handle) {
  final result = Map<int, DummyInterface>();
  final _iteratorHandle = _foobarMapofIntToSmokeDummyinterfaceIterator(handle);
  while (_foobarMapofIntToSmokeDummyinterfaceIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToSmokeDummyinterfaceIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToSmokeDummyinterfaceIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        smokeDummyinterfaceFromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      smokeDummyinterfaceReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToSmokeDummyinterfaceIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToSmokeDummyinterfaceIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofIntToSmokeDummyinterfaceReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToSmokeDummyinterfaceReleaseHandle(handle);
final _foobarMapofIntToSmokeDummyinterfaceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_create_handle_nullable'));
final _foobarMapofIntToSmokeDummyinterfaceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_release_handle_nullable'));
final _foobarMapofIntToSmokeDummyinterfaceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_DummyInterface_get_value_nullable'));
Pointer<Void> foobarMapofIntToSmokeDummyinterfaceToFfiNullable(Map<int, DummyInterface> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofIntToSmokeDummyinterfaceToFfi(value);
  final result = _foobarMapofIntToSmokeDummyinterfaceCreateHandleNullable(_handle);
  foobarMapofIntToSmokeDummyinterfaceReleaseFfiHandle(_handle);
  return result;
}
Map<int, DummyInterface> foobarMapofIntToSmokeDummyinterfaceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofIntToSmokeDummyinterfaceGetValueNullable(handle);
  final result = foobarMapofIntToSmokeDummyinterfaceFromFfi(_handle);
  foobarMapofIntToSmokeDummyinterfaceReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofIntToSmokeDummyinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofIntToSmokeDummyinterfaceReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumToFfi(Map<int, GenericTypesWithCompoundTypes_ExternalEnum> value) {
  final _result = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = smokeGenerictypeswithcompoundtypesExternalenumToFfi(entry.value);
    _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, GenericTypesWithCompoundTypes_ExternalEnum> foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumFromFfi(Pointer<Void> handle) {
  final result = Map<int, GenericTypesWithCompoundTypes_ExternalEnum>();
  final _iteratorHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIterator(handle);
  while (_foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        smokeGenerictypeswithcompoundtypesExternalenumFromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandle(handle);
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable'));
Pointer<Void> foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumToFfiNullable(Map<int, GenericTypesWithCompoundTypes_ExternalEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumToFfi(value);
  final result = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumCreateHandleNullable(_handle);
  foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_handle);
  return result;
}
Map<int, GenericTypesWithCompoundTypes_ExternalEnum> foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumGetValueNullable(handle);
  final result = foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumFromFfi(_handle);
  foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofIntToSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumToFfi(Map<int, GenericTypesWithCompoundTypes_SomeEnum> value) {
  final _result = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = smokeGenerictypeswithcompoundtypesSomeenumToFfi(entry.value);
    _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, GenericTypesWithCompoundTypes_SomeEnum> foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumFromFfi(Pointer<Void> handle) {
  final result = Map<int, GenericTypesWithCompoundTypes_SomeEnum>();
  final _iteratorHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIterator(handle);
  while (_foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        smokeGenerictypeswithcompoundtypesSomeenumFromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandle(handle);
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable'));
final _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_Int_to_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable'));
Pointer<Void> foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumToFfiNullable(Map<int, GenericTypesWithCompoundTypes_SomeEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumToFfi(value);
  final result = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumCreateHandleNullable(_handle);
  foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_handle);
  return result;
}
Map<int, GenericTypesWithCompoundTypes_SomeEnum> foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumGetValueNullable(handle);
  final result = foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumFromFfi(_handle);
  foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofIntToSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofStringToStringToFfi(Map<String, String> value) {
  final _result = _foobarMapofStringToStringCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = stringToFfi(entry.key);
    final _valueHandle = stringToFfi(entry.value);
    _foobarMapofStringToStringPut(_result, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<String, String> foobarMapofStringToStringFromFfi(Pointer<Void> handle) {
  final result = Map<String, String>();
  final _iteratorHandle = _foobarMapofStringToStringIterator(handle);
  while (_foobarMapofStringToStringIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofStringToStringIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofStringToStringIteratorGetValue(_iteratorHandle);
    try {
      result[stringFromFfi(_keyHandle)] =
        stringFromFfi(_valueHandle);
    } finally {
      stringReleaseFfiHandle(_keyHandle);
      stringReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofStringToStringIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofStringToStringIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofStringToStringReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofStringToStringReleaseHandle(handle);
final _foobarMapofStringToStringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_create_handle_nullable'));
final _foobarMapofStringToStringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_release_handle_nullable'));
final _foobarMapofStringToStringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_String_get_value_nullable'));
Pointer<Void> foobarMapofStringToStringToFfiNullable(Map<String, String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofStringToStringToFfi(value);
  final result = _foobarMapofStringToStringCreateHandleNullable(_handle);
  foobarMapofStringToStringReleaseFfiHandle(_handle);
  return result;
}
Map<String, String> foobarMapofStringToStringFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofStringToStringGetValueNullable(handle);
  final result = foobarMapofStringToStringFromFfi(_handle);
  foobarMapofStringToStringReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofStringToStringReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofStringToStringReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructToFfi(Map<String, GenericTypesWithCompoundTypes_BasicStruct> value) {
  final _result = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = stringToFfi(entry.key);
    final _valueHandle = smokeGenerictypeswithcompoundtypesBasicstructToFfi(entry.value);
    _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructPut(_result, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);
    smokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<String, GenericTypesWithCompoundTypes_BasicStruct> foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructFromFfi(Pointer<Void> handle) {
  final result = Map<String, GenericTypesWithCompoundTypes_BasicStruct>();
  final _iteratorHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIterator(handle);
  while (_foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorGetValue(_iteratorHandle);
    try {
      result[stringFromFfi(_keyHandle)] =
        smokeGenerictypeswithcompoundtypesBasicstructFromFfi(_valueHandle);
    } finally {
      stringReleaseFfiHandle(_keyHandle);
      smokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructReleaseHandle(handle);
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_create_handle_nullable'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_release_handle_nullable'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_BasicStruct_get_value_nullable'));
Pointer<Void> foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructToFfiNullable(Map<String, GenericTypesWithCompoundTypes_BasicStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructToFfi(value);
  final result = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructCreateHandleNullable(_handle);
  foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_handle);
  return result;
}
Map<String, GenericTypesWithCompoundTypes_BasicStruct> foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructGetValueNullable(handle);
  final result = foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructFromFfi(_handle);
  foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofStringToSmokeGenerictypeswithcompoundtypesBasicstructReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructToFfi(Map<String, GenericTypesWithCompoundTypes_ExternalStruct> value) {
  final _result = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = stringToFfi(entry.key);
    final _valueHandle = smokeGenerictypeswithcompoundtypesExternalstructToFfi(entry.value);
    _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructPut(_result, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);
    smokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<String, GenericTypesWithCompoundTypes_ExternalStruct> foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructFromFfi(Pointer<Void> handle) {
  final result = Map<String, GenericTypesWithCompoundTypes_ExternalStruct>();
  final _iteratorHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIterator(handle);
  while (_foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorGetValue(_iteratorHandle);
    try {
      result[stringFromFfi(_keyHandle)] =
        smokeGenerictypeswithcompoundtypesExternalstructFromFfi(_valueHandle);
    } finally {
      stringReleaseFfiHandle(_keyHandle);
      smokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructReleaseHandle(handle);
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_create_handle_nullable'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_release_handle_nullable'));
final _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_String_to_smoke_GenericTypesWithCompoundTypes_ExternalStruct_get_value_nullable'));
Pointer<Void> foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructToFfiNullable(Map<String, GenericTypesWithCompoundTypes_ExternalStruct> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructToFfi(value);
  final result = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructCreateHandleNullable(_handle);
  foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(_handle);
  return result;
}
Map<String, GenericTypesWithCompoundTypes_ExternalStruct> foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructGetValueNullable(handle);
  final result = foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructFromFfi(_handle);
  foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofStringToSmokeGenerictypeswithcompoundtypesExternalstructReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofUbyteToStringToFfi(Map<int, String> value) {
  final _result = _foobarMapofUbyteToStringCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = (entry.key);
    final _valueHandle = stringToFfi(entry.value);
    _foobarMapofUbyteToStringPut(_result, _keyHandle, _valueHandle);
    (_keyHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<int, String> foobarMapofUbyteToStringFromFfi(Pointer<Void> handle) {
  final result = Map<int, String>();
  final _iteratorHandle = _foobarMapofUbyteToStringIterator(handle);
  while (_foobarMapofUbyteToStringIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofUbyteToStringIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofUbyteToStringIteratorGetValue(_iteratorHandle);
    try {
      result[(_keyHandle)] =
        stringFromFfi(_valueHandle);
    } finally {
      (_keyHandle);
      stringReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofUbyteToStringIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofUbyteToStringIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofUbyteToStringReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofUbyteToStringReleaseHandle(handle);
final _foobarMapofUbyteToStringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_create_handle_nullable'));
final _foobarMapofUbyteToStringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_release_handle_nullable'));
final _foobarMapofUbyteToStringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_UByte_to_String_get_value_nullable'));
Pointer<Void> foobarMapofUbyteToStringToFfiNullable(Map<int, String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofUbyteToStringToFfi(value);
  final result = _foobarMapofUbyteToStringCreateHandleNullable(_handle);
  foobarMapofUbyteToStringReleaseFfiHandle(_handle);
  return result;
}
Map<int, String> foobarMapofUbyteToStringFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofUbyteToStringGetValueNullable(handle);
  final result = foobarMapofUbyteToStringFromFfi(_handle);
  foobarMapofUbyteToStringReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofUbyteToStringReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofUbyteToStringReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofFoobarListofIntToBooleanToFfi(Map<List<int>, bool> value) {
  final _result = _foobarMapofFoobarListofIntToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = foobarListofIntToFfi(entry.key);
    final _valueHandle = booleanToFfi(entry.value);
    _foobarMapofFoobarListofIntToBooleanPut(_result, _keyHandle, _valueHandle);
    foobarListofIntReleaseFfiHandle(_keyHandle);
    booleanReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<List<int>, bool> foobarMapofFoobarListofIntToBooleanFromFfi(Pointer<Void> handle) {
  final result = Map<List<int>, bool>();
  final _iteratorHandle = _foobarMapofFoobarListofIntToBooleanIterator(handle);
  while (_foobarMapofFoobarListofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofFoobarListofIntToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofFoobarListofIntToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[foobarListofIntFromFfi(_keyHandle)] =
        booleanFromFfi(_valueHandle);
    } finally {
      foobarListofIntReleaseFfiHandle(_keyHandle);
      booleanReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofFoobarListofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofFoobarListofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofFoobarListofIntToBooleanReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofFoobarListofIntToBooleanReleaseHandle(handle);
final _foobarMapofFoobarListofIntToBooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_create_handle_nullable'));
final _foobarMapofFoobarListofIntToBooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_release_handle_nullable'));
final _foobarMapofFoobarListofIntToBooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_ListOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobarMapofFoobarListofIntToBooleanToFfiNullable(Map<List<int>, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofFoobarListofIntToBooleanToFfi(value);
  final result = _foobarMapofFoobarListofIntToBooleanCreateHandleNullable(_handle);
  foobarMapofFoobarListofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
Map<List<int>, bool> foobarMapofFoobarListofIntToBooleanFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofFoobarListofIntToBooleanGetValueNullable(handle);
  final result = foobarMapofFoobarListofIntToBooleanFromFfi(_handle);
  foobarMapofFoobarListofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofFoobarListofIntToBooleanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofFoobarListofIntToBooleanReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofFoobarMapofIntToBooleanToBooleanToFfi(Map<Map<int, bool>, bool> value) {
  final _result = _foobarMapofFoobarMapofIntToBooleanToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = foobarMapofIntToBooleanToFfi(entry.key);
    final _valueHandle = booleanToFfi(entry.value);
    _foobarMapofFoobarMapofIntToBooleanToBooleanPut(_result, _keyHandle, _valueHandle);
    foobarMapofIntToBooleanReleaseFfiHandle(_keyHandle);
    booleanReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<Map<int, bool>, bool> foobarMapofFoobarMapofIntToBooleanToBooleanFromFfi(Pointer<Void> handle) {
  final result = Map<Map<int, bool>, bool>();
  final _iteratorHandle = _foobarMapofFoobarMapofIntToBooleanToBooleanIterator(handle);
  while (_foobarMapofFoobarMapofIntToBooleanToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[foobarMapofIntToBooleanFromFfi(_keyHandle)] =
        booleanFromFfi(_valueHandle);
    } finally {
      foobarMapofIntToBooleanReleaseFfiHandle(_keyHandle);
      booleanReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofFoobarMapofIntToBooleanToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofFoobarMapofIntToBooleanToBooleanReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofFoobarMapofIntToBooleanToBooleanReleaseHandle(handle);
final _foobarMapofFoobarMapofIntToBooleanToBooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_create_handle_nullable'));
final _foobarMapofFoobarMapofIntToBooleanToBooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_release_handle_nullable'));
final _foobarMapofFoobarMapofIntToBooleanToBooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_MapOf_Int_to_Boolean_to_Boolean_get_value_nullable'));
Pointer<Void> foobarMapofFoobarMapofIntToBooleanToBooleanToFfiNullable(Map<Map<int, bool>, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofFoobarMapofIntToBooleanToBooleanToFfi(value);
  final result = _foobarMapofFoobarMapofIntToBooleanToBooleanCreateHandleNullable(_handle);
  foobarMapofFoobarMapofIntToBooleanToBooleanReleaseFfiHandle(_handle);
  return result;
}
Map<Map<int, bool>, bool> foobarMapofFoobarMapofIntToBooleanToBooleanFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofFoobarMapofIntToBooleanToBooleanGetValueNullable(handle);
  final result = foobarMapofFoobarMapofIntToBooleanToBooleanFromFfi(_handle);
  foobarMapofFoobarMapofIntToBooleanToBooleanReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofFoobarMapofIntToBooleanToBooleanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofFoobarMapofIntToBooleanToBooleanReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofFoobarSetofIntToBooleanToFfi(Map<Set<int>, bool> value) {
  final _result = _foobarMapofFoobarSetofIntToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = foobarSetofIntToFfi(entry.key);
    final _valueHandle = booleanToFfi(entry.value);
    _foobarMapofFoobarSetofIntToBooleanPut(_result, _keyHandle, _valueHandle);
    foobarSetofIntReleaseFfiHandle(_keyHandle);
    booleanReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<Set<int>, bool> foobarMapofFoobarSetofIntToBooleanFromFfi(Pointer<Void> handle) {
  final result = Map<Set<int>, bool>();
  final _iteratorHandle = _foobarMapofFoobarSetofIntToBooleanIterator(handle);
  while (_foobarMapofFoobarSetofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofFoobarSetofIntToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofFoobarSetofIntToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[foobarSetofIntFromFfi(_keyHandle)] =
        booleanFromFfi(_valueHandle);
    } finally {
      foobarSetofIntReleaseFfiHandle(_keyHandle);
      booleanReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofFoobarSetofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofFoobarSetofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofFoobarSetofIntToBooleanReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofFoobarSetofIntToBooleanReleaseHandle(handle);
final _foobarMapofFoobarSetofIntToBooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_create_handle_nullable'));
final _foobarMapofFoobarSetofIntToBooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_release_handle_nullable'));
final _foobarMapofFoobarSetofIntToBooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_foobar_SetOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobarMapofFoobarSetofIntToBooleanToFfiNullable(Map<Set<int>, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofFoobarSetofIntToBooleanToFfi(value);
  final result = _foobarMapofFoobarSetofIntToBooleanCreateHandleNullable(_handle);
  foobarMapofFoobarSetofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
Map<Set<int>, bool> foobarMapofFoobarSetofIntToBooleanFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofFoobarSetofIntToBooleanGetValueNullable(handle);
  final result = foobarMapofFoobarSetofIntToBooleanFromFfi(_handle);
  foobarMapofFoobarSetofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofFoobarSetofIntToBooleanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofFoobarSetofIntToBooleanReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanToFfi(Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> value) {
  final _result = _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = smokeGenerictypeswithcompoundtypesExternalenumToFfi(entry.key);
    final _valueHandle = booleanToFfi(entry.value);
    _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanPut(_result, _keyHandle, _valueHandle);
    smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_keyHandle);
    booleanReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanFromFfi(Pointer<Void> handle) {
  final result = Map<GenericTypesWithCompoundTypes_ExternalEnum, bool>();
  final _iteratorHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIterator(handle);
  while (_foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[smokeGenerictypeswithcompoundtypesExternalenumFromFfi(_keyHandle)] =
        booleanFromFfi(_valueHandle);
    } finally {
      smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_keyHandle);
      booleanReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanReleaseHandle(handle);
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_create_handle_nullable'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_release_handle_nullable'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_to_Boolean_get_value_nullable'));
Pointer<Void> foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanToFfiNullable(Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanToFfi(value);
  final result = _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanCreateHandleNullable(_handle);
  foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanReleaseFfiHandle(_handle);
  return result;
}
Map<GenericTypesWithCompoundTypes_ExternalEnum, bool> foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanGetValueNullable(handle);
  final result = foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanFromFfi(_handle);
  foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofSmokeGenerictypeswithcompoundtypesExternalenumToBooleanReleaseHandleNullable(handle);
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
Pointer<Void> foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanToFfi(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> value) {
  final _result = _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanCreateHandle();
  for (final entry in value.entries) {
    final _keyHandle = smokeGenerictypeswithcompoundtypesSomeenumToFfi(entry.key);
    final _valueHandle = booleanToFfi(entry.value);
    _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanPut(_result, _keyHandle, _valueHandle);
    smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_keyHandle);
    booleanReleaseFfiHandle(_valueHandle);
  }
  return _result;
}
Map<GenericTypesWithCompoundTypes_SomeEnum, bool> foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanFromFfi(Pointer<Void> handle) {
  final result = Map<GenericTypesWithCompoundTypes_SomeEnum, bool>();
  final _iteratorHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIterator(handle);
  while (_foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _keyHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorGetKey(_iteratorHandle);
    final _valueHandle = _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorGetValue(_iteratorHandle);
    try {
      result[smokeGenerictypeswithcompoundtypesSomeenumFromFfi(_keyHandle)] =
        booleanFromFfi(_valueHandle);
    } finally {
      smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_keyHandle);
      booleanReleaseFfiHandle(_valueHandle);
    }
    _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanReleaseFfiHandle(Pointer<Void> handle) => _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanReleaseHandle(handle);
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_create_handle_nullable'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_release_handle_nullable'));
final _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_MapOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_to_Boolean_get_value_nullable'));
Pointer<Void> foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanToFfiNullable(Map<GenericTypesWithCompoundTypes_SomeEnum, bool> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanToFfi(value);
  final result = _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanCreateHandleNullable(_handle);
  foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanReleaseFfiHandle(_handle);
  return result;
}
Map<GenericTypesWithCompoundTypes_SomeEnum, bool> foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanGetValueNullable(handle);
  final result = foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanFromFfi(_handle);
  foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanReleaseFfiHandle(_handle);
  return result;
}
void foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarMapofSmokeGenerictypeswithcompoundtypesSomeenumToBooleanReleaseHandleNullable(handle);
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
Pointer<Void> foobarSetofFloatToFfi(Set<double> value) {
  final _result = _foobarSetofFloatCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarSetofFloatInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
Set<double> foobarSetofFloatFromFfi(Pointer<Void> handle) {
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
void foobarSetofFloatReleaseFfiHandle(Pointer<Void> handle) => _foobarSetofFloatReleaseHandle(handle);
final _foobarSetofFloatCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Float_create_handle_nullable'));
final _foobarSetofFloatReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Float_release_handle_nullable'));
final _foobarSetofFloatGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Float_get_value_nullable'));
Pointer<Void> foobarSetofFloatToFfiNullable(Set<double> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarSetofFloatToFfi(value);
  final result = _foobarSetofFloatCreateHandleNullable(_handle);
  foobarSetofFloatReleaseFfiHandle(_handle);
  return result;
}
Set<double> foobarSetofFloatFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarSetofFloatGetValueNullable(handle);
  final result = foobarSetofFloatFromFfi(_handle);
  foobarSetofFloatReleaseFfiHandle(_handle);
  return result;
}
void foobarSetofFloatReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarSetofFloatReleaseHandleNullable(handle);
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
Pointer<Void> foobarSetofIntToFfi(Set<int> value) {
  final _result = _foobarSetofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarSetofIntInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
Set<int> foobarSetofIntFromFfi(Pointer<Void> handle) {
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
void foobarSetofIntReleaseFfiHandle(Pointer<Void> handle) => _foobarSetofIntReleaseHandle(handle);
final _foobarSetofIntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Int_create_handle_nullable'));
final _foobarSetofIntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_Int_release_handle_nullable'));
final _foobarSetofIntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobarSetofIntToFfiNullable(Set<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarSetofIntToFfi(value);
  final result = _foobarSetofIntCreateHandleNullable(_handle);
  foobarSetofIntReleaseFfiHandle(_handle);
  return result;
}
Set<int> foobarSetofIntFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarSetofIntGetValueNullable(handle);
  final result = foobarSetofIntFromFfi(_handle);
  foobarSetofIntReleaseFfiHandle(_handle);
  return result;
}
void foobarSetofIntReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarSetofIntReleaseHandleNullable(handle);
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
Pointer<Void> foobarSetofStringToFfi(Set<String> value) {
  final _result = _foobarSetofStringCreateHandle();
  for (final element in value) {
    final _elementHandle = stringToFfi(element);
    _foobarSetofStringInsert(_result, _elementHandle);
    stringReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<String> foobarSetofStringFromFfi(Pointer<Void> handle) {
  final result = Set<String>();
  final _iteratorHandle = _foobarSetofStringIterator(handle);
  while (_foobarSetofStringIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofStringIteratorGet(_iteratorHandle);
    try {
      result.add(stringFromFfi(_elementHandle));
    } finally {
      stringReleaseFfiHandle(_elementHandle);
    }
    _foobarSetofStringIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofStringIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarSetofStringReleaseFfiHandle(Pointer<Void> handle) => _foobarSetofStringReleaseHandle(handle);
final _foobarSetofStringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_String_create_handle_nullable'));
final _foobarSetofStringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_String_release_handle_nullable'));
final _foobarSetofStringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_String_get_value_nullable'));
Pointer<Void> foobarSetofStringToFfiNullable(Set<String> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarSetofStringToFfi(value);
  final result = _foobarSetofStringCreateHandleNullable(_handle);
  foobarSetofStringReleaseFfiHandle(_handle);
  return result;
}
Set<String> foobarSetofStringFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarSetofStringGetValueNullable(handle);
  final result = foobarSetofStringFromFfi(_handle);
  foobarSetofStringReleaseFfiHandle(_handle);
  return result;
}
void foobarSetofStringReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarSetofStringReleaseHandleNullable(handle);
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
Pointer<Void> foobarSetofUbyteToFfi(Set<int> value) {
  final _result = _foobarSetofUbyteCreateHandle();
  for (final element in value) {
    final _elementHandle = (element);
    _foobarSetofUbyteInsert(_result, _elementHandle);
    (_elementHandle);
  }
  return _result;
}
Set<int> foobarSetofUbyteFromFfi(Pointer<Void> handle) {
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
void foobarSetofUbyteReleaseFfiHandle(Pointer<Void> handle) => _foobarSetofUbyteReleaseHandle(handle);
final _foobarSetofUbyteCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_UByte_create_handle_nullable'));
final _foobarSetofUbyteReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_UByte_release_handle_nullable'));
final _foobarSetofUbyteGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_UByte_get_value_nullable'));
Pointer<Void> foobarSetofUbyteToFfiNullable(Set<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarSetofUbyteToFfi(value);
  final result = _foobarSetofUbyteCreateHandleNullable(_handle);
  foobarSetofUbyteReleaseFfiHandle(_handle);
  return result;
}
Set<int> foobarSetofUbyteFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarSetofUbyteGetValueNullable(handle);
  final result = foobarSetofUbyteFromFfi(_handle);
  foobarSetofUbyteReleaseFfiHandle(_handle);
  return result;
}
void foobarSetofUbyteReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarSetofUbyteReleaseHandleNullable(handle);
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
Pointer<Void> foobarSetofFoobarListofIntToFfi(Set<List<int>> value) {
  final _result = _foobarSetofFoobarListofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = foobarListofIntToFfi(element);
    _foobarSetofFoobarListofIntInsert(_result, _elementHandle);
    foobarListofIntReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<List<int>> foobarSetofFoobarListofIntFromFfi(Pointer<Void> handle) {
  final result = Set<List<int>>();
  final _iteratorHandle = _foobarSetofFoobarListofIntIterator(handle);
  while (_foobarSetofFoobarListofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofFoobarListofIntIteratorGet(_iteratorHandle);
    try {
      result.add(foobarListofIntFromFfi(_elementHandle));
    } finally {
      foobarListofIntReleaseFfiHandle(_elementHandle);
    }
    _foobarSetofFoobarListofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofFoobarListofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarSetofFoobarListofIntReleaseFfiHandle(Pointer<Void> handle) => _foobarSetofFoobarListofIntReleaseHandle(handle);
final _foobarSetofFoobarListofIntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_create_handle_nullable'));
final _foobarSetofFoobarListofIntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_release_handle_nullable'));
final _foobarSetofFoobarListofIntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_ListOf_Int_get_value_nullable'));
Pointer<Void> foobarSetofFoobarListofIntToFfiNullable(Set<List<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarSetofFoobarListofIntToFfi(value);
  final result = _foobarSetofFoobarListofIntCreateHandleNullable(_handle);
  foobarSetofFoobarListofIntReleaseFfiHandle(_handle);
  return result;
}
Set<List<int>> foobarSetofFoobarListofIntFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarSetofFoobarListofIntGetValueNullable(handle);
  final result = foobarSetofFoobarListofIntFromFfi(_handle);
  foobarSetofFoobarListofIntReleaseFfiHandle(_handle);
  return result;
}
void foobarSetofFoobarListofIntReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarSetofFoobarListofIntReleaseHandleNullable(handle);
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
Pointer<Void> foobarSetofFoobarMapofIntToBooleanToFfi(Set<Map<int, bool>> value) {
  final _result = _foobarSetofFoobarMapofIntToBooleanCreateHandle();
  for (final element in value) {
    final _elementHandle = foobarMapofIntToBooleanToFfi(element);
    _foobarSetofFoobarMapofIntToBooleanInsert(_result, _elementHandle);
    foobarMapofIntToBooleanReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<Map<int, bool>> foobarSetofFoobarMapofIntToBooleanFromFfi(Pointer<Void> handle) {
  final result = Set<Map<int, bool>>();
  final _iteratorHandle = _foobarSetofFoobarMapofIntToBooleanIterator(handle);
  while (_foobarSetofFoobarMapofIntToBooleanIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofFoobarMapofIntToBooleanIteratorGet(_iteratorHandle);
    try {
      result.add(foobarMapofIntToBooleanFromFfi(_elementHandle));
    } finally {
      foobarMapofIntToBooleanReleaseFfiHandle(_elementHandle);
    }
    _foobarSetofFoobarMapofIntToBooleanIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofFoobarMapofIntToBooleanIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarSetofFoobarMapofIntToBooleanReleaseFfiHandle(Pointer<Void> handle) => _foobarSetofFoobarMapofIntToBooleanReleaseHandle(handle);
final _foobarSetofFoobarMapofIntToBooleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_create_handle_nullable'));
final _foobarSetofFoobarMapofIntToBooleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_release_handle_nullable'));
final _foobarSetofFoobarMapofIntToBooleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_MapOf_Int_to_Boolean_get_value_nullable'));
Pointer<Void> foobarSetofFoobarMapofIntToBooleanToFfiNullable(Set<Map<int, bool>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarSetofFoobarMapofIntToBooleanToFfi(value);
  final result = _foobarSetofFoobarMapofIntToBooleanCreateHandleNullable(_handle);
  foobarSetofFoobarMapofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
Set<Map<int, bool>> foobarSetofFoobarMapofIntToBooleanFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarSetofFoobarMapofIntToBooleanGetValueNullable(handle);
  final result = foobarSetofFoobarMapofIntToBooleanFromFfi(_handle);
  foobarSetofFoobarMapofIntToBooleanReleaseFfiHandle(_handle);
  return result;
}
void foobarSetofFoobarMapofIntToBooleanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarSetofFoobarMapofIntToBooleanReleaseHandleNullable(handle);
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
Pointer<Void> foobarSetofFoobarSetofIntToFfi(Set<Set<int>> value) {
  final _result = _foobarSetofFoobarSetofIntCreateHandle();
  for (final element in value) {
    final _elementHandle = foobarSetofIntToFfi(element);
    _foobarSetofFoobarSetofIntInsert(_result, _elementHandle);
    foobarSetofIntReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<Set<int>> foobarSetofFoobarSetofIntFromFfi(Pointer<Void> handle) {
  final result = Set<Set<int>>();
  final _iteratorHandle = _foobarSetofFoobarSetofIntIterator(handle);
  while (_foobarSetofFoobarSetofIntIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofFoobarSetofIntIteratorGet(_iteratorHandle);
    try {
      result.add(foobarSetofIntFromFfi(_elementHandle));
    } finally {
      foobarSetofIntReleaseFfiHandle(_elementHandle);
    }
    _foobarSetofFoobarSetofIntIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofFoobarSetofIntIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarSetofFoobarSetofIntReleaseFfiHandle(Pointer<Void> handle) => _foobarSetofFoobarSetofIntReleaseHandle(handle);
final _foobarSetofFoobarSetofIntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_create_handle_nullable'));
final _foobarSetofFoobarSetofIntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_release_handle_nullable'));
final _foobarSetofFoobarSetofIntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_foobar_SetOf_Int_get_value_nullable'));
Pointer<Void> foobarSetofFoobarSetofIntToFfiNullable(Set<Set<int>> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarSetofFoobarSetofIntToFfi(value);
  final result = _foobarSetofFoobarSetofIntCreateHandleNullable(_handle);
  foobarSetofFoobarSetofIntReleaseFfiHandle(_handle);
  return result;
}
Set<Set<int>> foobarSetofFoobarSetofIntFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarSetofFoobarSetofIntGetValueNullable(handle);
  final result = foobarSetofFoobarSetofIntFromFfi(_handle);
  foobarSetofFoobarSetofIntReleaseFfiHandle(_handle);
  return result;
}
void foobarSetofFoobarSetofIntReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarSetofFoobarSetofIntReleaseHandleNullable(handle);
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
Pointer<Void> foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumToFfi(Set<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  final _result = _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeGenerictypeswithcompoundtypesExternalenumToFfi(element);
    _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumInsert(_result, _elementHandle);
    smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<GenericTypesWithCompoundTypes_ExternalEnum> foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumFromFfi(Pointer<Void> handle) {
  final result = Set<GenericTypesWithCompoundTypes_ExternalEnum>();
  final _iteratorHandle = _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIterator(handle);
  while (_foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorGet(_iteratorHandle);
    try {
      result.add(smokeGenerictypeswithcompoundtypesExternalenumFromFfi(_elementHandle));
    } finally {
      smokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_elementHandle);
    }
    _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(Pointer<Void> handle) => _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandle(handle);
final _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_create_handle_nullable'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_release_handle_nullable'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_ExternalEnum_get_value_nullable'));
Pointer<Void> foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumToFfiNullable(Set<GenericTypesWithCompoundTypes_ExternalEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumToFfi(value);
  final result = _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumCreateHandleNullable(_handle);
  foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_handle);
  return result;
}
Set<GenericTypesWithCompoundTypes_ExternalEnum> foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumGetValueNullable(handle);
  final result = foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumFromFfi(_handle);
  foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandle(_handle);
  return result;
}
void foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarSetofSmokeGenerictypeswithcompoundtypesExternalenumReleaseHandleNullable(handle);
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
Pointer<Void> foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumToFfi(Set<GenericTypesWithCompoundTypes_SomeEnum> value) {
  final _result = _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeGenerictypeswithcompoundtypesSomeenumToFfi(element);
    _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumInsert(_result, _elementHandle);
    smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
Set<GenericTypesWithCompoundTypes_SomeEnum> foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumFromFfi(Pointer<Void> handle) {
  final result = Set<GenericTypesWithCompoundTypes_SomeEnum>();
  final _iteratorHandle = _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIterator(handle);
  while (_foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorGet(_iteratorHandle);
    try {
      result.add(smokeGenerictypeswithcompoundtypesSomeenumFromFfi(_elementHandle));
    } finally {
      smokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_elementHandle);
    }
    _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorIncrement(_iteratorHandle);
  }
  _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(Pointer<Void> handle) => _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandle(handle);
final _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_create_handle_nullable'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_release_handle_nullable'));
final _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_SetOf_smoke_GenericTypesWithCompoundTypes_SomeEnum_get_value_nullable'));
Pointer<Void> foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumToFfiNullable(Set<GenericTypesWithCompoundTypes_SomeEnum> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumToFfi(value);
  final result = _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumCreateHandleNullable(_handle);
  foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_handle);
  return result;
}
Set<GenericTypesWithCompoundTypes_SomeEnum> foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumGetValueNullable(handle);
  final result = foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumFromFfi(_handle);
  foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandle(_handle);
  return result;
}
void foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarSetofSmokeGenerictypeswithcompoundtypesSomeenumReleaseHandleNullable(handle);
