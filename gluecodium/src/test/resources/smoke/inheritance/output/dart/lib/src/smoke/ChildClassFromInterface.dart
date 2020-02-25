import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/smoke/ParentInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_ChildClassFromInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ChildClassFromInterface_copy_handle');
final _smoke_ChildClassFromInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ChildClassFromInterface_release_handle');
class ChildClassFromInterface implements ParentInterface {
  final Pointer<Void> _handle;
  ChildClassFromInterface._(this._handle);
  void release() => _smoke_ChildClassFromInterface_release_handle(_handle);
  childClassMethod() {
    final _childClassMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('smoke_ChildClassFromInterface_childClassMethod');
    final __result_handle = _childClassMethod_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  rootMethod() {
    final _rootMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('smoke_ParentInterface_rootMethod');
    final __result_handle = _rootMethod_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  String get rootProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_ParentInterface_rootProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  set rootProperty(String value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_ParentInterface_rootProperty_set__String');
    final _value_handle = String_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    String_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_ChildClassFromInterface_toFfi(ChildClassFromInterface value) =>
  _smoke_ChildClassFromInterface_copy_handle(value._handle);
ChildClassFromInterface smoke_ChildClassFromInterface_fromFfi(Pointer<Void> handle) =>
  ChildClassFromInterface._(_smoke_ChildClassFromInterface_copy_handle(handle));
void smoke_ChildClassFromInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ChildClassFromInterface_release_handle(handle);
Pointer<Void> smoke_ChildClassFromInterface_toFfi_nullable(ChildClassFromInterface value) =>
  value != null ? smoke_ChildClassFromInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ChildClassFromInterface smoke_ChildClassFromInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ChildClassFromInterface_fromFfi(handle) : null;
void smoke_ChildClassFromInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ChildClassFromInterface_release_handle(handle);
