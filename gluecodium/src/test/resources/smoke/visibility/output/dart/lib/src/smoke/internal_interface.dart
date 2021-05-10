import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
abstract class InternalInterface {
  InternalInterface();
  factory InternalInterface.fromLambdas({
    @required void Function() lambda_fooBar,
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
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeInternalinterfaceReleaseHandle(handle);
    handle = null;
  }
  @override
  internal_fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalInterface_fooBar'));
    final _handle = this.handle;
    final __resultHandle = _fooBarFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _InternalInterface_fooBar_static(int _token) {
  try {
    (__lib.instanceCache[_token] as InternalInterface).internal_fooBar();
  } finally {
  }
  return 0;
}
Pointer<Void> smoke_InternalInterface_toFfi(InternalInterface value) {
  if (value is __lib.NativeBase) return _smokeInternalinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeInternalinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64)>(_InternalInterface_fooBar_static, __lib.unknownError)
  );
  return result;
}
InternalInterface smoke_InternalInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as InternalInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeInternalinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeInternalinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : InternalInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_InternalInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeInternalinterfaceReleaseHandle(handle);
Pointer<Void> smoke_InternalInterface_toFfi_nullable(InternalInterface value) =>
  value != null ? smoke_InternalInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
InternalInterface smoke_InternalInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InternalInterface_fromFfi(handle) : null;
void smoke_InternalInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeInternalinterfaceReleaseHandle(handle);
// End of InternalInterface "private" section.
