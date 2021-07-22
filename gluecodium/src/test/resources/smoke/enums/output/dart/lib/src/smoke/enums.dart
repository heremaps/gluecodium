import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class Enums {
  /// @nodoc
  @Deprecated("Does nothing")
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
int smokeEnumsSimpleenumToFfi(Enums_SimpleEnum value) {
  switch (value) {
  case Enums_SimpleEnum.first:
    return 0;
  case Enums_SimpleEnum.second:
    return 1;
  default:
    throw StateError("Invalid enum value $value for Enums_SimpleEnum enum.");
  }
}
Enums_SimpleEnum smokeEnumsSimpleenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enums_SimpleEnum.first;
  case 1:
    return Enums_SimpleEnum.second;
  default:
    throw StateError("Invalid numeric value $handle for Enums_SimpleEnum enum.");
  }
}
void smokeEnumsSimpleenumReleaseFfiHandle(int handle) {}
final _smokeEnumsSimpleenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Enums_SimpleEnum_create_handle_nullable'));
final _smokeEnumsSimpleenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_SimpleEnum_release_handle_nullable'));
final _smokeEnumsSimpleenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_SimpleEnum_get_value_nullable'));
Pointer<Void> smokeEnumsSimpleenumToFfiNullable(Enums_SimpleEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumsSimpleenumToFfi(value);
  final result = _smokeEnumsSimpleenumCreateHandleNullable(_handle);
  smokeEnumsSimpleenumReleaseFfiHandle(_handle);
  return result;
}
Enums_SimpleEnum? smokeEnumsSimpleenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumsSimpleenumGetValueNullable(handle);
  final result = smokeEnumsSimpleenumFromFfi(_handle);
  smokeEnumsSimpleenumReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumsSimpleenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumsSimpleenumReleaseHandleNullable(handle);
// End of Enums_SimpleEnum "private" section.
enum Enums_InternalErrorCode {
    errorNone,
    errorFatal
}
// Enums_InternalErrorCode "private" section, not exported.
int smokeEnumsInternalerrorcodeToFfi(Enums_InternalErrorCode value) {
  switch (value) {
  case Enums_InternalErrorCode.errorNone:
    return 0;
  case Enums_InternalErrorCode.errorFatal:
    return 999;
  default:
    throw StateError("Invalid enum value $value for Enums_InternalErrorCode enum.");
  }
}
Enums_InternalErrorCode smokeEnumsInternalerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enums_InternalErrorCode.errorNone;
  case 999:
    return Enums_InternalErrorCode.errorFatal;
  default:
    throw StateError("Invalid numeric value $handle for Enums_InternalErrorCode enum.");
  }
}
void smokeEnumsInternalerrorcodeReleaseFfiHandle(int handle) {}
final _smokeEnumsInternalerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Enums_InternalErrorCode_create_handle_nullable'));
final _smokeEnumsInternalerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_InternalErrorCode_release_handle_nullable'));
final _smokeEnumsInternalerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_InternalErrorCode_get_value_nullable'));
Pointer<Void> smokeEnumsInternalerrorcodeToFfiNullable(Enums_InternalErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumsInternalerrorcodeToFfi(value);
  final result = _smokeEnumsInternalerrorcodeCreateHandleNullable(_handle);
  smokeEnumsInternalerrorcodeReleaseFfiHandle(_handle);
  return result;
}
Enums_InternalErrorCode? smokeEnumsInternalerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumsInternalerrorcodeGetValueNullable(handle);
  final result = smokeEnumsInternalerrorcodeFromFfi(_handle);
  smokeEnumsInternalerrorcodeReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumsInternalerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumsInternalerrorcodeReleaseHandleNullable(handle);
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
Pointer<Void> smokeEnumsErrorstructToFfi(Enums_ErrorStruct value) {
  final _typeHandle = smokeEnumsInternalerrorcodeToFfi(value.type);
  final _messageHandle = stringToFfi(value.message);
  final _result = _smokeEnumsErrorstructCreateHandle(_typeHandle, _messageHandle);
  smokeEnumsInternalerrorcodeReleaseFfiHandle(_typeHandle);
  stringReleaseFfiHandle(_messageHandle);
  return _result;
}
Enums_ErrorStruct smokeEnumsErrorstructFromFfi(Pointer<Void> handle) {
  final _typeHandle = _smokeEnumsErrorstructGetFieldtype(handle);
  final _messageHandle = _smokeEnumsErrorstructGetFieldmessage(handle);
  try {
    return Enums_ErrorStruct(
      smokeEnumsInternalerrorcodeFromFfi(_typeHandle),
      stringFromFfi(_messageHandle)
    );
  } finally {
    smokeEnumsInternalerrorcodeReleaseFfiHandle(_typeHandle);
    stringReleaseFfiHandle(_messageHandle);
  }
}
void smokeEnumsErrorstructReleaseFfiHandle(Pointer<Void> handle) => _smokeEnumsErrorstructReleaseHandle(handle);
// Nullable Enums_ErrorStruct
final _smokeEnumsErrorstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_create_handle_nullable'));
final _smokeEnumsErrorstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_release_handle_nullable'));
final _smokeEnumsErrorstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_ErrorStruct_get_value_nullable'));
Pointer<Void> smokeEnumsErrorstructToFfiNullable(Enums_ErrorStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumsErrorstructToFfi(value);
  final result = _smokeEnumsErrorstructCreateHandleNullable(_handle);
  smokeEnumsErrorstructReleaseFfiHandle(_handle);
  return result;
}
Enums_ErrorStruct? smokeEnumsErrorstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumsErrorstructGetValueNullable(handle);
  final result = smokeEnumsErrorstructFromFfi(_handle);
  smokeEnumsErrorstructReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumsErrorstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumsErrorstructReleaseHandleNullable(handle);
// End of Enums_ErrorStruct "private" section.
// Enums "private" section, not exported.
final _smokeEnumsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Enums_register_finalizer'));
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
  void release() {}
  static Enums_SimpleEnum methodWithEnumeration(Enums_SimpleEnum input) {
    final _methodWithEnumerationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_Enums_methodWithEnumeration__SimpleEnum'));
    final _inputHandle = smokeEnumsSimpleenumToFfi(input);
    final __resultHandle = _methodWithEnumerationFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeEnumsSimpleenumReleaseFfiHandle(_inputHandle);
    try {
      return smokeEnumsSimpleenumFromFfi(__resultHandle);
    } finally {
      smokeEnumsSimpleenumReleaseFfiHandle(__resultHandle);
    }
  }
  static Enums_InternalErrorCode flipEnumValue(Enums_InternalErrorCode input) {
    final _flipEnumValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Uint32), int Function(int, int)>('library_smoke_Enums_flipEnumValue__InternalErrorCode'));
    final _inputHandle = smokeEnumsInternalerrorcodeToFfi(input);
    final __resultHandle = _flipEnumValueFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeEnumsInternalerrorcodeReleaseFfiHandle(_inputHandle);
    try {
      return smokeEnumsInternalerrorcodeFromFfi(__resultHandle);
    } finally {
      smokeEnumsInternalerrorcodeReleaseFfiHandle(__resultHandle);
    }
  }
  static Enums_InternalErrorCode extractEnumFromStruct(Enums_ErrorStruct input) {
    final _extractEnumFromStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Int32, Pointer<Void>), int Function(int, Pointer<Void>)>('library_smoke_Enums_extractEnumFromStruct__ErrorStruct'));
    final _inputHandle = smokeEnumsErrorstructToFfi(input);
    final __resultHandle = _extractEnumFromStructFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeEnumsErrorstructReleaseFfiHandle(_inputHandle);
    try {
      return smokeEnumsInternalerrorcodeFromFfi(__resultHandle);
    } finally {
      smokeEnumsInternalerrorcodeReleaseFfiHandle(__resultHandle);
    }
  }
  static Enums_ErrorStruct createStructWithEnumInside(Enums_InternalErrorCode type, String message) {
    final _createStructWithEnumInsideFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Pointer<Void>), Pointer<Void> Function(int, int, Pointer<Void>)>('library_smoke_Enums_createStructWithEnumInside__InternalErrorCode_String'));
    final _typeHandle = smokeEnumsInternalerrorcodeToFfi(type);
    final _messageHandle = stringToFfi(message);
    final __resultHandle = _createStructWithEnumInsideFfi(__lib.LibraryContext.isolateId, _typeHandle, _messageHandle);
    smokeEnumsInternalerrorcodeReleaseFfiHandle(_typeHandle);
    stringReleaseFfiHandle(_messageHandle);
    try {
      return smokeEnumsErrorstructFromFfi(__resultHandle);
    } finally {
      smokeEnumsErrorstructReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeEnumsToFfi(Enums value) =>
  _smokeEnumsCopyHandle((value as __lib.NativeBase).handle);
Enums smokeEnumsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Enums) return instance;
  final _copiedHandle = _smokeEnumsCopyHandle(handle);
  final result = Enums$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeEnumsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeEnumsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeEnumsReleaseHandle(handle);
Pointer<Void> smokeEnumsToFfiNullable(Enums? value) =>
  value != null ? smokeEnumsToFfi(value) : Pointer<Void>.fromAddress(0);
Enums? smokeEnumsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeEnumsFromFfi(handle) : null;
void smokeEnumsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumsReleaseHandle(handle);
// End of Enums "private" section.
