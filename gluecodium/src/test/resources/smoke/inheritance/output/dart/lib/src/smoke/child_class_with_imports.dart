import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_class_with_imports.dart';
abstract class ChildClassWithImports implements ParentClassWithImports {

}
// ChildClassWithImports "private" section, not exported.
final _smokeChildclasswithimportsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ChildClassWithImports_register_finalizer'));
final _smokeChildclasswithimportsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassWithImports_copy_handle'));
final _smokeChildclasswithimportsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildClassWithImports_release_handle'));
final _smokeChildclasswithimportsGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildClassWithImports_get_type_id'));
class ChildClassWithImports$Impl extends ParentClassWithImports$Impl implements ChildClassWithImports {
  ChildClassWithImports$Impl(Pointer<Void> handle) : super(handle);

}
Pointer<Void> smokeChildclasswithimportsToFfi(ChildClassWithImports value) =>
  _smokeChildclasswithimportsCopyHandle((value as __lib.NativeBase).handle);
ChildClassWithImports smokeChildclasswithimportsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ChildClassWithImports) return instance;
  final _typeIdHandle = _smokeChildclasswithimportsGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeChildclasswithimportsCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ChildClassWithImports$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeChildclasswithimportsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeChildclasswithimportsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeChildclasswithimportsReleaseHandle(handle);
Pointer<Void> smokeChildclasswithimportsToFfiNullable(ChildClassWithImports? value) =>
  value != null ? smokeChildclasswithimportsToFfi(value) : Pointer<Void>.fromAddress(0);
ChildClassWithImports? smokeChildclasswithimportsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeChildclasswithimportsFromFfi(handle) : null;
void smokeChildclasswithimportsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeChildclasswithimportsReleaseHandle(handle);
// End of ChildClassWithImports "private" section.
