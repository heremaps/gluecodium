import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/calculation_result.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class CalculatorListener {
  CalculatorListener();
  factory CalculatorListener.fromLambdas({
    @required void Function(double) lambda_onCalculationResult,
    @required void Function(double) lambda_onCalculationResultConst,
    @required void Function(CalculatorListener_ResultStruct) lambda_onCalculationResultStruct,
    @required void Function(List<double>) lambda_onCalculationResultArray,
    @required void Function(Map<String, double>) lambda_onCalculationResultMap,
    @required void Function(CalculationResult) lambda_onCalculationResultInstance,
  }) => CalculatorListener$Lambdas(
    lambda_onCalculationResult,
    lambda_onCalculationResultConst,
    lambda_onCalculationResultStruct,
    lambda_onCalculationResultArray,
    lambda_onCalculationResultMap,
    lambda_onCalculationResultInstance,
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
Pointer<Void> smoke_CalculatorListener_ResultStruct_toFfi(CalculatorListener_ResultStruct value) {
  final _resultHandle = (value.result);
  final _result = _smokeCalculatorlistenerResultstructCreateHandle(_resultHandle);
  (_resultHandle);
  return _result;
}
CalculatorListener_ResultStruct smoke_CalculatorListener_ResultStruct_fromFfi(Pointer<Void> handle) {
  final _resultHandle = _smokeCalculatorlistenerResultstructGetFieldresult(handle);
  try {
    return CalculatorListener_ResultStruct(
      (_resultHandle)
    );
  } finally {
    (_resultHandle);
  }
}
void smoke_CalculatorListener_ResultStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeCalculatorlistenerResultstructReleaseHandle(handle);
// Nullable CalculatorListener_ResultStruct
final _smoke_CalculatorListener_ResultStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_ResultStruct_create_handle_nullable'));
final _smoke_CalculatorListener_ResultStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_ResultStruct_release_handle_nullable'));
final _smoke_CalculatorListener_ResultStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CalculatorListener_ResultStruct_get_value_nullable'));
Pointer<Void> smoke_CalculatorListener_ResultStruct_toFfi_nullable(CalculatorListener_ResultStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_CalculatorListener_ResultStruct_toFfi(value);
  final result = _smoke_CalculatorListener_ResultStructCreateHandleNullable(_handle);
  smoke_CalculatorListener_ResultStruct_releaseFfiHandle(_handle);
  return result;
}
CalculatorListener_ResultStruct smoke_CalculatorListener_ResultStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_CalculatorListener_ResultStructGetValueNullable(handle);
  final result = smoke_CalculatorListener_ResultStruct_fromFfi(_handle);
  smoke_CalculatorListener_ResultStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_CalculatorListener_ResultStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CalculatorListener_ResultStructReleaseHandleNullable(handle);
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
  void Function(double) lambda_onCalculationResult;
  void Function(double) lambda_onCalculationResultConst;
  void Function(CalculatorListener_ResultStruct) lambda_onCalculationResultStruct;
  void Function(List<double>) lambda_onCalculationResultArray;
  void Function(Map<String, double>) lambda_onCalculationResultMap;
  void Function(CalculationResult) lambda_onCalculationResultInstance;
  CalculatorListener$Lambdas(
    this.lambda_onCalculationResult,
    this.lambda_onCalculationResultConst,
    this.lambda_onCalculationResultStruct,
    this.lambda_onCalculationResultArray,
    this.lambda_onCalculationResultMap,
    this.lambda_onCalculationResultInstance,
  );
  @override
  void release() {}
  @override
  onCalculationResult(double calculationResult) =>
    lambda_onCalculationResult(calculationResult);
  @override
  onCalculationResultConst(double calculationResult) =>
    lambda_onCalculationResultConst(calculationResult);
  @override
  onCalculationResultStruct(CalculatorListener_ResultStruct calculationResult) =>
    lambda_onCalculationResultStruct(calculationResult);
  @override
  onCalculationResultArray(List<double> calculationResult) =>
    lambda_onCalculationResultArray(calculationResult);
  @override
  onCalculationResultMap(Map<String, double> calculationResults) =>
    lambda_onCalculationResultMap(calculationResults);
  @override
  onCalculationResultInstance(CalculationResult calculationResult) =>
    lambda_onCalculationResultInstance(calculationResult);
}
class CalculatorListener$Impl extends __lib.NativeBase implements CalculatorListener {
  CalculatorListener$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeCalculatorlistenerReleaseHandle(handle);
    handle = null;
  }
  @override
  onCalculationResult(double calculationResult) {
    final _onCalculationResultFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('library_smoke_CalculatorListener_onCalculationResult__Double'));
    final _calculationResultHandle = (calculationResult);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    (_calculationResultHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  onCalculationResultConst(double calculationResult) {
    final _onCalculationResultConstFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('library_smoke_CalculatorListener_onCalculationResultConst__Double'));
    final _calculationResultHandle = (calculationResult);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultConstFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    (_calculationResultHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  onCalculationResultStruct(CalculatorListener_ResultStruct calculationResult) {
    final _onCalculationResultStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultStruct__ResultStruct'));
    final _calculationResultHandle = smoke_CalculatorListener_ResultStruct_toFfi(calculationResult);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultStructFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    smoke_CalculatorListener_ResultStruct_releaseFfiHandle(_calculationResultHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  onCalculationResultArray(List<double> calculationResult) {
    final _onCalculationResultArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultArray__ListOf_1Double'));
    final _calculationResultHandle = foobar_ListOf_Double_toFfi(calculationResult);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultArrayFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    foobar_ListOf_Double_releaseFfiHandle(_calculationResultHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  onCalculationResultMap(Map<String, double> calculationResults) {
    final _onCalculationResultMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultMap__MapOf_1String_1to_1Double'));
    final _calculationResultsHandle = foobar_MapOf_String_to_Double_toFfi(calculationResults);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultMapFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultsHandle);
    foobar_MapOf_String_to_Double_releaseFfiHandle(_calculationResultsHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  onCalculationResultInstance(CalculationResult calculationResult) {
    final _onCalculationResultInstanceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CalculatorListener_onCalculationResultInstance__CalculationResult'));
    final _calculationResultHandle = smoke_CalculationResult_toFfi(calculationResult);
    final _handle = this.handle;
    final __resultHandle = _onCalculationResultInstanceFfi(_handle, __lib.LibraryContext.isolateId, _calculationResultHandle);
    smoke_CalculationResult_releaseFfiHandle(_calculationResultHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _CalculatorListener_onCalculationResult_static(int _token, double calculationResult) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResult((calculationResult));
  } finally {
    (calculationResult);
  }
  return 0;
}
int _CalculatorListener_onCalculationResultConst_static(int _token, double calculationResult) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResultConst((calculationResult));
  } finally {
    (calculationResult);
  }
  return 0;
}
int _CalculatorListener_onCalculationResultStruct_static(int _token, Pointer<Void> calculationResult) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResultStruct(smoke_CalculatorListener_ResultStruct_fromFfi(calculationResult));
  } finally {
    smoke_CalculatorListener_ResultStruct_releaseFfiHandle(calculationResult);
  }
  return 0;
}
int _CalculatorListener_onCalculationResultArray_static(int _token, Pointer<Void> calculationResult) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResultArray(foobar_ListOf_Double_fromFfi(calculationResult));
  } finally {
    foobar_ListOf_Double_releaseFfiHandle(calculationResult);
  }
  return 0;
}
int _CalculatorListener_onCalculationResultMap_static(int _token, Pointer<Void> calculationResults) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResultMap(foobar_MapOf_String_to_Double_fromFfi(calculationResults));
  } finally {
    foobar_MapOf_String_to_Double_releaseFfiHandle(calculationResults);
  }
  return 0;
}
int _CalculatorListener_onCalculationResultInstance_static(int _token, Pointer<Void> calculationResult) {
  try {
    (__lib.instanceCache[_token] as CalculatorListener).onCalculationResultInstance(smoke_CalculationResult_fromFfi(calculationResult));
  } finally {
    smoke_CalculationResult_releaseFfiHandle(calculationResult);
  }
  return 0;
}
Pointer<Void> smoke_CalculatorListener_toFfi(CalculatorListener value) {
  if (value is __lib.NativeBase) return _smokeCalculatorlistenerCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeCalculatorlistenerCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Double)>(_CalculatorListener_onCalculationResult_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Double)>(_CalculatorListener_onCalculationResultConst_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_CalculatorListener_onCalculationResultStruct_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_CalculatorListener_onCalculationResultArray_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_CalculatorListener_onCalculationResultMap_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_CalculatorListener_onCalculationResultInstance_static, __lib.unknownError)
  );
  return result;
}
CalculatorListener smoke_CalculatorListener_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as CalculatorListener;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeCalculatorlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeCalculatorlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : CalculatorListener$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_CalculatorListener_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeCalculatorlistenerReleaseHandle(handle);
Pointer<Void> smoke_CalculatorListener_toFfi_nullable(CalculatorListener value) =>
  value != null ? smoke_CalculatorListener_toFfi(value) : Pointer<Void>.fromAddress(0);
CalculatorListener smoke_CalculatorListener_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_CalculatorListener_fromFfi(handle) : null;
void smoke_CalculatorListener_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeCalculatorlistenerReleaseHandle(handle);
// End of CalculatorListener "private" section.
