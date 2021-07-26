import 'package:library/src/smoke/deprecated_with_no_message.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
final _foobarListofSmokeDeprecatedwithnomessageCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_foobar_ListOf_smoke_DeprecatedWithNoMessage_create_handle'));
final _foobarListofSmokeDeprecatedwithnomessageReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DeprecatedWithNoMessage_release_handle'));
final _foobarListofSmokeDeprecatedwithnomessageInsert = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Pointer<Void>),
    void Function(Pointer<Void>, Pointer<Void>)
  >('library_foobar_ListOf_smoke_DeprecatedWithNoMessage_insert'));
final _foobarListofSmokeDeprecatedwithnomessageIterator = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DeprecatedWithNoMessage_iterator'));
final _foobarListofSmokeDeprecatedwithnomessageIteratorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DeprecatedWithNoMessage_iterator_release_handle'));
final _foobarListofSmokeDeprecatedwithnomessageIteratorIsValid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
>('library_foobar_ListOf_smoke_DeprecatedWithNoMessage_iterator_is_valid'));
final _foobarListofSmokeDeprecatedwithnomessageIteratorIncrement = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DeprecatedWithNoMessage_iterator_increment'));
final _foobarListofSmokeDeprecatedwithnomessageIteratorGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
>('library_foobar_ListOf_smoke_DeprecatedWithNoMessage_iterator_get'));
// ignore: deprecated_member_use_from_same_package
Pointer<Void> foobarListofSmokeDeprecatedwithnomessageToFfi(List<DeprecatedWithNoMessage> value) {
  final _result = _foobarListofSmokeDeprecatedwithnomessageCreateHandle();
  for (final element in value) {
    final _elementHandle = smokeDeprecatedwithnomessageToFfi(element);
    _foobarListofSmokeDeprecatedwithnomessageInsert(_result, _elementHandle);
    smokeDeprecatedwithnomessageReleaseFfiHandle(_elementHandle);
  }
  return _result;
}
// ignore: deprecated_member_use_from_same_package
List<DeprecatedWithNoMessage> foobarListofSmokeDeprecatedwithnomessageFromFfi(Pointer<Void> handle) {
  // ignore: deprecated_member_use_from_same_package
  final result = List<DeprecatedWithNoMessage>.empty(growable: true);
  final _iteratorHandle = _foobarListofSmokeDeprecatedwithnomessageIterator(handle);
  while (_foobarListofSmokeDeprecatedwithnomessageIteratorIsValid(handle, _iteratorHandle) != 0) {
    final _elementHandle = _foobarListofSmokeDeprecatedwithnomessageIteratorGet(_iteratorHandle);
    try {
      result.add(smokeDeprecatedwithnomessageFromFfi(_elementHandle));
    } finally {
      smokeDeprecatedwithnomessageReleaseFfiHandle(_elementHandle);
    }
    _foobarListofSmokeDeprecatedwithnomessageIteratorIncrement(_iteratorHandle);
  }
  _foobarListofSmokeDeprecatedwithnomessageIteratorReleaseHandle(_iteratorHandle);
  return result;
}
void foobarListofSmokeDeprecatedwithnomessageReleaseFfiHandle(Pointer<Void> handle) => _foobarListofSmokeDeprecatedwithnomessageReleaseHandle(handle);
final _foobarListofSmokeDeprecatedwithnomessageCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DeprecatedWithNoMessage_create_handle_nullable'));
final _foobarListofSmokeDeprecatedwithnomessageReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DeprecatedWithNoMessage_release_handle_nullable'));
final _foobarListofSmokeDeprecatedwithnomessageGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_foobar_ListOf_smoke_DeprecatedWithNoMessage_get_value_nullable'));
// ignore: deprecated_member_use_from_same_package
Pointer<Void> foobarListofSmokeDeprecatedwithnomessageToFfiNullable(List<DeprecatedWithNoMessage>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = foobarListofSmokeDeprecatedwithnomessageToFfi(value);
  final result = _foobarListofSmokeDeprecatedwithnomessageCreateHandleNullable(_handle);
  foobarListofSmokeDeprecatedwithnomessageReleaseFfiHandle(_handle);
  return result;
}
// ignore: deprecated_member_use_from_same_package
List<DeprecatedWithNoMessage>? foobarListofSmokeDeprecatedwithnomessageFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _foobarListofSmokeDeprecatedwithnomessageGetValueNullable(handle);
  final result = foobarListofSmokeDeprecatedwithnomessageFromFfi(_handle);
  foobarListofSmokeDeprecatedwithnomessageReleaseFfiHandle(_handle);
  return result;
}
void foobarListofSmokeDeprecatedwithnomessageReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _foobarListofSmokeDeprecatedwithnomessageReleaseHandleNullable(handle);
