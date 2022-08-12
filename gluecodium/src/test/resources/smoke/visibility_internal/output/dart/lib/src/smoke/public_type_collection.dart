import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class PublicTypeCollection {
}
/// @nodoc
class PublicTypeCollection_InternalStruct {
  /// @nodoc
  String _stringField;
  PublicTypeCollection_InternalStruct(this._stringField);
  void fooBar() => $prototype.fooBar(this);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = PublicTypeCollection_InternalStruct$Impl();
}
// PublicTypeCollection_InternalStruct "private" section, not exported.
final _smokePublictypecollectionInternalstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_create_handle'));
final _smokePublictypecollectionInternalstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_release_handle'));
final _smokePublictypecollectionInternalstructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_get_field_stringField'));
/// @nodoc
@visibleForTesting
class PublicTypeCollection_InternalStruct$Impl {
  void fooBar(PublicTypeCollection_InternalStruct $that) {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_PublicTypeCollection_InternalStruct_fooBar'));
    final _handle = smokePublictypecollectionInternalstructToFfi($that);
    _fooBarFfi(_handle, __lib.LibraryContext.isolateId);
    smokePublictypecollectionInternalstructReleaseFfiHandle(_handle);
  }
}
Pointer<Void> smokePublictypecollectionInternalstructToFfi(PublicTypeCollection_InternalStruct value) {
  final _stringFieldHandle = stringToFfi(value._stringField);
  final _result = _smokePublictypecollectionInternalstructCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
PublicTypeCollection_InternalStruct smokePublictypecollectionInternalstructFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokePublictypecollectionInternalstructGetFieldstringField(handle);
  try {
    return PublicTypeCollection_InternalStruct(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokePublictypecollectionInternalstructReleaseFfiHandle(Pointer<Void> handle) => _smokePublictypecollectionInternalstructReleaseHandle(handle);
// Nullable PublicTypeCollection_InternalStruct
final _smokePublictypecollectionInternalstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_create_handle_nullable'));
final _smokePublictypecollectionInternalstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_release_handle_nullable'));
final _smokePublictypecollectionInternalstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_get_value_nullable'));
Pointer<Void> smokePublictypecollectionInternalstructToFfiNullable(PublicTypeCollection_InternalStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublictypecollectionInternalstructToFfi(value);
  final result = _smokePublictypecollectionInternalstructCreateHandleNullable(_handle);
  smokePublictypecollectionInternalstructReleaseFfiHandle(_handle);
  return result;
}
PublicTypeCollection_InternalStruct? smokePublictypecollectionInternalstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublictypecollectionInternalstructGetValueNullable(handle);
  final result = smokePublictypecollectionInternalstructFromFfi(_handle);
  smokePublictypecollectionInternalstructReleaseFfiHandle(_handle);
  return result;
}
void smokePublictypecollectionInternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublictypecollectionInternalstructReleaseHandleNullable(handle);
// End of PublicTypeCollection_InternalStruct "private" section.
// PublicTypeCollection "private" section, not exported.
final _smokePublictypecollectionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_smoke_PublicTypeCollection_create_handle'));
final _smokePublictypecollectionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_release_handle'));
Pointer<Void> smokePublictypecollectionToFfi(PublicTypeCollection value) {
  final _result = _smokePublictypecollectionCreateHandle();
  return _result;
}
PublicTypeCollection smokePublictypecollectionFromFfi(Pointer<Void> handle) {
  try {
    return PublicTypeCollection(
    );
  } finally {
  }
}
void smokePublictypecollectionReleaseFfiHandle(Pointer<Void> handle) => _smokePublictypecollectionReleaseHandle(handle);
// Nullable PublicTypeCollection
final _smokePublictypecollectionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_create_handle_nullable'));
final _smokePublictypecollectionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_release_handle_nullable'));
final _smokePublictypecollectionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_get_value_nullable'));
Pointer<Void> smokePublictypecollectionToFfiNullable(PublicTypeCollection? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublictypecollectionToFfi(value);
  final result = _smokePublictypecollectionCreateHandleNullable(_handle);
  smokePublictypecollectionReleaseFfiHandle(_handle);
  return result;
}
PublicTypeCollection? smokePublictypecollectionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublictypecollectionGetValueNullable(handle);
  final result = smokePublictypecollectionFromFfi(_handle);
  smokePublictypecollectionReleaseFfiHandle(_handle);
  return result;
}
void smokePublictypecollectionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublictypecollectionReleaseHandleNullable(handle);
// End of PublicTypeCollection "private" section.
