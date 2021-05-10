import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
class InternalStruct {
  /// @nodoc
  String internal_stringField;
  InternalStruct(this.internal_stringField);
  /// @nodoc
  internal_fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_PublicTypeCollection_InternalStruct_fooBar'));
    final _handle = smoke_PublicTypeCollection_InternalStruct_toFfi(this);
    final __resultHandle = _fooBarFfi(_handle, __lib.LibraryContext.isolateId);
    smoke_PublicTypeCollection_InternalStruct_releaseFfiHandle(_handle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
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
Pointer<Void> smoke_PublicTypeCollection_InternalStruct_toFfi(InternalStruct value) {
  final _stringFieldHandle = String_toFfi(value.internal_stringField);
  final _result = _smokePublictypecollectionInternalstructCreateHandle(_stringFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  return _result;
}
InternalStruct smoke_PublicTypeCollection_InternalStruct_fromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokePublictypecollectionInternalstructGetFieldstringField(handle);
  try {
    return InternalStruct(
      String_fromFfi(_stringFieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_stringFieldHandle);
  }
}
void smoke_PublicTypeCollection_InternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smokePublictypecollectionInternalstructReleaseHandle(handle);
// Nullable InternalStruct
final _smoke_PublicTypeCollection_InternalStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_create_handle_nullable'));
final _smoke_PublicTypeCollection_InternalStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_release_handle_nullable'));
final _smoke_PublicTypeCollection_InternalStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_get_value_nullable'));
Pointer<Void> smoke_PublicTypeCollection_InternalStruct_toFfi_nullable(InternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicTypeCollection_InternalStruct_toFfi(value);
  final result = _smoke_PublicTypeCollection_InternalStructCreateHandleNullable(_handle);
  smoke_PublicTypeCollection_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
InternalStruct smoke_PublicTypeCollection_InternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicTypeCollection_InternalStructGetValueNullable(handle);
  final result = smoke_PublicTypeCollection_InternalStruct_fromFfi(_handle);
  smoke_PublicTypeCollection_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicTypeCollection_InternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicTypeCollection_InternalStructReleaseHandleNullable(handle);
// End of InternalStruct "private" section.
