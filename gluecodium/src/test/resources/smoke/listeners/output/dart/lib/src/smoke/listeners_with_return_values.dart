import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/calculation_result.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ListenersWithReturnValues {
  ListenersWithReturnValues() {}
  factory ListenersWithReturnValues.fromLambdas({
    @required double Function() lambda_fetchDataDouble,
    @required String Function() lambda_fetchDataString,
    @required ListenersWithReturnValues_ResultStruct Function() lambda_fetchDataStruct,
    @required ListenersWithReturnValues_ResultEnum Function() lambda_fetchDataEnum,
    @required List<double> Function() lambda_fetchDataArray,
    @required Map<String, double> Function() lambda_fetchDataMap,
    @required CalculationResult Function() lambda_fetchDataInstance
  }) => ListenersWithReturnValues$Lambdas(
    lambda_fetchDataDouble,
    lambda_fetchDataString,
    lambda_fetchDataStruct,
    lambda_fetchDataEnum,
    lambda_fetchDataArray,
    lambda_fetchDataMap,
    lambda_fetchDataInstance
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
final _smoke_ListenersWithReturnValues_ResultEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ListenersWithReturnValues_ResultEnum_create_handle_nullable'));
final _smoke_ListenersWithReturnValues_ResultEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultEnum_release_handle_nullable'));
final _smoke_ListenersWithReturnValues_ResultEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultEnum_get_value_nullable'));
Pointer<Void> smoke_ListenersWithReturnValues_ResultEnum_toFfi_nullable(ListenersWithReturnValues_ResultEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ListenersWithReturnValues_ResultEnum_toFfi(value);
  final result = _smoke_ListenersWithReturnValues_ResultEnum_create_handle_nullable(_handle);
  smoke_ListenersWithReturnValues_ResultEnum_releaseFfiHandle(_handle);
  return result;
}
ListenersWithReturnValues_ResultEnum smoke_ListenersWithReturnValues_ResultEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ListenersWithReturnValues_ResultEnum_get_value_nullable(handle);
  final result = smoke_ListenersWithReturnValues_ResultEnum_fromFfi(_handle);
  smoke_ListenersWithReturnValues_ResultEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ListenersWithReturnValues_ResultEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ListenersWithReturnValues_ResultEnum_release_handle_nullable(handle);
// End of ListenersWithReturnValues_ResultEnum "private" section.
class ListenersWithReturnValues_ResultStruct {
  double result;
  ListenersWithReturnValues_ResultStruct(this.result);
}
// ListenersWithReturnValues_ResultStruct "private" section, not exported.
final _smoke_ListenersWithReturnValues_ResultStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_create_handle'));
final _smoke_ListenersWithReturnValues_ResultStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_release_handle'));
final _smoke_ListenersWithReturnValues_ResultStruct_get_field_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_get_field_result'));
Pointer<Void> smoke_ListenersWithReturnValues_ResultStruct_toFfi(ListenersWithReturnValues_ResultStruct value) {
  final _result_handle = (value.result);
  final _result = _smoke_ListenersWithReturnValues_ResultStruct_create_handle(_result_handle);
  (_result_handle);
  return _result;
}
ListenersWithReturnValues_ResultStruct smoke_ListenersWithReturnValues_ResultStruct_fromFfi(Pointer<Void> handle) {
  final _result_handle = _smoke_ListenersWithReturnValues_ResultStruct_get_field_result(handle);
  try {
    return ListenersWithReturnValues_ResultStruct(
      (_result_handle)
    );
  } finally {
    (_result_handle);
  }
}
void smoke_ListenersWithReturnValues_ResultStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_ListenersWithReturnValues_ResultStruct_release_handle(handle);
// Nullable ListenersWithReturnValues_ResultStruct
final _smoke_ListenersWithReturnValues_ResultStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_create_handle_nullable'));
final _smoke_ListenersWithReturnValues_ResultStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_release_handle_nullable'));
final _smoke_ListenersWithReturnValues_ResultStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_ResultStruct_get_value_nullable'));
Pointer<Void> smoke_ListenersWithReturnValues_ResultStruct_toFfi_nullable(ListenersWithReturnValues_ResultStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ListenersWithReturnValues_ResultStruct_toFfi(value);
  final result = _smoke_ListenersWithReturnValues_ResultStruct_create_handle_nullable(_handle);
  smoke_ListenersWithReturnValues_ResultStruct_releaseFfiHandle(_handle);
  return result;
}
ListenersWithReturnValues_ResultStruct smoke_ListenersWithReturnValues_ResultStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ListenersWithReturnValues_ResultStruct_get_value_nullable(handle);
  final result = smoke_ListenersWithReturnValues_ResultStruct_fromFfi(_handle);
  smoke_ListenersWithReturnValues_ResultStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_ListenersWithReturnValues_ResultStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ListenersWithReturnValues_ResultStruct_release_handle_nullable(handle);
// End of ListenersWithReturnValues_ResultStruct "private" section.
// ListenersWithReturnValues "private" section, not exported.
final _smoke_ListenersWithReturnValues_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_copy_handle'));
final _smoke_ListenersWithReturnValues_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_release_handle'));
final _smoke_ListenersWithReturnValues_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ListenersWithReturnValues_create_proxy'));
final _smoke_ListenersWithReturnValues_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
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
    this.lambda_fetchDataInstance
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
class ListenersWithReturnValues$Impl implements ListenersWithReturnValues {
  Pointer<Void> handle;
  ListenersWithReturnValues$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_ListenersWithReturnValues_release_handle(handle);
    handle = null;
  }
  @override
  double fetchDataDouble() {
    final _fetchDataDouble_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataDouble'));
    final _handle = this.handle;
    final __result_handle = _fetchDataDouble_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  String fetchDataString() {
    final _fetchDataString_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataString'));
    final _handle = this.handle;
    final __result_handle = _fetchDataString_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  @override
  ListenersWithReturnValues_ResultStruct fetchDataStruct() {
    final _fetchDataStruct_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataStruct'));
    final _handle = this.handle;
    final __result_handle = _fetchDataStruct_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_ListenersWithReturnValues_ResultStruct_fromFfi(__result_handle);
    } finally {
      smoke_ListenersWithReturnValues_ResultStruct_releaseFfiHandle(__result_handle);
    }
  }
  @override
  ListenersWithReturnValues_ResultEnum fetchDataEnum() {
    final _fetchDataEnum_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataEnum'));
    final _handle = this.handle;
    final __result_handle = _fetchDataEnum_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_ListenersWithReturnValues_ResultEnum_fromFfi(__result_handle);
    } finally {
      smoke_ListenersWithReturnValues_ResultEnum_releaseFfiHandle(__result_handle);
    }
  }
  @override
  List<double> fetchDataArray() {
    final _fetchDataArray_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataArray'));
    final _handle = this.handle;
    final __result_handle = _fetchDataArray_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_ListOf_Double_fromFfi(__result_handle);
    } finally {
      foobar_ListOf_Double_releaseFfiHandle(__result_handle);
    }
  }
  @override
  Map<String, double> fetchDataMap() {
    final _fetchDataMap_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataMap'));
    final _handle = this.handle;
    final __result_handle = _fetchDataMap_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobar_MapOf_String_to_Double_fromFfi(__result_handle);
    } finally {
      foobar_MapOf_String_to_Double_releaseFfiHandle(__result_handle);
    }
  }
  @override
  CalculationResult fetchDataInstance() {
    final _fetchDataInstance_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenersWithReturnValues_fetchDataInstance'));
    final _handle = this.handle;
    final __result_handle = _fetchDataInstance_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_CalculationResult_fromFfi(__result_handle);
    } finally {
      smoke_CalculationResult_releaseFfiHandle(__result_handle);
    }
  }
}
int _ListenersWithReturnValues_fetchDataDouble_static(int _token, Pointer<Double> _result) {
  double _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataDouble();
    _result.value = (_result_object);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataString_static(int _token, Pointer<Pointer<Void>> _result) {
  String _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataString();
    _result.value = String_toFfi(_result_object);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataStruct_static(int _token, Pointer<Pointer<Void>> _result) {
  ListenersWithReturnValues_ResultStruct _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataStruct();
    _result.value = smoke_ListenersWithReturnValues_ResultStruct_toFfi(_result_object);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataEnum_static(int _token, Pointer<Uint32> _result) {
  ListenersWithReturnValues_ResultEnum _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataEnum();
    _result.value = smoke_ListenersWithReturnValues_ResultEnum_toFfi(_result_object);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataArray_static(int _token, Pointer<Pointer<Void>> _result) {
  List<double> _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataArray();
    _result.value = foobar_ListOf_Double_toFfi(_result_object);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataMap_static(int _token, Pointer<Pointer<Void>> _result) {
  Map<String, double> _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataMap();
    _result.value = foobar_MapOf_String_to_Double_toFfi(_result_object);
  } finally {
  }
  return 0;
}
int _ListenersWithReturnValues_fetchDataInstance_static(int _token, Pointer<Pointer<Void>> _result) {
  CalculationResult _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as ListenersWithReturnValues).fetchDataInstance();
    _result.value = smoke_CalculationResult_toFfi(_result_object);
  } finally {
    if (_result_object != null) _result_object.release();
  }
  return 0;
}
Pointer<Void> smoke_ListenersWithReturnValues_toFfi(ListenersWithReturnValues value) {
  if (value is ListenersWithReturnValues$Impl) return _smoke_ListenersWithReturnValues_copy_handle(value.handle);
  final result = _smoke_ListenersWithReturnValues_create_proxy(
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
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as ListenersWithReturnValues;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_ListenersWithReturnValues_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_ListenersWithReturnValues_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : ListenersWithReturnValues$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ListenersWithReturnValues_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ListenersWithReturnValues_release_handle(handle);
Pointer<Void> smoke_ListenersWithReturnValues_toFfi_nullable(ListenersWithReturnValues value) =>
  value != null ? smoke_ListenersWithReturnValues_toFfi(value) : Pointer<Void>.fromAddress(0);
ListenersWithReturnValues smoke_ListenersWithReturnValues_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ListenersWithReturnValues_fromFfi(handle) : null;
void smoke_ListenersWithReturnValues_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ListenersWithReturnValues_release_handle(handle);
// End of ListenersWithReturnValues "private" section.
