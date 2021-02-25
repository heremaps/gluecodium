import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_class.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ChildClassFromClass implements ParentClass {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  childClassMethod();
}
// ChildClassFromClass "private" section, not exported.
final _smoke_ChildClassFromClass_register_finalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ChildClassFromClass_register_finalizer'));
final _smoke_ChildClassFromClass_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromClass_copy_handle'));
final _smoke_ChildClassFromClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildClassFromClass_release_handle'));
final _smoke_ChildClassFromClass_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromClass_get_type_id'));
class ChildClassFromClass$Impl extends ParentClass$Impl implements ChildClassFromClass {
  ChildClassFromClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  childClassMethod() {
    final _childClassMethod_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildClassFromClass_childClassMethod'));
    final _handle = this.handle;
    final __result_handle = _childClassMethod_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_ChildClassFromClass_toFfi(ChildClassFromClass value) =>
  _smoke_ChildClassFromClass_copy_handle((value as ChildClassFromClass$Impl).handle);
ChildClassFromClass smoke_ChildClassFromClass_fromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ChildClassFromClass) return instance as ChildClassFromClass;
  final _type_id_handle = _smoke_ChildClassFromClass_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_ChildClassFromClass_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : ChildClassFromClass$Impl(_copied_handle);
  __lib.cacheInstance(_copied_handle, result, _smoke_ChildClassFromClass_register_finalizer);
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
