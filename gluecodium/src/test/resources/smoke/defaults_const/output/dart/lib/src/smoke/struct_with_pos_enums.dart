import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/smoke/something_enum.dart';
class StructWithPosEnums {
  SomethingEnum firstField;
  SomethingEnum explicitField;
  SomethingEnum lastField;
  StructWithPosEnums._(this.firstField, this.explicitField, this.lastField);
  StructWithPosEnums()
    : firstField = SomethingEnum.reallyFirst, explicitField = SomethingEnum.explicit, lastField = SomethingEnum.last;
  static final SomethingEnum firstConstant = SomethingEnum.reallyFirst;
}
// StructWithPosEnums "private" section, not exported.
final _smokeStructwithposenumsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint32, Uint32),
    Pointer<Void> Function(int, int, int)
  >('library_smoke_StructWithPosEnums_create_handle'));
final _smokeStructwithposenumsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithPosEnums_release_handle'));
final _smokeStructwithposenumsGetFieldfirstField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithPosEnums_get_field_firstField'));
final _smokeStructwithposenumsGetFieldexplicitField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithPosEnums_get_field_explicitField'));
final _smokeStructwithposenumsGetFieldlastField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithPosEnums_get_field_lastField'));
Pointer<Void> smokeStructwithposenumsToFfi(StructWithPosEnums value) {
  final _firstFieldHandle = smokeSomethingenumToFfi(value.firstField);
  final _explicitFieldHandle = smokeSomethingenumToFfi(value.explicitField);
  final _lastFieldHandle = smokeSomethingenumToFfi(value.lastField);
  final _result = _smokeStructwithposenumsCreateHandle(_firstFieldHandle, _explicitFieldHandle, _lastFieldHandle);
  smokeSomethingenumReleaseFfiHandle(_firstFieldHandle);
  smokeSomethingenumReleaseFfiHandle(_explicitFieldHandle);
  smokeSomethingenumReleaseFfiHandle(_lastFieldHandle);
  return _result;
}
StructWithPosEnums smokeStructwithposenumsFromFfi(Pointer<Void> handle) {
  final _firstFieldHandle = _smokeStructwithposenumsGetFieldfirstField(handle);
  final _explicitFieldHandle = _smokeStructwithposenumsGetFieldexplicitField(handle);
  final _lastFieldHandle = _smokeStructwithposenumsGetFieldlastField(handle);
  try {
    return StructWithPosEnums._(
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
void smokeStructwithposenumsReleaseFfiHandle(Pointer<Void> handle) => _smokeStructwithposenumsReleaseHandle(handle);
// Nullable StructWithPosEnums
final _smokeStructwithposenumsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithPosEnums_create_handle_nullable'));
final _smokeStructwithposenumsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithPosEnums_release_handle_nullable'));
final _smokeStructwithposenumsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithPosEnums_get_value_nullable'));
Pointer<Void> smokeStructwithposenumsToFfiNullable(StructWithPosEnums? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructwithposenumsToFfi(value);
  final result = _smokeStructwithposenumsCreateHandleNullable(_handle);
  smokeStructwithposenumsReleaseFfiHandle(_handle);
  return result;
}
StructWithPosEnums? smokeStructwithposenumsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructwithposenumsGetValueNullable(handle);
  final result = smokeStructwithposenumsFromFfi(_handle);
  smokeStructwithposenumsReleaseFfiHandle(_handle);
  return result;
}
void smokeStructwithposenumsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructwithposenumsReleaseHandleNullable(handle);
// End of StructWithPosEnums "private" section.
