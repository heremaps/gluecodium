import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
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
      return smoke_StructWithConstructor_fromFfi(__resultHandle);
    } finally {
      smoke_StructWithConstructor_releaseFfiHandle(__resultHandle);
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
Pointer<Void> smoke_StructWithConstructor_toFfi(StructWithConstructor value) {
  final _fieldHandle = String_toFfi(value.field);
  final _result = _smokeStructwithconstructorCreateHandle(_fieldHandle);
  String_releaseFfiHandle(_fieldHandle);
  return _result;
}
StructWithConstructor smoke_StructWithConstructor_fromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeStructwithconstructorGetFieldfield(handle);
  try {
    return StructWithConstructor._(
      String_fromFfi(_fieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_fieldHandle);
  }
}
void smoke_StructWithConstructor_releaseFfiHandle(Pointer<Void> handle) => _smokeStructwithconstructorReleaseHandle(handle);
// Nullable StructWithConstructor
final _smoke_StructWithConstructorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_create_handle_nullable'));
final _smoke_StructWithConstructorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_release_handle_nullable'));
final _smoke_StructWithConstructorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_get_value_nullable'));
Pointer<Void> smoke_StructWithConstructor_toFfi_nullable(StructWithConstructor value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithConstructor_toFfi(value);
  final result = _smoke_StructWithConstructorCreateHandleNullable(_handle);
  smoke_StructWithConstructor_releaseFfiHandle(_handle);
  return result;
}
StructWithConstructor smoke_StructWithConstructor_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithConstructorGetValueNullable(handle);
  final result = smoke_StructWithConstructor_fromFfi(_handle);
  smoke_StructWithConstructor_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithConstructor_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithConstructorReleaseHandleNullable(handle);
// End of StructWithConstructor "private" section.
