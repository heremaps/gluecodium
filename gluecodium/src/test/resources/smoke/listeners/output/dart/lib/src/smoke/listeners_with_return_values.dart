import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/calculation_result.dart';
import 'package:meta/meta.dart';
abstract class ListenersWithReturnValues {
  ListenersWithReturnValues();
  factory ListenersWithReturnValues.fromLambdas({
    required double Function() lambda_fetchDataDouble,
    required String Function() lambda_fetchDataString,
    required ListenersWithReturnValues_ResultStruct Function() lambda_fetchDataStruct,
    required ListenersWithReturnValues_ResultEnum Function() lambda_fetchDataEnum,
    required List<double> Function() lambda_fetchDataArray,
    required Map<String, double> Function() lambda_fetchDataMap,
    required CalculationResult Function() lambda_fetchDataInstance,
  }) => ListenersWithReturnValues$Lambdas(
    lambda_fetchDataDouble,
    lambda_fetchDataString,
    lambda_fetchDataStruct,
    lambda_fetchDataEnum,
    lambda_fetchDataArray,
    lambda_fetchDataMap,
    lambda_fetchDataInstance,
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  double fetchDataDouble();
  String fetchDataString();
  ListenersWithReturnValues_ResultStruct fetchDataStruct();
  ListenersWithReturnValues_ResultEnum fetchDataEnum();
  List<double> fetchDataArray();
  Map<String, double> fetchDataMap();
  CalculationResult fetchDataInstance();
}
enum ListenersWithReturnValues_ResultEnum {
    none,
    result
}
// ListenersWithReturnValues_ResultEnum "private" section, not exported.
int smokeListenerswithreturnvaluesResultenumToFfi(ListenersWithReturnValues_ResultEnum value) {
  switch (value) {
  case ListenersWithReturnValues_ResultEnum.none:
    return 0;
  break;
  case ListenersWithReturnValues_ResultEnum.result:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for ListenersWithReturnValues_ResultEnum enum.");
  }
}
ListenersWithReturnValues_ResultEnum smokeListenerswithreturnvaluesResultenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ListenersWithReturnValues_ResultEnum.none;
  break;
  case 1:
    return ListenersWithReturnValues_ResultEnum.result;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ListenersWithReturnValues_ResultEnum enum.");
  }
}
void smokeListenerswithreturnvaluesResultenumReleaseFfiHandle(int handle) {}
final _smokeListenerswithreturnvaluesResultenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ListenersWithReturnValues_ResultEnum_create_handle_nullable'));
final _smokeListenerswithreturnvaluesResultenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultEnum_release_handle_nullable'));
final _smokeListenerswithreturnvaluesResultenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultEnum_get_value_nullable'));
Pointer<Void> smokeListenerswithreturnvaluesResultenumToFfiNullable(ListenersWithReturnValues_ResultEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeListenerswithreturnvaluesResultenumToFfi(value);
  final result = _smokeListenerswithreturnvaluesResultenumCreateHandleNullable(_handle);
  smokeListenerswithreturnvaluesResultenumReleaseFfiHandle(_handle);
  return result;
}
ListenersWithReturnValues_ResultEnum? smokeListenerswithreturnvaluesResultenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeListenerswithreturnvaluesResultenumGetValueNullable(handle);
  final result = smokeListenerswithreturnvaluesResultenumFromFfi(_handle);
  smokeListenerswithreturnvaluesResultenumReleaseFfiHandle(_handle);
  return result;
}
void smokeListenerswithreturnvaluesResultenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeListenerswithreturnvaluesResultenumReleaseHandleNullable(handle);
// End of ListenersWithReturnValues_ResultEnum "private" section.
class ListenersWithReturnValues_ResultStruct {
  double result;
  ListenersWithReturnValues_ResultStruct(this.result);
}
// ListenersWithReturnValues_ResultStruct "private" section, not exported.
final _smokeListenerswithreturnvaluesResultstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_create_handle'));
final _smokeListenerswithreturnvaluesResultstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_release_handle'));
final _smokeListenerswithreturnvaluesResultstructGetFieldresult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_get_field_result'));
Pointer<Void> smokeListenerswithreturnvaluesResultstructToFfi(ListenersWithReturnValues_ResultStruct value) {
  final _resultHandle = (value.result);
  final _result = _smokeListenerswithreturnvaluesResultstructCreateHandle(_resultHandle);
  return _result;
}
ListenersWithReturnValues_ResultStruct smokeListenerswithreturnvaluesResultstructFromFfi(Pointer<Void> handle) {
  final _resultHandle = _smokeListenerswithreturnvaluesResultstructGetFieldresult(handle);
  try {
    return ListenersWithReturnValues_ResultStruct(
      (_resultHandle)
    );
  } finally {
  }
}
void smokeListenerswithreturnvaluesResultstructReleaseFfiHandle(Pointer<Void> handle) => _smokeListenerswithreturnvaluesResultstructReleaseHandle(handle);
// Nullable ListenersWithReturnValues_ResultStruct
final _smokeListenerswithreturnvaluesResultstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_create_handle_nullable'));
final _smokeListenerswithreturnvaluesResultstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_release_handle_nullable'));
final _smokeListenerswithreturnvaluesResultstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_get_value_nullable'));
Pointer<Void> smokeListenerswithreturnvaluesResultstructToFfiNullable(ListenersWithReturnValues_ResultStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeListenerswithreturnvaluesResultstructToFfi(value);
  final result = _smokeListenerswithreturnvaluesResultstructCreateHandleNullable(_handle);
  smokeListenerswithreturnvaluesResultstructReleaseFfiHandle(_handle);
  return result;
}
ListenersWithReturnValues_ResultStruct? smokeListenerswithreturnvaluesResultstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeListenerswithreturnvaluesResultstructGetValueNullable(handle);
  final result = smokeListenerswithreturnvaluesResultstructFromFfi(_handle);
  smokeListenerswithreturnvaluesResultstructReleaseFfiHandle(_handle);
  return result;
}
void smokeListenerswithreturnvaluesResultstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeListenerswithreturnvaluesResultstructReleaseHandleNullable(handle);
// End of ListenersWithReturnValues_ResultStruct "private" section.
// ListenersWithReturnValues "private" section, not exported.
final _smokeListenerswithreturnvaluesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_copy_handle'));
final _smokeListenerswithreturnvaluesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_release_handle'));
final _smokeListenerswithreturnvaluesCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ListenersWithReturnValues_create_proxy'));
final _smokeListenerswithreturnvaluesGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_get_type_id'));
class ListenersWithReturnValues$Lambdas implements ListenersWithReturnValues {
  double Function() lambda_fetchDataDouble;
  String Function() lambda_fetchDataString;
  ListenersWithReturnValues_ResultStruct Function() lambda_fetchDataStruct;
  ListenersWithReturnValues_ResultEnum Function() lambda_fetchDataEnum;
  List<double> Function() lambda_fetchDataArray;
  Map<String, double> Function() lambda_fetchDataMap;
  CalculationResult Function() lambda_fetchDataInstance;
  ListenersWithReturnValues$Lambdas(
    this.lambda_fetchDataDouble,
    this.lambda_fetchDataString,
    this.lambda_fetchDataStruct,
    this.lambda_fetchDataEnum,
    this.lambda_fetchDataArray,
    this.lambda_fetchDataMap,
    this.lambda_fetchDataInstance,
  );
  @override
  void release() {}
  @override
  double fetchDataDouble() =>
    lambda_fetchDataDouble();
  @override
  String fetchDataString() =>
    lambda_fetchDataString();
  @override
  ListenersWithReturnValues_ResultStruct fetchDataStruct() =>
    lambda_fetchDataStruct();
  @override
  ListenersWithReturnValues_ResultEnum fetchDataEnum() =>
    lambda_fetchDataEnum();
  @override
  List<double> fetchDataArray() =>
    lambda_fetchDataArray();
  @override
  Map<String, double> fetchDataMap() =>
    lambda_fetchDataMap();
  @override
  CalculationResult fetchDataInstance() =>
    lambda_fetchDataInstance();
}
class ListenersWithReturnValues$Impl extends __lib.NativeBase implements ListenersWithReturnValues {
  ListenersWithReturnValues$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeListenerswithreturnvaluesReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  double fetchDataDouble() {
    final _fetchDataDoubleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataDouble'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataDoubleFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  String fetchDataString() {
    final _fetchDataStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataString'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataStringFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  ListenersWithReturnValues_ResultStruct fetchDataStruct() {
    final _fetchDataStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataStruct'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataStructFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeListenerswithreturnvaluesResultstructFromFfi(__resultHandle);
    } finally {
      smokeListenerswithreturnvaluesResultstructReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  ListenersWithReturnValues_ResultEnum fetchDataEnum() {
    final _fetchDataEnumFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataEnum'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataEnumFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeListenerswithreturnvaluesResultenumFromFfi(__resultHandle);
    } finally {
      smokeListenerswithreturnvaluesResultenumReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  List<double> fetchDataArray() {
    final _fetchDataArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataArray'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataArrayFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarListofDoubleFromFfi(__resultHandle);
    } finally {
      foobarListofDoubleReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<String, double> fetchDataMap() {
    final _fetchDataMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataMap'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataMapFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarMapofStringToDoubleFromFfi(__resultHandle);
    } finally {
      foobarMapofStringToDoubleReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  CalculationResult fetchDataInstance() {
    final _fetchDataInstanceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataInstance'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataInstanceFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeCalculationresultFromFfi(__resultHandle);
    } finally {
      smokeCalculationresultReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeListenerswithreturnvaluesfetchDataDoubleStatic(int _token, Pointer<Double> _result) {
  double? _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataDouble();
    _result.value = (_resultObject);
  } finally {
  }
  return 0;
}
int _smokeListenerswithreturnvaluesfetchDataStringStatic(int _token, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataString();
    _result.value = stringToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _smokeListenerswithreturnvaluesfetchDataStructStatic(int _token, Pointer<Pointer<Void>> _result) {
  ListenersWithReturnValues_ResultStruct? _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataStruct();
    _result.value = smokeListenerswithreturnvaluesResultstructToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _smokeListenerswithreturnvaluesfetchDataEnumStatic(int _token, Pointer<Uint32> _result) {
  ListenersWithReturnValues_ResultEnum? _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataEnum();
    _result.value = smokeListenerswithreturnvaluesResultenumToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _smokeListenerswithreturnvaluesfetchDataArrayStatic(int _token, Pointer<Pointer<Void>> _result) {
  List<double>? _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataArray();
    _result.value = foobarListofDoubleToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _smokeListenerswithreturnvaluesfetchDataMapStatic(int _token, Pointer<Pointer<Void>> _result) {
  Map<String, double>? _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataMap();
    _result.value = foobarMapofStringToDoubleToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _smokeListenerswithreturnvaluesfetchDataInstanceStatic(int _token, Pointer<Pointer<Void>> _result) {
  CalculationResult? _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataInstance();
    _result.value = smokeCalculationresultToFfi(_resultObject);
  } finally {
    _resultObject?.release();
  }
  return 0;
}
Pointer<Void> smokeListenerswithreturnvaluesToFfi(ListenersWithReturnValues value) {
  if (value is __lib.NativeBase) return _smokeListenerswithreturnvaluesCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeListenerswithreturnvaluesCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Double>)>(_smokeListenerswithreturnvaluesfetchDataDoubleStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_smokeListenerswithreturnvaluesfetchDataStringStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_smokeListenerswithreturnvaluesfetchDataStructStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint32>)>(_smokeListenerswithreturnvaluesfetchDataEnumStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_smokeListenerswithreturnvaluesfetchDataArrayStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_smokeListenerswithreturnvaluesfetchDataMapStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_smokeListenerswithreturnvaluesfetchDataInstanceStatic, __lib.unknownError)
  );
  return result;
}
ListenersWithReturnValues smokeListenerswithreturnvaluesFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is ListenersWithReturnValues) return instance;
  final _typeIdHandle = _smokeListenerswithreturnvaluesGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeListenerswithreturnvaluesCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ListenersWithReturnValues$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeListenerswithreturnvaluesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeListenerswithreturnvaluesReleaseHandle(handle);
Pointer<Void> smokeListenerswithreturnvaluesToFfiNullable(ListenersWithReturnValues? value) =>
  value != null ? smokeListenerswithreturnvaluesToFfi(value) : Pointer<Void>.fromAddress(0);
ListenersWithReturnValues? smokeListenerswithreturnvaluesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeListenerswithreturnvaluesFromFfi(handle) : null;
void smokeListenerswithreturnvaluesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeListenerswithreturnvaluesReleaseHandle(handle);
// End of ListenersWithReturnValues "private" section.
