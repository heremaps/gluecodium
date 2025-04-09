

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/calculation_result.dart';

abstract class ListenersWithReturnValues implements Finalizable {

  factory ListenersWithReturnValues(
    double Function() fetchDataDoubleLambda,
    String Function() fetchDataStringLambda,
    ListenersWithReturnValues_ResultStruct Function() fetchDataStructLambda,
    ListenersWithReturnValues_ResultEnum Function() fetchDataEnumLambda,
    List<double> Function() fetchDataArrayLambda,
    Map<String, double> Function() fetchDataMapLambda,
    CalculationResult Function() fetchDataInstanceLambda,

  ) => ListenersWithReturnValues$Lambdas(
    fetchDataDoubleLambda,
    fetchDataStringLambda,
    fetchDataStructLambda,
    fetchDataEnumLambda,
    fetchDataArrayLambda,
    fetchDataMapLambda,
    fetchDataInstanceLambda,

  );


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
  case ListenersWithReturnValues_ResultEnum.result:
    return 1;
  }
}

ListenersWithReturnValues_ResultEnum smokeListenerswithreturnvaluesResultenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ListenersWithReturnValues_ResultEnum.none;
  case 1:
    return ListenersWithReturnValues_ResultEnum.result;
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

final _smokeListenerswithreturnvaluesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ListenersWithReturnValues_register_finalizer'));
final _smokeListenerswithreturnvaluesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_copy_handle'));
final _smokeListenerswithreturnvaluesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_release_handle'));
final _smokeListenerswithreturnvaluesCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ListenersWithReturnValues_create_proxy'));
final _smokeListenerswithreturnvaluesGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenersWithReturnValues_get_type_id'));








class ListenersWithReturnValues$Lambdas implements ListenersWithReturnValues {
  double Function() fetchDataDoubleLambda;
  String Function() fetchDataStringLambda;
  ListenersWithReturnValues_ResultStruct Function() fetchDataStructLambda;
  ListenersWithReturnValues_ResultEnum Function() fetchDataEnumLambda;
  List<double> Function() fetchDataArrayLambda;
  Map<String, double> Function() fetchDataMapLambda;
  CalculationResult Function() fetchDataInstanceLambda;

  ListenersWithReturnValues$Lambdas(
    this.fetchDataDoubleLambda,
    this.fetchDataStringLambda,
    this.fetchDataStructLambda,
    this.fetchDataEnumLambda,
    this.fetchDataArrayLambda,
    this.fetchDataMapLambda,
    this.fetchDataInstanceLambda,

  );

  @override
  double fetchDataDouble() =>
    fetchDataDoubleLambda();
  @override
  String fetchDataString() =>
    fetchDataStringLambda();
  @override
  ListenersWithReturnValues_ResultStruct fetchDataStruct() =>
    fetchDataStructLambda();
  @override
  ListenersWithReturnValues_ResultEnum fetchDataEnum() =>
    fetchDataEnumLambda();
  @override
  List<double> fetchDataArray() =>
    fetchDataArrayLambda();
  @override
  Map<String, double> fetchDataMap() =>
    fetchDataMapLambda();
  @override
  CalculationResult fetchDataInstance() =>
    fetchDataInstanceLambda();
}

class ListenersWithReturnValues$Impl extends __lib.NativeBase implements ListenersWithReturnValues {

  ListenersWithReturnValues$Impl(Pointer<Void> handle) : super(handle);

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

void _smokeListenerswithreturnvaluesfetchDataDoubleStatic(ListenersWithReturnValues _obj, Pointer<Double> _result) {
  double? _resultObject;
  try {
    _resultObject = _obj.fetchDataDouble();
    _result.value = (_resultObject);
  } finally {
  }
}
void _smokeListenerswithreturnvaluesfetchDataStringStatic(ListenersWithReturnValues _obj, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = _obj.fetchDataString();
    _result.value = stringToFfi(_resultObject);
  } finally {
  }
}
void _smokeListenerswithreturnvaluesfetchDataStructStatic(ListenersWithReturnValues _obj, Pointer<Pointer<Void>> _result) {
  ListenersWithReturnValues_ResultStruct? _resultObject;
  try {
    _resultObject = _obj.fetchDataStruct();
    _result.value = smokeListenerswithreturnvaluesResultstructToFfi(_resultObject);
  } finally {
  }
}
void _smokeListenerswithreturnvaluesfetchDataEnumStatic(ListenersWithReturnValues _obj, Pointer<Uint32> _result) {
  ListenersWithReturnValues_ResultEnum? _resultObject;
  try {
    _resultObject = _obj.fetchDataEnum();
    _result.value = smokeListenerswithreturnvaluesResultenumToFfi(_resultObject);
  } finally {
  }
}
void _smokeListenerswithreturnvaluesfetchDataArrayStatic(ListenersWithReturnValues _obj, Pointer<Pointer<Void>> _result) {
  List<double>? _resultObject;
  try {
    _resultObject = _obj.fetchDataArray();
    _result.value = foobarListofDoubleToFfi(_resultObject);
  } finally {
  }
}
void _smokeListenerswithreturnvaluesfetchDataMapStatic(ListenersWithReturnValues _obj, Pointer<Pointer<Void>> _result) {
  Map<String, double>? _resultObject;
  try {
    _resultObject = _obj.fetchDataMap();
    _result.value = foobarMapofStringToDoubleToFfi(_resultObject);
  } finally {
  }
}
void _smokeListenerswithreturnvaluesfetchDataInstanceStatic(ListenersWithReturnValues _obj, Pointer<Pointer<Void>> _result) {
  CalculationResult? _resultObject;
  try {
    _resultObject = _obj.fetchDataInstance();
    _result.value = smokeCalculationresultToFfi(_resultObject);
  } finally {
  }
}


Pointer<Void> smokeListenerswithreturnvaluesToFfi(ListenersWithReturnValues value) {
  if (value is __lib.NativeBase) return _smokeListenerswithreturnvaluesCopyHandle((value as __lib.NativeBase).handle);

  void __fetchDataDoubleCaller(Pointer<Double> _result) { _smokeListenerswithreturnvaluesfetchDataDoubleStatic(value, _result); }
  final __fetchDataDoubleCallback = NativeCallable<Void Function(Pointer<Double>)>.isolateLocal(__fetchDataDoubleCaller);
  __fetchDataDoubleCallback.keepIsolateAlive = false;

  void __fetchDataStringCaller(Pointer<Pointer<Void>> _result) { _smokeListenerswithreturnvaluesfetchDataStringStatic(value, _result); }
  final __fetchDataStringCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__fetchDataStringCaller);
  __fetchDataStringCallback.keepIsolateAlive = false;

  void __fetchDataStructCaller(Pointer<Pointer<Void>> _result) { _smokeListenerswithreturnvaluesfetchDataStructStatic(value, _result); }
  final __fetchDataStructCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__fetchDataStructCaller);
  __fetchDataStructCallback.keepIsolateAlive = false;

  void __fetchDataEnumCaller(Pointer<Uint32> _result) { _smokeListenerswithreturnvaluesfetchDataEnumStatic(value, _result); }
  final __fetchDataEnumCallback = NativeCallable<Void Function(Pointer<Uint32>)>.isolateLocal(__fetchDataEnumCaller);
  __fetchDataEnumCallback.keepIsolateAlive = false;

  void __fetchDataArrayCaller(Pointer<Pointer<Void>> _result) { _smokeListenerswithreturnvaluesfetchDataArrayStatic(value, _result); }
  final __fetchDataArrayCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__fetchDataArrayCaller);
  __fetchDataArrayCallback.keepIsolateAlive = false;

  void __fetchDataMapCaller(Pointer<Pointer<Void>> _result) { _smokeListenerswithreturnvaluesfetchDataMapStatic(value, _result); }
  final __fetchDataMapCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__fetchDataMapCaller);
  __fetchDataMapCallback.keepIsolateAlive = false;

  void __fetchDataInstanceCaller(Pointer<Pointer<Void>> _result) { _smokeListenerswithreturnvaluesfetchDataInstanceStatic(value, _result); }
  final __fetchDataInstanceCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__fetchDataInstanceCaller);
  __fetchDataInstanceCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __fetchDataDoubleCallback.close();
    __fetchDataStringCallback.close();
    __fetchDataStructCallback.close();
    __fetchDataEnumCallback.close();
    __fetchDataArrayCallback.close();
    __fetchDataMapCallback.close();
    __fetchDataInstanceCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeListenerswithreturnvaluesCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    __closeAllCallback.nativeFunction,
    __fetchDataDoubleCallback.nativeFunction,
    __fetchDataStringCallback.nativeFunction,
    __fetchDataStructCallback.nativeFunction,
    __fetchDataEnumCallback.nativeFunction,
    __fetchDataArrayCallback.nativeFunction,
    __fetchDataMapCallback.nativeFunction,
    __fetchDataInstanceCallback.nativeFunction
  );

  return result;
}

ListenersWithReturnValues smokeListenerswithreturnvaluesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ListenersWithReturnValues) return instance;

  final _typeIdHandle = _smokeListenerswithreturnvaluesGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeListenerswithreturnvaluesCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ListenersWithReturnValues$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeListenerswithreturnvaluesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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


