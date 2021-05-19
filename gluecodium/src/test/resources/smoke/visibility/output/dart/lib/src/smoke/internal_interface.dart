import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
/// @nodoc
abstract class InternalInterface {
  InternalInterface();
  factory InternalInterface.fromLambdas({
    required void Function() lambda_fooBar,
  }) => InternalInterface$Lambdas(
    lambda_fooBar,
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  /// @nodoc
  internal_fooBar();
}
// InternalInterface "private" section, not exported.
final _smokeInternalinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalInterface_copy_handle'));
final _smokeInternalinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalInterface_release_handle'));
final _smokeInternalinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_InternalInterface_create_proxy'));
final _smokeInternalinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalInterface_get_type_id'));
class InternalInterface$Lambdas implements InternalInterface {
  void Function() lambda_fooBar;
  InternalInterface$Lambdas(
    this.lambda_fooBar,
  );
  @override
  void release() {}
  @override
  internal_fooBar() =>
    lambda_fooBar();
}
class InternalInterface$Impl extends __lib.NativeBase implements InternalInterface {
  InternalInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeInternalinterfaceReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  internal_fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalInterface_fooBar'));
    final _handle = this.handle;
    final __resultHandle = _fooBarFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
int _smokeInternalinterfacefooBarStatic(int _token) {
  try {
    (__lib.instanceCache[_token] as InternalInterface).internal_fooBar();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeInternalinterfaceToFfi(InternalInterface value) {
  if (value is __lib.NativeBase) return _smokeInternalinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeInternalinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64)>(_smokeInternalinterfacefooBarStatic, __lib.unknownError)
  );
  return result;
}
InternalInterface smokeInternalinterfaceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is InternalInterface) return instance;
  final _typeIdHandle = _smokeInternalinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeInternalinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : InternalInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeInternalinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeInternalinterfaceReleaseHandle(handle);
Pointer<Void> smokeInternalinterfaceToFfiNullable(InternalInterface? value) =>
  value != null ? smokeInternalinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
InternalInterface? smokeInternalinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeInternalinterfaceFromFfi(handle) : null;
void smokeInternalinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInternalinterfaceReleaseHandle(handle);
// End of InternalInterface "private" section.
