import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
final _smoke_Structs_ExternalStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_create_handle'));
final _smoke_Structs_ExternalStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_release_handle'));
final _smoke_Structs_ExternalStruct_get_field_stringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_get_field_stringField'));
final _smoke_Structs_ExternalStruct_get_field_externalStringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_get_field_externalStringField'));
final _smoke_Structs_ExternalStruct_get_field_externalArrayField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_get_field_externalArrayField'));
final _smoke_Structs_ExternalStruct_get_field_externalStructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_get_field_externalStructField'));
Pointer<Void> smoke_Structs_ExternalStruct_toFfi(Structs_ExternalStruct value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _externalStringField_handle = String_toFfi(value.externalStringField);
  final _externalArrayField_handle = foobar_ListOf_Byte_toFfi(value.externalArrayField);
  final _externalStructField_handle = smoke_Structs_AnotherExternalStruct_toFfi(value.externalStructField);
  final _result = _smoke_Structs_ExternalStruct_create_handle(_stringField_handle, _externalStringField_handle, _externalArrayField_handle, _externalStructField_handle);
  String_releaseFfiHandle(_stringField_handle);
  String_releaseFfiHandle(_externalStringField_handle);
  foobar_ListOf_Byte_releaseFfiHandle(_externalArrayField_handle);
  smoke_Structs_AnotherExternalStruct_releaseFfiHandle(_externalStructField_handle);
  return _result;
}
Structs_ExternalStruct smoke_Structs_ExternalStruct_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_Structs_ExternalStruct_get_field_stringField(handle);
  final _externalStringField_handle = _smoke_Structs_ExternalStruct_get_field_externalStringField(handle);
  final _externalArrayField_handle = _smoke_Structs_ExternalStruct_get_field_externalArrayField(handle);
  final _externalStructField_handle = _smoke_Structs_ExternalStruct_get_field_externalStructField(handle);
  try {
    return Structs_ExternalStruct(
      String_fromFfi(_stringField_handle),
      String_fromFfi(_externalStringField_handle),
      foobar_ListOf_Byte_fromFfi(_externalArrayField_handle),
      smoke_Structs_AnotherExternalStruct_fromFfi(_externalStructField_handle)
    );
  } finally {
    String_releaseFfiHandle(_stringField_handle);
    String_releaseFfiHandle(_externalStringField_handle);
    foobar_ListOf_Byte_releaseFfiHandle(_externalArrayField_handle);
    smoke_Structs_AnotherExternalStruct_releaseFfiHandle(_externalStructField_handle);
  }
}
void smoke_Structs_ExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_ExternalStruct_release_handle(handle);
// Nullable Structs_ExternalStruct
final _smoke_Structs_ExternalStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_create_handle_nullable'));
final _smoke_Structs_ExternalStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_release_handle_nullable'));
final _smoke_Structs_ExternalStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ExternalStruct_get_value_nullable'));
Pointer<Void> smoke_Structs_ExternalStruct_toFfi_nullable(Structs_ExternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_ExternalStruct_toFfi(value);
  final result = _smoke_Structs_ExternalStruct_create_handle_nullable(_handle);
  smoke_Structs_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
Structs_ExternalStruct smoke_Structs_ExternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_ExternalStruct_get_value_nullable(handle);
  final result = smoke_Structs_ExternalStruct_fromFfi(_handle);
  smoke_Structs_ExternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_ExternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_ExternalStruct_release_handle_nullable(handle);
// End of Structs_ExternalStruct "private" section.
class Structs_AnotherExternalStruct {
  int intField;
  Structs_AnotherExternalStruct(this.intField);
}
// Structs_AnotherExternalStruct "private" section, not exported.
final _smoke_Structs_AnotherExternalStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int8),
    Pointer<Void> Function(int)
  >('library_smoke_Structs_AnotherExternalStruct_create_handle'));
final _smoke_Structs_AnotherExternalStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_release_handle'));
final _smoke_Structs_AnotherExternalStruct_get_field_intField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_get_field_intField'));
Pointer<Void> smoke_Structs_AnotherExternalStruct_toFfi(Structs_AnotherExternalStruct value) {
  final _intField_handle = (value.intField);
  final _result = _smoke_Structs_AnotherExternalStruct_create_handle(_intField_handle);
  (_intField_handle);
  return _result;
}
Structs_AnotherExternalStruct smoke_Structs_AnotherExternalStruct_fromFfi(Pointer<Void> handle) {
  final _intField_handle = _smoke_Structs_AnotherExternalStruct_get_field_intField(handle);
  try {
    return Structs_AnotherExternalStruct(
      (_intField_handle)
    );
  } finally {
    (_intField_handle);
  }
}
void smoke_Structs_AnotherExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_AnotherExternalStruct_release_handle(handle);
// Nullable Structs_AnotherExternalStruct
final _smoke_Structs_AnotherExternalStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_create_handle_nullable'));
final _smoke_Structs_AnotherExternalStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_release_handle_nullable'));
final _smoke_Structs_AnotherExternalStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AnotherExternalStruct_get_value_nullable'));
Pointer<Void> smoke_Structs_AnotherExternalStruct_toFfi_nullable(Structs_AnotherExternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_AnotherExternalStruct_toFfi(value);
  final result = _smoke_Structs_AnotherExternalStruct_create_handle_nullable(_handle);
  smoke_Structs_AnotherExternalStruct_releaseFfiHandle(_handle);
  return result;
}
Structs_AnotherExternalStruct smoke_Structs_AnotherExternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_AnotherExternalStruct_get_value_nullable(handle);
  final result = smoke_Structs_AnotherExternalStruct_fromFfi(_handle);
  smoke_Structs_AnotherExternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_AnotherExternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_AnotherExternalStruct_release_handle_nullable(handle);
// End of Structs_AnotherExternalStruct "private" section.
// Structs "private" section, not exported.
final _smoke_Structs_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_copy_handle'));
final _smoke_Structs_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_release_handle'));
class Structs$Impl extends __lib.NativeBase implements Structs {
  Structs$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_Structs_release_handle(handle);
    handle = null;
  }
  static Structs_ExternalStruct getExternalStruct() {
    final _getExternalStruct_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Structs_getExternalStruct'));
    final __result_handle = _getExternalStruct_ffi(__lib.LibraryContext.isolateId);
    try {
      return smoke_Structs_ExternalStruct_fromFfi(__result_handle);
    } finally {
      smoke_Structs_ExternalStruct_releaseFfiHandle(__result_handle);
    }
  }
  static Structs_AnotherExternalStruct getAnotherExternalStruct() {
    final _getAnotherExternalStruct_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Structs_getAnotherExternalStruct'));
    final __result_handle = _getAnotherExternalStruct_ffi(__lib.LibraryContext.isolateId);
    try {
      return smoke_Structs_AnotherExternalStruct_fromFfi(__result_handle);
    } finally {
      smoke_Structs_AnotherExternalStruct_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_Structs_toFfi(Structs value) =>
  _smoke_Structs_copy_handle((value as __lib.NativeBase).handle);
Structs smoke_Structs_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as Structs;
  if (instance != null) return instance;
  final _copied_handle = _smoke_Structs_copy_handle(handle);
  final result = Structs$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_Structs_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Structs_release_handle(handle);
Pointer<Void> smoke_Structs_toFfi_nullable(Structs value) =>
  value != null ? smoke_Structs_toFfi(value) : Pointer<Void>.fromAddress(0);
Structs smoke_Structs_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Structs_fromFfi(handle) : null;
void smoke_Structs_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_release_handle(handle);
// End of Structs "private" section.
