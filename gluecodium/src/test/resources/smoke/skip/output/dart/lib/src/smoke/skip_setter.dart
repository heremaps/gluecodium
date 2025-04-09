

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

abstract class SkipSetter implements Finalizable {

  factory SkipSetter(
    String Function() fooGetLambda
  ) => SkipSetter$Lambdas(
    fooGetLambda
  );

  String get foo;

}


// SkipSetter "private" section, not exported.

final _smokeSkipsetterRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SkipSetter_register_finalizer'));
final _smokeSkipsetterCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipSetter_copy_handle'));
final _smokeSkipsetterReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipSetter_release_handle'));
final _smokeSkipsetterCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_SkipSetter_create_proxy'));
final _smokeSkipsetterGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipSetter_get_type_id'));

class SkipSetter$Lambdas implements SkipSetter {
  String Function() fooGetLambda;

  SkipSetter$Lambdas(
    this.fooGetLambda
  );

  @override
  String get foo => fooGetLambda();
}

class SkipSetter$Impl extends __lib.NativeBase implements SkipSetter {

  SkipSetter$Impl(Pointer<Void> handle) : super(handle);

  String get foo {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SkipSetter_foo_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }



}


void _smokeSkipsetterfooGetStatic(SkipSetter _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi(_obj.foo);
}

Pointer<Void> smokeSkipsetterToFfi(SkipSetter __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeSkipsetterCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __smokeSkipsetterfooGetCaller(Pointer<Pointer<Void>> _result) { _smokeSkipsetterfooGetStatic(__interfaceObj, _result); }
  final __smokeSkipsetterfooGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeSkipsetterfooGetCaller);
  __smokeSkipsetterfooGetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __smokeSkipsetterfooGetCallback.close();    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeSkipsetterCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __smokeSkipsetterfooGetCallback.nativeFunction
  );

  return result;
}

SkipSetter smokeSkipsetterFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SkipSetter) return instance;

  final _typeIdHandle = _smokeSkipsetterGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeSkipsetterCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SkipSetter$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeSkipsetterRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeSkipsetterReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSkipsetterReleaseHandle(handle);

Pointer<Void> smokeSkipsetterToFfiNullable(SkipSetter? value) =>
  value != null ? smokeSkipsetterToFfi(value) : Pointer<Void>.fromAddress(0);

SkipSetter? smokeSkipsetterFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSkipsetterFromFfi(handle) : null;

void smokeSkipsetterReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkipsetterReleaseHandle(handle);

// End of SkipSetter "private" section.


