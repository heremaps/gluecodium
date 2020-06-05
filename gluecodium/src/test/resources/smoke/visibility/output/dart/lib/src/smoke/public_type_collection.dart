import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
class InternalStruct {
  /// @nodoc
  String internal_stringField;
  InternalStruct(this.internal_stringField);
}
// InternalStruct "private" section, not exported.
final _smoke_PublicTypeCollection_InternalStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_create_handle');
final _smoke_PublicTypeCollection_InternalStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_release_handle');
final _smoke_PublicTypeCollection_InternalStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_get_field_stringField');
Pointer<Void> smoke_PublicTypeCollection_InternalStruct_toFfi(InternalStruct value) {
  final _stringField_handle = String_toFfi(value.internal_stringField);
  final _result = _smoke_PublicTypeCollection_InternalStruct_create_handle(_stringField_handle);
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
InternalStruct smoke_PublicTypeCollection_InternalStruct_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_PublicTypeCollection_InternalStruct_get_field_stringField(handle);
  try {
    return InternalStruct(
      String_fromFfi(_stringField_handle)
    );
  } finally {
    String_releaseFfiHandle(_stringField_handle);
  }
}
void smoke_PublicTypeCollection_InternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_PublicTypeCollection_InternalStruct_release_handle(handle);
// Nullable InternalStruct
final _smoke_PublicTypeCollection_InternalStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_create_handle_nullable');
final _smoke_PublicTypeCollection_InternalStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_release_handle_nullable');
final _smoke_PublicTypeCollection_InternalStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicTypeCollection_InternalStruct_get_value_nullable');
Pointer<Void> smoke_PublicTypeCollection_InternalStruct_toFfi_nullable(InternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicTypeCollection_InternalStruct_toFfi(value);
  final result = _smoke_PublicTypeCollection_InternalStruct_create_handle_nullable(_handle);
  smoke_PublicTypeCollection_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
InternalStruct smoke_PublicTypeCollection_InternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicTypeCollection_InternalStruct_get_value_nullable(handle);
  final result = smoke_PublicTypeCollection_InternalStruct_fromFfi(_handle);
  smoke_PublicTypeCollection_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicTypeCollection_InternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicTypeCollection_InternalStruct_release_handle_nullable(handle);
// End of InternalStruct "private" section.
