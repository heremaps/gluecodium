import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class StructWithConstructor {
  String field;
  StructWithConstructor._(this.field);
  StructWithConstructor._copy(StructWithConstructor _other) : this._(_other.field);
  factory StructWithConstructor() => $class.fooBar();
  static var $class = StructWithConstructor$Impl();
}
class StructWithConstructor$Impl {
  String field;
  StructWithConstructor._(this.field);
  StructWithConstructor._copy(StructWithConstructor _other) : this._(_other.field);
  StructWithConstructor() : this._copy(_fooBar());
  StructWithConstructor _fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_StructWithConstructor_fooBar'));
    final __resultHandle = _fooBarFfi(__lib.LibraryContext.isolateId);
    try {
      return smokeStructwithconstructorFromFfi(__resultHandle);
    } finally {
      smokeStructwithconstructorReleaseFfiHandle(__resultHandle);
    }
  }
}
// StructWithConstructor "private" section, not exported.
final _smokeStructwithconstructorCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_create_handle'));
final _smokeStructwithconstructorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_release_handle'));
final _smokeStructwithconstructorGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_get_field_field'));
Pointer<Void> smokeStructwithconstructorToFfi(StructWithConstructor value) {
  final _fieldHandle = stringToFfi(value.field);
  final _result = _smokeStructwithconstructorCreateHandle(_fieldHandle);
  stringReleaseFfiHandle(_fieldHandle);
  return _result;
}
StructWithConstructor smokeStructwithconstructorFromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeStructwithconstructorGetFieldfield(handle);
  try {
    return StructWithConstructor._(
      stringFromFfi(_fieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_fieldHandle);
  }
}
void smokeStructwithconstructorReleaseFfiHandle(Pointer<Void> handle) => _smokeStructwithconstructorReleaseHandle(handle);
// Nullable StructWithConstructor
final _smokeStructwithconstructorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_create_handle_nullable'));
final _smokeStructwithconstructorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_release_handle_nullable'));
final _smokeStructwithconstructorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_get_value_nullable'));
Pointer<Void> smokeStructwithconstructorToFfiNullable(StructWithConstructor value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructwithconstructorToFfi(value);
  final result = _smokeStructwithconstructorCreateHandleNullable(_handle);
  smokeStructwithconstructorReleaseFfiHandle(_handle);
  return result;
}
StructWithConstructor smokeStructwithconstructorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructwithconstructorGetValueNullable(handle);
  final result = smokeStructwithconstructorFromFfi(_handle);
  smokeStructwithconstructorReleaseFfiHandle(_handle);
  return result;
}
void smokeStructwithconstructorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructwithconstructorReleaseHandleNullable(handle);
// End of StructWithConstructor "private" section.
