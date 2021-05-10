import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
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
    final _paramHandle = String_toFfi(param);
    final _handle = smoke_AttributesStruct_toFfi(this);
    final __resultHandle = _veryFunFfi(_handle, __lib.LibraryContext.isolateId, _paramHandle);
    smoke_AttributesStruct_releaseFfiHandle(_handle);
    String_releaseFfiHandle(_paramHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
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
Pointer<Void> smoke_AttributesStruct_toFfi(AttributesStruct value) {
  final _fieldHandle = String_toFfi(value.field);
  final _result = _smokeAttributesstructCreateHandle(_fieldHandle);
  String_releaseFfiHandle(_fieldHandle);
  return _result;
}
AttributesStruct smoke_AttributesStruct_fromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeAttributesstructGetFieldfield(handle);
  try {
    return AttributesStruct(
      String_fromFfi(_fieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_fieldHandle);
  }
}
void smoke_AttributesStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeAttributesstructReleaseHandle(handle);
// Nullable AttributesStruct
final _smoke_AttributesStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_create_handle_nullable'));
final _smoke_AttributesStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_release_handle_nullable'));
final _smoke_AttributesStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_get_value_nullable'));
Pointer<Void> smoke_AttributesStruct_toFfi_nullable(AttributesStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_AttributesStruct_toFfi(value);
  final result = _smoke_AttributesStructCreateHandleNullable(_handle);
  smoke_AttributesStruct_releaseFfiHandle(_handle);
  return result;
}
AttributesStruct smoke_AttributesStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_AttributesStructGetValueNullable(handle);
  final result = smoke_AttributesStruct_fromFfi(_handle);
  smoke_AttributesStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_AttributesStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesStructReleaseHandleNullable(handle);
// End of AttributesStruct "private" section.
