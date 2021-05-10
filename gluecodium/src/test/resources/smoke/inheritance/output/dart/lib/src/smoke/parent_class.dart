import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ParentClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  rootMethod();
  String get rootProperty;
  set rootProperty(String value);
}
// ParentClass "private" section, not exported.
final _smokeParentclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ParentClass_copy_handle'));
final _smokeParentclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ParentClass_release_handle'));
final _smokeParentclassGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ParentClass_get_type_id'));
class ParentClass$Impl extends __lib.NativeBase implements ParentClass {
  ParentClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeParentclassReleaseHandle(handle);
    handle = null;
  }
  @override
  rootMethod() {
    final _rootMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentClass_rootMethod'));
    final _handle = this.handle;
    final __resultHandle = _rootMethodFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  String get rootProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentClass_rootProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set rootProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentClass_rootProperty_set__String'));
    final _valueHandle = String_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    String_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_ParentClass_toFfi(ParentClass value) =>
  _smokeParentclassCopyHandle((value as __lib.NativeBase).handle);
ParentClass smoke_ParentClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ParentClass;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeParentclassGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeParentclassCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ParentClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ParentClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeParentclassReleaseHandle(handle);
Pointer<Void> smoke_ParentClass_toFfi_nullable(ParentClass value) =>
  value != null ? smoke_ParentClass_toFfi(value) : Pointer<Void>.fromAddress(0);
ParentClass smoke_ParentClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ParentClass_fromFfi(handle) : null;
void smoke_ParentClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeParentclassReleaseHandle(handle);
// End of ParentClass "private" section.
