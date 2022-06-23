import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class PublicFieldsAllInitPosDefaults {
  String publicField;
  /// @nodoc
  @internal
  String _internalField;
  PublicFieldsAllInitPosDefaults([String publicField = "bar", String internalField = "foo"])
    : publicField = publicField, _internalField = internalField;
}
// PublicFieldsAllInitPosDefaults "private" section, not exported.
final _smokePublicfieldsallinitposdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_PublicFieldsAllInitPosDefaults_create_handle'));
final _smokePublicfieldsallinitposdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInitPosDefaults_release_handle'));
final _smokePublicfieldsallinitposdefaultsGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInitPosDefaults_get_field_publicField'));
final _smokePublicfieldsallinitposdefaultsGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInitPosDefaults_get_field_internalField'));
Pointer<Void> smokePublicfieldsallinitposdefaultsToFfi(PublicFieldsAllInitPosDefaults value) {
  final _publicFieldHandle = stringToFfi(value.publicField);
  final _internalFieldHandle = stringToFfi(value._internalField);
  final _result = _smokePublicfieldsallinitposdefaultsCreateHandle(_publicFieldHandle, _internalFieldHandle);
  stringReleaseFfiHandle(_publicFieldHandle);
  stringReleaseFfiHandle(_internalFieldHandle);
  return _result;
}
PublicFieldsAllInitPosDefaults smokePublicfieldsallinitposdefaultsFromFfi(Pointer<Void> handle) {
  final _publicFieldHandle = _smokePublicfieldsallinitposdefaultsGetFieldpublicField(handle);
  final _internalFieldHandle = _smokePublicfieldsallinitposdefaultsGetFieldinternalField(handle);
  try {
    return PublicFieldsAllInitPosDefaults(
      stringFromFfi(_publicFieldHandle),
      stringFromFfi(_internalFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_publicFieldHandle);
    stringReleaseFfiHandle(_internalFieldHandle);
  }
}
void smokePublicfieldsallinitposdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokePublicfieldsallinitposdefaultsReleaseHandle(handle);
// Nullable PublicFieldsAllInitPosDefaults
final _smokePublicfieldsallinitposdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInitPosDefaults_create_handle_nullable'));
final _smokePublicfieldsallinitposdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInitPosDefaults_release_handle_nullable'));
final _smokePublicfieldsallinitposdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInitPosDefaults_get_value_nullable'));
Pointer<Void> smokePublicfieldsallinitposdefaultsToFfiNullable(PublicFieldsAllInitPosDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublicfieldsallinitposdefaultsToFfi(value);
  final result = _smokePublicfieldsallinitposdefaultsCreateHandleNullable(_handle);
  smokePublicfieldsallinitposdefaultsReleaseFfiHandle(_handle);
  return result;
}
PublicFieldsAllInitPosDefaults? smokePublicfieldsallinitposdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublicfieldsallinitposdefaultsGetValueNullable(handle);
  final result = smokePublicfieldsallinitposdefaultsFromFfi(_handle);
  smokePublicfieldsallinitposdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokePublicfieldsallinitposdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicfieldsallinitposdefaultsReleaseHandleNullable(handle);
// End of PublicFieldsAllInitPosDefaults "private" section.
