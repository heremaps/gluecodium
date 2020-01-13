import 'package:library/src/String__conversion.dart';
import 'package:library/src/_library_init.dart' as __lib;
import 'package:library/src/smoke/Enums_ErrorStruct__conversion.dart';
import 'package:library/src/smoke/Enums_ExternalEnum__conversion.dart';
import 'package:library/src/smoke/Enums_InternalErrorCode__conversion.dart';
import 'package:library/src/smoke/Enums_SimpleEnum__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Enums_release_handle');
class Enums {
  final Pointer<Void> _handle;
  Enums._(this._handle);
  void release() => __release_handle(_handle);
  static Enums_SimpleEnum methodWithEnumeration(Enums_SimpleEnum input) {
    final _methodWithEnumeration_ffi = __lib.nativeLibrary.lookupFunction<Uint32 Function(Uint32), int Function(int)>('smoke_Enums_methodWithEnumeration__SimpleEnum');
    final _input_handle = smoke_Enums_1SimpleEnum_toFfi(input);
    final __result_handle = _methodWithEnumeration_ffi(_input_handle);
    final _result = smoke_Enums_1SimpleEnum_fromFfi(__result_handle);
    smoke_Enums_1SimpleEnum_releaseFfiHandle(__result_handle);
    smoke_Enums_1SimpleEnum_releaseFfiHandle(_input_handle);
    return _result;
  }
  static Enums_InternalErrorCode flipEnumValue(Enums_InternalErrorCode input) {
    final _flipEnumValue_ffi = __lib.nativeLibrary.lookupFunction<Uint32 Function(Uint32), int Function(int)>('smoke_Enums_flipEnumValue__InternalErrorCode');
    final _input_handle = smoke_Enums_1InternalErrorCode_toFfi(input);
    final __result_handle = _flipEnumValue_ffi(_input_handle);
    final _result = smoke_Enums_1InternalErrorCode_fromFfi(__result_handle);
    smoke_Enums_1InternalErrorCode_releaseFfiHandle(__result_handle);
    smoke_Enums_1InternalErrorCode_releaseFfiHandle(_input_handle);
    return _result;
  }
  static Enums_InternalErrorCode extractEnumFromStruct(Enums_ErrorStruct input) {
    final _extractEnumFromStruct_ffi = __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>), int Function(Pointer<Void>)>('smoke_Enums_extractEnumFromStruct__ErrorStruct');
    final _input_handle = smoke_Enums_1ErrorStruct_toFfi(input);
    final __result_handle = _extractEnumFromStruct_ffi(_input_handle);
    final _result = smoke_Enums_1InternalErrorCode_fromFfi(__result_handle);
    smoke_Enums_1InternalErrorCode_releaseFfiHandle(__result_handle);
    smoke_Enums_1ErrorStruct_releaseFfiHandle(_input_handle);
    return _result;
  }
  static Enums_ErrorStruct createStructWithEnumInside(Enums_InternalErrorCode type, String message) {
    final _createStructWithEnumInside_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Uint32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('smoke_Enums_createStructWithEnumInside__InternalErrorCode_String');
    final _type_handle = smoke_Enums_1InternalErrorCode_toFfi(type);
    final _message_handle = String_toFfi(message);
    final __result_handle = _createStructWithEnumInside_ffi(_type_handle, _message_handle);
    final _result = smoke_Enums_1ErrorStruct_fromFfi(__result_handle);
    smoke_Enums_1ErrorStruct_releaseFfiHandle(__result_handle);
    smoke_Enums_1InternalErrorCode_releaseFfiHandle(_type_handle);
    String_releaseFfiHandle(_message_handle);
    return _result;
  }
  static methodWithExternalEnum(Enums_ExternalEnum input) {
    final _methodWithExternalEnum_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Uint32), void Function(int)>('smoke_Enums_methodWithExternalEnum__External_1Enum');
    final _input_handle = smoke_Enums_1ExternalEnum_toFfi(input);
    final __result_handle = _methodWithExternalEnum_ffi(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    smoke_Enums_1ExternalEnum_releaseFfiHandle(_input_handle);
    return _result;
  }
}
Pointer<Void> smoke_Enums_toFfi(Enums value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
Enums smoke_Enums_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? Enums._(handle) : null;
void smoke_Enums_releaseFfiHandle(Pointer<Void> handle) {}
enum Enums_SimpleEnum {
    first,
    second
}
enum Enums_InternalErrorCode {
    errorNone,
    errorFatal
}
enum Enums_ExternalEnum {
    fooValue,
    barValue
}
enum Enums_VeryExternalEnum {
    foo,
    bar
}
class Enums_ErrorStruct {
  Enums_InternalErrorCode type;
  String message;
  Enums_ErrorStruct(this.type, this.message);
}
