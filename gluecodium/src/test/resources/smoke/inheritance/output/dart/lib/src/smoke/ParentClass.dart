import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_ParentClass_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ParentClass_copy_handle');
final _smoke_ParentClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ParentClass_release_handle');
final _smoke_ParentClass_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ParentClass_get_type_id');
class ParentClass {
  @protected
  final Pointer<Void> handle;
  Pointer<Void> get _handle => handle;
  @protected
  ParentClass(this.handle);
  void release() => _smoke_ParentClass_release_handle(_handle);
  rootMethod() {
    final _rootMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('smoke_ParentClass_rootMethod');
    final __result_handle = _rootMethod_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_ParentClass_toFfi(ParentClass value) =>
  _smoke_ParentClass_copy_handle(value._handle);
ParentClass smoke_ParentClass_fromFfi(Pointer<Void> handle) {
  final _copied_handle = _smoke_ParentClass_copy_handle(handle);
  final _type_id_handle = _smoke_ParentClass_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? ParentClass(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_ParentClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ParentClass_release_handle(handle);
Pointer<Void> smoke_ParentClass_toFfi_nullable(ParentClass value) =>
  value != null ? smoke_ParentClass_toFfi(value) : Pointer<Void>.fromAddress(0);
ParentClass smoke_ParentClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ParentClass_fromFfi(handle) : null;
void smoke_ParentClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ParentClass_release_handle(handle);
// Internal, not exported.
class ParentClass__Factory {
  static ParentClass create(Pointer<Void> handle) => ParentClass(handle);
}
