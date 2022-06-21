import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class FieldConstructorsInternal {
  String publicField;
  double internalField;
  @internal
  FieldConstructorsInternal.withAll()
      : publicField = "foo", internalField = 42;
  @internal
  FieldConstructorsInternal.withFortyTwo(this.publicField)
      : internalField = 42;
  @internal
  FieldConstructorsInternal.withFoo(this.internalField)
      : publicField = "foo";
  @internal
  FieldConstructorsInternal(this.internalField, this.publicField);
}
// FieldConstructorsInternal "private" section, not exported.
final _smokeFieldconstructorsinternalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Double),
    Pointer<Void> Function(Pointer<Void>, double)
  >('library_smoke_FieldConstructorsInternal_create_handle'));
final _smokeFieldconstructorsinternalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternal_release_handle'));
final _smokeFieldconstructorsinternalGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternal_get_field_publicField'));
final _smokeFieldconstructorsinternalGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternal_get_field_internalField'));
Pointer<Void> smokeFieldconstructorsinternalToFfi(FieldConstructorsInternal value) {
  final _publicFieldHandle = stringToFfi(value.publicField);
  final _internalFieldHandle = (value.internalField);
  final _result = _smokeFieldconstructorsinternalCreateHandle(_publicFieldHandle, _internalFieldHandle);
  stringReleaseFfiHandle(_publicFieldHandle);
  return _result;
}
FieldConstructorsInternal smokeFieldconstructorsinternalFromFfi(Pointer<Void> handle) {
  final _publicFieldHandle = _smokeFieldconstructorsinternalGetFieldpublicField(handle);
  final _internalFieldHandle = _smokeFieldconstructorsinternalGetFieldinternalField(handle);
  try {
    return FieldConstructorsInternal(
      (_internalFieldHandle),
      stringFromFfi(_publicFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_publicFieldHandle);
  }
}
void smokeFieldconstructorsinternalReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorsinternalReleaseHandle(handle);
// Nullable FieldConstructorsInternal
final _smokeFieldconstructorsinternalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternal_create_handle_nullable'));
final _smokeFieldconstructorsinternalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternal_release_handle_nullable'));
final _smokeFieldconstructorsinternalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsInternal_get_value_nullable'));
Pointer<Void> smokeFieldconstructorsinternalToFfiNullable(FieldConstructorsInternal? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorsinternalToFfi(value);
  final result = _smokeFieldconstructorsinternalCreateHandleNullable(_handle);
  smokeFieldconstructorsinternalReleaseFfiHandle(_handle);
  return result;
}
FieldConstructorsInternal? smokeFieldconstructorsinternalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorsinternalGetValueNullable(handle);
  final result = smokeFieldconstructorsinternalFromFfi(_handle);
  smokeFieldconstructorsinternalReleaseFfiHandle(_handle);
  return result;
}
void smokeFieldconstructorsinternalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorsinternalReleaseHandleNullable(handle);
// End of FieldConstructorsInternal "private" section.
