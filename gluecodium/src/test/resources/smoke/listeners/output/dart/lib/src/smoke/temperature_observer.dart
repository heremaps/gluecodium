

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/thermometer.dart';

/// Observer interface for monitoring changes in thermometer ("Observer of subject").
abstract class TemperatureObserver implements Finalizable {
  /// Observer interface for monitoring changes in thermometer ("Observer of subject").

  factory TemperatureObserver(
    void Function(Thermometer) onTemperatureUpdateLambda,

  ) => TemperatureObserver$Lambdas(
    onTemperatureUpdateLambda,

  );


  void onTemperatureUpdate(Thermometer thermometer);
}


// TemperatureObserver "private" section, not exported.

final _smokeTemperatureobserverRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_TemperatureObserver_register_finalizer'));
final _smokeTemperatureobserverCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TemperatureObserver_copy_handle'));
final _smokeTemperatureobserverReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TemperatureObserver_release_handle'));
final _smokeTemperatureobserverCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_TemperatureObserver_create_proxy'));
final _smokeTemperatureobserverGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TemperatureObserver_get_type_id'));


class TemperatureObserver$Lambdas implements TemperatureObserver {
  void Function(Thermometer) onTemperatureUpdateLambda;

  TemperatureObserver$Lambdas(
    this.onTemperatureUpdateLambda,

  );

  @override
  void onTemperatureUpdate(Thermometer thermometer) =>
    onTemperatureUpdateLambda(thermometer);
}

class TemperatureObserver$Impl extends __lib.NativeBase implements TemperatureObserver {

  TemperatureObserver$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onTemperatureUpdate(Thermometer thermometer) {
    final _onTemperatureUpdateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_TemperatureObserver_onTemperatureUpdate__Thermometer'));
    final _thermometerHandle = smokeThermometerToFfi(thermometer);
    final _handle = this.handle;
    _onTemperatureUpdateFfi(_handle, __lib.LibraryContext.isolateId, _thermometerHandle);
    smokeThermometerReleaseFfiHandle(_thermometerHandle);

  }


}

void _smokeTemperatureobserveronTemperatureUpdateStatic(TemperatureObserver _obj, Pointer<Void> thermometer) {

  try {
    _obj.onTemperatureUpdate(smokeThermometerFromFfi(thermometer));
  } finally {
    smokeThermometerReleaseFfiHandle(thermometer);
  }
}


Pointer<Void> smokeTemperatureobserverToFfi(TemperatureObserver __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeTemperatureobserverCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __onTemperatureUpdateCaller(Pointer<Void> thermometer) { _smokeTemperatureobserveronTemperatureUpdateStatic(__interfaceObj, thermometer); }
  final __onTemperatureUpdateCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__onTemperatureUpdateCaller);
  __onTemperatureUpdateCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __onTemperatureUpdateCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeTemperatureobserverCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __onTemperatureUpdateCallback.nativeFunction
  );

  return result;
}

TemperatureObserver smokeTemperatureobserverFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TemperatureObserver) return instance;

  final _typeIdHandle = _smokeTemperatureobserverGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeTemperatureobserverCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TemperatureObserver$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeTemperatureobserverRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeTemperatureobserverReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeTemperatureobserverReleaseHandle(handle);

Pointer<Void> smokeTemperatureobserverToFfiNullable(TemperatureObserver? value) =>
  value != null ? smokeTemperatureobserverToFfi(value) : Pointer<Void>.fromAddress(0);

TemperatureObserver? smokeTemperatureobserverFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeTemperatureobserverFromFfi(handle) : null;

void smokeTemperatureobserverReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTemperatureobserverReleaseHandle(handle);

// End of TemperatureObserver "private" section.


