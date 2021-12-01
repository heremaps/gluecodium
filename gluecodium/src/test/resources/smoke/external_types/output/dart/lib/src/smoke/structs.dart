import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:meta/meta.dart';
abstract class Structs {

  static Structs_ExternalStruct getExternalStruct() => $prototype.getExternalStruct();
  static Structs_AnotherExternalStruct getAnotherExternalStruct() => $prototype.getAnotherExternalStruct();
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Structs$Impl(Pointer<Void>.fromAddress(0));
}
class Structs_ExternalStruct {
  String stringField;
  String externalStringField;
  List<int> externalArrayField;
  Structs_AnotherExternalStruct externalStructField;
  Structs_ExternalStruct(this.stringField, this.externalStringField, this.externalArrayField, this.externalStructField);
}
// Structs_ExternalStruct "private" section, not exported.
final _smokeStructsExternalstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_create_handle'));
final _smokeStructsExternalstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_release_handle'));
final _smokeStructsExternalstructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_get_field_stringField'));
final _smokeStructsExternalstructGetFieldexternalStringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_get_field_externalStringField'));
final _smokeStructsExternalstructGetFieldexternalArrayField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_get_field_externalArrayField'));
final _smokeStructsExternalstructGetFieldexternalStructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_get_field_externalStructField'));
Pointer<Void> smokeStructsExternalstructToFfi(Structs_ExternalStruct value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _externalStringFieldHandle = stringToFfi(value.externalStringField);
  final _externalArrayFieldHandle = foobarListofByteToFfi(value.externalArrayField);
  final _externalStructFieldHandle = smokeStructsAnotherexternalstructToFfi(value.externalStructField);
  final _result = _smokeStructsExternalstructCreateHandle(_stringFieldHandle, _externalStringFieldHandle, _externalArrayFieldHandle, _externalStructFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_externalStringFieldHandle);
  foobarListofByteReleaseFfiHandle(_externalArrayFieldHandle);
  smokeStructsAnotherexternalstructReleaseFfiHandle(_externalStructFieldHandle);
  return _result;
}
Structs_ExternalStruct smokeStructsExternalstructFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeStructsExternalstructGetFieldstringField(handle);
  final _externalStringFieldHandle = _smokeStructsExternalstructGetFieldexternalStringField(handle);
  final _externalArrayFieldHandle = _smokeStructsExternalstructGetFieldexternalArrayField(handle);
  final _externalStructFieldHandle = _smokeStructsExternalstructGetFieldexternalStructField(handle);
  try {
    return Structs_ExternalStruct(
      stringFromFfi(_stringFieldHandle),
      stringFromFfi(_externalStringFieldHandle),
      foobarListofByteFromFfi(_externalArrayFieldHandle),
      smokeStructsAnotherexternalstructFromFfi(_externalStructFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
    stringReleaseFfiHandle(_externalStringFieldHandle);
    foobarListofByteReleaseFfiHandle(_externalArrayFieldHandle);
    smokeStructsAnotherexternalstructReleaseFfiHandle(_externalStructFieldHandle);
  }
}
void smokeStructsExternalstructReleaseFfiHandle(Pointer<Void> handle) => _smokeStructsExternalstructReleaseHandle(handle);
// Nullable Structs_ExternalStruct
final _smokeStructsExternalstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_create_handle_nullable'));
final _smokeStructsExternalstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_release_handle_nullable'));
final _smokeStructsExternalstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_get_value_nullable'));
Pointer<Void> smokeStructsExternalstructToFfiNullable(Structs_ExternalStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructsExternalstructToFfi(value);
  final result = _smokeStructsExternalstructCreateHandleNullable(_handle);
  smokeStructsExternalstructReleaseFfiHandle(_handle);
  return result;
}
Structs_ExternalStruct? smokeStructsExternalstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructsExternalstructGetValueNullable(handle);
  final result = smokeStructsExternalstructFromFfi(_handle);
  smokeStructsExternalstructReleaseFfiHandle(_handle);
  return result;
}
void smokeStructsExternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsExternalstructReleaseHandleNullable(handle);
// End of Structs_ExternalStruct "private" section.
class Structs_AnotherExternalStruct {
  int intField;
  Structs_AnotherExternalStruct(this.intField);
}
// Structs_AnotherExternalStruct "private" section, not exported.
final _smokeStructsAnotherexternalstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int8),
    Pointer<Void> Function(int)
  >('library_smoke_Structs_AnotherExternalStruct_create_handle'));
final _smokeStructsAnotherexternalstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_release_handle'));
final _smokeStructsAnotherexternalstructGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_get_field_intField'));
Pointer<Void> smokeStructsAnotherexternalstructToFfi(Structs_AnotherExternalStruct value) {
  final _intFieldHandle = (value.intField);
  final _result = _smokeStructsAnotherexternalstructCreateHandle(_intFieldHandle);
  return _result;
}
Structs_AnotherExternalStruct smokeStructsAnotherexternalstructFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeStructsAnotherexternalstructGetFieldintField(handle);
  try {
    return Structs_AnotherExternalStruct(
      (_intFieldHandle)
    );
  } finally {
  }
}
void smokeStructsAnotherexternalstructReleaseFfiHandle(Pointer<Void> handle) => _smokeStructsAnotherexternalstructReleaseHandle(handle);
// Nullable Structs_AnotherExternalStruct
final _smokeStructsAnotherexternalstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_create_handle_nullable'));
final _smokeStructsAnotherexternalstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_release_handle_nullable'));
final _smokeStructsAnotherexternalstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_get_value_nullable'));
Pointer<Void> smokeStructsAnotherexternalstructToFfiNullable(Structs_AnotherExternalStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructsAnotherexternalstructToFfi(value);
  final result = _smokeStructsAnotherexternalstructCreateHandleNullable(_handle);
  smokeStructsAnotherexternalstructReleaseFfiHandle(_handle);
  return result;
}
Structs_AnotherExternalStruct? smokeStructsAnotherexternalstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructsAnotherexternalstructGetValueNullable(handle);
  final result = smokeStructsAnotherexternalstructFromFfi(_handle);
  smokeStructsAnotherexternalstructReleaseFfiHandle(_handle);
  return result;
}
void smokeStructsAnotherexternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsAnotherexternalstructReleaseHandleNullable(handle);
// End of Structs_AnotherExternalStruct "private" section.
// Structs "private" section, not exported.
final _smokeStructsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Structs_register_finalizer'));
final _smokeStructsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_copy_handle'));
final _smokeStructsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_release_handle'));
/// @nodoc
@visibleForTesting
class Structs$Impl extends __lib.NativeBase implements Structs {
  Structs$Impl(Pointer<Void> handle) : super(handle);

  Structs_ExternalStruct getExternalStruct() {
    final _getExternalStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Structs_getExternalStruct'));
    final __resultHandle = _getExternalStructFfi(__lib.LibraryContext.isolateId);
    try {
      return smokeStructsExternalstructFromFfi(__resultHandle);
    } finally {
      smokeStructsExternalstructReleaseFfiHandle(__resultHandle);
    }
  }
  Structs_AnotherExternalStruct getAnotherExternalStruct() {
    final _getAnotherExternalStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Structs_getAnotherExternalStruct'));
    final __resultHandle = _getAnotherExternalStructFfi(__lib.LibraryContext.isolateId);
    try {
      return smokeStructsAnotherexternalstructFromFfi(__resultHandle);
    } finally {
      smokeStructsAnotherexternalstructReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeStructsToFfi(Structs value) =>
  _smokeStructsCopyHandle((value as __lib.NativeBase).handle);
Structs smokeStructsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Structs) return instance;
  final _copiedHandle = _smokeStructsCopyHandle(handle);
  final result = Structs$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeStructsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeStructsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeStructsReleaseHandle(handle);
Pointer<Void> smokeStructsToFfiNullable(Structs? value) =>
  value != null ? smokeStructsToFfi(value) : Pointer<Void>.fromAddress(0);
Structs? smokeStructsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeStructsFromFfi(handle) : null;
void smokeStructsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsReleaseHandle(handle);
// End of Structs "private" section.
