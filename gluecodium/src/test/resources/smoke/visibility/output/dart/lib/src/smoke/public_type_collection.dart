import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
/// @nodoc
class InternalStruct {
  /// @nodoc
  String internal_stringField;
  InternalStruct(this.internal_stringField);
  /// @nodoc
  internal_fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_PublicTypeCollection_InternalStruct_fooBar'));
    final _handle = smokePublictypecollectionInternalstructToFfi(this);
    final __resultHandle = _fooBarFfi(_handle, __lib.LibraryContext.isolateId);
    smokePublictypecollectionInternalstructReleaseFfiHandle(_handle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
// InternalStruct "private" section, not exported.
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
Pointer<Void> smokePublictypecollectionInternalstructToFfi(InternalStruct value) {
  final _stringFieldHandle = stringToFfi(value.internal_stringField);
  final _result = _smokePublictypecollectionInternalstructCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
InternalStruct smokePublictypecollectionInternalstructFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokePublictypecollectionInternalstructGetFieldstringField(handle);
  try {
    return InternalStruct(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokePublictypecollectionInternalstructReleaseFfiHandle(Pointer<Void> handle) => _smokePublictypecollectionInternalstructReleaseHandle(handle);
// Nullable InternalStruct
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
Pointer<Void> smokePublictypecollectionInternalstructToFfiNullable(InternalStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublictypecollectionInternalstructToFfi(value);
  final result = _smokePublictypecollectionInternalstructCreateHandleNullable(_handle);
  smokePublictypecollectionInternalstructReleaseFfiHandle(_handle);
  return result;
}
InternalStruct? smokePublictypecollectionInternalstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublictypecollectionInternalstructGetValueNullable(handle);
  final result = smokePublictypecollectionInternalstructFromFfi(_handle);
  smokePublictypecollectionInternalstructReleaseFfiHandle(_handle);
  return result;
}
void smokePublictypecollectionInternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublictypecollectionInternalstructReleaseHandleNullable(handle);
// End of InternalStruct "private" section.
