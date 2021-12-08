import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_class.dart';
abstract class ChildClassFromClass implements ParentClass {

  void childClassMethod();
}
// ChildClassFromClass "private" section, not exported.
final _smokeChildclassfromclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ChildClassFromClass_register_finalizer'));
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
  void childClassMethod() {
    final _childClassMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildClassFromClass_childClassMethod'));
    final _handle = this.handle;
    _childClassMethodFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
Pointer<Void> smokeChildclassfromclassToFfi(ChildClassFromClass value) =>
  _smokeChildclassfromclassCopyHandle((value as __lib.NativeBase).handle);
ChildClassFromClass smokeChildclassfromclassFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ChildClassFromClass) return instance;
  final _typeIdHandle = _smokeChildclassfromclassGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeChildclassfromclassCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ChildClassFromClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeChildclassfromclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeChildclassfromclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeChildclassfromclassReleaseHandle(handle);
Pointer<Void> smokeChildclassfromclassToFfiNullable(ChildClassFromClass? value) =>
  value != null ? smokeChildclassfromclassToFfi(value) : Pointer<Void>.fromAddress(0);
ChildClassFromClass? smokeChildclassfromclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeChildclassfromclassFromFfi(handle) : null;
void smokeChildclassfromclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeChildclassfromclassReleaseHandle(handle);
// End of ChildClassFromClass "private" section.
