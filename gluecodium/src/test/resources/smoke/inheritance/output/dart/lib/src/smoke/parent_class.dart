import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class ParentClass {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  void rootMethod();
  String get rootProperty;
  set rootProperty(String value);
}
// ParentClass "private" section, not exported.
final _smokeParentclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ParentClass_register_finalizer'));
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
  void release() {}
  @override
  void rootMethod() {
    final _rootMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentClass_rootMethod'));
    final _handle = this.handle;
    _rootMethodFfi(_handle, __lib.LibraryContext.isolateId);
  }
  @override
  String get rootProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentClass_rootProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set rootProperty(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentClass_rootProperty_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
  }
}
Pointer<Void> smokeParentclassToFfi(ParentClass value) =>
  _smokeParentclassCopyHandle((value as __lib.NativeBase).handle);
ParentClass smokeParentclassFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ParentClass) return instance;
  final _typeIdHandle = _smokeParentclassGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeParentclassCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ParentClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeParentclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeParentclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeParentclassReleaseHandle(handle);
Pointer<Void> smokeParentclassToFfiNullable(ParentClass? value) =>
  value != null ? smokeParentclassToFfi(value) : Pointer<Void>.fromAddress(0);
ParentClass? smokeParentclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeParentclassFromFfi(handle) : null;
void smokeParentclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeParentclassReleaseHandle(handle);
// End of ParentClass "private" section.
