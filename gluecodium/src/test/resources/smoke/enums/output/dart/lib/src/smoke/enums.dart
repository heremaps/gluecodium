import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
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
final _smoke_Enums_SimpleEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Enums_SimpleEnum_create_handle_nullable'));
final _smoke_Enums_SimpleEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_SimpleEnum_release_handle_nullable'));
final _smoke_Enums_SimpleEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_SimpleEnum_get_value_nullable'));
Pointer<Void> smoke_Enums_SimpleEnum_toFfi_nullable(Enums_SimpleEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Enums_SimpleEnum_toFfi(value);
  final result = _smoke_Enums_SimpleEnumCreateHandleNullable(_handle);
  smoke_Enums_SimpleEnum_releaseFfiHandle(_handle);
  return result;
}
Enums_SimpleEnum smoke_Enums_SimpleEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Enums_SimpleEnumGetValueNullable(handle);
  final result = smoke_Enums_SimpleEnum_fromFfi(_handle);
  smoke_Enums_SimpleEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Enums_SimpleEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_SimpleEnumReleaseHandleNullable(handle);
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
final _smoke_Enums_InternalErrorCodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Enums_InternalErrorCode_create_handle_nullable'));
final _smoke_Enums_InternalErrorCodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_InternalErrorCode_release_handle_nullable'));
final _smoke_Enums_InternalErrorCodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_InternalErrorCode_get_value_nullable'));
Pointer<Void> smoke_Enums_InternalErrorCode_toFfi_nullable(Enums_InternalErrorCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Enums_InternalErrorCode_toFfi(value);
  final result = _smoke_Enums_InternalErrorCodeCreateHandleNullable(_handle);
  smoke_Enums_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
Enums_InternalErrorCode smoke_Enums_InternalErrorCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Enums_InternalErrorCodeGetValueNullable(handle);
  final result = smoke_Enums_InternalErrorCode_fromFfi(_handle);
  smoke_Enums_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
void smoke_Enums_InternalErrorCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_InternalErrorCodeReleaseHandleNullable(handle);
// End of Enums_InternalErrorCode "private" section.
class Enums_ErrorStruct {
  Enums_InternalErrorCode type;
  String message;
  Enums_ErrorStruct(this.type, this.message);
}
// Enums_ErrorStruct "private" section, not exported.
final _smokeEnumsErrorstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_create_handle'));
final _smokeEnumsErrorstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_release_handle'));
final _smokeEnumsErrorstructGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_get_field_type'));
final _smokeEnumsErrorstructGetFieldmessage = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_get_field_message'));
Pointer<Void> smoke_Enums_ErrorStruct_toFfi(Enums_ErrorStruct value) {
  final _typeHandle = smoke_Enums_InternalErrorCode_toFfi(value.type);
  final _messageHandle = String_toFfi(value.message);
  final _result = _smokeEnumsErrorstructCreateHandle(_typeHandle, _messageHandle);
  smoke_Enums_InternalErrorCode_releaseFfiHandle(_typeHandle);
  String_releaseFfiHandle(_messageHandle);
  return _result;
}
Enums_ErrorStruct smoke_Enums_ErrorStruct_fromFfi(Pointer<Void> handle) {
  final _typeHandle = _smokeEnumsErrorstructGetFieldtype(handle);
  final _messageHandle = _smokeEnumsErrorstructGetFieldmessage(handle);
  try {
    return Enums_ErrorStruct(
      smoke_Enums_InternalErrorCode_fromFfi(_typeHandle),
      String_fromFfi(_messageHandle)
    );
  } finally {
    smoke_Enums_InternalErrorCode_releaseFfiHandle(_typeHandle);
    String_releaseFfiHandle(_messageHandle);
  }
}
void smoke_Enums_ErrorStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeEnumsErrorstructReleaseHandle(handle);
// Nullable Enums_ErrorStruct
final _smoke_Enums_ErrorStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_create_handle_nullable'));
final _smoke_Enums_ErrorStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_release_handle_nullable'));
final _smoke_Enums_ErrorStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_get_value_nullable'));
Pointer<Void> smoke_Enums_ErrorStruct_toFfi_nullable(Enums_ErrorStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Enums_ErrorStruct_toFfi(value);
  final result = _smoke_Enums_ErrorStructCreateHandleNullable(_handle);
  smoke_Enums_ErrorStruct_releaseFfiHandle(_handle);
  return result;
}
Enums_ErrorStruct smoke_Enums_ErrorStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Enums_ErrorStructGetValueNullable(handle);
  final result = smoke_Enums_ErrorStruct_fromFfi(_handle);
  smoke_Enums_ErrorStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Enums_ErrorStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_ErrorStructReleaseHandleNullable(handle);
// End of Enums_ErrorStruct "private" section.
// Enums "private" section, not exported.
final _smokeEnumsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_copy_handle'));
final _smokeEnumsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_release_handle'));
class Enums$Impl extends __lib.NativeBase implements Enums {
  Enums$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeEnumsReleaseHandle(handle);
    handle = null;
  }
  static Enums_SimpleEnum methodWithEnumeration(Enums_SimpleEnum input) {
    final _methodWithEnumerationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_Enums_methodWithEnumeration__SimpleEnum'));
    final _inputHandle = smoke_Enums_SimpleEnum_toFfi(input);
    final __resultHandle = _methodWithEnumerationFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_Enums_SimpleEnum_releaseFfiHandle(_inputHandle);
    try {
      return smoke_Enums_SimpleEnum_fromFfi(__resultHandle);
    } finally {
      smoke_Enums_SimpleEnum_releaseFfiHandle(__resultHandle);
    }
  }
  static Enums_InternalErrorCode flipEnumValue(Enums_InternalErrorCode input) {
    final _flipEnumValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_Enums_flipEnumValue__InternalErrorCode'));
    final _inputHandle = smoke_Enums_InternalErrorCode_toFfi(input);
    final __resultHandle = _flipEnumValueFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_Enums_InternalErrorCode_releaseFfiHandle(_inputHandle);
    try {
      return smoke_Enums_InternalErrorCode_fromFfi(__resultHandle);
    } finally {
      smoke_Enums_InternalErrorCode_releaseFfiHandle(__resultHandle);
    }
  }
  static Enums_InternalErrorCode extractEnumFromStruct(Enums_ErrorStruct input) {
    final _extractEnumFromStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Pointer<Void>), int Function(int, Pointer<Void>)>('library_smoke_Enums_extractEnumFromStruct__ErrorStruct'));
    final _inputHandle = smoke_Enums_ErrorStruct_toFfi(input);
    final __resultHandle = _extractEnumFromStructFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_Enums_ErrorStruct_releaseFfiHandle(_inputHandle);
    try {
      return smoke_Enums_InternalErrorCode_fromFfi(__resultHandle);
    } finally {
      smoke_Enums_InternalErrorCode_releaseFfiHandle(__resultHandle);
    }
  }
  static Enums_ErrorStruct createStructWithEnumInside(Enums_InternalErrorCode type, String message) {
    final _createStructWithEnumInsideFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Pointer<Void>), Pointer<Void> Function(int, int, Pointer<Void>)>('library_smoke_Enums_createStructWithEnumInside__InternalErrorCode_String'));
    final _typeHandle = smoke_Enums_InternalErrorCode_toFfi(type);
    final _messageHandle = String_toFfi(message);
    final __resultHandle = _createStructWithEnumInsideFfi(__lib.LibraryContext.isolateId, _typeHandle, _messageHandle);
    smoke_Enums_InternalErrorCode_releaseFfiHandle(_typeHandle);
    String_releaseFfiHandle(_messageHandle);
    try {
      return smoke_Enums_ErrorStruct_fromFfi(__resultHandle);
    } finally {
      smoke_Enums_ErrorStruct_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_Enums_toFfi(Enums value) =>
  _smokeEnumsCopyHandle((value as __lib.NativeBase).handle);
Enums smoke_Enums_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Enums;
  if (instance != null) return instance;
  final _copiedHandle = _smokeEnumsCopyHandle(handle);
  final result = Enums$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_Enums_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeEnumsReleaseHandle(handle);
Pointer<Void> smoke_Enums_toFfi_nullable(Enums value) =>
  value != null ? smoke_Enums_toFfi(value) : Pointer<Void>.fromAddress(0);
Enums smoke_Enums_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Enums_fromFfi(handle) : null;
void smoke_Enums_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeEnumsReleaseHandle(handle);
// End of Enums "private" section.
