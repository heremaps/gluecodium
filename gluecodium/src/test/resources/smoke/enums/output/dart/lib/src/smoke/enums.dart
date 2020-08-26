import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Enums {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static Enums_SimpleEnum methodWithEnumeration(Enums_SimpleEnum input) => Enums$Impl.methodWithEnumeration(input);
  static Enums_InternalErrorCode flipEnumValue(Enums_InternalErrorCode input) => Enums$Impl.flipEnumValue(input);
  static Enums_InternalErrorCode extractEnumFromStruct(Enums_ErrorStruct input) => Enums$Impl.extractEnumFromStruct(input);
  static Enums_ErrorStruct createStructWithEnumInside(Enums_InternalErrorCode type, String message) => Enums$Impl.createStructWithEnumInside(type, message);
}
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
final _smoke_Enums_SimpleEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Enums_SimpleEnum_create_handle_nullable'));
final _smoke_Enums_SimpleEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_SimpleEnum_release_handle_nullable'));
final _smoke_Enums_SimpleEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_SimpleEnum_get_value_nullable'));
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
final _smoke_Enums_InternalErrorCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Enums_InternalErrorCode_create_handle_nullable'));
final _smoke_Enums_InternalErrorCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_InternalErrorCode_release_handle_nullable'));
final _smoke_Enums_InternalErrorCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_InternalErrorCode_get_value_nullable'));
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
class Enums_ErrorStruct {
  Enums_InternalErrorCode type;
  String message;
  Enums_ErrorStruct(this.type, this.message);
}
// Enums_ErrorStruct "private" section, not exported.
final _smoke_Enums_ErrorStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_create_handle'));
final _smoke_Enums_ErrorStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_release_handle'));
final _smoke_Enums_ErrorStruct_get_field_type = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_get_field_type'));
final _smoke_Enums_ErrorStruct_get_field_message = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_get_field_message'));
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
  try {
    return Enums_ErrorStruct(
      smoke_Enums_InternalErrorCode_fromFfi(_type_handle),
      String_fromFfi(_message_handle)
    );
  } finally {
    smoke_Enums_InternalErrorCode_releaseFfiHandle(_type_handle);
    String_releaseFfiHandle(_message_handle);
  }
}
void smoke_Enums_ErrorStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Enums_ErrorStruct_release_handle(handle);
// Nullable Enums_ErrorStruct
final _smoke_Enums_ErrorStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_create_handle_nullable'));
final _smoke_Enums_ErrorStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_release_handle_nullable'));
final _smoke_Enums_ErrorStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_get_value_nullable'));
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
// Enums "private" section, not exported.
final _smoke_Enums_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_copy_handle'));
final _smoke_Enums_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_release_handle'));
final _smoke_Enums_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_Enums_get_raw_pointer'));
class Enums$Impl implements Enums {
  @protected
  Pointer<Void> handle;
  Enums$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_Enums_get_raw_pointer(handle));
    _smoke_Enums_release_handle(handle);
    handle = null;
  }
  static Enums_SimpleEnum methodWithEnumeration(Enums_SimpleEnum input) {
    final _methodWithEnumeration_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_Enums_methodWithEnumeration__SimpleEnum'));
    final _input_handle = smoke_Enums_SimpleEnum_toFfi(input);
    final __result_handle = _methodWithEnumeration_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_Enums_SimpleEnum_releaseFfiHandle(_input_handle);
    try {
      return smoke_Enums_SimpleEnum_fromFfi(__result_handle);
    } finally {
      smoke_Enums_SimpleEnum_releaseFfiHandle(__result_handle);
    }
  }
  static Enums_InternalErrorCode flipEnumValue(Enums_InternalErrorCode input) {
    final _flipEnumValue_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_Enums_flipEnumValue__InternalErrorCode'));
    final _input_handle = smoke_Enums_InternalErrorCode_toFfi(input);
    final __result_handle = _flipEnumValue_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_Enums_InternalErrorCode_releaseFfiHandle(_input_handle);
    try {
      return smoke_Enums_InternalErrorCode_fromFfi(__result_handle);
    } finally {
      smoke_Enums_InternalErrorCode_releaseFfiHandle(__result_handle);
    }
  }
  static Enums_InternalErrorCode extractEnumFromStruct(Enums_ErrorStruct input) {
    final _extractEnumFromStruct_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Pointer<Void>), int Function(int, Pointer<Void>)>('library_smoke_Enums_extractEnumFromStruct__ErrorStruct'));
    final _input_handle = smoke_Enums_ErrorStruct_toFfi(input);
    final __result_handle = _extractEnumFromStruct_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_Enums_ErrorStruct_releaseFfiHandle(_input_handle);
    try {
      return smoke_Enums_InternalErrorCode_fromFfi(__result_handle);
    } finally {
      smoke_Enums_InternalErrorCode_releaseFfiHandle(__result_handle);
    }
  }
  static Enums_ErrorStruct createStructWithEnumInside(Enums_InternalErrorCode type, String message) {
    final _createStructWithEnumInside_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Pointer<Void>), Pointer<Void> Function(int, int, Pointer<Void>)>('library_smoke_Enums_createStructWithEnumInside__InternalErrorCode_String'));
    final _type_handle = smoke_Enums_InternalErrorCode_toFfi(type);
    final _message_handle = String_toFfi(message);
    final __result_handle = _createStructWithEnumInside_ffi(__lib.LibraryContext.isolateId, _type_handle, _message_handle);
    smoke_Enums_InternalErrorCode_releaseFfiHandle(_type_handle);
    String_releaseFfiHandle(_message_handle);
    try {
      return smoke_Enums_ErrorStruct_fromFfi(__result_handle);
    } finally {
      smoke_Enums_ErrorStruct_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_Enums_toFfi(Enums value) =>
  _smoke_Enums_copy_handle((value as Enums$Impl).handle);
Enums smoke_Enums_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_Enums_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Enums;
  if (instance != null) return instance;
  final _copied_handle = _smoke_Enums_copy_handle(handle);
  final result = Enums$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_Enums_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Enums_release_handle(handle);
Pointer<Void> smoke_Enums_toFfi_nullable(Enums value) =>
  value != null ? smoke_Enums_toFfi(value) : Pointer<Void>.fromAddress(0);
Enums smoke_Enums_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Enums_fromFfi(handle) : null;
void smoke_Enums_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_release_handle(handle);
// End of Enums "private" section.
