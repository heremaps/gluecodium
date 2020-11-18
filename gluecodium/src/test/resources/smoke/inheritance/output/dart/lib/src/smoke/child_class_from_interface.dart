import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_interface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ChildClassFromInterface implements ParentInterface {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  childClassMethod();
}
// ChildClassFromInterface "private" section, not exported.
final _smoke_ChildClassFromInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromInterface_copy_handle'));
final _smoke_ChildClassFromInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildClassFromInterface_release_handle'));
final _smoke_ChildClassFromInterface_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_ChildClassFromInterface_get_raw_pointer'));
final _smoke_ChildClassFromInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromInterface_get_type_id'));
class ChildClassFromInterface$Impl implements ChildClassFromInterface {
  @protected
  Pointer<Void> handle;
  ChildClassFromInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_ChildClassFromInterface_get_raw_pointer(handle));
    _smoke_ChildClassFromInterface_release_handle(handle);
    handle = null;
  }
  @override
  childClassMethod() {
    final _childClassMethod_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildClassFromInterface_childClassMethod'));
    final _handle = this.handle;
    final __result_handle = _childClassMethod_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  rootMethod() {
    final _rootMethod_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootMethod'));
    final _handle = this.handle;
    final __result_handle = _rootMethod_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  String get rootProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  @override
  set rootProperty(String value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentInterface_rootProperty_set__String'));
    final _value_handle = String_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    String_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_ChildClassFromInterface_toFfi(ChildClassFromInterface value) =>
  _smoke_ChildClassFromInterface_copy_handle((value as ChildClassFromInterface$Impl).handle);
ChildClassFromInterface smoke_ChildClassFromInterface_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_ChildClassFromInterface_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle];
  if (instance is ChildClassFromInterface) return instance as ChildClassFromInterface;
  final _type_id_handle = _smoke_ChildClassFromInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_ChildClassFromInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : ChildClassFromInterface$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
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
