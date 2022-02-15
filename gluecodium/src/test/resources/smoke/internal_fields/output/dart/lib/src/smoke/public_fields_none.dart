import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class PublicFieldsNone {
  /// @nodoc
  @internal
  String internal_internalField;
  PublicFieldsNone._(this.internal_internalField);
  PublicFieldsNone()
    : internal_internalField = "foo";
}
// PublicFieldsNone "private" section, not exported.
final _smokePublicfieldsnoneCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNone_create_handle'));
final _smokePublicfieldsnoneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNone_release_handle'));
final _smokePublicfieldsnoneGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNone_get_field_internalField'));
Pointer<Void> smokePublicfieldsnoneToFfi(PublicFieldsNone value) {
  final _internalFieldHandle = stringToFfi(value.internal_internalField);
  final _result = _smokePublicfieldsnoneCreateHandle(_internalFieldHandle);
  stringReleaseFfiHandle(_internalFieldHandle);
  return _result;
}
PublicFieldsNone smokePublicfieldsnoneFromFfi(Pointer<Void> handle) {
  final _internalFieldHandle = _smokePublicfieldsnoneGetFieldinternalField(handle);
  try {
    return PublicFieldsNone._(
      stringFromFfi(_internalFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_internalFieldHandle);
  }
}
void smokePublicfieldsnoneReleaseFfiHandle(Pointer<Void> handle) => _smokePublicfieldsnoneReleaseHandle(handle);
// Nullable PublicFieldsNone
final _smokePublicfieldsnoneCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNone_create_handle_nullable'));
final _smokePublicfieldsnoneReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNone_release_handle_nullable'));
final _smokePublicfieldsnoneGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsNone_get_value_nullable'));
Pointer<Void> smokePublicfieldsnoneToFfiNullable(PublicFieldsNone? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublicfieldsnoneToFfi(value);
  final result = _smokePublicfieldsnoneCreateHandleNullable(_handle);
  smokePublicfieldsnoneReleaseFfiHandle(_handle);
  return result;
}
PublicFieldsNone? smokePublicfieldsnoneFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublicfieldsnoneGetValueNullable(handle);
  final result = smokePublicfieldsnoneFromFfi(_handle);
  smokePublicfieldsnoneReleaseFfiHandle(_handle);
  return result;
}
void smokePublicfieldsnoneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicfieldsnoneReleaseHandleNullable(handle);
// End of PublicFieldsNone "private" section.
