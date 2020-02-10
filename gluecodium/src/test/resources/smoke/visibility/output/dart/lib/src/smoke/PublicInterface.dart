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
  >('smoke_PublicInterface_InternalStruct_create_handle');
final _smoke_PublicInterface_InternalStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PublicInterface_InternalStruct_release_handle');
final _smoke_PublicInterface_InternalStruct_get_field_fieldOfInternalType = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicInterface_InternalStruct_get_field_fieldOfInternalType');
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
  >('smoke_PublicInterface_InternalStruct_create_handle_nullable');
final _smoke_PublicInterface_InternalStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PublicInterface_InternalStruct_release_handle_nullable');
final _smoke_PublicInterface_InternalStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicInterface_InternalStruct_get_value_nullable');
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
final _smoke_PublicInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PublicInterface_release_handle');
class PublicInterface__Impl implements PublicInterface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  PublicInterface__Impl(this.handle);
  @override
  void release() => _smoke_PublicInterface_release_handle(handle);
}
Pointer<Void> smoke_PublicInterface_toFfi(PublicInterface__Impl value) =>
  value != null ? value.handle : Pointer<Void>.fromAddress(0);
PublicInterface smoke_PublicInterface_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? PublicInterface__Impl(handle) : null;
void smoke_PublicInterface_releaseFfiHandle(Pointer<Void> handle) {}
Pointer<Void> smoke_PublicInterface_toFfi_nullable(PublicInterface__Impl value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
PublicInterface smoke_PublicInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? PublicInterface__Impl(handle) : null;
void smoke_PublicInterface_releaseFfiHandle_nullable(Pointer<Void> handle) {}
// End of PublicInterface "private" section.
