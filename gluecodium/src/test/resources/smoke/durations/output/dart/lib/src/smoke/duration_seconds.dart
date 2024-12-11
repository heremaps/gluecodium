

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

abstract class DurationSeconds implements Finalizable {


  Duration durationFunction(Duration input);

  Duration? nullableDurationFunction(Duration? input);
  Duration get durationProperty;
  set durationProperty(Duration value);

}


class DurationSeconds_DurationStruct {
  Duration durationField;

  DurationSeconds_DurationStruct(this.durationField);
}


// DurationSeconds_DurationStruct "private" section, not exported.

final _smokeDurationsecondsDurationstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('library_smoke_DurationSeconds_DurationStruct_create_handle'));
final _smokeDurationsecondsDurationstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DurationSeconds_DurationStruct_release_handle'));
final _smokeDurationsecondsDurationstructGetFielddurationField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DurationSeconds_DurationStruct_get_field_durationField'));



Pointer<Void> smokeDurationsecondsDurationstructToFfi(DurationSeconds_DurationStruct value) {
  final _durationFieldHandle = durationToFfi(value.durationField);
  final _result = _smokeDurationsecondsDurationstructCreateHandle(_durationFieldHandle);
  durationReleaseFfiHandle(_durationFieldHandle);
  return _result;
}

DurationSeconds_DurationStruct smokeDurationsecondsDurationstructFromFfi(Pointer<Void> handle) {
  final _durationFieldHandle = _smokeDurationsecondsDurationstructGetFielddurationField(handle);
  try {
    return DurationSeconds_DurationStruct(
      durationFromFfi(_durationFieldHandle)
    );
  } finally {
    durationReleaseFfiHandle(_durationFieldHandle);
  }
}

void smokeDurationsecondsDurationstructReleaseFfiHandle(Pointer<Void> handle) => _smokeDurationsecondsDurationstructReleaseHandle(handle);

// Nullable DurationSeconds_DurationStruct

final _smokeDurationsecondsDurationstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DurationSeconds_DurationStruct_create_handle_nullable'));
final _smokeDurationsecondsDurationstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DurationSeconds_DurationStruct_release_handle_nullable'));
final _smokeDurationsecondsDurationstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DurationSeconds_DurationStruct_get_value_nullable'));

Pointer<Void> smokeDurationsecondsDurationstructToFfiNullable(DurationSeconds_DurationStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDurationsecondsDurationstructToFfi(value);
  final result = _smokeDurationsecondsDurationstructCreateHandleNullable(_handle);
  smokeDurationsecondsDurationstructReleaseFfiHandle(_handle);
  return result;
}

DurationSeconds_DurationStruct? smokeDurationsecondsDurationstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDurationsecondsDurationstructGetValueNullable(handle);
  final result = smokeDurationsecondsDurationstructFromFfi(_handle);
  smokeDurationsecondsDurationstructReleaseFfiHandle(_handle);
  return result;
}

void smokeDurationsecondsDurationstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDurationsecondsDurationstructReleaseHandleNullable(handle);

// End of DurationSeconds_DurationStruct "private" section.

// DurationSeconds "private" section, not exported.

final _smokeDurationsecondsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_DurationSeconds_register_finalizer'));
final _smokeDurationsecondsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DurationSeconds_copy_handle'));
final _smokeDurationsecondsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DurationSeconds_release_handle'));




class DurationSeconds$Impl extends __lib.NativeBase implements DurationSeconds {

  DurationSeconds$Impl(Pointer<Void> handle) : super(handle);

  @override
  Duration durationFunction(Duration input) {
    final _durationFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32, Uint64), int Function(Pointer<Void>, int, int)>('library_smoke_DurationSeconds_durationFunction__Duration'));
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
    final _nullableDurationFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_DurationSeconds_nullableDurationFunction__Duration_'));
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
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_DurationSeconds_durationProperty_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint64), void Function(Pointer<Void>, int, int)>('library_smoke_DurationSeconds_durationProperty_set__Duration'));
    final _valueHandle = durationToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    durationReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> smokeDurationsecondsToFfi(DurationSeconds value) =>
  _smokeDurationsecondsCopyHandle((value as __lib.NativeBase).handle);

DurationSeconds smokeDurationsecondsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DurationSeconds) return instance;

  final _copiedHandle = _smokeDurationsecondsCopyHandle(handle);
  final result = DurationSeconds$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeDurationsecondsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeDurationsecondsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeDurationsecondsReleaseHandle(handle);

Pointer<Void> smokeDurationsecondsToFfiNullable(DurationSeconds? value) =>
  value != null ? smokeDurationsecondsToFfi(value) : Pointer<Void>.fromAddress(0);

DurationSeconds? smokeDurationsecondsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeDurationsecondsFromFfi(handle) : null;

void smokeDurationsecondsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDurationsecondsReleaseHandle(handle);

// End of DurationSeconds "private" section.


