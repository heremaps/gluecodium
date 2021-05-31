import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
@OnStruct
class AttributesStruct {
  @OnField
  String field;
  AttributesStruct(this.field);
  @OnConstInStruct
  static final bool pi = false;
  @OnFunctionInStruct
  veryFun(@OnParameterInStruct String param) {
    final _veryFunFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesStruct_veryFun__String'));
    final _paramHandle = stringToFfi(param);
    final _handle = smokeAttributesstructToFfi(this);
    final __resultHandle = _veryFunFfi(_handle, __lib.LibraryContext.isolateId, _paramHandle);
    smokeAttributesstructReleaseFfiHandle(_handle);
    stringReleaseFfiHandle(_paramHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
// AttributesStruct "private" section, not exported.
final _smokeAttributesstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_create_handle'));
final _smokeAttributesstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_release_handle'));
final _smokeAttributesstructGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_get_field_field'));
Pointer<Void> smokeAttributesstructToFfi(AttributesStruct value) {
  final _fieldHandle = stringToFfi(value.field);
  final _result = _smokeAttributesstructCreateHandle(_fieldHandle);
  stringReleaseFfiHandle(_fieldHandle);
  return _result;
}
AttributesStruct smokeAttributesstructFromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeAttributesstructGetFieldfield(handle);
  try {
    return AttributesStruct(
      stringFromFfi(_fieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_fieldHandle);
  }
}
void smokeAttributesstructReleaseFfiHandle(Pointer<Void> handle) => _smokeAttributesstructReleaseHandle(handle);
// Nullable AttributesStruct
final _smokeAttributesstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_create_handle_nullable'));
final _smokeAttributesstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_release_handle_nullable'));
final _smokeAttributesstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_get_value_nullable'));
Pointer<Void> smokeAttributesstructToFfiNullable(AttributesStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeAttributesstructToFfi(value);
  final result = _smokeAttributesstructCreateHandleNullable(_handle);
  smokeAttributesstructReleaseFfiHandle(_handle);
  return result;
}
AttributesStruct? smokeAttributesstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeAttributesstructGetValueNullable(handle);
  final result = smokeAttributesstructFromFfi(_handle);
  smokeAttributesstructReleaseFfiHandle(_handle);
  return result;
}
void smokeAttributesstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAttributesstructReleaseHandleNullable(handle);
// End of AttributesStruct "private" section.
