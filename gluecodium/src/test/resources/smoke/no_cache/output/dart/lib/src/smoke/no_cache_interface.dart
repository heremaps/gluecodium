

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

abstract class NoCacheInterface implements Finalizable {

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
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
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

void _smokeNocacheinterfacefooStatic(NoCacheInterface _obj) {

  try {
    _obj.foo();
  } finally {
  }
}


Pointer<Void> smokeNocacheinterfaceToFfi(NoCacheInterface __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeNocacheinterfaceCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __fooCaller() { _smokeNocacheinterfacefooStatic(__interfaceObj); }
  final __fooCallback = NativeCallable<Void Function()>.isolateLocal(__fooCaller);
  __fooCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __fooCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeNocacheinterfaceCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __fooCallback.nativeFunction
  );

  return result;
}

NoCacheInterface smokeNocacheinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");

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


