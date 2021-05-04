import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class StructConstants {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static final StructConstants_SomeStruct structConstant = StructConstants_SomeStruct("bar Buzz", 1.41);
  static final StructConstants_NestingStruct nestingStructConstant = StructConstants_NestingStruct(StructConstants_SomeStruct("nonsense", -2.82));
}
class StructConstants_SomeStruct {
  String stringField;
  double floatField;
  StructConstants_SomeStruct(this.stringField, this.floatField);
}
// StructConstants_SomeStruct "private" section, not exported.
final _smoke_StructConstants_SomeStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Float),
    Pointer<Void> Function(Pointer<Void>, double)
  >('library_smoke_StructConstants_SomeStruct_create_handle'));
final _smoke_StructConstants_SomeStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_release_handle'));
final _smoke_StructConstants_SomeStruct_get_field_stringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_get_field_stringField'));
final _smoke_StructConstants_SomeStruct_get_field_floatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_get_field_floatField'));
Pointer<Void> smoke_StructConstants_SomeStruct_toFfi(StructConstants_SomeStruct value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _floatField_handle = (value.floatField);
  final _result = _smoke_StructConstants_SomeStruct_create_handle(_stringField_handle, _floatField_handle);
  String_releaseFfiHandle(_stringField_handle);
  (_floatField_handle);
  return _result;
}
StructConstants_SomeStruct smoke_StructConstants_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_StructConstants_SomeStruct_get_field_stringField(handle);
  final _floatField_handle = _smoke_StructConstants_SomeStruct_get_field_floatField(handle);
  try {
    return StructConstants_SomeStruct(
      String_fromFfi(_stringField_handle),
      (_floatField_handle)
    );
  } finally {
    String_releaseFfiHandle(_stringField_handle);
    (_floatField_handle);
  }
}
void smoke_StructConstants_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructConstants_SomeStruct_release_handle(handle);
// Nullable StructConstants_SomeStruct
final _smoke_StructConstants_SomeStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_create_handle_nullable'));
final _smoke_StructConstants_SomeStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_release_handle_nullable'));
final _smoke_StructConstants_SomeStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_StructConstants_SomeStruct_toFfi_nullable(StructConstants_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructConstants_SomeStruct_toFfi(value);
  final result = _smoke_StructConstants_SomeStruct_create_handle_nullable(_handle);
  smoke_StructConstants_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
StructConstants_SomeStruct? smoke_StructConstants_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructConstants_SomeStruct_get_value_nullable(handle);
  final result = smoke_StructConstants_SomeStruct_fromFfi(_handle);
  smoke_StructConstants_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructConstants_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructConstants_SomeStruct_release_handle_nullable(handle);
// End of StructConstants_SomeStruct "private" section.
class StructConstants_NestingStruct {
  StructConstants_SomeStruct structField;
  StructConstants_NestingStruct(this.structField);
}
// StructConstants_NestingStruct "private" section, not exported.
final _smoke_StructConstants_NestingStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_create_handle'));
final _smoke_StructConstants_NestingStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_release_handle'));
final _smoke_StructConstants_NestingStruct_get_field_structField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_get_field_structField'));
Pointer<Void> smoke_StructConstants_NestingStruct_toFfi(StructConstants_NestingStruct value) {
  final _structField_handle = smoke_StructConstants_SomeStruct_toFfi(value.structField);
  final _result = _smoke_StructConstants_NestingStruct_create_handle(_structField_handle);
  smoke_StructConstants_SomeStruct_releaseFfiHandle(_structField_handle);
  return _result;
}
StructConstants_NestingStruct smoke_StructConstants_NestingStruct_fromFfi(Pointer<Void> handle) {
  final _structField_handle = _smoke_StructConstants_NestingStruct_get_field_structField(handle);
  try {
    return StructConstants_NestingStruct(
      smoke_StructConstants_SomeStruct_fromFfi(_structField_handle)
    );
  } finally {
    smoke_StructConstants_SomeStruct_releaseFfiHandle(_structField_handle);
  }
}
void smoke_StructConstants_NestingStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructConstants_NestingStruct_release_handle(handle);
// Nullable StructConstants_NestingStruct
final _smoke_StructConstants_NestingStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_create_handle_nullable'));
final _smoke_StructConstants_NestingStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_release_handle_nullable'));
final _smoke_StructConstants_NestingStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_get_value_nullable'));
Pointer<Void> smoke_StructConstants_NestingStruct_toFfi_nullable(StructConstants_NestingStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructConstants_NestingStruct_toFfi(value);
  final result = _smoke_StructConstants_NestingStruct_create_handle_nullable(_handle);
  smoke_StructConstants_NestingStruct_releaseFfiHandle(_handle);
  return result;
}
StructConstants_NestingStruct? smoke_StructConstants_NestingStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructConstants_NestingStruct_get_value_nullable(handle);
  final result = smoke_StructConstants_NestingStruct_fromFfi(_handle);
  smoke_StructConstants_NestingStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructConstants_NestingStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructConstants_NestingStruct_release_handle_nullable(handle);
// End of StructConstants_NestingStruct "private" section.
// StructConstants "private" section, not exported.
final _smoke_StructConstants_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_copy_handle'));
final _smoke_StructConstants_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_release_handle'));
class StructConstants$Impl extends __lib.NativeBase implements StructConstants {
  StructConstants$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_StructConstants_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
}
Pointer<Void> smoke_StructConstants_toFfi(StructConstants value) =>
  _smoke_StructConstants_copy_handle((value as __lib.NativeBase).handle);
StructConstants smoke_StructConstants_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is StructConstants) return instance;
  final _copied_handle = _smoke_StructConstants_copy_handle(handle);
  final result = StructConstants$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_StructConstants_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_StructConstants_release_handle(handle);
Pointer<Void> smoke_StructConstants_toFfi_nullable(StructConstants? value) =>
  value != null ? smoke_StructConstants_toFfi(value) : Pointer<Void>.fromAddress(0);
StructConstants? smoke_StructConstants_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_StructConstants_fromFfi(handle) : null;
void smoke_StructConstants_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructConstants_release_handle(handle);
// End of StructConstants "private" section.
