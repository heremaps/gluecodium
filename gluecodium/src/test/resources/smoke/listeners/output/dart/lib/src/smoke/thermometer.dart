

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/temperature_observer.dart';
import 'package:meta/meta.dart';

/// A class, which reads temperature and updates observers according to the given interval.
///
/// "Subject" in observer design pattern.
abstract class Thermometer implements Finalizable {

  factory Thermometer.makeWithDuration(Duration interval, List<TemperatureObserver> observers) => $prototype.makeWithDuration(interval, observers);

  factory Thermometer.makeWithoutDuration(List<TemperatureObserver> observers) => $prototype.makeWithoutDuration(observers);


  static void notifyObservers(Thermometer self, List<TemperatureObserver> observers) => $prototype.notifyObservers(self, observers);

  void forceUpdate();

  double getCelsius();

  double getKelvin();

  double getFahrenheit();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Thermometer$Impl(Pointer<Void>.fromAddress(0));
}


// Thermometer "private" section, not exported.

final _smokeThermometerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Thermometer_register_finalizer'));
final _smokeThermometerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Thermometer_copy_handle'));
final _smokeThermometerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Thermometer_release_handle'));









/// @nodoc
@visibleForTesting

class Thermometer$Impl extends __lib.NativeBase implements Thermometer {

  Thermometer$Impl(Pointer<Void> handle) : super(handle);


  Thermometer makeWithDuration(Duration interval, List<TemperatureObserver> observers) {
    final _result_handle = _makeWithDuration(interval, observers);
    final _result = Thermometer$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);


    notifyObservers(_result, observers);

    _smokeThermometerRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  Thermometer makeWithoutDuration(List<TemperatureObserver> observers) {
    final _result_handle = _makeWithoutDuration(observers);
    final _result = Thermometer$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);


    notifyObservers(_result, observers);

    _smokeThermometerRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _makeWithDuration(Duration interval, List<TemperatureObserver> observers) {
    final _makeWithDurationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint64, Pointer<Void>), Pointer<Void> Function(int, int, Pointer<Void>)>('library_smoke_Thermometer_makeWithDuration__Duration_ListOf_smoke_TemperatureObserver'));
    final _intervalHandle = durationToFfi(interval);
    final _observersHandle = foobarListofSmokeTemperatureobserverToFfi(observers);
    final __resultHandle = _makeWithDurationFfi(__lib.LibraryContext.isolateId, _intervalHandle, _observersHandle);
    durationReleaseFfiHandle(_intervalHandle);
    foobarListofSmokeTemperatureobserverReleaseFfiHandle(_observersHandle);
    return __resultHandle;
  }

  static Pointer<Void> _makeWithoutDuration(List<TemperatureObserver> observers) {
    final _makeWithoutDurationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Thermometer_makeWithoutDuration__ListOf_smoke_TemperatureObserver'));
    final _observersHandle = foobarListofSmokeTemperatureobserverToFfi(observers);
    final __resultHandle = _makeWithoutDurationFfi(__lib.LibraryContext.isolateId, _observersHandle);
    foobarListofSmokeTemperatureobserverReleaseFfiHandle(_observersHandle);
    return __resultHandle;
  }

  void notifyObservers(Thermometer self, List<TemperatureObserver> observers) {
    final _notifyObserversFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Pointer<Void>), void Function(int, Pointer<Void>, Pointer<Void>)>('library_smoke_Thermometer_notifyObservers__Thermometer_ListOf_smoke_TemperatureObserver'));
    final _selfHandle = smokeThermometerToFfi(self);
    final _observersHandle = foobarListofSmokeTemperatureobserverToFfi(observers);
    _notifyObserversFfi(__lib.LibraryContext.isolateId, _selfHandle, _observersHandle);
    smokeThermometerReleaseFfiHandle(_selfHandle);
    foobarListofSmokeTemperatureobserverReleaseFfiHandle(_observersHandle);

  }

  @override
  void forceUpdate() {
    final _forceUpdateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_Thermometer_forceUpdate'));
    final _handle = this.handle;
    _forceUpdateFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  double getCelsius() {
    final _getCelsiusFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('library_smoke_Thermometer_getCelsius'));
    final _handle = this.handle;
    final __resultHandle = _getCelsiusFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  double getKelvin() {
    final _getKelvinFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('library_smoke_Thermometer_getKelvin'));
    final _handle = this.handle;
    final __resultHandle = _getKelvinFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  double getFahrenheit() {
    final _getFahrenheitFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('library_smoke_Thermometer_getFahrenheit'));
    final _handle = this.handle;
    final __resultHandle = _getFahrenheitFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


}

Pointer<Void> smokeThermometerToFfi(Thermometer value) =>
  _smokeThermometerCopyHandle((value as __lib.NativeBase).handle);

Thermometer smokeThermometerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Thermometer) return instance;

  final _copiedHandle = _smokeThermometerCopyHandle(handle);
  final result = Thermometer$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeThermometerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeThermometerReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeThermometerReleaseHandle(handle);

Pointer<Void> smokeThermometerToFfiNullable(Thermometer? value) =>
  value != null ? smokeThermometerToFfi(value) : Pointer<Void>.fromAddress(0);

Thermometer? smokeThermometerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeThermometerFromFfi(handle) : null;

void smokeThermometerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeThermometerReleaseHandle(handle);

// End of Thermometer "private" section.


