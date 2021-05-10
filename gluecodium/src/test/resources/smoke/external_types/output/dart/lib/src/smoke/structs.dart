import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Structs {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static Structs_ExternalStruct getExternalStruct() => Structs$Impl.getExternalStruct();
  static Structs_AnotherExternalStruct getAnotherExternalStruct() => Structs$Impl.getAnotherExternalStruct();
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
Pointer<Void> smoke_Structs_ExternalStruct_toFfi(Structs_ExternalStruct value) {
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _externalStringFieldHandle = String_toFfi(value.externalStringField);
  final _externalArrayFieldHandle = foobar_ListOf_Byte_toFfi(value.externalArrayField);
  final _externalStructFieldHandle = smoke_Structs_AnotherExternalStruct_toFfi(value.externalStructField);
  final _result = _smokeStructsExternalstructCreateHandle(_stringFieldHandle, _externalStringFieldHandle, _externalArrayFieldHandle, _externalStructFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  String_releaseFfiHandle(_externalStringFieldHandle);
  foobar_ListOf_Byte_releaseFfiHandle(_externalArrayFieldHandle);
  smoke_Structs_AnotherExternalStruct_releaseFfiHandle(_externalStructFieldHandle);
  return _result;
}
Structs_ExternalStruct smoke_Structs_ExternalStruct_fromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeStructsExternalstructGetFieldstringField(handle);
  final _externalStringFieldHandle = _smokeStructsExternalstructGetFieldexternalStringField(handle);
  final _externalArrayFieldHandle = _smokeStructsExternalstructGetFieldexternalArrayField(handle);
  final _externalStructFieldHandle = _smokeStructsExternalstructGetFieldexternalStructField(handle);
  try {
    return Structs_ExternalStruct(
      String_fromFfi(_stringFieldHandle),
      String_fromFfi(_externalStringFieldHandle),
      foobar_ListOf_Byte_fromFfi(_externalArrayFieldHandle),
      smoke_Structs_AnotherExternalStruct_fromFfi(_externalStructFieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_stringFieldHandle);
    String_releaseFfiHandle(_externalStringFieldHandle);
    foobar_ListOf_Byte_releaseFfiHandle(_externalArrayFieldHandle);
    smoke_Structs_AnotherExternalStruct_releaseFfiHandle(_externalStructFieldHandle);
  }
}
void smoke_Structs_ExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeStructsExternalstructReleaseHandle(handle);
// Nullable Structs_ExternalStruct
final _smoke_Structs_ExternalStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_create_handle_nullable'));
final _smoke_Structs_ExternalStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_release_handle_nullable'));
final _smoke_Structs_ExternalStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_get_value_nullable'));
Pointer<Void> smoke_Structs_ExternalStruct_toFfi_nullable(Structs_ExternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_ExternalStruct_toFfi(value);
  final result = _smoke_Structs_ExternalStructCreateHandleNullable(_handle);
  smoke_Structs_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
Structs_ExternalStruct smoke_Structs_ExternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_ExternalStructGetValueNullable(handle);
  final result = smoke_Structs_ExternalStruct_fromFfi(_handle);
  smoke_Structs_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_ExternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_ExternalStructReleaseHandleNullable(handle);
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
Pointer<Void> smoke_Structs_AnotherExternalStruct_toFfi(Structs_AnotherExternalStruct value) {
  final _intFieldHandle = (value.intField);
  final _result = _smokeStructsAnotherexternalstructCreateHandle(_intFieldHandle);
  (_intFieldHandle);
  return _result;
}
Structs_AnotherExternalStruct smoke_Structs_AnotherExternalStruct_fromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeStructsAnotherexternalstructGetFieldintField(handle);
  try {
    return Structs_AnotherExternalStruct(
      (_intFieldHandle)
    );
  } finally {
    (_intFieldHandle);
  }
}
void smoke_Structs_AnotherExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeStructsAnotherexternalstructReleaseHandle(handle);
// Nullable Structs_AnotherExternalStruct
final _smoke_Structs_AnotherExternalStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_create_handle_nullable'));
final _smoke_Structs_AnotherExternalStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_release_handle_nullable'));
final _smoke_Structs_AnotherExternalStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_get_value_nullable'));
Pointer<Void> smoke_Structs_AnotherExternalStruct_toFfi_nullable(Structs_AnotherExternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_AnotherExternalStruct_toFfi(value);
  final result = _smoke_Structs_AnotherExternalStructCreateHandleNullable(_handle);
  smoke_Structs_AnotherExternalStruct_releaseFfiHandle(_handle);
  return result;
}
Structs_AnotherExternalStruct smoke_Structs_AnotherExternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_AnotherExternalStructGetValueNullable(handle);
  final result = smoke_Structs_AnotherExternalStruct_fromFfi(_handle);
  smoke_Structs_AnotherExternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_AnotherExternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_AnotherExternalStructReleaseHandleNullable(handle);
// End of Structs_AnotherExternalStruct "private" section.
// Structs "private" section, not exported.
final _smokeStructsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_copy_handle'));
final _smokeStructsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_release_handle'));
class Structs$Impl extends __lib.NativeBase implements Structs {
  Structs$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeStructsReleaseHandle(handle);
    handle = null;
  }
  static Structs_ExternalStruct getExternalStruct() {
    final _getExternalStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Structs_getExternalStruct'));
    final __resultHandle = _getExternalStructFfi(__lib.LibraryContext.isolateId);
    try {
      return smoke_Structs_ExternalStruct_fromFfi(__resultHandle);
    } finally {
      smoke_Structs_ExternalStruct_releaseFfiHandle(__resultHandle);
    }
  }
  static Structs_AnotherExternalStruct getAnotherExternalStruct() {
    final _getAnotherExternalStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Structs_getAnotherExternalStruct'));
    final __resultHandle = _getAnotherExternalStructFfi(__lib.LibraryContext.isolateId);
    try {
      return smoke_Structs_AnotherExternalStruct_fromFfi(__resultHandle);
    } finally {
      smoke_Structs_AnotherExternalStruct_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_Structs_toFfi(Structs value) =>
  _smokeStructsCopyHandle((value as __lib.NativeBase).handle);
Structs smoke_Structs_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Structs;
  if (instance != null) return instance;
  final _copiedHandle = _smokeStructsCopyHandle(handle);
  final result = Structs$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_Structs_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeStructsReleaseHandle(handle);
Pointer<Void> smoke_Structs_toFfi_nullable(Structs value) =>
  value != null ? smoke_Structs_toFfi(value) : Pointer<Void>.fromAddress(0);
Structs smoke_Structs_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Structs_fromFfi(handle) : null;
void smoke_Structs_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeStructsReleaseHandle(handle);
// End of Structs "private" section.
