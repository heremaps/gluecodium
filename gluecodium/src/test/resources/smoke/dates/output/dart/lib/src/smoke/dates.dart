import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Dates {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  DateTime dateMethod(DateTime input);
  DateTime get dateProperty;
  set dateProperty(DateTime value);
}
class Dates_DateStruct {
  DateTime dateField;
  Dates_DateStruct(this.dateField);
}
// Dates_DateStruct "private" section, not exported.
final _smokeDatesDatestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('library_smoke_Dates_DateStruct_create_handle'));
final _smokeDatesDatestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Dates_DateStruct_release_handle'));
final _smokeDatesDatestructGetFielddateField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Dates_DateStruct_get_field_dateField'));
Pointer<Void> smoke_Dates_DateStruct_toFfi(Dates_DateStruct value) {
  final _dateFieldHandle = Date_toFfi(value.dateField);
  final _result = _smokeDatesDatestructCreateHandle(_dateFieldHandle);
  Date_releaseFfiHandle(_dateFieldHandle);
  return _result;
}
Dates_DateStruct smoke_Dates_DateStruct_fromFfi(Pointer<Void> handle) {
  final _dateFieldHandle = _smokeDatesDatestructGetFielddateField(handle);
  try {
    return Dates_DateStruct(
      Date_fromFfi(_dateFieldHandle)
    );
  } finally {
    Date_releaseFfiHandle(_dateFieldHandle);
  }
}
void smoke_Dates_DateStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeDatesDatestructReleaseHandle(handle);
// Nullable Dates_DateStruct
final _smoke_Dates_DateStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Dates_DateStruct_create_handle_nullable'));
final _smoke_Dates_DateStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Dates_DateStruct_release_handle_nullable'));
final _smoke_Dates_DateStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Dates_DateStruct_get_value_nullable'));
Pointer<Void> smoke_Dates_DateStruct_toFfi_nullable(Dates_DateStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Dates_DateStruct_toFfi(value);
  final result = _smoke_Dates_DateStructCreateHandleNullable(_handle);
  smoke_Dates_DateStruct_releaseFfiHandle(_handle);
  return result;
}
Dates_DateStruct smoke_Dates_DateStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Dates_DateStructGetValueNullable(handle);
  final result = smoke_Dates_DateStruct_fromFfi(_handle);
  smoke_Dates_DateStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Dates_DateStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Dates_DateStructReleaseHandleNullable(handle);
// End of Dates_DateStruct "private" section.
// Dates "private" section, not exported.
final _smokeDatesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Dates_copy_handle'));
final _smokeDatesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Dates_release_handle'));
class Dates$Impl extends __lib.NativeBase implements Dates {
  Dates$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeDatesReleaseHandle(handle);
    handle = null;
  }
  @override
  DateTime dateMethod(DateTime input) {
    final _dateMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32, Uint64), int Function(Pointer<Void>, int, int)>('library_smoke_Dates_dateMethod__Date'));
    final _inputHandle = Date_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _dateMethodFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    Date_releaseFfiHandle(_inputHandle);
    try {
      return Date_fromFfi(__resultHandle);
    } finally {
      Date_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  DateTime get dateProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Dates_dateProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Date_fromFfi(__resultHandle);
    } finally {
      Date_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  set dateProperty(DateTime value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint64), void Function(Pointer<Void>, int, int)>('library_smoke_Dates_dateProperty_set__Date'));
    final _valueHandle = Date_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    Date_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_Dates_toFfi(Dates value) =>
  _smokeDatesCopyHandle((value as __lib.NativeBase).handle);
Dates smoke_Dates_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Dates;
  if (instance != null) return instance;
  final _copiedHandle = _smokeDatesCopyHandle(handle);
  final result = Dates$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_Dates_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeDatesReleaseHandle(handle);
Pointer<Void> smoke_Dates_toFfi_nullable(Dates value) =>
  value != null ? smoke_Dates_toFfi(value) : Pointer<Void>.fromAddress(0);
Dates smoke_Dates_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Dates_fromFfi(handle) : null;
void smoke_Dates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeDatesReleaseHandle(handle);
// End of Dates "private" section.
