import 'package:library/src/smoke/some_skipped_enum.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
final _listofSmokeSomeskippedenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_ListOf_smoke_SomeSkippedEnum_create_handle'));
final _listofSmokeSomeskippedenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_ListOf_smoke_SomeSkippedEnum_release_handle'));
final _listofSmokeSomeskippedenumInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint32),
    void Function(Pointer<Void>, int)
  >('library_ListOf_smoke_SomeSkippedEnum_insert'));
final _listofSmokeSomeskippedenumIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_ListOf_smoke_SomeSkippedEnum_iterator'));
final _listofSmokeSomeskippedenumIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_ListOf_smoke_SomeSkippedEnum_iterator_release_handle'));
final _listofSmokeSomeskippedenumIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_ListOf_smoke_SomeSkippedEnum_iterator_is_valid'));
final _listofSmokeSomeskippedenumIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_ListOf_smoke_SomeSkippedEnum_iterator_increment'));
final _listofSmokeSomeskippedenumIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_ListOf_smoke_SomeSkippedEnum_iterator_get'));
Pointer<Void> listofSmokeSomeskippedenumToFfi(List<SomeSkippedEnum> value) {
  final _result = _listofSmokeSomeskippedenumCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeSomeskippedenumToFfi(element);
    _listofSmokeSomeskippedenumInsert(_result, _elementHandle);
    smokeSomeskippedenumReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
List<SomeSkippedEnum> listofSmokeSomeskippedenumFromFfi(Pointer<Void> handle) {
  final result = List<SomeSkippedEnum>.empty(growable: true);
  final _iteratorHandle = _listofSmokeSomeskippedenumIterator(handle);
  while (_listofSmokeSomeskippedenumIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _listofSmokeSomeskippedenumIteratorGet(_iteratorHandle);
    try {
      result.add(smokeSomeskippedenumFromFfi(_elementHandle));
    } finally {
      smokeSomeskippedenumReleaseFfiHandle(_elementHandle);
    }
    _listofSmokeSomeskippedenumIteratorIncrement(_iteratorHandle);
  }
  _listofSmokeSomeskippedenumIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void listofSmokeSomeskippedenumReleaseFfiHandle(Pointer<Void> handle) => _listofSmokeSomeskippedenumReleaseHandle(handle);
final _listofSmokeSomeskippedenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_ListOf_smoke_SomeSkippedEnum_create_handle_nullable'));
final _listofSmokeSomeskippedenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_ListOf_smoke_SomeSkippedEnum_release_handle_nullable'));
final _listofSmokeSomeskippedenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_ListOf_smoke_SomeSkippedEnum_get_value_nullable'));
Pointer<Void> listofSmokeSomeskippedenumToFfiNullable(List<SomeSkippedEnum>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = listofSmokeSomeskippedenumToFfi(value);
  final result = _listofSmokeSomeskippedenumCreateHandleNullable(_handle);
  listofSmokeSomeskippedenumReleaseFfiHandle(_handle);
  return result;
}
List<SomeSkippedEnum>? listofSmokeSomeskippedenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _listofSmokeSomeskippedenumGetValueNullable(handle);
  final result = listofSmokeSomeskippedenumFromFfi(_handle);
  listofSmokeSomeskippedenumReleaseFfiHandle(_handle);
  return result;
}
void listofSmokeSomeskippedenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _listofSmokeSomeskippedenumReleaseHandleNullable(handle);
