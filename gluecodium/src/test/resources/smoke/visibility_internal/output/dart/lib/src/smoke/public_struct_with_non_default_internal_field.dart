import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class PublicStructWithNonDefaultInternalField {
  int defaultedField;
  /// @nodoc
  String _internalField;
  bool publicField;
  PublicStructWithNonDefaultInternalField._(this.defaultedField, this._internalField, this.publicField);
  PublicStructWithNonDefaultInternalField(String internalField, bool publicField)
    : defaultedField = 42, _internalField = internalField, publicField = publicField;
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
Pointer<Void> smokePublicstructwithnondefaultinternalfieldToFfi(PublicStructWithNonDefaultInternalField value) {
  final _defaultedFieldHandle = (value.defaultedField);
  final _internalFieldHandle = stringToFfi(value._internalField);
  final _publicFieldHandle = booleanToFfi(value.publicField);
  final _result = _smokePublicstructwithnondefaultinternalfieldCreateHandle(_defaultedFieldHandle, _internalFieldHandle, _publicFieldHandle);
  stringReleaseFfiHandle(_internalFieldHandle);
  booleanReleaseFfiHandle(_publicFieldHandle);
  return _result;
}
PublicStructWithNonDefaultInternalField smokePublicstructwithnondefaultinternalfieldFromFfi(Pointer<Void> handle) {
  final _defaultedFieldHandle = _smokePublicstructwithnondefaultinternalfieldGetFielddefaultedField(handle);
  final _internalFieldHandle = _smokePublicstructwithnondefaultinternalfieldGetFieldinternalField(handle);
  final _publicFieldHandle = _smokePublicstructwithnondefaultinternalfieldGetFieldpublicField(handle);
  try {
    return PublicStructWithNonDefaultInternalField._(
      (_defaultedFieldHandle),
      stringFromFfi(_internalFieldHandle),
      booleanFromFfi(_publicFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_internalFieldHandle);
    booleanReleaseFfiHandle(_publicFieldHandle);
  }
}
void smokePublicstructwithnondefaultinternalfieldReleaseFfiHandle(Pointer<Void> handle) => _smokePublicstructwithnondefaultinternalfieldReleaseHandle(handle);
// Nullable PublicStructWithNonDefaultInternalField
final _smokePublicstructwithnondefaultinternalfieldCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_create_handle_nullable'));
final _smokePublicstructwithnondefaultinternalfieldReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_release_handle_nullable'));
final _smokePublicstructwithnondefaultinternalfieldGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicStructWithNonDefaultInternalField_get_value_nullable'));
Pointer<Void> smokePublicstructwithnondefaultinternalfieldToFfiNullable(PublicStructWithNonDefaultInternalField? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublicstructwithnondefaultinternalfieldToFfi(value);
  final result = _smokePublicstructwithnondefaultinternalfieldCreateHandleNullable(_handle);
  smokePublicstructwithnondefaultinternalfieldReleaseFfiHandle(_handle);
  return result;
}
PublicStructWithNonDefaultInternalField? smokePublicstructwithnondefaultinternalfieldFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublicstructwithnondefaultinternalfieldGetValueNullable(handle);
  final result = smokePublicstructwithnondefaultinternalfieldFromFfi(_handle);
  smokePublicstructwithnondefaultinternalfieldReleaseFfiHandle(_handle);
  return result;
}
void smokePublicstructwithnondefaultinternalfieldReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicstructwithnondefaultinternalfieldReleaseHandleNullable(handle);
// End of PublicStructWithNonDefaultInternalField "private" section.
