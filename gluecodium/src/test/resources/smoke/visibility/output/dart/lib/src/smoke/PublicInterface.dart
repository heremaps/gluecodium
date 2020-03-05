import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/smoke/PublicClass.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class PublicInterface {
  void release();
}
class PublicInterface_InternalStruct {
  PublicClass_InternalStruct _fieldOfInternalType;
  PublicInterface_InternalStruct(this.fieldOfInternalType);
}
// PublicInterface_InternalStruct "private" section, not exported.
final _smoke_PublicInterface_InternalStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_create_handle');
final _smoke_PublicInterface_InternalStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_release_handle');
final _smoke_PublicInterface_InternalStruct_get_field_fieldOfInternalType = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_get_field_fieldOfInternalType');
Pointer<Void> smoke_PublicInterface_InternalStruct_toFfi(PublicInterface_InternalStruct value) {
  final _fieldOfInternalType_handle = smoke_PublicClass_InternalStruct_toFfi(value.fieldOfInternalType);
  final _result = _smoke_PublicInterface_InternalStruct_create_handle(_fieldOfInternalType_handle);
  smoke_PublicClass_InternalStruct_releaseFfiHandle(_fieldOfInternalType_handle);
  return _result;
}
PublicInterface_InternalStruct smoke_PublicInterface_InternalStruct_fromFfi(Pointer<Void> handle) {
  final _fieldOfInternalType_handle = _smoke_PublicInterface_InternalStruct_get_field_fieldOfInternalType(handle);
  final _result = PublicInterface_InternalStruct(
    smoke_PublicClass_InternalStruct_fromFfi(_fieldOfInternalType_handle)
  );
  smoke_PublicClass_InternalStruct_releaseFfiHandle(_fieldOfInternalType_handle);
  return _result;
}
void smoke_PublicInterface_InternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_PublicInterface_InternalStruct_release_handle(handle);
// Nullable PublicInterface_InternalStruct
final _smoke_PublicInterface_InternalStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_create_handle_nullable');
final _smoke_PublicInterface_InternalStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_release_handle_nullable');
final _smoke_PublicInterface_InternalStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_get_value_nullable');
Pointer<Void> smoke_PublicInterface_InternalStruct_toFfi_nullable(PublicInterface_InternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicInterface_InternalStruct_toFfi(value);
  final result = _smoke_PublicInterface_InternalStruct_create_handle_nullable(_handle);
  smoke_PublicInterface_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
PublicInterface_InternalStruct smoke_PublicInterface_InternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicInterface_InternalStruct_get_value_nullable(handle);
  final result = smoke_PublicInterface_InternalStruct_fromFfi(_handle);
  smoke_PublicInterface_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicInterface_InternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicInterface_InternalStruct_release_handle_nullable(handle);
// End of PublicInterface_InternalStruct "private" section.
// PublicInterface "private" section, not exported.
final _smoke_PublicInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_copy_handle');
final _smoke_PublicInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicInterface_release_handle');
final _smoke_PublicInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer),
    Pointer<Void> Function(int, Pointer)
  >('library_smoke_PublicInterface_create_proxy');
final _smoke_PublicInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_PublicInterface_get_raw_pointer');
final _smoke_PublicInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_get_type_id');
class PublicInterface__Impl implements PublicInterface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  PublicInterface__Impl(this.handle);
  @override
  void release() => _smoke_PublicInterface_release_handle(handle);
}
Pointer<Void> smoke_PublicInterface_toFfi(PublicInterface value) {
  if (value is PublicInterface__Impl) return _smoke_PublicInterface_copy_handle(value.handle);
  final token = __lib.getNewToken();
  __lib.instanceCache[token] = value;
  final result = _smoke_PublicInterface_create_proxy(token, __lib.uncacheObjectFfi);
  __lib.reverseCache[_smoke_PublicInterface_get_raw_pointer(result)] = value;
  return result;
}
PublicInterface smoke_PublicInterface_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_PublicInterface_get_raw_pointer(handle)] as PublicInterface;
  if (instance != null) return instance;
  final _copied_handle = _smoke_PublicInterface_copy_handle(handle);
  final _type_id_handle = _smoke_PublicInterface_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? PublicInterface__Impl(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_PublicInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_PublicInterface_release_handle(handle);
Pointer<Void> smoke_PublicInterface_toFfi_nullable(PublicInterface value) =>
  value != null ? smoke_PublicInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
PublicInterface smoke_PublicInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_PublicInterface_fromFfi(handle) : null;
void smoke_PublicInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicInterface_release_handle(handle);
// End of PublicInterface "private" section.
