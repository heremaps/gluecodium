import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/calculation_result.dart';
import 'package:meta/meta.dart';
abstract class CalculatorListener {
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
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  onCalculationResult(double calculationResult);
  onCalculationResultConst(double calculationResult);
  onCalculationResultStruct(CalculatorListener_ResultStruct calculationResult);
  onCalculationResultArray(List<double> calculationResult);
  onCalculationResultMap(Map<String, double> calculationResults);
  onCalculationResultInstance(CalculationResult calculationResult);
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
final _smokeCalculatorlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_copy_handle'));
final _smokeCalculatorlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_release_handle'));
final _smokeCalculatorlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
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
  void release() {}
  @override
  onCalculationResult(double calculationResult) =>
    onCalculationResultLambda(calculationResult);
  @override
  onCalculationResultConst(double calculationResult) =>
    onCalculationResultConstLambda(calculationResult);
  @override
  onCalculationResultStruct(CalculatorListener_ResultStruct calculationResult) =>
    onCalculationResultStructLambda(calculationResult);
  @override
  onCalculationResultArray(List<double> calculationResult) =>
    onCalculationResultArrayLambda(calculationResult);
  @override
  onCalculationResultMap(Map<String, double> calculationResults) =>
    onCalculationResultMapLambda(calculationResults);
  @override
  onCalculationResultInstance(CalculationResult calculationResult) =>
    onCalculationResultInstanceLambda(calculationResult);
}
class CalculatorListener$Impl extends __lib.NativeBase implements CalculatorListener {
  CalculatorListener$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeCalculatorlistenerReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  onCalculationResult(double calculationResult) {
    final _onCalculationResultFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('library_smoke_CalculatorListener_onCalculationResult__Double'));
    final _calculationResultHandle = (calculationResult);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  onCalculationResultConst(double calculationResult) {
    final _onCalculationResultConstFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('library_smoke_CalculatorListener_onCalculationResultConst__Double'));
    final _calculationResultHandle = (calculationResult);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultConstFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  onCalculationResultStruct(CalculatorListener_ResultStruct calculationResult) {
    final _onCalculationResultStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultStruct__ResultStruct'));
    final _calculationResultHandle = smokeCalculatorlistenerResultstructToFfi(calculationResult);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultStructFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    smokeCalculatorlistenerResultstructReleaseFfiHandle(_calculationResultHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  onCalculationResultArray(List<double> calculationResult) {
    final _onCalculationResultArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultArray__ListOf_1Double'));
    final _calculationResultHandle = foobarListofDoubleToFfi(calculationResult);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultArrayFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    foobarListofDoubleReleaseFfiHandle(_calculationResultHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  onCalculationResultMap(Map<String, double> calculationResults) {
    final _onCalculationResultMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultMap__MapOf_1String_1to_1Double'));
    final _calculationResultsHandle = foobarMapofStringToDoubleToFfi(calculationResults);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultMapFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultsHandle);
    foobarMapofStringToDoubleReleaseFfiHandle(_calculationResultsHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  onCalculationResultInstance(CalculationResult calculationResult) {
    final _onCalculationResultInstanceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultInstance__CalculationResult'));
    final _calculationResultHandle = smokeCalculationresultToFfi(calculationResult);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultInstanceFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    smokeCalculationresultReleaseFfiHandle(_calculationResultHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
int _smokeCalculatorlisteneronCalculationResultStatic(int _token, double calculationResult) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResult((calculationResult));
  } finally {
  }
  return 0;
}
int _smokeCalculatorlisteneronCalculationResultConstStatic(int _token, double calculationResult) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResultConst((calculationResult));
  } finally {
  }
  return 0;
}
int _smokeCalculatorlisteneronCalculationResultStructStatic(int _token, Pointer<Void> calculationResult) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResultStruct(smokeCalculatorlistenerResultstructFromFfi(calculationResult));
  } finally {
    smokeCalculatorlistenerResultstructReleaseFfiHandle(calculationResult);
  }
  return 0;
}
int _smokeCalculatorlisteneronCalculationResultArrayStatic(int _token, Pointer<Void> calculationResult) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResultArray(foobarListofDoubleFromFfi(calculationResult));
  } finally {
    foobarListofDoubleReleaseFfiHandle(calculationResult);
  }
  return 0;
}
int _smokeCalculatorlisteneronCalculationResultMapStatic(int _token, Pointer<Void> calculationResults) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResultMap(foobarMapofStringToDoubleFromFfi(calculationResults));
  } finally {
    foobarMapofStringToDoubleReleaseFfiHandle(calculationResults);
  }
  return 0;
}
int _smokeCalculatorlisteneronCalculationResultInstanceStatic(int _token, Pointer<Void> calculationResult) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResultInstance(smokeCalculationresultFromFfi(calculationResult));
  } finally {
    smokeCalculationresultReleaseFfiHandle(calculationResult);
  }
  return 0;
}
Pointer<Void> smokeCalculatorlistenerToFfi(CalculatorListener value) {
  if (value is __lib.NativeBase) return _smokeCalculatorlistenerCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeCalculatorlistenerCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Double)>(_smokeCalculatorlisteneronCalculationResultStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Double)>(_smokeCalculatorlisteneronCalculationResultConstStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_smokeCalculatorlisteneronCalculationResultStructStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_smokeCalculatorlisteneronCalculationResultArrayStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_smokeCalculatorlisteneronCalculationResultMapStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_smokeCalculatorlisteneronCalculationResultInstanceStatic, __lib.unknownError)
  );
  return result;
}
CalculatorListener smokeCalculatorlistenerFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is CalculatorListener) return instance;
  final _typeIdHandle = _smokeCalculatorlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeCalculatorlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : CalculatorListener$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
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
