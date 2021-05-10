import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/calculation_result.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ListenersWithReturnValues {
  ListenersWithReturnValues();
  factory ListenersWithReturnValues.fromLambdas({
    @required double Function() lambda_fetchDataDouble,
    @required String Function() lambda_fetchDataString,
    @required ListenersWithReturnValues_ResultStruct Function() lambda_fetchDataStruct,
    @required ListenersWithReturnValues_ResultEnum Function() lambda_fetchDataEnum,
    @required List<double> Function() lambda_fetchDataArray,
    @required Map<String, double> Function() lambda_fetchDataMap,
    @required CalculationResult Function() lambda_fetchDataInstance,
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
int smoke_ListenersWithReturnValues_ResultEnum_toFfi(ListenersWithReturnValues_ResultEnum value) {
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
ListenersWithReturnValues_ResultEnum smoke_ListenersWithReturnValues_ResultEnum_fromFfi(int handle) {
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
void smoke_ListenersWithReturnValues_ResultEnum_releaseFfiHandle(int handle) {}
final _smoke_ListenersWithReturnValues_ResultEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ListenersWithReturnValues_ResultEnum_create_handle_nullable'));
final _smoke_ListenersWithReturnValues_ResultEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultEnum_release_handle_nullable'));
final _smoke_ListenersWithReturnValues_ResultEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultEnum_get_value_nullable'));
Pointer<Void> smoke_ListenersWithReturnValues_ResultEnum_toFfi_nullable(ListenersWithReturnValues_ResultEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ListenersWithReturnValues_ResultEnum_toFfi(value);
  final result = _smoke_ListenersWithReturnValues_ResultEnumCreateHandleNullable(_handle);
  smoke_ListenersWithReturnValues_ResultEnum_releaseFfiHandle(_handle);
  return result;
}
ListenersWithReturnValues_ResultEnum smoke_ListenersWithReturnValues_ResultEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ListenersWithReturnValues_ResultEnumGetValueNullable(handle);
  final result = smoke_ListenersWithReturnValues_ResultEnum_fromFfi(_handle);
  smoke_ListenersWithReturnValues_ResultEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ListenersWithReturnValues_ResultEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ListenersWithReturnValues_ResultEnumReleaseHandleNullable(handle);
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
Pointer<Void> smoke_ListenersWithReturnValues_ResultStruct_toFfi(ListenersWithReturnValues_ResultStruct value) {
  final _resultHandle = (value.result);
  final _result = _smokeListenerswithreturnvaluesResultstructCreateHandle(_resultHandle);
  (_resultHandle);
  return _result;
}
ListenersWithReturnValues_ResultStruct smoke_ListenersWithReturnValues_ResultStruct_fromFfi(Pointer<Void> handle) {
  final _resultHandle = _smokeListenerswithreturnvaluesResultstructGetFieldresult(handle);
  try {
    return ListenersWithReturnValues_ResultStruct(
      (_resultHandle)
    );
  } finally {
    (_resultHandle);
  }
}
void smoke_ListenersWithReturnValues_ResultStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeListenerswithreturnvaluesResultstructReleaseHandle(handle);
// Nullable ListenersWithReturnValues_ResultStruct
final _smoke_ListenersWithReturnValues_ResultStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_create_handle_nullable'));
final _smoke_ListenersWithReturnValues_ResultStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_release_handle_nullable'));
final _smoke_ListenersWithReturnValues_ResultStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_get_value_nullable'));
Pointer<Void> smoke_ListenersWithReturnValues_ResultStruct_toFfi_nullable(ListenersWithReturnValues_ResultStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ListenersWithReturnValues_ResultStruct_toFfi(value);
  final result = _smoke_ListenersWithReturnValues_ResultStructCreateHandleNullable(_handle);
  smoke_ListenersWithReturnValues_ResultStruct_releaseFfiHandle(_handle);
  return result;
}
ListenersWithReturnValues_ResultStruct smoke_ListenersWithReturnValues_ResultStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ListenersWithReturnValues_ResultStructGetValueNullable(handle);
  final result = smoke_ListenersWithReturnValues_ResultStruct_fromFfi(_handle);
  smoke_ListenersWithReturnValues_ResultStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_ListenersWithReturnValues_ResultStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ListenersWithReturnValues_ResultStructReleaseHandleNullable(handle);
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
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeListenerswithreturnvaluesReleaseHandle(handle);
    handle = null;
  }
  @override
  double fetchDataDouble() {
    final _fetchDataDoubleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataDouble'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataDoubleFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  String fetchDataString() {
    final _fetchDataStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataString'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataStringFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  ListenersWithReturnValues_ResultStruct fetchDataStruct() {
    final _fetchDataStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataStruct'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataStructFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_ListenersWithReturnValues_ResultStruct_fromFfi(__resultHandle);
    } finally {
      smoke_ListenersWithReturnValues_ResultStruct_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  ListenersWithReturnValues_ResultEnum fetchDataEnum() {
    final _fetchDataEnumFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataEnum'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataEnumFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_ListenersWithReturnValues_ResultEnum_fromFfi(__resultHandle);
    } finally {
      smoke_ListenersWithReturnValues_ResultEnum_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  List<double> fetchDataArray() {
    final _fetchDataArrayFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataArray'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataArrayFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_ListOf_Double_fromFfi(__resultHandle);
    } finally {
      foobar_ListOf_Double_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  Map<String, double> fetchDataMap() {
    final _fetchDataMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataMap'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataMapFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_MapOf_String_to_Double_fromFfi(__resultHandle);
    } finally {
      foobar_MapOf_String_to_Double_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  CalculationResult fetchDataInstance() {
    final _fetchDataInstanceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataInstance'));
    final _handle = this.handle;
    final __resultHandle = _fetchDataInstanceFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_CalculationResult_fromFfi(__resultHandle);
    } finally {
      smoke_CalculationResult_releaseFfiHandle(__resultHandle);
    }
  }
}
int _ListenersWithReturnValues_fetchDataDouble_static(int _token, Pointer<Double> _result) {
  double _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataDouble();
    _result.value = (_resultObject);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataString_static(int _token, Pointer<Pointer<Void>> _result) {
  String _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataString();
    _result.value = String_toFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataStruct_static(int _token, Pointer<Pointer<Void>> _result) {
  ListenersWithReturnValues_ResultStruct _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataStruct();
    _result.value = smoke_ListenersWithReturnValues_ResultStruct_toFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataEnum_static(int _token, Pointer<Uint32> _result) {
  ListenersWithReturnValues_ResultEnum _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataEnum();
    _result.value = smoke_ListenersWithReturnValues_ResultEnum_toFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataArray_static(int _token, Pointer<Pointer<Void>> _result) {
  List<double> _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataArray();
    _result.value = foobar_ListOf_Double_toFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataMap_static(int _token, Pointer<Pointer<Void>> _result) {
  Map<String, double> _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataMap();
    _result.value = foobar_MapOf_String_to_Double_toFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataInstance_static(int _token, Pointer<Pointer<Void>> _result) {
  CalculationResult _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataInstance();
    _result.value = smoke_CalculationResult_toFfi(_resultObject);
  } finally {
    if (_resultObject != null) _resultObject.release();
  }
  return 0;
}
Pointer<Void> smoke_ListenersWithReturnValues_toFfi(ListenersWithReturnValues value) {
  if (value is __lib.NativeBase) return _smokeListenerswithreturnvaluesCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeListenerswithreturnvaluesCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Double>)>(_ListenersWithReturnValues_fetchDataDouble_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ListenersWithReturnValues_fetchDataString_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ListenersWithReturnValues_fetchDataStruct_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint32>)>(_ListenersWithReturnValues_fetchDataEnum_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ListenersWithReturnValues_fetchDataArray_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ListenersWithReturnValues_fetchDataMap_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ListenersWithReturnValues_fetchDataInstance_static, __lib.unknownError)
  );
  return result;
}
ListenersWithReturnValues smoke_ListenersWithReturnValues_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ListenersWithReturnValues;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeListenerswithreturnvaluesGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeListenerswithreturnvaluesCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ListenersWithReturnValues$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ListenersWithReturnValues_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeListenerswithreturnvaluesReleaseHandle(handle);
Pointer<Void> smoke_ListenersWithReturnValues_toFfi_nullable(ListenersWithReturnValues value) =>
  value != null ? smoke_ListenersWithReturnValues_toFfi(value) : Pointer<Void>.fromAddress(0);
ListenersWithReturnValues smoke_ListenersWithReturnValues_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ListenersWithReturnValues_fromFfi(handle) : null;
void smoke_ListenersWithReturnValues_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeListenerswithreturnvaluesReleaseHandle(handle);
// End of ListenersWithReturnValues "private" section.
