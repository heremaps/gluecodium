

import 'dart:ffi';
import 'dart:typed_data';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/calculation_result.dart';

abstract class ListenerWithProperties implements Finalizable {

  factory ListenerWithProperties(
    String Function() messageGetLambda,
    void Function(String) messageSetLambda,
    CalculationResult Function() packedMessageGetLambda,
    void Function(CalculationResult) packedMessageSetLambda,
    ListenerWithProperties_ResultStruct Function() structuredMessageGetLambda,
    void Function(ListenerWithProperties_ResultStruct) structuredMessageSetLambda,
    ListenerWithProperties_ResultEnum Function() enumeratedMessageGetLambda,
    void Function(ListenerWithProperties_ResultEnum) enumeratedMessageSetLambda,
    List<String> Function() arrayedMessageGetLambda,
    void Function(List<String>) arrayedMessageSetLambda,
    Map<String, double> Function() mappedMessageGetLambda,
    void Function(Map<String, double>) mappedMessageSetLambda,
    Uint8List Function() bufferedMessageGetLambda,
    void Function(Uint8List) bufferedMessageSetLambda
  ) => ListenerWithProperties$Lambdas(
    messageGetLambda,
    messageSetLambda,
    packedMessageGetLambda,
    packedMessageSetLambda,
    structuredMessageGetLambda,
    structuredMessageSetLambda,
    enumeratedMessageGetLambda,
    enumeratedMessageSetLambda,
    arrayedMessageGetLambda,
    arrayedMessageSetLambda,
    mappedMessageGetLambda,
    mappedMessageSetLambda,
    bufferedMessageGetLambda,
    bufferedMessageSetLambda
  );

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
  case ListenerWithProperties_ResultEnum.result:
    return 1;
  }
}

ListenerWithProperties_ResultEnum smokeListenerwithpropertiesResultenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ListenerWithProperties_ResultEnum.none;
  case 1:
    return ListenerWithProperties_ResultEnum.result;
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
  
  return _result;
}

ListenerWithProperties_ResultStruct smokeListenerwithpropertiesResultstructFromFfi(Pointer<Void> handle) {
  final _resultHandle = _smokeListenerwithpropertiesResultstructGetFieldresult(handle);
  try {
    return ListenerWithProperties_ResultStruct(
      (_resultHandle)
    );
  } finally {
    
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

final _smokeListenerwithpropertiesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ListenerWithProperties_register_finalizer'));
final _smokeListenerwithpropertiesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_copy_handle'));
final _smokeListenerwithpropertiesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_release_handle'));
final _smokeListenerwithpropertiesCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ListenerWithProperties_create_proxy'));
final _smokeListenerwithpropertiesGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ListenerWithProperties_get_type_id'));

class ListenerWithProperties$Lambdas implements ListenerWithProperties {
  String Function() messageGetLambda;
  void Function(String) messageSetLambda;
  CalculationResult Function() packedMessageGetLambda;
  void Function(CalculationResult) packedMessageSetLambda;
  ListenerWithProperties_ResultStruct Function() structuredMessageGetLambda;
  void Function(ListenerWithProperties_ResultStruct) structuredMessageSetLambda;
  ListenerWithProperties_ResultEnum Function() enumeratedMessageGetLambda;
  void Function(ListenerWithProperties_ResultEnum) enumeratedMessageSetLambda;
  List<String> Function() arrayedMessageGetLambda;
  void Function(List<String>) arrayedMessageSetLambda;
  Map<String, double> Function() mappedMessageGetLambda;
  void Function(Map<String, double>) mappedMessageSetLambda;
  Uint8List Function() bufferedMessageGetLambda;
  void Function(Uint8List) bufferedMessageSetLambda;

  ListenerWithProperties$Lambdas(
    this.messageGetLambda,
    this.messageSetLambda,
    this.packedMessageGetLambda,
    this.packedMessageSetLambda,
    this.structuredMessageGetLambda,
    this.structuredMessageSetLambda,
    this.enumeratedMessageGetLambda,
    this.enumeratedMessageSetLambda,
    this.arrayedMessageGetLambda,
    this.arrayedMessageSetLambda,
    this.mappedMessageGetLambda,
    this.mappedMessageSetLambda,
    this.bufferedMessageGetLambda,
    this.bufferedMessageSetLambda
  );

  @override
  String get message => messageGetLambda();
  @override
  set message(String value) => messageSetLambda(value);
  @override
  CalculationResult get packedMessage => packedMessageGetLambda();
  @override
  set packedMessage(CalculationResult value) => packedMessageSetLambda(value);
  @override
  ListenerWithProperties_ResultStruct get structuredMessage => structuredMessageGetLambda();
  @override
  set structuredMessage(ListenerWithProperties_ResultStruct value) => structuredMessageSetLambda(value);
  @override
  ListenerWithProperties_ResultEnum get enumeratedMessage => enumeratedMessageGetLambda();
  @override
  set enumeratedMessage(ListenerWithProperties_ResultEnum value) => enumeratedMessageSetLambda(value);
  @override
  List<String> get arrayedMessage => arrayedMessageGetLambda();
  @override
  set arrayedMessage(List<String> value) => arrayedMessageSetLambda(value);
  @override
  Map<String, double> get mappedMessage => mappedMessageGetLambda();
  @override
  set mappedMessage(Map<String, double> value) => mappedMessageSetLambda(value);
  @override
  Uint8List get bufferedMessage => bufferedMessageGetLambda();
  @override
  set bufferedMessage(Uint8List value) => bufferedMessageSetLambda(value);
}

class ListenerWithProperties$Impl extends __lib.NativeBase implements ListenerWithProperties {

  ListenerWithProperties$Impl(Pointer<Void> handle) : super(handle);

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
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

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
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokeCalculationresultReleaseFfiHandle(_valueHandle);

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
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokeListenerwithpropertiesResultstructReleaseFfiHandle(_valueHandle);

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
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    smokeListenerwithpropertiesResultenumReleaseFfiHandle(_valueHandle);

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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ListenerWithProperties_arrayedMessage_set__ListOf_String'));
    final _valueHandle = foobarListofStringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarListofStringReleaseFfiHandle(_valueHandle);

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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ListenerWithProperties_mappedMessage_set__MapOf_String_to_Double'));
    final _valueHandle = foobarMapofStringToDoubleToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    foobarMapofStringToDoubleReleaseFfiHandle(_valueHandle);

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
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    blobReleaseFfiHandle(_valueHandle);

  }



}


void _smokeListenerwithpropertiesmessageGetStatic(ListenerWithProperties _obj, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi(_obj.message);
}

void _smokeListenerwithpropertiesmessageSetStatic(ListenerWithProperties _obj, Pointer<Void> _value) {
  try {
    _obj.message = stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
}
void _smokeListenerwithpropertiespackedMessageGetStatic(ListenerWithProperties _obj, Pointer<Pointer<Void>> _result) {
  _result.value = smokeCalculationresultToFfi(_obj.packedMessage);
}

void _smokeListenerwithpropertiespackedMessageSetStatic(ListenerWithProperties _obj, Pointer<Void> _value) {
  try {
    _obj.packedMessage = smokeCalculationresultFromFfi(_value);
  } finally {
    smokeCalculationresultReleaseFfiHandle(_value);
  }
}
void _smokeListenerwithpropertiesstructuredMessageGetStatic(ListenerWithProperties _obj, Pointer<Pointer<Void>> _result) {
  _result.value = smokeListenerwithpropertiesResultstructToFfi(_obj.structuredMessage);
}

void _smokeListenerwithpropertiesstructuredMessageSetStatic(ListenerWithProperties _obj, Pointer<Void> _value) {
  try {
    _obj.structuredMessage = smokeListenerwithpropertiesResultstructFromFfi(_value);
  } finally {
    smokeListenerwithpropertiesResultstructReleaseFfiHandle(_value);
  }
}
void _smokeListenerwithpropertiesenumeratedMessageGetStatic(ListenerWithProperties _obj, Pointer<Uint32> _result) {
  _result.value = smokeListenerwithpropertiesResultenumToFfi(_obj.enumeratedMessage);
}

void _smokeListenerwithpropertiesenumeratedMessageSetStatic(ListenerWithProperties _obj, int _value) {
  try {
    _obj.enumeratedMessage = smokeListenerwithpropertiesResultenumFromFfi(_value);
  } finally {
    smokeListenerwithpropertiesResultenumReleaseFfiHandle(_value);
  }
}
void _smokeListenerwithpropertiesarrayedMessageGetStatic(ListenerWithProperties _obj, Pointer<Pointer<Void>> _result) {
  _result.value = foobarListofStringToFfi(_obj.arrayedMessage);
}

void _smokeListenerwithpropertiesarrayedMessageSetStatic(ListenerWithProperties _obj, Pointer<Void> _value) {
  try {
    _obj.arrayedMessage = foobarListofStringFromFfi(_value);
  } finally {
    foobarListofStringReleaseFfiHandle(_value);
  }
}
void _smokeListenerwithpropertiesmappedMessageGetStatic(ListenerWithProperties _obj, Pointer<Pointer<Void>> _result) {
  _result.value = foobarMapofStringToDoubleToFfi(_obj.mappedMessage);
}

void _smokeListenerwithpropertiesmappedMessageSetStatic(ListenerWithProperties _obj, Pointer<Void> _value) {
  try {
    _obj.mappedMessage = foobarMapofStringToDoubleFromFfi(_value);
  } finally {
    foobarMapofStringToDoubleReleaseFfiHandle(_value);
  }
}
void _smokeListenerwithpropertiesbufferedMessageGetStatic(ListenerWithProperties _obj, Pointer<Pointer<Void>> _result) {
  _result.value = blobToFfi(_obj.bufferedMessage);
}

void _smokeListenerwithpropertiesbufferedMessageSetStatic(ListenerWithProperties _obj, Pointer<Void> _value) {
  try {
    _obj.bufferedMessage = blobFromFfi(_value);
  } finally {
    blobReleaseFfiHandle(_value);
  }
}

Pointer<Void> smokeListenerwithpropertiesToFfi(ListenerWithProperties value) {
  if (value is __lib.NativeBase) return _smokeListenerwithpropertiesCopyHandle((value as __lib.NativeBase).handle);

  void __smokeListenerwithpropertiesmessageGetCaller(Pointer<Pointer<Void>> _result) { _smokeListenerwithpropertiesmessageGetStatic(value, _result); }
  final __smokeListenerwithpropertiesmessageGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeListenerwithpropertiesmessageGetCaller);
  __smokeListenerwithpropertiesmessageGetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiesmessageSetCaller(Pointer<Void> _value) { _smokeListenerwithpropertiesmessageSetStatic(value, _value); }
  final __smokeListenerwithpropertiesmessageSetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeListenerwithpropertiesmessageSetCaller);
  __smokeListenerwithpropertiesmessageSetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiespackedMessageGetCaller(Pointer<Pointer<Void>> _result) { _smokeListenerwithpropertiespackedMessageGetStatic(value, _result); }
  final __smokeListenerwithpropertiespackedMessageGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeListenerwithpropertiespackedMessageGetCaller);
  __smokeListenerwithpropertiespackedMessageGetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiespackedMessageSetCaller(Pointer<Void> _value) { _smokeListenerwithpropertiespackedMessageSetStatic(value, _value); }
  final __smokeListenerwithpropertiespackedMessageSetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeListenerwithpropertiespackedMessageSetCaller);
  __smokeListenerwithpropertiespackedMessageSetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiesstructuredMessageGetCaller(Pointer<Pointer<Void>> _result) { _smokeListenerwithpropertiesstructuredMessageGetStatic(value, _result); }
  final __smokeListenerwithpropertiesstructuredMessageGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeListenerwithpropertiesstructuredMessageGetCaller);
  __smokeListenerwithpropertiesstructuredMessageGetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiesstructuredMessageSetCaller(Pointer<Void> _value) { _smokeListenerwithpropertiesstructuredMessageSetStatic(value, _value); }
  final __smokeListenerwithpropertiesstructuredMessageSetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeListenerwithpropertiesstructuredMessageSetCaller);
  __smokeListenerwithpropertiesstructuredMessageSetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiesenumeratedMessageGetCaller(Pointer<Uint32> _result) { _smokeListenerwithpropertiesenumeratedMessageGetStatic(value, _result); }
  final __smokeListenerwithpropertiesenumeratedMessageGetCallback = NativeCallable<Void Function(Pointer<Uint32>)>.isolateLocal(__smokeListenerwithpropertiesenumeratedMessageGetCaller);
  __smokeListenerwithpropertiesenumeratedMessageGetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiesenumeratedMessageSetCaller(int _value) { _smokeListenerwithpropertiesenumeratedMessageSetStatic(value, _value); }
  final __smokeListenerwithpropertiesenumeratedMessageSetCallback = NativeCallable<Void Function(Uint32)>.isolateLocal(__smokeListenerwithpropertiesenumeratedMessageSetCaller);
  __smokeListenerwithpropertiesenumeratedMessageSetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiesarrayedMessageGetCaller(Pointer<Pointer<Void>> _result) { _smokeListenerwithpropertiesarrayedMessageGetStatic(value, _result); }
  final __smokeListenerwithpropertiesarrayedMessageGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeListenerwithpropertiesarrayedMessageGetCaller);
  __smokeListenerwithpropertiesarrayedMessageGetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiesarrayedMessageSetCaller(Pointer<Void> _value) { _smokeListenerwithpropertiesarrayedMessageSetStatic(value, _value); }
  final __smokeListenerwithpropertiesarrayedMessageSetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeListenerwithpropertiesarrayedMessageSetCaller);
  __smokeListenerwithpropertiesarrayedMessageSetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiesmappedMessageGetCaller(Pointer<Pointer<Void>> _result) { _smokeListenerwithpropertiesmappedMessageGetStatic(value, _result); }
  final __smokeListenerwithpropertiesmappedMessageGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeListenerwithpropertiesmappedMessageGetCaller);
  __smokeListenerwithpropertiesmappedMessageGetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiesmappedMessageSetCaller(Pointer<Void> _value) { _smokeListenerwithpropertiesmappedMessageSetStatic(value, _value); }
  final __smokeListenerwithpropertiesmappedMessageSetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeListenerwithpropertiesmappedMessageSetCaller);
  __smokeListenerwithpropertiesmappedMessageSetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiesbufferedMessageGetCaller(Pointer<Pointer<Void>> _result) { _smokeListenerwithpropertiesbufferedMessageGetStatic(value, _result); }
  final __smokeListenerwithpropertiesbufferedMessageGetCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>)>.isolateLocal(__smokeListenerwithpropertiesbufferedMessageGetCaller);
  __smokeListenerwithpropertiesbufferedMessageGetCallback.keepIsolateAlive = false;

  void __smokeListenerwithpropertiesbufferedMessageSetCaller(Pointer<Void> _value) { _smokeListenerwithpropertiesbufferedMessageSetStatic(value, _value); }
  final __smokeListenerwithpropertiesbufferedMessageSetCallback = NativeCallable<Void Function(Pointer<Void>)>.isolateLocal(__smokeListenerwithpropertiesbufferedMessageSetCaller);
  __smokeListenerwithpropertiesbufferedMessageSetCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __smokeListenerwithpropertiesmessageGetCallback.close();
    __smokeListenerwithpropertiesmessageSetCallback.close();
    __smokeListenerwithpropertiespackedMessageGetCallback.close();
    __smokeListenerwithpropertiespackedMessageSetCallback.close();
    __smokeListenerwithpropertiesstructuredMessageGetCallback.close();
    __smokeListenerwithpropertiesstructuredMessageSetCallback.close();
    __smokeListenerwithpropertiesenumeratedMessageGetCallback.close();
    __smokeListenerwithpropertiesenumeratedMessageSetCallback.close();
    __smokeListenerwithpropertiesarrayedMessageGetCallback.close();
    __smokeListenerwithpropertiesarrayedMessageSetCallback.close();
    __smokeListenerwithpropertiesmappedMessageGetCallback.close();
    __smokeListenerwithpropertiesmappedMessageSetCallback.close();
    __smokeListenerwithpropertiesbufferedMessageGetCallback.close();
    __smokeListenerwithpropertiesbufferedMessageSetCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeListenerwithpropertiesCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    __closeAllCallback.nativeFunction,
    __smokeListenerwithpropertiesmessageGetCallback.nativeFunction,
    __smokeListenerwithpropertiesmessageSetCallback.nativeFunction,
    __smokeListenerwithpropertiespackedMessageGetCallback.nativeFunction,
    __smokeListenerwithpropertiespackedMessageSetCallback.nativeFunction,
    __smokeListenerwithpropertiesstructuredMessageGetCallback.nativeFunction,
    __smokeListenerwithpropertiesstructuredMessageSetCallback.nativeFunction,
    __smokeListenerwithpropertiesenumeratedMessageGetCallback.nativeFunction,
    __smokeListenerwithpropertiesenumeratedMessageSetCallback.nativeFunction,
    __smokeListenerwithpropertiesarrayedMessageGetCallback.nativeFunction,
    __smokeListenerwithpropertiesarrayedMessageSetCallback.nativeFunction,
    __smokeListenerwithpropertiesmappedMessageGetCallback.nativeFunction,
    __smokeListenerwithpropertiesmappedMessageSetCallback.nativeFunction,
    __smokeListenerwithpropertiesbufferedMessageGetCallback.nativeFunction,
    __smokeListenerwithpropertiesbufferedMessageSetCallback.nativeFunction
  );

  return result;
}

ListenerWithProperties smokeListenerwithpropertiesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ListenerWithProperties) return instance;

  final _typeIdHandle = _smokeListenerwithpropertiesGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeListenerwithpropertiesCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ListenerWithProperties$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeListenerwithpropertiesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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


