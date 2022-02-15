import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class PublicFieldsAllInit {
  String publicField;
  /// @nodoc
  @internal
  String internal_internalField;
  PublicFieldsAllInit._(this.publicField, this.internal_internalField);
  PublicFieldsAllInit()
    : publicField = "bar", internal_internalField = "foo";
}
// PublicFieldsAllInit "private" section, not exported.
final _smokePublicfieldsallinitCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_PublicFieldsAllInit_create_handle'));
final _smokePublicfieldsallinitReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInit_release_handle'));
final _smokePublicfieldsallinitGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInit_get_field_publicField'));
final _smokePublicfieldsallinitGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInit_get_field_internalField'));
Pointer<Void> smokePublicfieldsallinitToFfi(PublicFieldsAllInit value) {
  final _publicFieldHandle = stringToFfi(value.publicField);
  final _internalFieldHandle = stringToFfi(value.internal_internalField);
  final _result = _smokePublicfieldsallinitCreateHandle(_publicFieldHandle, _internalFieldHandle);
  stringReleaseFfiHandle(_publicFieldHandle);
  stringReleaseFfiHandle(_internalFieldHandle);
  return _result;
}
PublicFieldsAllInit smokePublicfieldsallinitFromFfi(Pointer<Void> handle) {
  final _publicFieldHandle = _smokePublicfieldsallinitGetFieldpublicField(handle);
  final _internalFieldHandle = _smokePublicfieldsallinitGetFieldinternalField(handle);
  try {
    return PublicFieldsAllInit._(
      stringFromFfi(_publicFieldHandle),
      stringFromFfi(_internalFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_publicFieldHandle);
    stringReleaseFfiHandle(_internalFieldHandle);
  }
}
void smokePublicfieldsallinitReleaseFfiHandle(Pointer<Void> handle) => _smokePublicfieldsallinitReleaseHandle(handle);
// Nullable PublicFieldsAllInit
final _smokePublicfieldsallinitCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInit_create_handle_nullable'));
final _smokePublicfieldsallinitReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInit_release_handle_nullable'));
final _smokePublicfieldsallinitGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicFieldsAllInit_get_value_nullable'));
Pointer<Void> smokePublicfieldsallinitToFfiNullable(PublicFieldsAllInit? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublicfieldsallinitToFfi(value);
  final result = _smokePublicfieldsallinitCreateHandleNullable(_handle);
  smokePublicfieldsallinitReleaseFfiHandle(_handle);
  return result;
}
PublicFieldsAllInit? smokePublicfieldsallinitFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublicfieldsallinitGetValueNullable(handle);
  final result = smokePublicfieldsallinitFromFfi(_handle);
  smokePublicfieldsallinitReleaseFfiHandle(_handle);
  return result;
}
void smokePublicfieldsallinitReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicfieldsallinitReleaseHandleNullable(handle);
// End of PublicFieldsAllInit "private" section.
