import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class PublicFieldsMixedInit {
  String publicField1;
  String publicField2;
  /// @nodoc
  @internal
  String internal_internalField;
  PublicFieldsMixedInit(this.publicField1, this.publicField2) : internal_internalField = "foo";
  PublicFieldsMixedInit.allFields(this.publicField1, this.publicField2, this.internal_internalField);
  PublicFieldsMixedInit.withDefaults(String publicField2)
    : publicField1 = "bar", publicField2 = publicField2, internal_internalField = "foo";
}
// PublicFieldsMixedInit "private" section, not exported.
final _smokePublicfieldsmixedinitCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_PublicFieldsMixedInit_create_handle'));
final _smokePublicfieldsmixedinitReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicFieldsMixedInit_release_handle'));
final _smokePublicfieldsmixedinitGetFieldpublicField1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsMixedInit_get_field_publicField1'));
final _smokePublicfieldsmixedinitGetFieldpublicField2 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsMixedInit_get_field_publicField2'));
final _smokePublicfieldsmixedinitGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsMixedInit_get_field_internalField'));
Pointer<Void> smokePublicfieldsmixedinitToFfi(PublicFieldsMixedInit value) {
  final _publicField1Handle = stringToFfi(value.publicField1);
  final _publicField2Handle = stringToFfi(value.publicField2);
  final _internalFieldHandle = stringToFfi(value.internal_internalField);
  final _result = _smokePublicfieldsmixedinitCreateHandle(_publicField1Handle, _publicField2Handle, _internalFieldHandle);
  stringReleaseFfiHandle(_publicField1Handle);
  stringReleaseFfiHandle(_publicField2Handle);
  stringReleaseFfiHandle(_internalFieldHandle);
  return _result;
}
PublicFieldsMixedInit smokePublicfieldsmixedinitFromFfi(Pointer<Void> handle) {
  final _publicField1Handle = _smokePublicfieldsmixedinitGetFieldpublicField1(handle);
  final _publicField2Handle = _smokePublicfieldsmixedinitGetFieldpublicField2(handle);
  final _internalFieldHandle = _smokePublicfieldsmixedinitGetFieldinternalField(handle);
  try {
    return PublicFieldsMixedInit.allFields(
      stringFromFfi(_publicField1Handle),
      stringFromFfi(_publicField2Handle),
      stringFromFfi(_internalFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_publicField1Handle);
    stringReleaseFfiHandle(_publicField2Handle);
    stringReleaseFfiHandle(_internalFieldHandle);
  }
}
void smokePublicfieldsmixedinitReleaseFfiHandle(Pointer<Void> handle) => _smokePublicfieldsmixedinitReleaseHandle(handle);
// Nullable PublicFieldsMixedInit
final _smokePublicfieldsmixedinitCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsMixedInit_create_handle_nullable'));
final _smokePublicfieldsmixedinitReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicFieldsMixedInit_release_handle_nullable'));
final _smokePublicfieldsmixedinitGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsMixedInit_get_value_nullable'));
Pointer<Void> smokePublicfieldsmixedinitToFfiNullable(PublicFieldsMixedInit? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublicfieldsmixedinitToFfi(value);
  final result = _smokePublicfieldsmixedinitCreateHandleNullable(_handle);
  smokePublicfieldsmixedinitReleaseFfiHandle(_handle);
  return result;
}
PublicFieldsMixedInit? smokePublicfieldsmixedinitFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublicfieldsmixedinitGetValueNullable(handle);
  final result = smokePublicfieldsmixedinitFromFfi(_handle);
  smokePublicfieldsmixedinitReleaseFfiHandle(_handle);
  return result;
}
void smokePublicfieldsmixedinitReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicfieldsmixedinitReleaseHandleNullable(handle);
// End of PublicFieldsMixedInit "private" section.
