import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class PublicStructWithNonDefaultInternalField {
  int defaultedField;
  /// @nodoc
  String internal_internalField;
  bool publicField;
  PublicStructWithNonDefaultInternalField(this.defaultedField, this.internal_internalField, this.publicField);
  PublicStructWithNonDefaultInternalField.withDefaults(String internalField, bool publicField)
    : defaultedField = 42, internal_internalField = internalField, publicField = publicField;
}
// PublicStructWithNonDefaultInternalField "private" section, not exported.
final _smokePublicstructwithnondefaultinternalfieldCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>, Uint8),
    Pointer<Void> Function(int, Pointer<Void>, int)
  >('library_smoke_PublicStructWithNonDefaultInternalField_create_handle'));
final _smokePublicstructwithnondefaultinternalfieldReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_release_handle'));
final _smokePublicstructwithnondefaultinternalfieldGetFielddefaultedField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_get_field_defaultedField'));
final _smokePublicstructwithnondefaultinternalfieldGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_get_field_internalField'));
final _smokePublicstructwithnondefaultinternalfieldGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_get_field_publicField'));
Pointer<Void> smoke_PublicStructWithNonDefaultInternalField_toFfi(PublicStructWithNonDefaultInternalField value) {
  final _defaultedFieldHandle = (value.defaultedField);
  final _internalFieldHandle = String_toFfi(value.internal_internalField);
  final _publicFieldHandle = Boolean_toFfi(value.publicField);
  final _result = _smokePublicstructwithnondefaultinternalfieldCreateHandle(_defaultedFieldHandle, _internalFieldHandle, _publicFieldHandle);
  (_defaultedFieldHandle);
  String_releaseFfiHandle(_internalFieldHandle);
  Boolean_releaseFfiHandle(_publicFieldHandle);
  return _result;
}
PublicStructWithNonDefaultInternalField smoke_PublicStructWithNonDefaultInternalField_fromFfi(Pointer<Void> handle) {
  final _defaultedFieldHandle = _smokePublicstructwithnondefaultinternalfieldGetFielddefaultedField(handle);
  final _internalFieldHandle = _smokePublicstructwithnondefaultinternalfieldGetFieldinternalField(handle);
  final _publicFieldHandle = _smokePublicstructwithnondefaultinternalfieldGetFieldpublicField(handle);
  try {
    return PublicStructWithNonDefaultInternalField(
      (_defaultedFieldHandle),
      String_fromFfi(_internalFieldHandle),
      Boolean_fromFfi(_publicFieldHandle)
    );
  } finally {
    (_defaultedFieldHandle);
    String_releaseFfiHandle(_internalFieldHandle);
    Boolean_releaseFfiHandle(_publicFieldHandle);
  }
}
void smoke_PublicStructWithNonDefaultInternalField_releaseFfiHandle(Pointer<Void> handle) => _smokePublicstructwithnondefaultinternalfieldReleaseHandle(handle);
// Nullable PublicStructWithNonDefaultInternalField
final _smoke_PublicStructWithNonDefaultInternalFieldCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_create_handle_nullable'));
final _smoke_PublicStructWithNonDefaultInternalFieldReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_release_handle_nullable'));
final _smoke_PublicStructWithNonDefaultInternalFieldGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_get_value_nullable'));
Pointer<Void> smoke_PublicStructWithNonDefaultInternalField_toFfi_nullable(PublicStructWithNonDefaultInternalField value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicStructWithNonDefaultInternalField_toFfi(value);
  final result = _smoke_PublicStructWithNonDefaultInternalFieldCreateHandleNullable(_handle);
  smoke_PublicStructWithNonDefaultInternalField_releaseFfiHandle(_handle);
  return result;
}
PublicStructWithNonDefaultInternalField smoke_PublicStructWithNonDefaultInternalField_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicStructWithNonDefaultInternalFieldGetValueNullable(handle);
  final result = smoke_PublicStructWithNonDefaultInternalField_fromFfi(_handle);
  smoke_PublicStructWithNonDefaultInternalField_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicStructWithNonDefaultInternalField_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicStructWithNonDefaultInternalFieldReleaseHandleNullable(handle);
// End of PublicStructWithNonDefaultInternalField "private" section.
