import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// This is some very useful interface.
/// @nodoc
abstract class ExcludedCommentsInterface {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
}
// ExcludedCommentsInterface "private" section, not exported.
final _smokeExcludedcommentsinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_copy_handle'));
final _smokeExcludedcommentsinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_release_handle'));
final _smokeExcludedcommentsinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer),
    Pointer<Void> Function(int, int, Pointer)
  >('library_smoke_ExcludedCommentsInterface_create_proxy'));
final _smokeExcludedcommentsinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_get_type_id'));
class ExcludedCommentsInterface$Impl extends __lib.NativeBase implements ExcludedCommentsInterface {
  ExcludedCommentsInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeExcludedcommentsinterfaceReleaseHandle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_ExcludedCommentsInterface_toFfi(ExcludedCommentsInterface value) {
  if (value is __lib.NativeBase) return _smokeExcludedcommentsinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeExcludedcommentsinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi
  );
  return result;
}
ExcludedCommentsInterface smoke_ExcludedCommentsInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ExcludedCommentsInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeExcludedcommentsinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeExcludedcommentsinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ExcludedCommentsInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ExcludedCommentsInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeExcludedcommentsinterfaceReleaseHandle(handle);
Pointer<Void> smoke_ExcludedCommentsInterface_toFfi_nullable(ExcludedCommentsInterface value) =>
  value != null ? smoke_ExcludedCommentsInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ExcludedCommentsInterface smoke_ExcludedCommentsInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ExcludedCommentsInterface_fromFfi(handle) : null;
void smoke_ExcludedCommentsInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsinterfaceReleaseHandle(handle);
// End of ExcludedCommentsInterface "private" section.
