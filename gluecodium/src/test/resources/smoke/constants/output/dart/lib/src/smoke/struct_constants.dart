import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
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
final _smokeStructconstantsSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Float),
    Pointer<Void> Function(Pointer<Void>, double)
  >('library_smoke_StructConstants_SomeStruct_create_handle'));
final _smokeStructconstantsSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_release_handle'));
final _smokeStructconstantsSomestructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_get_field_stringField'));
final _smokeStructconstantsSomestructGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_get_field_floatField'));
Pointer<Void> smoke_StructConstants_SomeStruct_toFfi(StructConstants_SomeStruct value) {
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _floatFieldHandle = (value.floatField);
  final _result = _smokeStructconstantsSomestructCreateHandle(_stringFieldHandle, _floatFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  (_floatFieldHandle);
  return _result;
}
StructConstants_SomeStruct smoke_StructConstants_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeStructconstantsSomestructGetFieldstringField(handle);
  final _floatFieldHandle = _smokeStructconstantsSomestructGetFieldfloatField(handle);
  try {
    return StructConstants_SomeStruct(
      String_fromFfi(_stringFieldHandle),
      (_floatFieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_stringFieldHandle);
    (_floatFieldHandle);
  }
}
void smoke_StructConstants_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeStructconstantsSomestructReleaseHandle(handle);
// Nullable StructConstants_SomeStruct
final _smoke_StructConstants_SomeStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_create_handle_nullable'));
final _smoke_StructConstants_SomeStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_release_handle_nullable'));
final _smoke_StructConstants_SomeStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_StructConstants_SomeStruct_toFfi_nullable(StructConstants_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructConstants_SomeStruct_toFfi(value);
  final result = _smoke_StructConstants_SomeStructCreateHandleNullable(_handle);
  smoke_StructConstants_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
StructConstants_SomeStruct smoke_StructConstants_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructConstants_SomeStructGetValueNullable(handle);
  final result = smoke_StructConstants_SomeStruct_fromFfi(_handle);
  smoke_StructConstants_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructConstants_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructConstants_SomeStructReleaseHandleNullable(handle);
// End of StructConstants_SomeStruct "private" section.
class StructConstants_NestingStruct {
  StructConstants_SomeStruct structField;
  StructConstants_NestingStruct(this.structField);
}
// StructConstants_NestingStruct "private" section, not exported.
final _smokeStructconstantsNestingstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_create_handle'));
final _smokeStructconstantsNestingstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_release_handle'));
final _smokeStructconstantsNestingstructGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_get_field_structField'));
Pointer<Void> smoke_StructConstants_NestingStruct_toFfi(StructConstants_NestingStruct value) {
  final _structFieldHandle = smoke_StructConstants_SomeStruct_toFfi(value.structField);
  final _result = _smokeStructconstantsNestingstructCreateHandle(_structFieldHandle);
  smoke_StructConstants_SomeStruct_releaseFfiHandle(_structFieldHandle);
  return _result;
}
StructConstants_NestingStruct smoke_StructConstants_NestingStruct_fromFfi(Pointer<Void> handle) {
  final _structFieldHandle = _smokeStructconstantsNestingstructGetFieldstructField(handle);
  try {
    return StructConstants_NestingStruct(
      smoke_StructConstants_SomeStruct_fromFfi(_structFieldHandle)
    );
  } finally {
    smoke_StructConstants_SomeStruct_releaseFfiHandle(_structFieldHandle);
  }
}
void smoke_StructConstants_NestingStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeStructconstantsNestingstructReleaseHandle(handle);
// Nullable StructConstants_NestingStruct
final _smoke_StructConstants_NestingStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_create_handle_nullable'));
final _smoke_StructConstants_NestingStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_release_handle_nullable'));
final _smoke_StructConstants_NestingStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_get_value_nullable'));
Pointer<Void> smoke_StructConstants_NestingStruct_toFfi_nullable(StructConstants_NestingStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructConstants_NestingStruct_toFfi(value);
  final result = _smoke_StructConstants_NestingStructCreateHandleNullable(_handle);
  smoke_StructConstants_NestingStruct_releaseFfiHandle(_handle);
  return result;
}
StructConstants_NestingStruct smoke_StructConstants_NestingStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructConstants_NestingStructGetValueNullable(handle);
  final result = smoke_StructConstants_NestingStruct_fromFfi(_handle);
  smoke_StructConstants_NestingStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructConstants_NestingStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructConstants_NestingStructReleaseHandleNullable(handle);
// End of StructConstants_NestingStruct "private" section.
// StructConstants "private" section, not exported.
final _smokeStructconstantsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_copy_handle'));
final _smokeStructconstantsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_release_handle'));
class StructConstants$Impl extends __lib.NativeBase implements StructConstants {
  StructConstants$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeStructconstantsReleaseHandle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_StructConstants_toFfi(StructConstants value) =>
  _smokeStructconstantsCopyHandle((value as __lib.NativeBase).handle);
StructConstants smoke_StructConstants_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as StructConstants;
  if (instance != null) return instance;
  final _copiedHandle = _smokeStructconstantsCopyHandle(handle);
  final result = StructConstants$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_StructConstants_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeStructconstantsReleaseHandle(handle);
Pointer<Void> smoke_StructConstants_toFfi_nullable(StructConstants value) =>
  value != null ? smoke_StructConstants_toFfi(value) : Pointer<Void>.fromAddress(0);
StructConstants smoke_StructConstants_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_StructConstants_fromFfi(handle) : null;
void smoke_StructConstants_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeStructconstantsReleaseHandle(handle);
// End of StructConstants "private" section.
