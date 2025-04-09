

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

/// @nodoc
abstract class InternalInterface implements Finalizable {
  /// @nodoc

  factory InternalInterface(
    void Function() fooBarLambda,

  ) => InternalInterface$Lambdas(
    fooBarLambda,

  );


  void fooBar();
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
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
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
  void fooBar() =>
    fooBarLambda();
}

class InternalInterface$Impl extends __lib.NativeBase implements InternalInterface {

  InternalInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  void fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalInterface_fooBar'));
    final _handle = this.handle;
    _fooBarFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

void _smokeInternalinterfacefooBarStatic(InternalInterface _obj) {

  try {
    _obj.fooBar();
  } finally {
  }
}


Pointer<Void> smokeInternalinterfaceToFfi(InternalInterface value) {
  if (value is __lib.NativeBase) return _smokeInternalinterfaceCopyHandle((value as __lib.NativeBase).handle);

  void __fooBarCaller() { _smokeInternalinterfacefooBarStatic(value); }
  final __fooBarCallback = NativeCallable<Void Function()>.isolateLocal(__fooBarCaller);
  __fooBarCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __fooBarCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeInternalinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    __closeAllCallback.nativeFunction,
    __fooBarCallback.nativeFunction
  );

  return result;
}

InternalInterface smokeInternalinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
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


