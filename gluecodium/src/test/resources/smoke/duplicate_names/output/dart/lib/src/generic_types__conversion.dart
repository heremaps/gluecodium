import 'package:library/src/smoke/alphabet.dart' as smoke;
import 'package:library/src/smoke/foo/alphabet.dart' as smoke_foo;
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
final _foobarListofSmokeAlphabetCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_Alphabet_create_handle'));
final _foobarListofSmokeAlphabetReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_Alphabet_release_handle'));
final _foobarListofSmokeAlphabetInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_smoke_Alphabet_insert'));
final _foobarListofSmokeAlphabetIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_Alphabet_iterator'));
final _foobarListofSmokeAlphabetIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_Alphabet_iterator_release_handle'));
final _foobarListofSmokeAlphabetIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_Alphabet_iterator_is_valid'));
final _foobarListofSmokeAlphabetIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_Alphabet_iterator_increment'));
final _foobarListofSmokeAlphabetIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_Alphabet_iterator_get'));
Pointer<Void> foobarListofSmokeAlphabetToFfi(List<smoke.Alphabet> value) {
  final _result = _foobarListofSmokeAlphabetCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke.smokeAlphabetToFfi(element);
    _foobarListofSmokeAlphabetInsert(_result, _elementHandle);
    smoke.smokeAlphabetReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<smoke.Alphabet> foobarListofSmokeAlphabetFromFfi(Pointer<Void> handle) {
  final result = List<smoke.Alphabet>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeAlphabetIterator(handle);
  while (_foobarListofSmokeAlphabetIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeAlphabetIteratorGet(_iteratorHandle);
    try {
      result.add(smoke.smokeAlphabetFromFfi(_elementHandle));
    } finally {
      smoke.smokeAlphabetReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeAlphabetIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeAlphabetIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeAlphabetReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeAlphabetReleaseHandle(handle);
final _foobarListofSmokeAlphabetCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_Alphabet_create_handle_nullable'));
final _foobarListofSmokeAlphabetReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_Alphabet_release_handle_nullable'));
final _foobarListofSmokeAlphabetGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_Alphabet_get_value_nullable'));
Pointer<Void> foobarListofSmokeAlphabetToFfiNullable(List<smoke.Alphabet>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeAlphabetToFfi(value);
  final result = _foobarListofSmokeAlphabetCreateHandleNullable(_handle);
  foobarListofSmokeAlphabetReleaseFfiHandle(_handle);
  return result;
}
List<smoke.Alphabet>? foobarListofSmokeAlphabetFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeAlphabetGetValueNullable(handle);
  final result = foobarListofSmokeAlphabetFromFfi(_handle);
  foobarListofSmokeAlphabetReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeAlphabetReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeAlphabetReleaseHandleNullable(handle);
final _foobarListofSmokeFooAlphabetCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_foo_Alphabet_create_handle'));
final _foobarListofSmokeFooAlphabetReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_foo_Alphabet_release_handle'));
final _foobarListofSmokeFooAlphabetInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_foobar_ListOf_smoke_foo_Alphabet_insert'));
final _foobarListofSmokeFooAlphabetIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_foo_Alphabet_iterator'));
final _foobarListofSmokeFooAlphabetIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_foo_Alphabet_iterator_release_handle'));
final _foobarListofSmokeFooAlphabetIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_foo_Alphabet_iterator_is_valid'));
final _foobarListofSmokeFooAlphabetIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_foo_Alphabet_iterator_increment'));
final _foobarListofSmokeFooAlphabetIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_foo_Alphabet_iterator_get'));
Pointer<Void> foobarListofSmokeFooAlphabetToFfi(List<smoke_foo.Alphabet> value) {
  final _result = _foobarListofSmokeFooAlphabetCreateHandle();
  for (final element in value) {
    final _elementHandle = smoke_foo.smokeFooAlphabetToFfi(element);
    _foobarListofSmokeFooAlphabetInsert(_result, _elementHandle);
    smoke_foo.smokeFooAlphabetReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<smoke_foo.Alphabet> foobarListofSmokeFooAlphabetFromFfi(Pointer<Void> handle) {
  final result = List<smoke_foo.Alphabet>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeFooAlphabetIterator(handle);
  while (_foobarListofSmokeFooAlphabetIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeFooAlphabetIteratorGet(_iteratorHandle);
    try {
      result.add(smoke_foo.smokeFooAlphabetFromFfi(_elementHandle));
    } finally {
      smoke_foo.smokeFooAlphabetReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeFooAlphabetIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeFooAlphabetIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeFooAlphabetReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeFooAlphabetReleaseHandle(handle);
final _foobarListofSmokeFooAlphabetCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_foo_Alphabet_create_handle_nullable'));
final _foobarListofSmokeFooAlphabetReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_foo_Alphabet_release_handle_nullable'));
final _foobarListofSmokeFooAlphabetGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_foo_Alphabet_get_value_nullable'));
Pointer<Void> foobarListofSmokeFooAlphabetToFfiNullable(List<smoke_foo.Alphabet>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeFooAlphabetToFfi(value);
  final result = _foobarListofSmokeFooAlphabetCreateHandleNullable(_handle);
  foobarListofSmokeFooAlphabetReleaseFfiHandle(_handle);
  return result;
}
List<smoke_foo.Alphabet>? foobarListofSmokeFooAlphabetFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeFooAlphabetGetValueNullable(handle);
  final result = foobarListofSmokeFooAlphabetFromFfi(_handle);
  foobarListofSmokeFooAlphabetReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeFooAlphabetReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeFooAlphabetReleaseHandleNullable(handle);
