import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class EquatableInterface {
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
}
// EquatableInterface "private" section, not exported.
final _smokeEquatableinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_EquatableInterface_register_finalizer'));
final _smokeEquatableinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableInterface_copy_handle'));
final _smokeEquatableinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EquatableInterface_release_handle'));
final _smokeEquatableinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle),
    Pointer<Void> Function(int, int, Object)
  >('library_smoke_EquatableInterface_create_proxy'));
final __areEqual = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>, Pointer<Void>),
    int Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_EquatableInterface_are_equal'));final _smokeEquatableinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EquatableInterface_get_type_id'));
class EquatableInterface$Impl extends __lib.NativeBase implements EquatableInterface {
  EquatableInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EquatableInterface$Impl) return false;
    return __areEqual(this.handle, other.handle) != 0;
  }
}
Pointer<Void> smokeEquatableinterfaceToFfi(EquatableInterface value) {
  if (value is __lib.NativeBase) return _smokeEquatableinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeEquatableinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value
  );
  return result;
}
EquatableInterface smokeEquatableinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is EquatableInterface) return instance;
  final _typeIdHandle = _smokeEquatableinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeEquatableinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : EquatableInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeEquatableinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeEquatableinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeEquatableinterfaceReleaseHandle(handle);
Pointer<Void> smokeEquatableinterfaceToFfiNullable(EquatableInterface? value) =>
  value != null ? smokeEquatableinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
EquatableInterface? smokeEquatableinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeEquatableinterfaceFromFfi(handle) : null;
void smokeEquatableinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEquatableinterfaceReleaseHandle(handle);
// End of EquatableInterface "private" section.
