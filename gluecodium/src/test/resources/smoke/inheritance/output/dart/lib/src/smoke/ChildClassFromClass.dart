import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/smoke/ParentClass.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_ChildClassFromClass_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ChildClassFromClass_copy_handle');
final _smoke_ChildClassFromClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ChildClassFromClass_release_handle');
class ChildClassFromClass extends ParentClass {
  Pointer<Void> get _handle => handle;
  ChildClassFromClass._(Pointer<Void> handle) : super(handle);
  void release() => _smoke_ChildClassFromClass_release_handle(_handle);
  childClassMethod() {
    final _childClassMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('smoke_ChildClassFromClass_childClassMethod');
    final __result_handle = _childClassMethod_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_ChildClassFromClass_toFfi(ChildClassFromClass value) =>
  _smoke_ChildClassFromClass_copy_handle(value._handle);
ChildClassFromClass smoke_ChildClassFromClass_fromFfi(Pointer<Void> handle) =>
  ChildClassFromClass._(_smoke_ChildClassFromClass_copy_handle(handle));
void smoke_ChildClassFromClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ChildClassFromClass_release_handle(handle);
Pointer<Void> smoke_ChildClassFromClass_toFfi_nullable(ChildClassFromClass value) =>
  value != null ? smoke_ChildClassFromClass_toFfi(value) : Pointer<Void>.fromAddress(0);
ChildClassFromClass smoke_ChildClassFromClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ChildClassFromClass_fromFfi(handle) : null;
void smoke_ChildClassFromClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ChildClassFromClass_release_handle(handle);
