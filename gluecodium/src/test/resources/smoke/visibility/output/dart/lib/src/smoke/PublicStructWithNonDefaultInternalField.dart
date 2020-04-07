import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;

class PublicStructWithNonDefaultInternalField {
  int defaultedField;
  String internal_internalField;
  bool publicField;
  PublicStructWithNonDefaultInternalField(this.defaultedField, this.internal_internalField, this.publicField);
  PublicStructWithNonDefaultInternalField.withDefaults(String internalField, bool publicField)
    : defaultedField = 42, internal_internalField = internalField, publicField = publicField;
}
// PublicStructWithNonDefaultInternalField "private" section, not exported.
final _smoke_PublicStructWithNonDefaultInternalField_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>, Uint8),
    Pointer<Void> Function(int, Pointer<Void>, int)
  >('library_smoke_PublicStructWithNonDefaultInternalField_create_handle');
final _smoke_PublicStructWithNonDefaultInternalField_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_release_handle');
final _smoke_PublicStructWithNonDefaultInternalField_get_field_defaultedField = __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_get_field_defaultedField');
final _smoke_PublicStructWithNonDefaultInternalField_get_field_internalField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_get_field_internalField');
final _smoke_PublicStructWithNonDefaultInternalField_get_field_publicField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_get_field_publicField');
Pointer<Void> smoke_PublicStructWithNonDefaultInternalField_toFfi(PublicStructWithNonDefaultInternalField value) {
  final _defaultedField_handle = (value.defaultedField);
  final _internalField_handle = String_toFfi(value.internal_internalField);
  final _publicField_handle = Boolean_toFfi(value.publicField);
  final _result = _smoke_PublicStructWithNonDefaultInternalField_create_handle(_defaultedField_handle, _internalField_handle, _publicField_handle);
  (_defaultedField_handle);
  String_releaseFfiHandle(_internalField_handle);
  Boolean_releaseFfiHandle(_publicField_handle);
  return _result;
}
PublicStructWithNonDefaultInternalField smoke_PublicStructWithNonDefaultInternalField_fromFfi(Pointer<Void> handle) {
  final _defaultedField_handle = _smoke_PublicStructWithNonDefaultInternalField_get_field_defaultedField(handle);
  final _internalField_handle = _smoke_PublicStructWithNonDefaultInternalField_get_field_internalField(handle);
  final _publicField_handle = _smoke_PublicStructWithNonDefaultInternalField_get_field_publicField(handle);
  final _result = PublicStructWithNonDefaultInternalField(
    (_defaultedField_handle),
    String_fromFfi(_internalField_handle),
    Boolean_fromFfi(_publicField_handle)
  );
  (_defaultedField_handle);
  String_releaseFfiHandle(_internalField_handle);
  Boolean_releaseFfiHandle(_publicField_handle);
  return _result;
}
void smoke_PublicStructWithNonDefaultInternalField_releaseFfiHandle(Pointer<Void> handle) => _smoke_PublicStructWithNonDefaultInternalField_release_handle(handle);
// Nullable PublicStructWithNonDefaultInternalField
final _smoke_PublicStructWithNonDefaultInternalField_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_create_handle_nullable');
final _smoke_PublicStructWithNonDefaultInternalField_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_release_handle_nullable');
final _smoke_PublicStructWithNonDefaultInternalField_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_get_value_nullable');
Pointer<Void> smoke_PublicStructWithNonDefaultInternalField_toFfi_nullable(PublicStructWithNonDefaultInternalField value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicStructWithNonDefaultInternalField_toFfi(value);
  final result = _smoke_PublicStructWithNonDefaultInternalField_create_handle_nullable(_handle);
  smoke_PublicStructWithNonDefaultInternalField_releaseFfiHandle(_handle);
  return result;
}
PublicStructWithNonDefaultInternalField smoke_PublicStructWithNonDefaultInternalField_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicStructWithNonDefaultInternalField_get_value_nullable(handle);
  final result = smoke_PublicStructWithNonDefaultInternalField_fromFfi(_handle);
  smoke_PublicStructWithNonDefaultInternalField_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicStructWithNonDefaultInternalField_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicStructWithNonDefaultInternalField_release_handle_nullable(handle);
// End of PublicStructWithNonDefaultInternalField "private" section.
