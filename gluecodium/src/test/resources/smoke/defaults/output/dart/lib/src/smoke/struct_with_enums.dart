import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/smoke/something_enum.dart';
class StructWithEnums {
  SomethingEnum firstField;
  SomethingEnum explicitField;
  SomethingEnum lastField;
  StructWithEnums._(this.firstField, this.explicitField, this.lastField);
  StructWithEnums()
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
Pointer<Void> smokeStructwithenumsToFfi(StructWithEnums value) {
  final _firstFieldHandle = smokeSomethingenumToFfi(value.firstField);
  final _explicitFieldHandle = smokeSomethingenumToFfi(value.explicitField);
  final _lastFieldHandle = smokeSomethingenumToFfi(value.lastField);
  final _result = _smokeStructwithenumsCreateHandle(_firstFieldHandle, _explicitFieldHandle, _lastFieldHandle);
  smokeSomethingenumReleaseFfiHandle(_firstFieldHandle);
  smokeSomethingenumReleaseFfiHandle(_explicitFieldHandle);
  smokeSomethingenumReleaseFfiHandle(_lastFieldHandle);
  return _result;
}
StructWithEnums smokeStructwithenumsFromFfi(Pointer<Void> handle) {
  final _firstFieldHandle = _smokeStructwithenumsGetFieldfirstField(handle);
  final _explicitFieldHandle = _smokeStructwithenumsGetFieldexplicitField(handle);
  final _lastFieldHandle = _smokeStructwithenumsGetFieldlastField(handle);
  try {
    return StructWithEnums._(
      smokeSomethingenumFromFfi(_firstFieldHandle),
      smokeSomethingenumFromFfi(_explicitFieldHandle),
      smokeSomethingenumFromFfi(_lastFieldHandle)
    );
  } finally {
    smokeSomethingenumReleaseFfiHandle(_firstFieldHandle);
    smokeSomethingenumReleaseFfiHandle(_explicitFieldHandle);
    smokeSomethingenumReleaseFfiHandle(_lastFieldHandle);
  }
}
void smokeStructwithenumsReleaseFfiHandle(Pointer<Void> handle) => _smokeStructwithenumsReleaseHandle(handle);
// Nullable StructWithEnums
final _smokeStructwithenumsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_create_handle_nullable'));
final _smokeStructwithenumsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_release_handle_nullable'));
final _smokeStructwithenumsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithEnums_get_value_nullable'));
Pointer<Void> smokeStructwithenumsToFfiNullable(StructWithEnums? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructwithenumsToFfi(value);
  final result = _smokeStructwithenumsCreateHandleNullable(_handle);
  smokeStructwithenumsReleaseFfiHandle(_handle);
  return result;
}
StructWithEnums? smokeStructwithenumsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructwithenumsGetValueNullable(handle);
  final result = smokeStructwithenumsFromFfi(_handle);
  smokeStructwithenumsReleaseFfiHandle(_handle);
  return result;
}
void smokeStructwithenumsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructwithenumsReleaseHandleNullable(handle);
// End of StructWithEnums "private" section.
