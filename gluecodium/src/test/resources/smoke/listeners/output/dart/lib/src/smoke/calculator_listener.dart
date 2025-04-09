

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/calculation_result.dart';

abstract class CalculatorListener implements Finalizable {

  factory CalculatorListener(
    void Function(double) onCalculationResultLambda,
    void Function(double) onCalculationResultConstLambda,
    void Function(CalculatorListener_ResultStruct) onCalculationResultStructLambda,
    void Function(List<double>) onCalculationResultArrayLambda,
    void Function(Map<String, double>) onCalculationResultMapLambda,
    void Function(CalculationResult) onCalculationResultInstanceLambda,

  ) => CalculatorListener$Lambdas(
    onCalculationResultLambda,
    onCalculationResultConstLambda,
    onCalculationResultStructLambda,
    onCalculationResultArrayLambda,
    onCalculationResultMapLambda,
    onCalculationResultInstanceLambda,

  );


  void onCalculationResult(double calculationResult);

  void onCalculationResultConst(double calculationResult);

  void onCalculationResultStruct(CalculatorListener_ResultStruct calculationResult);

  void onCalculationResultArray(List<double> calculationResult);

  void onCalculationResultMap(Map<String, double> calculationResults);

  void onCalculationResultInstance(CalculationResult calculationResult);
}


class CalculatorListener_ResultStruct {
  double result;

  CalculatorListener_ResultStruct(this.result);
}


// CalculatorListener_ResultStruct "private" section, not exported.

final _smokeCalculatorlistenerResultstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_CalculatorListener_ResultStruct_create_handle'));
final _smokeCalculatorlistenerResultstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_ResultStruct_release_handle'));
final _smokeCalculatorlistenerResultstructGetFieldresult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_ResultStruct_get_field_result'));



Pointer<Void> smokeCalculatorlistenerResultstructToFfi(CalculatorListener_ResultStruct value) {
  final _resultHandle = (value.result);
  final _result = _smokeCalculatorlistenerResultstructCreateHandle(_resultHandle);
  
  return _result;
}

CalculatorListener_ResultStruct smokeCalculatorlistenerResultstructFromFfi(Pointer<Void> handle) {
  final _resultHandle = _smokeCalculatorlistenerResultstructGetFieldresult(handle);
  try {
    return CalculatorListener_ResultStruct(
      (_resultHandle)
    );
  } finally {
    
  }
}

void smokeCalculatorlistenerResultstructReleaseFfiHandle(Pointer<Void> handle) => _smokeCalculatorlistenerResultstructReleaseHandle(handle);

// Nullable CalculatorListener_ResultStruct

final _smokeCalculatorlistenerResultstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_ResultStruct_create_handle_nullable'));
final _smokeCalculatorlistenerResultstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_ResultStruct_release_handle_nullable'));
final _smokeCalculatorlistenerResultstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_ResultStruct_get_value_nullable'));

Pointer<Void> smokeCalculatorlistenerResultstructToFfiNullable(CalculatorListener_ResultStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeCalculatorlistenerResultstructToFfi(value);
  final result = _smokeCalculatorlistenerResultstructCreateHandleNullable(_handle);
  smokeCalculatorlistenerResultstructReleaseFfiHandle(_handle);
  return result;
}

CalculatorListener_ResultStruct? smokeCalculatorlistenerResultstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeCalculatorlistenerResultstructGetValueNullable(handle);
  final result = smokeCalculatorlistenerResultstructFromFfi(_handle);
  smokeCalculatorlistenerResultstructReleaseFfiHandle(_handle);
  return result;
}

void smokeCalculatorlistenerResultstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCalculatorlistenerResultstructReleaseHandleNullable(handle);

// End of CalculatorListener_ResultStruct "private" section.

// CalculatorListener "private" section, not exported.

final _smokeCalculatorlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CalculatorListener_register_finalizer'));
final _smokeCalculatorlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_copy_handle'));
final _smokeCalculatorlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_release_handle'));
final _smokeCalculatorlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_CalculatorListener_create_proxy'));
final _smokeCalculatorlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_get_type_id'));







class CalculatorListener$Lambdas implements CalculatorListener {
  void Function(double) onCalculationResultLambda;
  void Function(double) onCalculationResultConstLambda;
  void Function(CalculatorListener_ResultStruct) onCalculationResultStructLambda;
  void Function(List<double>) onCalculationResultArrayLambda;
  void Function(Map<String, double>) onCalculationResultMapLambda;
  void Function(CalculationResult) onCalculationResultInstanceLambda;

  CalculatorListener$Lambdas(
    this.onCalculationResultLambda,
    this.onCalculationResultConstLambda,
    this.onCalculationResultStructLambda,
    this.onCalculationResultArrayLambda,
    this.onCalculationResultMapLambda,
    this.onCalculationResultInstanceLambda,

  );

  @override
  void onCalculationResult(double calculationResult) =>
    onCalculationResultLambda(calculationResult);
  @override
  void onCalculationResultConst(double calculationResult) =>
    onCalculationResultConstLambda(calculationResult);
  @override
  void onCalculationResultStruct(CalculatorListener_ResultStruct calculationResult) =>
    onCalculationResultStructLambda(calculationResult);
  @override
  void onCalculationResultArray(List<double> calculationResult) =>
    onCalculationResultArrayLambda(calculationResult);
  @override
  void onCalculationResultMap(Map<String, double> calculationResults) =>
    onCalculationResultMapLambda(calculationResults);
  @override
  void onCalculationResultInstance(CalculationResult calculationResult) =>
    onCalculationResultInstanceLambda(calculationResult);
}

class CalculatorListener$Impl extends __lib.NativeBase implements CalculatorListener {

  CalculatorListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onCalculationResult(double calculationResult) {
    final _onCalculationResultFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('library_smoke_CalculatorListener_onCalculationResult__Double'));
    final _calculationResultHandle = (calculationResult);
    final _handle = this.handle;
    _onCalculationResultFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);


  }

  @override
  void onCalculationResultConst(double calculationResult) {
    final _onCalculationResultConstFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('library_smoke_CalculatorListener_onCalculationResultConst__Double'));
    final _calculationResultHandle = (calculationResult);
    final _handle = this.handle;
    _onCalculationResultConstFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);


  }

  @override
  void onCalculationResultStruct(CalculatorListener_ResultStruct calculationResult) {
    final _onCalculationResultStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultStruct__ResultStruct'));
    final _calculationResultHandle = smokeCalculatorlistenerResultstructToFfi(calculationResult);
    final _handle = this.handle;
    _onCalculationResultStructFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    smokeCalculatorlistenerResultstructReleaseFfiHandle(_calculationResultHandle);

  }

  @override
  void onCalculationResultArray(List<double> calculationResult) {
    final _onCalculationResultArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultArray__ListOf_Double'));
    final _calculationResultHandle = foobarListofDoubleToFfi(calculationResult);
    final _handle = this.handle;
    _onCalculationResultArrayFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    foobarListofDoubleReleaseFfiHandle(_calculationResultHandle);

  }

  @override
  void onCalculationResultMap(Map<String, double> calculationResults) {
    final _onCalculationResultMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultMap__MapOf_String_to_Double'));
    final _calculationResultsHandle = foobarMapofStringToDoubleToFfi(calculationResults);
    final _handle = this.handle;
    _onCalculationResultMapFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultsHandle);
    foobarMapofStringToDoubleReleaseFfiHandle(_calculationResultsHandle);

  }

  @override
  void onCalculationResultInstance(CalculationResult calculationResult) {
    final _onCalculationResultInstanceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultInstance__CalculationResult'));
    final _calculationResultHandle = smokeCalculationresultToFfi(calculationResult);
    final _handle = this.handle;
    _onCalculationResultInstanceFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    smokeCalculationresultReleaseFfiHandle(_calculationResultHandle);

  }


}

void _smokeCalculatorlisteneronCalculationResultStatic(CalculatorListener _obj, double calculationResult) {

  try {
    _obj.onCalculationResult((calculationResult));
  } finally {
    
  }
}
void _smokeCalculatorlisteneronCalculationResultConstStatic(CalculatorListener _obj, double calculationResult) {

  try {
    _obj.onCalculationResultConst((calculationResult));
  } finally {
    
  }
}
void _smokeCalculatorlisteneronCalculationResultStructStatic(CalculatorListener _obj, Pointer<Void> calculationResult) {

  try {
    _obj.onCalculationResultStruct(smokeCalculatorlistenerResultstructFromFfi(calculationResult));
  } finally {
    smokeCalculatorlistenerResultstructReleaseFfiHandle(calculationResult);
  }
}
void _smokeCalculatorlisteneronCalculationResultArrayStatic(CalculatorListener _obj, Pointer<Void> calculationResult) {

  try {
    _obj.onCalculationResultArray(foobarListofDoubleFromFfi(calculationResult));
  } finally {
    foobarListofDoubleReleaseFfiHandle(calculationResult);
  }
}
void _smokeCalculatorlisteneronCalculationResultMapStatic(CalculatorListener _obj, Pointer<Void> calculationResults) {

  try {
    _obj.onCalculationResultMap(foobarMapofStringToDoubleFromFfi(calculationResults));
  } finally {
    foobarMapofStringToDoubleReleaseFfiHandle(calculationResults);
  }
}
void _smokeCalculatorlisteneronCalculationResultInstanceStatic(CalculatorListener _obj, Pointer<Void> calculationResult) {

  try {
    _obj.onCalculationResultInstance(smokeCalculationresultFromFfi(calculationResult));
  } finally {
    smokeCalculationresultReleaseFfiHandle(calculationResult);
  }
}


Pointer<Void> smokeCalculatorlistenerToFfi(CalculatorListener __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeCalculatorlistenerCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __onCalculationResultCaller(double calculationResult) { _smokeCalculatorlisteneronCalculationResultStatic(__interfaceObj, calculationResult); }
  final __onCalculationResultCallback = NativeCallable<Void Function(Double)>.isolateLocal(__onCalculationResultCaller);
  __onCalculationResultCallback.keepIsolateAlive = false;

  void __onCalculationResultConstCaller(double calculationResult) { _smokeCalculatorlisteneronCalculationResultConstStatic(__interfaceObj, calculationResult); }
  final __onCalculationResultConstCallback = NativeCallable<Void Function(Double)>.isolateLocal(__onCalculationResultConstCaller);
  __onCalculationResultConstCallback.keepIsolateAlive = false;

  void __onCalculationResultStructCaller(Pointer<Void> calculationResult) { _smokeCalculatorlisteneronCalculationResultStructStatic(__interfaceObj, calculationResult); }
  final __onCalculationResultStructCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__onCalculationResultStructCaller);
  __onCalculationResultStructCallback.keepIsolateAlive = false;

  void __onCalculationResultArrayCaller(Pointer<Void> calculationResult) { _smokeCalculatorlisteneronCalculationResultArrayStatic(__interfaceObj, calculationResult); }
  final __onCalculationResultArrayCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__onCalculationResultArrayCaller);
  __onCalculationResultArrayCallback.keepIsolateAlive = false;

  void __onCalculationResultMapCaller(Pointer<Void> calculationResults) { _smokeCalculatorlisteneronCalculationResultMapStatic(__interfaceObj, calculationResults); }
  final __onCalculationResultMapCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__onCalculationResultMapCaller);
  __onCalculationResultMapCallback.keepIsolateAlive = false;

  void __onCalculationResultInstanceCaller(Pointer<Void> calculationResult) { _smokeCalculatorlisteneronCalculationResultInstanceStatic(__interfaceObj, calculationResult); }
  final __onCalculationResultInstanceCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__onCalculationResultInstanceCaller);
  __onCalculationResultInstanceCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __onCalculationResultCallback.close();
    __onCalculationResultConstCallback.close();
    __onCalculationResultStructCallback.close();
    __onCalculationResultArrayCallback.close();
    __onCalculationResultMapCallback.close();
    __onCalculationResultInstanceCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeCalculatorlistenerCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __onCalculationResultCallback.nativeFunction,
    __onCalculationResultConstCallback.nativeFunction,
    __onCalculationResultStructCallback.nativeFunction,
    __onCalculationResultArrayCallback.nativeFunction,
    __onCalculationResultMapCallback.nativeFunction,
    __onCalculationResultInstanceCallback.nativeFunction
  );

  return result;
}

CalculatorListener smokeCalculatorlistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CalculatorListener) return instance;

  final _typeIdHandle = _smokeCalculatorlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeCalculatorlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : CalculatorListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeCalculatorlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeCalculatorlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCalculatorlistenerReleaseHandle(handle);

Pointer<Void> smokeCalculatorlistenerToFfiNullable(CalculatorListener? value) =>
  value != null ? smokeCalculatorlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

CalculatorListener? smokeCalculatorlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCalculatorlistenerFromFfi(handle) : null;

void smokeCalculatorlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCalculatorlistenerReleaseHandle(handle);

// End of CalculatorListener "private" section.


