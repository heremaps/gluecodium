import 'dart:typed_data';
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/calculation_result.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ListenerWithProperties {
  ListenerWithProperties();
  factory ListenerWithProperties.fromLambdas({
    required String Function() lambda_message_get,
    required void Function(String) lambda_message_set,
    required CalculationResult Function() lambda_packedMessage_get,
    required void Function(CalculationResult) lambda_packedMessage_set,
    required ListenerWithProperties_ResultStruct Function() lambda_structuredMessage_get,
    required void Function(ListenerWithProperties_ResultStruct) lambda_structuredMessage_set,
    required ListenerWithProperties_ResultEnum Function() lambda_enumeratedMessage_get,
    required void Function(ListenerWithProperties_ResultEnum) lambda_enumeratedMessage_set,
    required List<String> Function() lambda_arrayedMessage_get,
    required void Function(List<String>) lambda_arrayedMessage_set,
    required Map<String, double> Function() lambda_mappedMessage_get,
    required void Function(Map<String, double>) lambda_mappedMessage_set,
    required Uint8List Function() lambda_bufferedMessage_get,
    required void Function(Uint8List) lambda_bufferedMessage_set
  }) => ListenerWithProperties$Lambdas(
    lambda_message_get,
    lambda_message_set,
    lambda_packedMessage_get,
    lambda_packedMessage_set,
    lambda_structuredMessage_get,
    lambda_structuredMessage_set,
    lambda_enumeratedMessage_get,
    lambda_enumeratedMessage_set,
    lambda_arrayedMessage_get,
    lambda_arrayedMessage_set,
    lambda_mappedMessage_get,
    lambda_mappedMessage_set,
    lambda_bufferedMessage_get,
    lambda_bufferedMessage_set
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  String get message;
  set message(String value);
  CalculationResult get packedMessage;
  set packedMessage(CalculationResult value);
  ListenerWithProperties_ResultStruct get structuredMessage;
  set structuredMessage(ListenerWithProperties_ResultStruct value);
  ListenerWithProperties_ResultEnum get enumeratedMessage;
  set enumeratedMessage(ListenerWithProperties_ResultEnum value);
  List<String> get arrayedMessage;
  set arrayedMessage(List<String> value);
  Map<String, double> get mappedMessage;
  set mappedMessage(Map<String, double> value);
  Uint8List get bufferedMessage;
  set bufferedMessage(Uint8List value);
}
enum ListenerWithProperties_ResultEnum {
    none,
    result
}
// ListenerWithProperties_ResultEnum "private" section, not exported.
int smokeListenerwithpropertiesResultenumToFfi(ListenerWithProperties_ResultEnum value) {
  switch (value) {
  case ListenerWithProperties_ResultEnum.none:
    return 0;
  break;
  case ListenerWithProperties_ResultEnum.result:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for ListenerWithProperties_ResultEnum enum.");
  }
}
ListenerWithProperties_ResultEnum smokeListenerwithpropertiesResultenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ListenerWithProperties_ResultEnum.none;
  break;
  case 1:
    return ListenerWithProperties_ResultEnum.result;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ListenerWithProperties_ResultEnum enum.");
  }
}
void smokeListenerwithpropertiesResultenumReleaseFfiHandle(int handle) {}
final _smokeListenerwithpropertiesResultenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ListenerWithProperties_ResultEnum_create_handle_nullable'));
final _smokeListenerwithpropertiesResultenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_ResultEnum_release_handle_nullable'));
final _smokeListenerwithpropertiesResultenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_ResultEnum_get_value_nullable'));
Pointer<Void> smokeListenerwithpropertiesResultenumToFfiNullable(ListenerWithProperties_ResultEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeListenerwithpropertiesResultenumToFfi(value);
  final result = _smokeListenerwithpropertiesResultenumCreateHandleNullable(_handle);
  smokeListenerwithpropertiesResultenumReleaseFfiHandle(_handle);
  return result;
}
ListenerWithProperties_ResultEnum? smokeListenerwithpropertiesResultenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeListenerwithpropertiesResultenumGetValueNullable(handle);
  final result = smokeListenerwithpropertiesResultenumFromFfi(_handle);
  smokeListenerwithpropertiesResultenumReleaseFfiHandle(_handle);
  return result;
}
void smokeListenerwithpropertiesResultenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeListenerwithpropertiesResultenumReleaseHandleNullable(handle);
// End of ListenerWithProperties_ResultEnum "private" section.
class ListenerWithProperties_ResultStruct {
  double result;
  ListenerWithProperties_ResultStruct(this.result);
}
// ListenerWithProperties_ResultStruct "private" section, not exported.
final _smokeListenerwithpropertiesResultstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_smoke_ListenerWithProperties_ResultStruct_create_handle'));
final _smokeListenerwithpropertiesResultstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_ResultStruct_release_handle'));
final _smokeListenerwithpropertiesResultstructGetFieldresult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_ResultStruct_get_field_result'));
Pointer<Void> smokeListenerwithpropertiesResultstructToFfi(ListenerWithProperties_ResultStruct value) {
  final _resultHandle = (value.result);
  final _result = _smokeListenerwithpropertiesResultstructCreateHandle(_resultHandle);
  (_resultHandle);
  return _result;
}
ListenerWithProperties_ResultStruct smokeListenerwithpropertiesResultstructFromFfi(Pointer<Void> handle) {
  final _resultHandle = _smokeListenerwithpropertiesResultstructGetFieldresult(handle);
  try {
    return ListenerWithProperties_ResultStruct(
      (_resultHandle)
    );
  } finally {
    (_resultHandle);
  }
}
void smokeListenerwithpropertiesResultstructReleaseFfiHandle(Pointer<Void> handle) => _smokeListenerwithpropertiesResultstructReleaseHandle(handle);
// Nullable ListenerWithProperties_ResultStruct
final _smokeListenerwithpropertiesResultstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_ResultStruct_create_handle_nullable'));
final _smokeListenerwithpropertiesResultstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_ResultStruct_release_handle_nullable'));
final _smokeListenerwithpropertiesResultstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_ResultStruct_get_value_nullable'));
Pointer<Void> smokeListenerwithpropertiesResultstructToFfiNullable(ListenerWithProperties_ResultStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeListenerwithpropertiesResultstructToFfi(value);
  final result = _smokeListenerwithpropertiesResultstructCreateHandleNullable(_handle);
  smokeListenerwithpropertiesResultstructReleaseFfiHandle(_handle);
  return result;
}
ListenerWithProperties_ResultStruct? smokeListenerwithpropertiesResultstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeListenerwithpropertiesResultstructGetValueNullable(handle);
  final result = smokeListenerwithpropertiesResultstructFromFfi(_handle);
  smokeListenerwithpropertiesResultstructReleaseFfiHandle(_handle);
  return result;
}
void smokeListenerwithpropertiesResultstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeListenerwithpropertiesResultstructReleaseHandleNullable(handle);
// End of ListenerWithProperties_ResultStruct "private" section.
// ListenerWithProperties "private" section, not exported.
final _smokeListenerwithpropertiesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_copy_handle'));
final _smokeListenerwithpropertiesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_release_handle'));
final _smokeListenerwithpropertiesCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ListenerWithProperties_create_proxy'));
final _smokeListenerwithpropertiesGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_get_type_id'));
class ListenerWithProperties$Lambdas implements ListenerWithProperties {
  String Function() lambda_message_get;
  void Function(String) lambda_message_set;
  CalculationResult Function() lambda_packedMessage_get;
  void Function(CalculationResult) lambda_packedMessage_set;
  ListenerWithProperties_ResultStruct Function() lambda_structuredMessage_get;
  void Function(ListenerWithProperties_ResultStruct) lambda_structuredMessage_set;
  ListenerWithProperties_ResultEnum Function() lambda_enumeratedMessage_get;
  void Function(ListenerWithProperties_ResultEnum) lambda_enumeratedMessage_set;
  List<String> Function() lambda_arrayedMessage_get;
  void Function(List<String>) lambda_arrayedMessage_set;
  Map<String, double> Function() lambda_mappedMessage_get;
  void Function(Map<String, double>) lambda_mappedMessage_set;
  Uint8List Function() lambda_bufferedMessage_get;
  void Function(Uint8List) lambda_bufferedMessage_set;
  ListenerWithProperties$Lambdas(
    this.lambda_message_get,
    this.lambda_message_set,
    this.lambda_packedMessage_get,
    this.lambda_packedMessage_set,
    this.lambda_structuredMessage_get,
    this.lambda_structuredMessage_set,
    this.lambda_enumeratedMessage_get,
    this.lambda_enumeratedMessage_set,
    this.lambda_arrayedMessage_get,
    this.lambda_arrayedMessage_set,
    this.lambda_mappedMessage_get,
    this.lambda_mappedMessage_set,
    this.lambda_bufferedMessage_get,
    this.lambda_bufferedMessage_set
  );
  @override
  void release() {}
  @override
  String get message => lambda_message_get();
  @override
  set message(String value) => lambda_message_set(value);
  @override
  CalculationResult get packedMessage => lambda_packedMessage_get();
  @override
  set packedMessage(CalculationResult value) => lambda_packedMessage_set(value);
  @override
  ListenerWithProperties_ResultStruct get structuredMessage => lambda_structuredMessage_get();
  @override
  set structuredMessage(ListenerWithProperties_ResultStruct value) => lambda_structuredMessage_set(value);
  @override
  ListenerWithProperties_ResultEnum get enumeratedMessage => lambda_enumeratedMessage_get();
  @override
  set enumeratedMessage(ListenerWithProperties_ResultEnum value) => lambda_enumeratedMessage_set(value);
  @override
  List<String> get arrayedMessage => lambda_arrayedMessage_get();
  @override
  set arrayedMessage(List<String> value) => lambda_arrayedMessage_set(value);
  @override
  Map<String, double> get mappedMessage => lambda_mappedMessage_get();
  @override
  set mappedMessage(Map<String, double> value) => lambda_mappedMessage_set(value);
  @override
  Uint8List get bufferedMessage => lambda_bufferedMessage_get();
  @override
  set bufferedMessage(Uint8List value) => lambda_bufferedMessage_set(value);
}
class ListenerWithProperties$Impl extends __lib.NativeBase implements ListenerWithProperties {
  ListenerWithProperties$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeListenerwithpropertiesReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  String get message {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenerWithProperties_message_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  set message(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ListenerWithProperties_message_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  CalculationResult get packedMessage {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenerWithProperties_packedMessage_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeCalculationresultFromFfi(__resultHandle);
    } finally {
      smokeCalculationresultReleaseFfiHandle(__resultHandle);
    }
  }
  set packedMessage(CalculationResult value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ListenerWithProperties_packedMessage_set__CalculationResult'));
    final _valueHandle = smokeCalculationresultToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokeCalculationresultReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  ListenerWithProperties_ResultStruct get structuredMessage {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenerWithProperties_structuredMessage_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeListenerwithpropertiesResultstructFromFfi(__resultHandle);
    } finally {
      smokeListenerwithpropertiesResultstructReleaseFfiHandle(__resultHandle);
    }
  }
  set structuredMessage(ListenerWithProperties_ResultStruct value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ListenerWithProperties_structuredMessage_set__ResultStruct'));
    final _valueHandle = smokeListenerwithpropertiesResultstructToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokeListenerwithpropertiesResultstructReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  ListenerWithProperties_ResultEnum get enumeratedMessage {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_ListenerWithProperties_enumeratedMessage_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeListenerwithpropertiesResultenumFromFfi(__resultHandle);
    } finally {
      smokeListenerwithpropertiesResultenumReleaseFfiHandle(__resultHandle);
    }
  }
  set enumeratedMessage(ListenerWithProperties_ResultEnum value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_smoke_ListenerWithProperties_enumeratedMessage_set__ResultEnum'));
    final _valueHandle = smokeListenerwithpropertiesResultenumToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokeListenerwithpropertiesResultenumReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  List<String> get arrayedMessage {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenerWithProperties_arrayedMessage_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarListofStringFromFfi(__resultHandle);
    } finally {
      foobarListofStringReleaseFfiHandle(__resultHandle);
    }
  }
  set arrayedMessage(List<String> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ListenerWithProperties_arrayedMessage_set__ListOf_1String'));
    final _valueHandle = foobarListofStringToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarListofStringReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  Map<String, double> get mappedMessage {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenerWithProperties_mappedMessage_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return foobarMapofStringToDoubleFromFfi(__resultHandle);
    } finally {
      foobarMapofStringToDoubleReleaseFfiHandle(__resultHandle);
    }
  }
  set mappedMessage(Map<String, double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ListenerWithProperties_mappedMessage_set__MapOf_1String_1to_1Double'));
    final _valueHandle = foobarMapofStringToDoubleToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarMapofStringToDoubleReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  Uint8List get bufferedMessage {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ListenerWithProperties_bufferedMessage_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return blobFromFfi(__resultHandle);
    } finally {
      blobReleaseFfiHandle(__resultHandle);
    }
  }
  set bufferedMessage(Uint8List value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ListenerWithProperties_bufferedMessage_set__Blob'));
    final _valueHandle = blobToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    blobReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _ListenerWithPropertiesmessageGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((__lib.instanceCache[_token] as ListenerWithProperties).message);
  return 0;
}
int _ListenerWithPropertiesmessageSetStatic(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as ListenerWithProperties).message =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
int _ListenerWithPropertiespackedMessageGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = smokeCalculationresultToFfi((__lib.instanceCache[_token] as ListenerWithProperties).packedMessage);
  return 0;
}
int _ListenerWithPropertiespackedMessageSetStatic(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as ListenerWithProperties).packedMessage =
      smokeCalculationresultFromFfi(_value);
  } finally {
    smokeCalculationresultReleaseFfiHandle(_value);
  }
  return 0;
}
int _ListenerWithPropertiesstructuredMessageGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = smokeListenerwithpropertiesResultstructToFfi((__lib.instanceCache[_token] as ListenerWithProperties).structuredMessage);
  return 0;
}
int _ListenerWithPropertiesstructuredMessageSetStatic(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as ListenerWithProperties).structuredMessage =
      smokeListenerwithpropertiesResultstructFromFfi(_value);
  } finally {
    smokeListenerwithpropertiesResultstructReleaseFfiHandle(_value);
  }
  return 0;
}
int _ListenerWithPropertiesenumeratedMessageGetStatic(int _token, Pointer<Uint32> _result) {
  _result.value = smokeListenerwithpropertiesResultenumToFfi((__lib.instanceCache[_token] as ListenerWithProperties).enumeratedMessage);
  return 0;
}
int _ListenerWithPropertiesenumeratedMessageSetStatic(int _token, int _value) {
  try {
    (__lib.instanceCache[_token] as ListenerWithProperties).enumeratedMessage =
      smokeListenerwithpropertiesResultenumFromFfi(_value);
  } finally {
    smokeListenerwithpropertiesResultenumReleaseFfiHandle(_value);
  }
  return 0;
}
int _ListenerWithPropertiesarrayedMessageGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = foobarListofStringToFfi((__lib.instanceCache[_token] as ListenerWithProperties).arrayedMessage);
  return 0;
}
int _ListenerWithPropertiesarrayedMessageSetStatic(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as ListenerWithProperties).arrayedMessage =
      foobarListofStringFromFfi(_value);
  } finally {
    foobarListofStringReleaseFfiHandle(_value);
  }
  return 0;
}
int _ListenerWithPropertiesmappedMessageGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = foobarMapofStringToDoubleToFfi((__lib.instanceCache[_token] as ListenerWithProperties).mappedMessage);
  return 0;
}
int _ListenerWithPropertiesmappedMessageSetStatic(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as ListenerWithProperties).mappedMessage =
      foobarMapofStringToDoubleFromFfi(_value);
  } finally {
    foobarMapofStringToDoubleReleaseFfiHandle(_value);
  }
  return 0;
}
int _ListenerWithPropertiesbufferedMessageGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = blobToFfi((__lib.instanceCache[_token] as ListenerWithProperties).bufferedMessage);
  return 0;
}
int _ListenerWithPropertiesbufferedMessageSetStatic(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as ListenerWithProperties).bufferedMessage =
      blobFromFfi(_value);
  } finally {
    blobReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeListenerwithpropertiesToFfi(ListenerWithProperties value) {
  if (value is __lib.NativeBase) return _smokeListenerwithpropertiesCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeListenerwithpropertiesCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ListenerWithPropertiesmessageGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_ListenerWithPropertiesmessageSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ListenerWithPropertiespackedMessageGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_ListenerWithPropertiespackedMessageSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ListenerWithPropertiesstructuredMessageGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_ListenerWithPropertiesstructuredMessageSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint32>)>(_ListenerWithPropertiesenumeratedMessageGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint32)>(_ListenerWithPropertiesenumeratedMessageSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ListenerWithPropertiesarrayedMessageGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_ListenerWithPropertiesarrayedMessageSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ListenerWithPropertiesmappedMessageGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_ListenerWithPropertiesmappedMessageSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ListenerWithPropertiesbufferedMessageGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_ListenerWithPropertiesbufferedMessageSetStatic, __lib.unknownError)
  );
  return result;
}
ListenerWithProperties smokeListenerwithpropertiesFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is ListenerWithProperties) return instance;
  final _typeIdHandle = _smokeListenerwithpropertiesGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeListenerwithpropertiesCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ListenerWithProperties$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeListenerwithpropertiesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeListenerwithpropertiesReleaseHandle(handle);
Pointer<Void> smokeListenerwithpropertiesToFfiNullable(ListenerWithProperties? value) =>
  value != null ? smokeListenerwithpropertiesToFfi(value) : Pointer<Void>.fromAddress(0);
ListenerWithProperties? smokeListenerwithpropertiesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeListenerwithpropertiesFromFfi(handle) : null;
void smokeListenerwithpropertiesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeListenerwithpropertiesReleaseHandle(handle);
// End of ListenerWithProperties "private" section.
