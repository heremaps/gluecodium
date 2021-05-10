import 'package:library/src/smoke/something_enum.dart';
import 'dart:ffi';
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
final _smokeStructwithenumsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint32, Uint32),
    Pointer<Void> Function(int, int, int)
  >('library_smoke_StructWithEnums_create_handle'));
final _smokeStructwithenumsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_release_handle'));
final _smokeStructwithenumsGetFieldfirstField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_get_field_firstField'));
final _smokeStructwithenumsGetFieldexplicitField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_get_field_explicitField'));
final _smokeStructwithenumsGetFieldlastField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_get_field_lastField'));
Pointer<Void> smoke_StructWithEnums_toFfi(StructWithEnums value) {
  final _firstFieldHandle = smoke_SomethingEnum_toFfi(value.firstField);
  final _explicitFieldHandle = smoke_SomethingEnum_toFfi(value.explicitField);
  final _lastFieldHandle = smoke_SomethingEnum_toFfi(value.lastField);
  final _result = _smokeStructwithenumsCreateHandle(_firstFieldHandle, _explicitFieldHandle, _lastFieldHandle);
  smoke_SomethingEnum_releaseFfiHandle(_firstFieldHandle);
  smoke_SomethingEnum_releaseFfiHandle(_explicitFieldHandle);
  smoke_SomethingEnum_releaseFfiHandle(_lastFieldHandle);
  return _result;
}
StructWithEnums smoke_StructWithEnums_fromFfi(Pointer<Void> handle) {
  final _firstFieldHandle = _smokeStructwithenumsGetFieldfirstField(handle);
  final _explicitFieldHandle = _smokeStructwithenumsGetFieldexplicitField(handle);
  final _lastFieldHandle = _smokeStructwithenumsGetFieldlastField(handle);
  try {
    return StructWithEnums(
      smoke_SomethingEnum_fromFfi(_firstFieldHandle),
      smoke_SomethingEnum_fromFfi(_explicitFieldHandle),
      smoke_SomethingEnum_fromFfi(_lastFieldHandle)
    );
  } finally {
    smoke_SomethingEnum_releaseFfiHandle(_firstFieldHandle);
    smoke_SomethingEnum_releaseFfiHandle(_explicitFieldHandle);
    smoke_SomethingEnum_releaseFfiHandle(_lastFieldHandle);
  }
}
void smoke_StructWithEnums_releaseFfiHandle(Pointer<Void> handle) => _smokeStructwithenumsReleaseHandle(handle);
// Nullable StructWithEnums
final _smoke_StructWithEnumsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_create_handle_nullable'));
final _smoke_StructWithEnumsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_release_handle_nullable'));
final _smoke_StructWithEnumsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_get_value_nullable'));
Pointer<Void> smoke_StructWithEnums_toFfi_nullable(StructWithEnums value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithEnums_toFfi(value);
  final result = _smoke_StructWithEnumsCreateHandleNullable(_handle);
  smoke_StructWithEnums_releaseFfiHandle(_handle);
  return result;
}
StructWithEnums smoke_StructWithEnums_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithEnumsGetValueNullable(handle);
  final result = smoke_StructWithEnums_fromFfi(_handle);
  smoke_StructWithEnums_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithEnums_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithEnumsReleaseHandleNullable(handle);
// End of StructWithEnums "private" section.
