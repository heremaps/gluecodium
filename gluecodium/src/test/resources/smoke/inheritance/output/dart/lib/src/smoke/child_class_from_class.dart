import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_class.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ChildClassFromClass implements ParentClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  childClassMethod();
}
// ChildClassFromClass "private" section, not exported.
final _smokeChildclassfromclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromClass_copy_handle'));
final _smokeChildclassfromclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildClassFromClass_release_handle'));
final _smokeChildclassfromclassGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassFromClass_get_type_id'));
class ChildClassFromClass$Impl extends ParentClass$Impl implements ChildClassFromClass {
  ChildClassFromClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeChildclassfromclassReleaseHandle(handle);
    handle = null;
  }
  @override
  childClassMethod() {
    final _childClassMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildClassFromClass_childClassMethod'));
    final _handle = this.handle;
    final __resultHandle = _childClassMethodFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_ChildClassFromClass_toFfi(ChildClassFromClass value) =>
  _smokeChildclassfromclassCopyHandle((value as __lib.NativeBase).handle);
ChildClassFromClass smoke_ChildClassFromClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ChildClassFromClass;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeChildclassfromclassGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeChildclassfromclassCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ChildClassFromClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ChildClassFromClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeChildclassfromclassReleaseHandle(handle);
Pointer<Void> smoke_ChildClassFromClass_toFfi_nullable(ChildClassFromClass value) =>
  value != null ? smoke_ChildClassFromClass_toFfi(value) : Pointer<Void>.fromAddress(0);
ChildClassFromClass smoke_ChildClassFromClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ChildClassFromClass_fromFfi(handle) : null;
void smoke_ChildClassFromClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeChildclassfromclassReleaseHandle(handle);
// End of ChildClassFromClass "private" section.
