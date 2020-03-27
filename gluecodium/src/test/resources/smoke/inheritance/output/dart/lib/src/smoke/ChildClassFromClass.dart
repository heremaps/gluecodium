import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/smoke/ParentClass.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_library_init.dart' as __lib;
abstract class ChildClassFromClass implements ParentClass {
  void release();
  childClassMethod();
}
// ChildClassFromClass "private" section, not exported.
final _smoke_ChildClassFromClass_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromClass_copy_handle');
final _smoke_ChildClassFromClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildClassFromClass_release_handle');
final _smoke_ChildClassFromClass_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromClass_get_type_id');
class ChildClassFromClass$Impl extends ParentClass$Impl implements ChildClassFromClass {
  ChildClassFromClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() => _smoke_ChildClassFromClass_release_handle(handle);
  @override
  childClassMethod() {
    final _childClassMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildClassFromClass_childClassMethod');
    final _handle = this.handle;
    final __result_handle = _childClassMethod_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_ChildClassFromClass_toFfi(ChildClassFromClass value) =>
  _smoke_ChildClassFromClass_copy_handle((value as ChildClassFromClass$Impl).handle);
ChildClassFromClass smoke_ChildClassFromClass_fromFfi(Pointer<Void> handle) {
  final _copied_handle = _smoke_ChildClassFromClass_copy_handle(handle);
  final _type_id_handle = _smoke_ChildClassFromClass_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? ChildClassFromClass$Impl(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_ChildClassFromClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ChildClassFromClass_release_handle(handle);
Pointer<Void> smoke_ChildClassFromClass_toFfi_nullable(ChildClassFromClass value) =>
  value != null ? smoke_ChildClassFromClass_toFfi(value) : Pointer<Void>.fromAddress(0);
ChildClassFromClass smoke_ChildClassFromClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ChildClassFromClass_fromFfi(handle) : null;
void smoke_ChildClassFromClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ChildClassFromClass_release_handle(handle);
// End of ChildClassFromClass "private" section.
