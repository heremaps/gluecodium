import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
    final _fooBar_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_StructWithConstructor_fooBar'));
    final __result_handle = _fooBar_ffi(__lib.LibraryContext.isolateId);
    try {
      return smoke_StructWithConstructor_fromFfi(__result_handle);
    } finally {
      smoke_StructWithConstructor_releaseFfiHandle(__result_handle);
    }
  }
}
// StructWithConstructor "private" section, not exported.
final _smoke_StructWithConstructor_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_create_handle'));
final _smoke_StructWithConstructor_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_release_handle'));
final _smoke_StructWithConstructor_get_field_field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_get_field_field'));
Pointer<Void> smoke_StructWithConstructor_toFfi(StructWithConstructor value) {
  final _field_handle = String_toFfi(value.field);
  final _result = _smoke_StructWithConstructor_create_handle(_field_handle);
  String_releaseFfiHandle(_field_handle);
  return _result;
}
StructWithConstructor smoke_StructWithConstructor_fromFfi(Pointer<Void> handle) {
  final _field_handle = _smoke_StructWithConstructor_get_field_field(handle);
  try {
    return StructWithConstructor._(
      String_fromFfi(_field_handle)
    );
  } finally {
    String_releaseFfiHandle(_field_handle);
  }
}
void smoke_StructWithConstructor_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructWithConstructor_release_handle(handle);
// Nullable StructWithConstructor
final _smoke_StructWithConstructor_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_create_handle_nullable'));
final _smoke_StructWithConstructor_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_release_handle_nullable'));
final _smoke_StructWithConstructor_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithConstructor_get_value_nullable'));
Pointer<Void> smoke_StructWithConstructor_toFfi_nullable(StructWithConstructor value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithConstructor_toFfi(value);
  final result = _smoke_StructWithConstructor_create_handle_nullable(_handle);
  smoke_StructWithConstructor_releaseFfiHandle(_handle);
  return result;
}
StructWithConstructor smoke_StructWithConstructor_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithConstructor_get_value_nullable(handle);
  final result = smoke_StructWithConstructor_fromFfi(_handle);
  smoke_StructWithConstructor_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithConstructor_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithConstructor_release_handle_nullable(handle);
// End of StructWithConstructor "private" section.
