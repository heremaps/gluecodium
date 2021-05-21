import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class DurationMilliseconds {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  Duration durationFunction(Duration input);
  Duration? nullableDurationFunction(Duration? input);
  Duration get durationProperty;
  set durationProperty(Duration value);
}
class DurationMilliseconds_DurationStruct {
  Duration durationField;
  DurationMilliseconds_DurationStruct(this.durationField);
}
// DurationMilliseconds_DurationStruct "private" section, not exported.
final _smokeDurationmillisecondsDurationstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('library_smoke_DurationMilliseconds_DurationStruct_create_handle'));
final _smokeDurationmillisecondsDurationstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DurationMilliseconds_DurationStruct_release_handle'));
final _smokeDurationmillisecondsDurationstructGetFielddurationField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DurationMilliseconds_DurationStruct_get_field_durationField'));
Pointer<Void> smokeDurationmillisecondsDurationstructToFfi(DurationMilliseconds_DurationStruct value) {
  final _durationFieldHandle = durationToFfi(value.durationField);
  final _result = _smokeDurationmillisecondsDurationstructCreateHandle(_durationFieldHandle);
  durationReleaseFfiHandle(_durationFieldHandle);
  return _result;
}
DurationMilliseconds_DurationStruct smokeDurationmillisecondsDurationstructFromFfi(Pointer<Void> handle) {
  final _durationFieldHandle = _smokeDurationmillisecondsDurationstructGetFielddurationField(handle);
  try {
    return DurationMilliseconds_DurationStruct(
      durationFromFfi(_durationFieldHandle)
    );
  } finally {
    durationReleaseFfiHandle(_durationFieldHandle);
  }
}
void smokeDurationmillisecondsDurationstructReleaseFfiHandle(Pointer<Void> handle) => _smokeDurationmillisecondsDurationstructReleaseHandle(handle);
// Nullable DurationMilliseconds_DurationStruct
final _smokeDurationmillisecondsDurationstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DurationMilliseconds_DurationStruct_create_handle_nullable'));
final _smokeDurationmillisecondsDurationstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DurationMilliseconds_DurationStruct_release_handle_nullable'));
final _smokeDurationmillisecondsDurationstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DurationMilliseconds_DurationStruct_get_value_nullable'));
Pointer<Void> smokeDurationmillisecondsDurationstructToFfiNullable(DurationMilliseconds_DurationStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDurationmillisecondsDurationstructToFfi(value);
  final result = _smokeDurationmillisecondsDurationstructCreateHandleNullable(_handle);
  smokeDurationmillisecondsDurationstructReleaseFfiHandle(_handle);
  return result;
}
DurationMilliseconds_DurationStruct? smokeDurationmillisecondsDurationstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDurationmillisecondsDurationstructGetValueNullable(handle);
  final result = smokeDurationmillisecondsDurationstructFromFfi(_handle);
  smokeDurationmillisecondsDurationstructReleaseFfiHandle(_handle);
  return result;
}
void smokeDurationmillisecondsDurationstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDurationmillisecondsDurationstructReleaseHandleNullable(handle);
// End of DurationMilliseconds_DurationStruct "private" section.
// DurationMilliseconds "private" section, not exported.
final _smokeDurationmillisecondsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_DurationMilliseconds_register_finalizer'));
final _smokeDurationmillisecondsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DurationMilliseconds_copy_handle'));
final _smokeDurationmillisecondsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DurationMilliseconds_release_handle'));
class DurationMilliseconds$Impl extends __lib.NativeBase implements DurationMilliseconds {
  DurationMilliseconds$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  Duration durationFunction(Duration input) {
    final _durationFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32, Uint64), int Function(Pointer<Void>, int, int)>('library_smoke_DurationMilliseconds_durationFunction__Duration'));
    final _inputHandle = durationToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _durationFunctionFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    durationReleaseFfiHandle(_inputHandle);
    try {
      return durationFromFfi(__resultHandle);
    } finally {
      durationReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  Duration? nullableDurationFunction(Duration? input) {
    final _nullableDurationFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DurationMilliseconds_nullableDurationFunction__Duration'));
    final _inputHandle = durationToFfiNullable(input);
    final _handle = this.handle;
    final __resultHandle = _nullableDurationFunctionFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    durationReleaseFfiHandleNullable(_inputHandle);
    try {
      return durationFromFfiNullable(__resultHandle);
    } finally {
      durationReleaseFfiHandleNullable(__resultHandle);
    }
  }
  @override
  Duration get durationProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_DurationMilliseconds_durationProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return durationFromFfi(__resultHandle);
    } finally {
      durationReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  set durationProperty(Duration value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint64), void Function(Pointer<Void>, int, int)>('library_smoke_DurationMilliseconds_durationProperty_set__Duration'));
    final _valueHandle = durationToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    durationReleaseFfiHandle(_valueHandle);
  }
}
Pointer<Void> smokeDurationmillisecondsToFfi(DurationMilliseconds value) =>
  _smokeDurationmillisecondsCopyHandle((value as __lib.NativeBase).handle);
DurationMilliseconds smokeDurationmillisecondsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DurationMilliseconds) return instance as DurationMilliseconds;
  final _copiedHandle = _smokeDurationmillisecondsCopyHandle(handle);
  final result = DurationMilliseconds$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeDurationmillisecondsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeDurationmillisecondsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeDurationmillisecondsReleaseHandle(handle);
Pointer<Void> smokeDurationmillisecondsToFfiNullable(DurationMilliseconds? value) =>
  value != null ? smokeDurationmillisecondsToFfi(value) : Pointer<Void>.fromAddress(0);
DurationMilliseconds? smokeDurationmillisecondsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeDurationmillisecondsFromFfi(handle) : null;
void smokeDurationmillisecondsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDurationmillisecondsReleaseHandle(handle);
// End of DurationMilliseconds "private" section.
