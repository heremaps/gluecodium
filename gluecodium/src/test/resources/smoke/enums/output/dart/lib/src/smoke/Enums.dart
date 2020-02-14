import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_Enums_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Enums_release_handle');
class Enums {
  final Pointer<Void> _handle;
  Enums._(this._handle);
  void release() => _smoke_Enums_release_handle(_handle);
  static Enums_SimpleEnum methodWithEnumeration(Enums_SimpleEnum input) {
    final _methodWithEnumeration_ffi = __lib.nativeLibrary.lookupFunction<Uint32 Function(Uint32), int Function(int)>('smoke_Enums_methodWithEnumeration__SimpleEnum');
    final _input_handle = smoke_Enums_SimpleEnum_toFfi(input);
    final __result_handle = _methodWithEnumeration_ffi(_input_handle);
    smoke_Enums_SimpleEnum_releaseFfiHandle(_input_handle);
    final _result = smoke_Enums_SimpleEnum_fromFfi(__result_handle);
    smoke_Enums_SimpleEnum_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Enums_InternalErrorCode flipEnumValue(Enums_InternalErrorCode input) {
    final _flipEnumValue_ffi = __lib.nativeLibrary.lookupFunction<Uint32 Function(Uint32), int Function(int)>('smoke_Enums_flipEnumValue__InternalErrorCode');
    final _input_handle = smoke_Enums_InternalErrorCode_toFfi(input);
    final __result_handle = _flipEnumValue_ffi(_input_handle);
    smoke_Enums_InternalErrorCode_releaseFfiHandle(_input_handle);
    final _result = smoke_Enums_InternalErrorCode_fromFfi(__result_handle);
    smoke_Enums_InternalErrorCode_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Enums_InternalErrorCode extractEnumFromStruct(Enums_ErrorStruct input) {
    final _extractEnumFromStruct_ffi = __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>), int Function(Pointer<Void>)>('smoke_Enums_extractEnumFromStruct__ErrorStruct');
    final _input_handle = smoke_Enums_ErrorStruct_toFfi(input);
    final __result_handle = _extractEnumFromStruct_ffi(_input_handle);
    smoke_Enums_ErrorStruct_releaseFfiHandle(_input_handle);
    final _result = smoke_Enums_InternalErrorCode_fromFfi(__result_handle);
    smoke_Enums_InternalErrorCode_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Enums_ErrorStruct createStructWithEnumInside(Enums_InternalErrorCode type, String message) {
    final _createStructWithEnumInside_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Uint32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('smoke_Enums_createStructWithEnumInside__InternalErrorCode_String');
    final _type_handle = smoke_Enums_InternalErrorCode_toFfi(type);
    final _message_handle = String_toFfi(message);
    final __result_handle = _createStructWithEnumInside_ffi(_type_handle, _message_handle);
    smoke_Enums_InternalErrorCode_releaseFfiHandle(_type_handle);
    String_releaseFfiHandle(_message_handle);
    final _result = smoke_Enums_ErrorStruct_fromFfi(__result_handle);
    smoke_Enums_ErrorStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static methodWithExternalEnum(Enums_ExternalEnum input) {
    final _methodWithExternalEnum_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Uint32), void Function(int)>('smoke_Enums_methodWithExternalEnum__External_1Enum');
    final _input_handle = smoke_Enums_ExternalEnum_toFfi(input);
    final __result_handle = _methodWithExternalEnum_ffi(_input_handle);
    smoke_Enums_ExternalEnum_releaseFfiHandle(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_Enums_toFfi(Enums value) => value._handle;
Enums smoke_Enums_fromFfi(Pointer<Void> handle) => Enums._(handle);
void smoke_Enums_releaseFfiHandle(Pointer<Void> handle) {}
Pointer<Void> smoke_Enums_toFfi_nullable(Enums value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
Enums smoke_Enums_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? Enums._(handle) : null;
void smoke_Enums_releaseFfiHandle_nullable(Pointer<Void> handle) {}
enum Enums_SimpleEnum {
    first,
    second
}
// Enums_SimpleEnum "private" section, not exported.
int smoke_Enums_SimpleEnum_toFfi(Enums_SimpleEnum value) {
  switch (value) {
  case Enums_SimpleEnum.first:
    return 0;
  break;
  case Enums_SimpleEnum.second:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Enums_SimpleEnum enum.");
  }
}
Enums_SimpleEnum smoke_Enums_SimpleEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enums_SimpleEnum.first;
  break;
  case 1:
    return Enums_SimpleEnum.second;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Enums_SimpleEnum enum.");
  }
}
void smoke_Enums_SimpleEnum_releaseFfiHandle(int handle) {}
final _smoke_Enums_SimpleEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('smoke_Enums_SimpleEnum_create_handle_nullable');
final _smoke_Enums_SimpleEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Enums_SimpleEnum_release_handle_nullable');
final _smoke_Enums_SimpleEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Enums_SimpleEnum_get_value_nullable');
Pointer<Void> smoke_Enums_SimpleEnum_toFfi_nullable(Enums_SimpleEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Enums_SimpleEnum_toFfi(value);
  final result = _smoke_Enums_SimpleEnum_create_handle_nullable(_handle);
  smoke_Enums_SimpleEnum_releaseFfiHandle(_handle);
  return result;
}
Enums_SimpleEnum smoke_Enums_SimpleEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Enums_SimpleEnum_get_value_nullable(handle);
  final result = smoke_Enums_SimpleEnum_fromFfi(_handle);
  smoke_Enums_SimpleEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Enums_SimpleEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_SimpleEnum_release_handle_nullable(handle);
// End of Enums_SimpleEnum "private" section.
enum Enums_InternalErrorCode {
    errorNone,
    errorFatal
}
// Enums_InternalErrorCode "private" section, not exported.
int smoke_Enums_InternalErrorCode_toFfi(Enums_InternalErrorCode value) {
  switch (value) {
  case Enums_InternalErrorCode.errorNone:
    return 0;
  break;
  case Enums_InternalErrorCode.errorFatal:
    return 999;
  break;
  default:
    throw StateError("Invalid enum value $value for Enums_InternalErrorCode enum.");
  }
}
Enums_InternalErrorCode smoke_Enums_InternalErrorCode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enums_InternalErrorCode.errorNone;
  break;
  case 999:
    return Enums_InternalErrorCode.errorFatal;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Enums_InternalErrorCode enum.");
  }
}
void smoke_Enums_InternalErrorCode_releaseFfiHandle(int handle) {}
final _smoke_Enums_InternalErrorCode_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('smoke_Enums_InternalErrorCode_create_handle_nullable');
final _smoke_Enums_InternalErrorCode_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Enums_InternalErrorCode_release_handle_nullable');
final _smoke_Enums_InternalErrorCode_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Enums_InternalErrorCode_get_value_nullable');
Pointer<Void> smoke_Enums_InternalErrorCode_toFfi_nullable(Enums_InternalErrorCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Enums_InternalErrorCode_toFfi(value);
  final result = _smoke_Enums_InternalErrorCode_create_handle_nullable(_handle);
  smoke_Enums_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
Enums_InternalErrorCode smoke_Enums_InternalErrorCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Enums_InternalErrorCode_get_value_nullable(handle);
  final result = smoke_Enums_InternalErrorCode_fromFfi(_handle);
  smoke_Enums_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
void smoke_Enums_InternalErrorCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_InternalErrorCode_release_handle_nullable(handle);
// End of Enums_InternalErrorCode "private" section.
enum Enums_ExternalEnum {
    fooValue,
    barValue
}
// Enums_ExternalEnum "private" section, not exported.
int smoke_Enums_ExternalEnum_toFfi(Enums_ExternalEnum value) {
  switch (value) {
  case Enums_ExternalEnum.fooValue:
    return 0;
  break;
  case Enums_ExternalEnum.barValue:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Enums_ExternalEnum enum.");
  }
}
Enums_ExternalEnum smoke_Enums_ExternalEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enums_ExternalEnum.fooValue;
  break;
  case 1:
    return Enums_ExternalEnum.barValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Enums_ExternalEnum enum.");
  }
}
void smoke_Enums_ExternalEnum_releaseFfiHandle(int handle) {}
final _smoke_Enums_ExternalEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('smoke_Enums_ExternalEnum_create_handle_nullable');
final _smoke_Enums_ExternalEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Enums_ExternalEnum_release_handle_nullable');
final _smoke_Enums_ExternalEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Enums_ExternalEnum_get_value_nullable');
Pointer<Void> smoke_Enums_ExternalEnum_toFfi_nullable(Enums_ExternalEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Enums_ExternalEnum_toFfi(value);
  final result = _smoke_Enums_ExternalEnum_create_handle_nullable(_handle);
  smoke_Enums_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
Enums_ExternalEnum smoke_Enums_ExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Enums_ExternalEnum_get_value_nullable(handle);
  final result = smoke_Enums_ExternalEnum_fromFfi(_handle);
  smoke_Enums_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Enums_ExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_ExternalEnum_release_handle_nullable(handle);
// End of Enums_ExternalEnum "private" section.
enum Enums_VeryExternalEnum {
    foo,
    bar
}
// Enums_VeryExternalEnum "private" section, not exported.
int smoke_Enums_VeryExternalEnum_toFfi(Enums_VeryExternalEnum value) {
  switch (value) {
  case Enums_VeryExternalEnum.foo:
    return 0;
  break;
  case Enums_VeryExternalEnum.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Enums_VeryExternalEnum enum.");
  }
}
Enums_VeryExternalEnum smoke_Enums_VeryExternalEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enums_VeryExternalEnum.foo;
  break;
  case 1:
    return Enums_VeryExternalEnum.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Enums_VeryExternalEnum enum.");
  }
}
void smoke_Enums_VeryExternalEnum_releaseFfiHandle(int handle) {}
final _smoke_Enums_VeryExternalEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('smoke_Enums_VeryExternalEnum_create_handle_nullable');
final _smoke_Enums_VeryExternalEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Enums_VeryExternalEnum_release_handle_nullable');
final _smoke_Enums_VeryExternalEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Enums_VeryExternalEnum_get_value_nullable');
Pointer<Void> smoke_Enums_VeryExternalEnum_toFfi_nullable(Enums_VeryExternalEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Enums_VeryExternalEnum_toFfi(value);
  final result = _smoke_Enums_VeryExternalEnum_create_handle_nullable(_handle);
  smoke_Enums_VeryExternalEnum_releaseFfiHandle(_handle);
  return result;
}
Enums_VeryExternalEnum smoke_Enums_VeryExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Enums_VeryExternalEnum_get_value_nullable(handle);
  final result = smoke_Enums_VeryExternalEnum_fromFfi(_handle);
  smoke_Enums_VeryExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Enums_VeryExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_VeryExternalEnum_release_handle_nullable(handle);
// End of Enums_VeryExternalEnum "private" section.
class Enums_ErrorStruct {
  Enums_InternalErrorCode type;
  String message;
  Enums_ErrorStruct(this.type, this.message);
}
// Enums_ErrorStruct "private" section, not exported.
final _smoke_Enums_ErrorStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('smoke_Enums_ErrorStruct_create_handle');
final _smoke_Enums_ErrorStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Enums_ErrorStruct_release_handle');
final _smoke_Enums_ErrorStruct_get_field_type = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Enums_ErrorStruct_get_field_type');
final _smoke_Enums_ErrorStruct_get_field_message = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Enums_ErrorStruct_get_field_message');
Pointer<Void> smoke_Enums_ErrorStruct_toFfi(Enums_ErrorStruct value) {
  final _type_handle = smoke_Enums_InternalErrorCode_toFfi(value.type);
  final _message_handle = String_toFfi(value.message);
  final _result = _smoke_Enums_ErrorStruct_create_handle(_type_handle, _message_handle);
  smoke_Enums_InternalErrorCode_releaseFfiHandle(_type_handle);
  String_releaseFfiHandle(_message_handle);
  return _result;
}
Enums_ErrorStruct smoke_Enums_ErrorStruct_fromFfi(Pointer<Void> handle) {
  final _type_handle = _smoke_Enums_ErrorStruct_get_field_type(handle);
  final _message_handle = _smoke_Enums_ErrorStruct_get_field_message(handle);
  final _result = Enums_ErrorStruct(
    smoke_Enums_InternalErrorCode_fromFfi(_type_handle),
    String_fromFfi(_message_handle)
  );
  smoke_Enums_InternalErrorCode_releaseFfiHandle(_type_handle);
  String_releaseFfiHandle(_message_handle);
  return _result;
}
void smoke_Enums_ErrorStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Enums_ErrorStruct_release_handle(handle);
// Nullable Enums_ErrorStruct
final _smoke_Enums_ErrorStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Enums_ErrorStruct_create_handle_nullable');
final _smoke_Enums_ErrorStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Enums_ErrorStruct_release_handle_nullable');
final _smoke_Enums_ErrorStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Enums_ErrorStruct_get_value_nullable');
Pointer<Void> smoke_Enums_ErrorStruct_toFfi_nullable(Enums_ErrorStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Enums_ErrorStruct_toFfi(value);
  final result = _smoke_Enums_ErrorStruct_create_handle_nullable(_handle);
  smoke_Enums_ErrorStruct_releaseFfiHandle(_handle);
  return result;
}
Enums_ErrorStruct smoke_Enums_ErrorStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Enums_ErrorStruct_get_value_nullable(handle);
  final result = smoke_Enums_ErrorStruct_fromFfi(_handle);
  smoke_Enums_ErrorStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Enums_ErrorStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_ErrorStruct_release_handle_nullable(handle);
// End of Enums_ErrorStruct "private" section.
