import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class PublicFieldsNoInit {
  String publicField;
  /// @nodoc
  String _internalField;
  PublicFieldsNoInit._(this.publicField, this._internalField);
  PublicFieldsNoInit(String publicField)
    : publicField = publicField, _internalField = "foo";
}
// PublicFieldsNoInit "private" section, not exported.
final _smokePublicfieldsnoinitCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_PublicFieldsNoInit_create_handle'));
final _smokePublicfieldsnoinitReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNoInit_release_handle'));
final _smokePublicfieldsnoinitGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNoInit_get_field_publicField'));
final _smokePublicfieldsnoinitGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNoInit_get_field_internalField'));
Pointer<Void> smokePublicfieldsnoinitToFfi(PublicFieldsNoInit value) {
  final _publicFieldHandle = stringToFfi(value.publicField);
  final _internalFieldHandle = stringToFfi(value._internalField);
  final _result = _smokePublicfieldsnoinitCreateHandle(_publicFieldHandle, _internalFieldHandle);
  stringReleaseFfiHandle(_publicFieldHandle);
  stringReleaseFfiHandle(_internalFieldHandle);
  return _result;
}
PublicFieldsNoInit smokePublicfieldsnoinitFromFfi(Pointer<Void> handle) {
  final _publicFieldHandle = _smokePublicfieldsnoinitGetFieldpublicField(handle);
  final _internalFieldHandle = _smokePublicfieldsnoinitGetFieldinternalField(handle);
  try {
    return PublicFieldsNoInit._(
      stringFromFfi(_publicFieldHandle),
      stringFromFfi(_internalFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_publicFieldHandle);
    stringReleaseFfiHandle(_internalFieldHandle);
  }
}
void smokePublicfieldsnoinitReleaseFfiHandle(Pointer<Void> handle) => _smokePublicfieldsnoinitReleaseHandle(handle);
// Nullable PublicFieldsNoInit
final _smokePublicfieldsnoinitCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNoInit_create_handle_nullable'));
final _smokePublicfieldsnoinitReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNoInit_release_handle_nullable'));
final _smokePublicfieldsnoinitGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNoInit_get_value_nullable'));
Pointer<Void> smokePublicfieldsnoinitToFfiNullable(PublicFieldsNoInit? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublicfieldsnoinitToFfi(value);
  final result = _smokePublicfieldsnoinitCreateHandleNullable(_handle);
  smokePublicfieldsnoinitReleaseFfiHandle(_handle);
  return result;
}
PublicFieldsNoInit? smokePublicfieldsnoinitFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublicfieldsnoinitGetValueNullable(handle);
  final result = smokePublicfieldsnoinitFromFfi(_handle);
  smokePublicfieldsnoinitReleaseFfiHandle(_handle);
  return result;
}
void smokePublicfieldsnoinitReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicfieldsnoinitReleaseHandleNullable(handle);
// End of PublicFieldsNoInit "private" section.
