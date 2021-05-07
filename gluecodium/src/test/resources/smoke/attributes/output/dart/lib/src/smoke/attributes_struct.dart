import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
    final _veryFun_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesStruct_veryFun__String'));
    final _param_handle = String_toFfi(param);
    final _handle = smoke_AttributesStruct_toFfi(this);
    final __result_handle = _veryFun_ffi(_handle, __lib.LibraryContext.isolateId, _param_handle);
    smoke_AttributesStruct_releaseFfiHandle(_handle);
    String_releaseFfiHandle(_param_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
// AttributesStruct "private" section, not exported.
final _smoke_AttributesStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_create_handle'));
final _smoke_AttributesStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_release_handle'));
final _smoke_AttributesStruct_get_field_field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_get_field_field'));
Pointer<Void> smoke_AttributesStruct_toFfi(AttributesStruct value) {
  final _field_handle = String_toFfi(value.field);
  final _result = _smoke_AttributesStruct_create_handle(_field_handle);
  String_releaseFfiHandle(_field_handle);
  return _result;
}
AttributesStruct smoke_AttributesStruct_fromFfi(Pointer<Void> handle) {
  final _field_handle = _smoke_AttributesStruct_get_field_field(handle);
  try {
    return AttributesStruct(
      String_fromFfi(_field_handle)
    );
  } finally {
    String_releaseFfiHandle(_field_handle);
  }
}
void smoke_AttributesStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_AttributesStruct_release_handle(handle);
// Nullable AttributesStruct
final _smoke_AttributesStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_create_handle_nullable'));
final _smoke_AttributesStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_release_handle_nullable'));
final _smoke_AttributesStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesStruct_get_value_nullable'));
Pointer<Void> smoke_AttributesStruct_toFfi_nullable(AttributesStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_AttributesStruct_toFfi(value);
  final result = _smoke_AttributesStruct_create_handle_nullable(_handle);
  smoke_AttributesStruct_releaseFfiHandle(_handle);
  return result;
}
AttributesStruct smoke_AttributesStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_AttributesStruct_get_value_nullable(handle);
  final result = smoke_AttributesStruct_fromFfi(_handle);
  smoke_AttributesStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_AttributesStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesStruct_release_handle_nullable(handle);
// End of AttributesStruct "private" section.
