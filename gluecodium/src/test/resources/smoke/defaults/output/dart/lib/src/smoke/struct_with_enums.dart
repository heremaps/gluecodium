import 'package:library/src/smoke/something_enum.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class StructWithEnums {
  SomethingEnum firstField;
  SomethingEnum explicitField;
  SomethingEnum lastField;
  StructWithEnums(this.firstField, this.explicitField, this.lastField);
  StructWithEnums.withDefaults()
    : firstField = SomethingEnum.reallyFirst, explicitField = SomethingEnum.explicit, lastField = SomethingEnum.last;
  static final SomethingEnum firstConstant = SomethingEnum.reallyFirst;
}
// StructWithEnums "private" section, not exported.
final _smoke_StructWithEnums_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint32, Uint32),
    Pointer<Void> Function(int, int, int)
  >('library_smoke_StructWithEnums_create_handle'));
final _smoke_StructWithEnums_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_release_handle'));
final _smoke_StructWithEnums_get_field_firstField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_get_field_firstField'));
final _smoke_StructWithEnums_get_field_explicitField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_get_field_explicitField'));
final _smoke_StructWithEnums_get_field_lastField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_get_field_lastField'));
Pointer<Void> smoke_StructWithEnums_toFfi(StructWithEnums value) {
  final _firstField_handle = smoke_SomethingEnum_toFfi(value.firstField);
  final _explicitField_handle = smoke_SomethingEnum_toFfi(value.explicitField);
  final _lastField_handle = smoke_SomethingEnum_toFfi(value.lastField);
  final _result = _smoke_StructWithEnums_create_handle(_firstField_handle, _explicitField_handle, _lastField_handle);
  smoke_SomethingEnum_releaseFfiHandle(_firstField_handle);
  smoke_SomethingEnum_releaseFfiHandle(_explicitField_handle);
  smoke_SomethingEnum_releaseFfiHandle(_lastField_handle);
  return _result;
}
StructWithEnums smoke_StructWithEnums_fromFfi(Pointer<Void> handle) {
  final _firstField_handle = _smoke_StructWithEnums_get_field_firstField(handle);
  final _explicitField_handle = _smoke_StructWithEnums_get_field_explicitField(handle);
  final _lastField_handle = _smoke_StructWithEnums_get_field_lastField(handle);
  try {
    return StructWithEnums(
      smoke_SomethingEnum_fromFfi(_firstField_handle),
      smoke_SomethingEnum_fromFfi(_explicitField_handle),
      smoke_SomethingEnum_fromFfi(_lastField_handle)
    );
  } finally {
    smoke_SomethingEnum_releaseFfiHandle(_firstField_handle);
    smoke_SomethingEnum_releaseFfiHandle(_explicitField_handle);
    smoke_SomethingEnum_releaseFfiHandle(_lastField_handle);
  }
}
void smoke_StructWithEnums_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructWithEnums_release_handle(handle);
// Nullable StructWithEnums
final _smoke_StructWithEnums_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_create_handle_nullable'));
final _smoke_StructWithEnums_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_release_handle_nullable'));
final _smoke_StructWithEnums_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_get_value_nullable'));
Pointer<Void> smoke_StructWithEnums_toFfi_nullable(StructWithEnums value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithEnums_toFfi(value);
  final result = _smoke_StructWithEnums_create_handle_nullable(_handle);
  smoke_StructWithEnums_releaseFfiHandle(_handle);
  return result;
}
StructWithEnums smoke_StructWithEnums_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithEnums_get_value_nullable(handle);
  final result = smoke_StructWithEnums_fromFfi(_handle);
  smoke_StructWithEnums_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithEnums_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithEnums_release_handle_nullable(handle);
// End of StructWithEnums "private" section.
