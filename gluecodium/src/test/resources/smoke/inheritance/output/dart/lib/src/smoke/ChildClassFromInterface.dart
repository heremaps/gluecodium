import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/smoke/ParentInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_library_init.dart' as __lib;
abstract class ChildClassFromInterface implements ParentInterface {
  void release();
  childClassMethod();
}
// ChildClassFromInterface "private" section, not exported.
final _smoke_ChildClassFromInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromInterface_copy_handle');
final _smoke_ChildClassFromInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildClassFromInterface_release_handle');
final _smoke_ChildClassFromInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromInterface_get_type_id');
class ChildClassFromInterface$Impl implements ChildClassFromInterface {
  final Pointer<Void> handle;
  ChildClassFromInterface$Impl(this.handle);
  @override
  void release() => _smoke_ChildClassFromInterface_release_handle(handle);
  @override
  childClassMethod() {
    final _childClassMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildClassFromInterface_childClassMethod');
    final _handle = this.handle;
    final __result_handle = _childClassMethod_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  rootMethod() {
    final _rootMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootMethod');
    final _handle = this.handle;
    final __result_handle = _rootMethod_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  String get rootProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  set rootProperty(String value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentInterface_rootProperty_set__String');
    final _value_handle = String_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    String_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_ChildClassFromInterface_toFfi(ChildClassFromInterface value) =>
  _smoke_ChildClassFromInterface_copy_handle((value as ChildClassFromInterface$Impl).handle);
ChildClassFromInterface smoke_ChildClassFromInterface_fromFfi(Pointer<Void> handle) {
  final _copied_handle = _smoke_ChildClassFromInterface_copy_handle(handle);
  final _type_id_handle = _smoke_ChildClassFromInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  final result = factoryConstructor == null
    ? ChildClassFromInterface$Impl(_copied_handle)
    : factoryConstructor(_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_ChildClassFromInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ChildClassFromInterface_release_handle(handle);
Pointer<Void> smoke_ChildClassFromInterface_toFfi_nullable(ChildClassFromInterface value) =>
  value != null ? smoke_ChildClassFromInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ChildClassFromInterface smoke_ChildClassFromInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ChildClassFromInterface_fromFfi(handle) : null;
void smoke_ChildClassFromInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ChildClassFromInterface_release_handle(handle);
// End of ChildClassFromInterface "private" section.
