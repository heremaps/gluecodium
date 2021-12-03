import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
/// @nodoc
@internal
abstract class InternalInterface {
  /// @nodoc
  factory InternalInterface(
    void Function() fooBarLambda,
  ) => InternalInterface$Lambdas(
    fooBarLambda,
  );
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
  /// @nodoc
  void internal_fooBar();
}
// InternalInterface "private" section, not exported.
final _smokeInternalinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_InternalInterface_register_finalizer'));
final _smokeInternalinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalInterface_copy_handle'));
final _smokeInternalinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalInterface_release_handle'));
final _smokeInternalinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_InternalInterface_create_proxy'));
final _smokeInternalinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalInterface_get_type_id'));
class InternalInterface$Lambdas implements InternalInterface {
  void Function() fooBarLambda;
  InternalInterface$Lambdas(
    this.fooBarLambda,
  );
  @override
  void release() {}
  @override
  void internal_fooBar() =>
    fooBarLambda();
}
class InternalInterface$Impl extends __lib.NativeBase implements InternalInterface {
  InternalInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  void internal_fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalInterface_fooBar'));
    final _handle = this.handle;
    _fooBarFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeInternalinterfacefooBarStatic(Object _obj) {
  try {
    (_obj as InternalInterface).internal_fooBar();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeInternalinterfaceToFfi(InternalInterface value) {
  if (value is __lib.NativeBase) return _smokeInternalinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeInternalinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle)>(_smokeInternalinterfacefooBarStatic, __lib.unknownError)
  );
  return result;
}
InternalInterface smokeInternalinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InternalInterface) return instance;
  final _typeIdHandle = _smokeInternalinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeInternalinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : InternalInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeInternalinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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
