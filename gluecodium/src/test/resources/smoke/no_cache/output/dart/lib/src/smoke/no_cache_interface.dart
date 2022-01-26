import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class NoCacheInterface {
  factory NoCacheInterface(
    void Function() fooLambda,
  ) => NoCacheInterface$Lambdas(
    fooLambda,
  );
  void foo();
}
// NoCacheInterface "private" section, not exported.
final _smokeNocacheinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_NoCacheInterface_register_finalizer'));
final _smokeNocacheinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_NoCacheInterface_copy_handle'));
final _smokeNocacheinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_NoCacheInterface_release_handle'));
final _smokeNocacheinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_NoCacheInterface_create_proxy'));
final _smokeNocacheinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_NoCacheInterface_get_type_id'));
class NoCacheInterface$Lambdas implements NoCacheInterface {
  void Function() fooLambda;
  NoCacheInterface$Lambdas(
    this.fooLambda,
  );
  @override
  void foo() =>
    fooLambda();
}
class NoCacheInterface$Impl extends __lib.NativeBase implements NoCacheInterface {
  NoCacheInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void foo() {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_NoCacheInterface_foo'));
    final _handle = this.handle;
    _fooFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeNocacheinterfacefooStatic(Object _obj) {
  try {
    (_obj as NoCacheInterface).foo();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeNocacheinterfaceToFfi(NoCacheInterface value) {
  if (value is __lib.NativeBase) return _smokeNocacheinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeNocacheinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle)>(_smokeNocacheinterfacefooStatic, __lib.unknownError)
  );
  return result;
}
NoCacheInterface smokeNocacheinterfaceFromFfi(Pointer<Void> handle) {
  final _typeIdHandle = _smokeNocacheinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeNocacheinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : NoCacheInterface$Impl(_copiedHandle);
  _smokeNocacheinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeNocacheinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeNocacheinterfaceReleaseHandle(handle);
Pointer<Void> smokeNocacheinterfaceToFfiNullable(NoCacheInterface? value) =>
  value != null ? smokeNocacheinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
NoCacheInterface? smokeNocacheinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeNocacheinterfaceFromFfi(handle) : null;
void smokeNocacheinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeNocacheinterfaceReleaseHandle(handle);
// End of NoCacheInterface "private" section.
