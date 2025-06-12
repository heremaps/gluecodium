

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
  /// A constructor, which makes the thermometer with readout interval.
  ///
  /// - [interval] readout interval
  ///
  /// - [observers] observers of temperature changes
  ///
  factory Thermometer.makeWithDuration(Duration interval, List<TemperatureObserver> observers) => $prototype.makeWithDuration(interval, observers);
  /// A constructor, which makes the thermometer with default readout interval (1 second).
  ///
  /// - [observers] observers of temperature changes
  ///
  factory Thermometer.makeWithoutDuration(List<TemperatureObserver> observers) => $prototype.makeWithoutDuration(observers);
  /// A throwing constructor, which makes the thermometer with default readout interval (1 second).
  ///
  /// - [id] identification of this thermometer
  ///
  /// - [observers] observers of temperature changes
  ///
  /// Throws [Thermometer_NotificationException]. if identification number is invalid
  ///
  factory Thermometer.throwingMake(int id, List<TemperatureObserver> observers) => $prototype.throwingMake(id, observers);
  /// A non-throwing constructor, which makes the thermometer with default readout interval (1 second).
  ///
  /// - [label] some identification label
  ///
  /// - [niceObservers] observers of temperature changes
  ///
  /// Throws [Thermometer_NotificationException]. if notification of observers failed
  ///
  factory Thermometer.nothrowMake(String label, List<TemperatureObserver> niceObservers) => $prototype.nothrowMake(label, niceObservers);
  /// A throwing constructor, which makes the thermometer with default readout interval (1 second).
  ///
  /// - [dummy] some dummy boolean flag
  ///
  /// - [observers] observers of temperature changes
  ///
  /// Throws [Thermometer_AnotherNotificationException]. if some problem occurs
  ///
  /// Throws [Thermometer_NotificationException]. if notification of observers failed
  ///
  factory Thermometer.anotherThrowingMake(bool dummy, List<TemperatureObserver> observers) => $prototype.anotherThrowingMake(dummy, observers);


  static void notifyObservers(Thermometer thermometer, List<TemperatureObserver> someObservers) => $prototype.notifyObservers(thermometer, someObservers);
  /// Function used to notify observers.
  ///
  /// - [thermometer] subject that has changed state
  ///
  /// - [someObservers] observers to be notified
  ///
  /// Throws [Thermometer_NotificationException]. if notification of observers failed
  ///
  static void throwingNotifyObservers(Thermometer thermometer, List<TemperatureObserver> someObservers) => $prototype.throwingNotifyObservers(thermometer, someObservers);

  void forceUpdate();

  double getCelsius();

  double getKelvin();

  double getFahrenheit();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Thermometer$Impl(Pointer<Void>.fromAddress(0));
}

/// Some error code for thermometer.
enum Thermometer_SomeThermometerErrorCode {
    errorNone,
    errorFatal
}

// Thermometer_SomeThermometerErrorCode "private" section, not exported.

int smokeThermometerSomethermometererrorcodeToFfi(Thermometer_SomeThermometerErrorCode value) {
  switch (value) {
  case Thermometer_SomeThermometerErrorCode.errorNone:
    return 0;
  case Thermometer_SomeThermometerErrorCode.errorFatal:
    return 1;
  }
}

Thermometer_SomeThermometerErrorCode smokeThermometerSomethermometererrorcodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Thermometer_SomeThermometerErrorCode.errorNone;
  case 1:
    return Thermometer_SomeThermometerErrorCode.errorFatal;
  default:
    throw StateError("Invalid numeric value $handle for Thermometer_SomeThermometerErrorCode enum.");
  }
}

void smokeThermometerSomethermometererrorcodeReleaseFfiHandle(int handle) {}

final _smokeThermometerSomethermometererrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Thermometer_SomeThermometerErrorCode_create_handle_nullable'));
final _smokeThermometerSomethermometererrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Thermometer_SomeThermometerErrorCode_release_handle_nullable'));
final _smokeThermometerSomethermometererrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Thermometer_SomeThermometerErrorCode_get_value_nullable'));

Pointer<Void> smokeThermometerSomethermometererrorcodeToFfiNullable(Thermometer_SomeThermometerErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeThermometerSomethermometererrorcodeToFfi(value);
  final result = _smokeThermometerSomethermometererrorcodeCreateHandleNullable(_handle);
  smokeThermometerSomethermometererrorcodeReleaseFfiHandle(_handle);
  return result;
}

Thermometer_SomeThermometerErrorCode? smokeThermometerSomethermometererrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeThermometerSomethermometererrorcodeGetValueNullable(handle);
  final result = smokeThermometerSomethermometererrorcodeFromFfi(_handle);
  smokeThermometerSomethermometererrorcodeReleaseFfiHandle(_handle);
  return result;
}

void smokeThermometerSomethermometererrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeThermometerSomethermometererrorcodeReleaseHandleNullable(handle);

// End of Thermometer_SomeThermometerErrorCode "private" section.
/// This error indicates problems with notification of observers.
///
/// May be thrown if observers cannot be notified.
class Thermometer_NotificationException implements Exception {
  final String error;
  Thermometer_NotificationException(this.error);
}
/// This error indicates other problems with notification of observers.
class Thermometer_AnotherNotificationException implements Exception {
  final Thermometer_SomeThermometerErrorCode error;
  Thermometer_AnotherNotificationException(this.error);
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




final _throwingMakesmokeThermometerThrowingmakeIntListofSmokeTemperatureobserverReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Thermometer_throwingMake__Int_ListOf_smoke_TemperatureObserver_return_release_handle'));
final _throwingMakesmokeThermometerThrowingmakeIntListofSmokeTemperatureobserverReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Thermometer_throwingMake__Int_ListOf_smoke_TemperatureObserver_return_get_result'));
final _throwingMakesmokeThermometerThrowingmakeIntListofSmokeTemperatureobserverReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Thermometer_throwingMake__Int_ListOf_smoke_TemperatureObserver_return_get_error'));
final _throwingMakesmokeThermometerThrowingmakeIntListofSmokeTemperatureobserverReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Thermometer_throwingMake__Int_ListOf_smoke_TemperatureObserver_return_has_error'));



final _anotherThrowingMakesmokeThermometerAnotherthrowingmakeBooleanListofSmokeTemperatureobserverReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Thermometer_anotherThrowingMake__Boolean_ListOf_smoke_TemperatureObserver_return_release_handle'));
final _anotherThrowingMakesmokeThermometerAnotherthrowingmakeBooleanListofSmokeTemperatureobserverReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Thermometer_anotherThrowingMake__Boolean_ListOf_smoke_TemperatureObserver_return_get_result'));
final _anotherThrowingMakesmokeThermometerAnotherthrowingmakeBooleanListofSmokeTemperatureobserverReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Thermometer_anotherThrowingMake__Boolean_ListOf_smoke_TemperatureObserver_return_get_error'));
final _anotherThrowingMakesmokeThermometerAnotherthrowingmakeBooleanListofSmokeTemperatureobserverReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Thermometer_anotherThrowingMake__Boolean_ListOf_smoke_TemperatureObserver_return_has_error'));



final _throwingNotifyObserverssmokeThermometerThrowingnotifyobserversThermometerListofSmokeTemperatureobserverReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Thermometer_throwingNotifyObservers__Thermometer_ListOf_smoke_TemperatureObserver_return_release_handle'));
final _throwingNotifyObserverssmokeThermometerThrowingnotifyobserversThermometerListofSmokeTemperatureobserverReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Thermometer_throwingNotifyObservers__Thermometer_ListOf_smoke_TemperatureObserver_return_get_error'));
final _throwingNotifyObserverssmokeThermometerThrowingnotifyobserversThermometerListofSmokeTemperatureobserverReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Thermometer_throwingNotifyObservers__Thermometer_ListOf_smoke_TemperatureObserver_return_has_error'));






/// @nodoc
@visibleForTesting

class Thermometer$Impl extends __lib.NativeBase implements Thermometer {

  Thermometer$Impl(Pointer<Void> handle) : super(handle);


  Thermometer makeWithDuration(Duration interval, List<TemperatureObserver> observers) {
    final _result_handle = _makeWithDuration(interval, observers);
    final _result = Thermometer$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeThermometerRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);

    notifyObservers(_result, observers);

    return _result;
  }


  Thermometer makeWithoutDuration(List<TemperatureObserver> observers) {
    final _result_handle = _makeWithoutDuration(observers);
    final _result = Thermometer$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeThermometerRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);

    notifyObservers(_result, observers);

    return _result;
  }


  Thermometer throwingMake(int id, List<TemperatureObserver> observers) {
    final _result_handle = _throwingMake(id, observers);
    final _result = Thermometer$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeThermometerRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);

    throwingNotifyObservers(_result, observers);

    return _result;
  }


  Thermometer nothrowMake(String label, List<TemperatureObserver> niceObservers) {
    final _result_handle = _nothrowMake(label, niceObservers);
    final _result = Thermometer$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeThermometerRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);

    throwingNotifyObservers(_result, niceObservers);

    return _result;
  }


  Thermometer anotherThrowingMake(bool dummy, List<TemperatureObserver> observers) {
    final _result_handle = _anotherThrowingMake(dummy, observers);
    final _result = Thermometer$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeThermometerRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);

    throwingNotifyObservers(_result, observers);

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

  static Pointer<Void> _throwingMake(int id, List<TemperatureObserver> observers) {
    final _throwingMakeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Int32, Pointer<Void>), Pointer<Void> Function(int, int, Pointer<Void>)>('library_smoke_Thermometer_throwingMake__Int_ListOf_smoke_TemperatureObserver'));
    final _idHandle = (id);
    final _observersHandle = foobarListofSmokeTemperatureobserverToFfi(observers);
    final __callResultHandle = _throwingMakeFfi(__lib.LibraryContext.isolateId, _idHandle, _observersHandle);

    foobarListofSmokeTemperatureobserverReleaseFfiHandle(_observersHandle);
    if (_throwingMakesmokeThermometerThrowingmakeIntListofSmokeTemperatureobserverReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _throwingMakesmokeThermometerThrowingmakeIntListofSmokeTemperatureobserverReturnGetError(__callResultHandle);
        _throwingMakesmokeThermometerThrowingmakeIntListofSmokeTemperatureobserverReturnReleaseHandle(__callResultHandle);
        try {
          throw Thermometer_NotificationException(stringFromFfi(__errorHandle));
        } finally {
          stringReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _throwingMakesmokeThermometerThrowingmakeIntListofSmokeTemperatureobserverReturnGetResult(__callResultHandle);
    _throwingMakesmokeThermometerThrowingmakeIntListofSmokeTemperatureobserverReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _nothrowMake(String label, List<TemperatureObserver> niceObservers) {
    final _nothrowMakeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('library_smoke_Thermometer_nothrowMake__String_ListOf_smoke_TemperatureObserver'));
    final _labelHandle = stringToFfi(label);
    final _niceObserversHandle = foobarListofSmokeTemperatureobserverToFfi(niceObservers);
    final __resultHandle = _nothrowMakeFfi(__lib.LibraryContext.isolateId, _labelHandle, _niceObserversHandle);
    stringReleaseFfiHandle(_labelHandle);
    foobarListofSmokeTemperatureobserverReleaseFfiHandle(_niceObserversHandle);
    return __resultHandle;
  }

  static Pointer<Void> _anotherThrowingMake(bool dummy, List<TemperatureObserver> observers) {
    final _anotherThrowingMakeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint8, Pointer<Void>), Pointer<Void> Function(int, int, Pointer<Void>)>('library_smoke_Thermometer_anotherThrowingMake__Boolean_ListOf_smoke_TemperatureObserver'));
    final _dummyHandle = booleanToFfi(dummy);
    final _observersHandle = foobarListofSmokeTemperatureobserverToFfi(observers);
    final __callResultHandle = _anotherThrowingMakeFfi(__lib.LibraryContext.isolateId, _dummyHandle, _observersHandle);
    booleanReleaseFfiHandle(_dummyHandle);
    foobarListofSmokeTemperatureobserverReleaseFfiHandle(_observersHandle);
    if (_anotherThrowingMakesmokeThermometerAnotherthrowingmakeBooleanListofSmokeTemperatureobserverReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _anotherThrowingMakesmokeThermometerAnotherthrowingmakeBooleanListofSmokeTemperatureobserverReturnGetError(__callResultHandle);
        _anotherThrowingMakesmokeThermometerAnotherthrowingmakeBooleanListofSmokeTemperatureobserverReturnReleaseHandle(__callResultHandle);
        try {
          throw Thermometer_AnotherNotificationException(smokeThermometerSomethermometererrorcodeFromFfi(__errorHandle));
        } finally {
          smokeThermometerSomethermometererrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _anotherThrowingMakesmokeThermometerAnotherthrowingmakeBooleanListofSmokeTemperatureobserverReturnGetResult(__callResultHandle);
    _anotherThrowingMakesmokeThermometerAnotherthrowingmakeBooleanListofSmokeTemperatureobserverReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  void notifyObservers(Thermometer thermometer, List<TemperatureObserver> someObservers) {
    final _notifyObserversFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Pointer<Void>), void Function(int, Pointer<Void>, Pointer<Void>)>('library_smoke_Thermometer_notifyObservers__Thermometer_ListOf_smoke_TemperatureObserver'));
    final _thermometerHandle = smokeThermometerToFfi(thermometer);
    final _someObserversHandle = foobarListofSmokeTemperatureobserverToFfi(someObservers);
    _notifyObserversFfi(__lib.LibraryContext.isolateId, _thermometerHandle, _someObserversHandle);
    smokeThermometerReleaseFfiHandle(_thermometerHandle);
    foobarListofSmokeTemperatureobserverReleaseFfiHandle(_someObserversHandle);

  }

  void throwingNotifyObservers(Thermometer thermometer, List<TemperatureObserver> someObservers) {
    final _throwingNotifyObserversFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('library_smoke_Thermometer_throwingNotifyObservers__Thermometer_ListOf_smoke_TemperatureObserver'));
    final _thermometerHandle = smokeThermometerToFfi(thermometer);
    final _someObserversHandle = foobarListofSmokeTemperatureobserverToFfi(someObservers);
    final __callResultHandle = _throwingNotifyObserversFfi(__lib.LibraryContext.isolateId, _thermometerHandle, _someObserversHandle);
    smokeThermometerReleaseFfiHandle(_thermometerHandle);
    foobarListofSmokeTemperatureobserverReleaseFfiHandle(_someObserversHandle);
    if (_throwingNotifyObserverssmokeThermometerThrowingnotifyobserversThermometerListofSmokeTemperatureobserverReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _throwingNotifyObserverssmokeThermometerThrowingnotifyobserversThermometerListofSmokeTemperatureobserverReturnGetError(__callResultHandle);
        _throwingNotifyObserverssmokeThermometerThrowingnotifyobserversThermometerListofSmokeTemperatureobserverReturnReleaseHandle(__callResultHandle);
        try {
          throw Thermometer_NotificationException(stringFromFfi(__errorHandle));
        } finally {
          stringReleaseFfiHandle(__errorHandle);
        }
    }
    _throwingNotifyObserverssmokeThermometerThrowingnotifyobserversThermometerListofSmokeTemperatureobserverReturnReleaseHandle(__callResultHandle);

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


