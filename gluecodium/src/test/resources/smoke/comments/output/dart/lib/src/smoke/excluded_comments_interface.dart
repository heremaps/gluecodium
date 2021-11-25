import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
/// This is some very useful interface.
/// @nodoc
abstract class ExcludedCommentsInterface {

}
// ExcludedCommentsInterface "private" section, not exported.
final _smokeExcludedcommentsinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ExcludedCommentsInterface_register_finalizer'));
final _smokeExcludedcommentsinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_copy_handle'));
final _smokeExcludedcommentsinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_release_handle'));
final _smokeExcludedcommentsinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle),
    Pointer<Void> Function(int, int, Object)
  >('library_smoke_ExcludedCommentsInterface_create_proxy'));
final _smokeExcludedcommentsinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_get_type_id'));
class ExcludedCommentsInterface$Impl extends __lib.NativeBase implements ExcludedCommentsInterface {
  ExcludedCommentsInterface$Impl(Pointer<Void> handle) : super(handle);

}
Pointer<Void> smokeExcludedcommentsinterfaceToFfi(ExcludedCommentsInterface value) {
  if (value is __lib.NativeBase) return _smokeExcludedcommentsinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeExcludedcommentsinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value
  );
  return result;
}
ExcludedCommentsInterface smokeExcludedcommentsinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ExcludedCommentsInterface) return instance;
  final _typeIdHandle = _smokeExcludedcommentsinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeExcludedcommentsinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ExcludedCommentsInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeExcludedcommentsinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeExcludedcommentsinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeExcludedcommentsinterfaceReleaseHandle(handle);
Pointer<Void> smokeExcludedcommentsinterfaceToFfiNullable(ExcludedCommentsInterface? value) =>
  value != null ? smokeExcludedcommentsinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
ExcludedCommentsInterface? smokeExcludedcommentsinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeExcludedcommentsinterfaceFromFfi(handle) : null;
void smokeExcludedcommentsinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsinterfaceReleaseHandle(handle);
// End of ExcludedCommentsInterface "private" section.
