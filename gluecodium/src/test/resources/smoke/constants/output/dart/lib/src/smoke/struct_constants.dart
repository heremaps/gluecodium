import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class StructConstants {

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
Pointer<Void> smokeStructconstantsSomestructToFfi(StructConstants_SomeStruct value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _floatFieldHandle = (value.floatField);
  final _result = _smokeStructconstantsSomestructCreateHandle(_stringFieldHandle, _floatFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
StructConstants_SomeStruct smokeStructconstantsSomestructFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeStructconstantsSomestructGetFieldstringField(handle);
  final _floatFieldHandle = _smokeStructconstantsSomestructGetFieldfloatField(handle);
  try {
    return StructConstants_SomeStruct(
      stringFromFfi(_stringFieldHandle),
      (_floatFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeStructconstantsSomestructReleaseFfiHandle(Pointer<Void> handle) => _smokeStructconstantsSomestructReleaseHandle(handle);
// Nullable StructConstants_SomeStruct
final _smokeStructconstantsSomestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_create_handle_nullable'));
final _smokeStructconstantsSomestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_release_handle_nullable'));
final _smokeStructconstantsSomestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_SomeStruct_get_value_nullable'));
Pointer<Void> smokeStructconstantsSomestructToFfiNullable(StructConstants_SomeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructconstantsSomestructToFfi(value);
  final result = _smokeStructconstantsSomestructCreateHandleNullable(_handle);
  smokeStructconstantsSomestructReleaseFfiHandle(_handle);
  return result;
}
StructConstants_SomeStruct? smokeStructconstantsSomestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructconstantsSomestructGetValueNullable(handle);
  final result = smokeStructconstantsSomestructFromFfi(_handle);
  smokeStructconstantsSomestructReleaseFfiHandle(_handle);
  return result;
}
void smokeStructconstantsSomestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructconstantsSomestructReleaseHandleNullable(handle);
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
Pointer<Void> smokeStructconstantsNestingstructToFfi(StructConstants_NestingStruct value) {
  final _structFieldHandle = smokeStructconstantsSomestructToFfi(value.structField);
  final _result = _smokeStructconstantsNestingstructCreateHandle(_structFieldHandle);
  smokeStructconstantsSomestructReleaseFfiHandle(_structFieldHandle);
  return _result;
}
StructConstants_NestingStruct smokeStructconstantsNestingstructFromFfi(Pointer<Void> handle) {
  final _structFieldHandle = _smokeStructconstantsNestingstructGetFieldstructField(handle);
  try {
    return StructConstants_NestingStruct(
      smokeStructconstantsSomestructFromFfi(_structFieldHandle)
    );
  } finally {
    smokeStructconstantsSomestructReleaseFfiHandle(_structFieldHandle);
  }
}
void smokeStructconstantsNestingstructReleaseFfiHandle(Pointer<Void> handle) => _smokeStructconstantsNestingstructReleaseHandle(handle);
// Nullable StructConstants_NestingStruct
final _smokeStructconstantsNestingstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_create_handle_nullable'));
final _smokeStructconstantsNestingstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_release_handle_nullable'));
final _smokeStructconstantsNestingstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructConstants_NestingStruct_get_value_nullable'));
Pointer<Void> smokeStructconstantsNestingstructToFfiNullable(StructConstants_NestingStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructconstantsNestingstructToFfi(value);
  final result = _smokeStructconstantsNestingstructCreateHandleNullable(_handle);
  smokeStructconstantsNestingstructReleaseFfiHandle(_handle);
  return result;
}
StructConstants_NestingStruct? smokeStructconstantsNestingstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructconstantsNestingstructGetValueNullable(handle);
  final result = smokeStructconstantsNestingstructFromFfi(_handle);
  smokeStructconstantsNestingstructReleaseFfiHandle(_handle);
  return result;
}
void smokeStructconstantsNestingstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructconstantsNestingstructReleaseHandleNullable(handle);
// End of StructConstants_NestingStruct "private" section.
// StructConstants "private" section, not exported.
final _smokeStructconstantsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_StructConstants_register_finalizer'));
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

}
Pointer<Void> smokeStructconstantsToFfi(StructConstants value) =>
  _smokeStructconstantsCopyHandle((value as __lib.NativeBase).handle);
StructConstants smokeStructconstantsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is StructConstants) return instance;
  final _copiedHandle = _smokeStructconstantsCopyHandle(handle);
  final result = StructConstants$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeStructconstantsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeStructconstantsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeStructconstantsReleaseHandle(handle);
Pointer<Void> smokeStructconstantsToFfiNullable(StructConstants? value) =>
  value != null ? smokeStructconstantsToFfi(value) : Pointer<Void>.fromAddress(0);
StructConstants? smokeStructconstantsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeStructconstantsFromFfi(handle) : null;
void smokeStructconstantsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructconstantsReleaseHandle(handle);
// End of StructConstants "private" section.
