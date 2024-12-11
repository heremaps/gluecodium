

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';

abstract class ExternalClass implements Finalizable {

  factory ExternalClass() => $prototype.$init();


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = ExternalClass$Impl(Pointer<Void>.fromAddress(0));
}

enum ExternalClass_ErrorEnum {
    none,
    crashed
}

// ExternalClass_ErrorEnum "private" section, not exported.

int smokeExternalclassErrorenumToFfi(ExternalClass_ErrorEnum value) {
  switch (value) {
  case ExternalClass_ErrorEnum.none:
    return 0;
  case ExternalClass_ErrorEnum.crashed:
    return 1;
  default:
    throw StateError("Invalid enum value $value for ExternalClass_ErrorEnum enum.");
  }
}

ExternalClass_ErrorEnum smokeExternalclassErrorenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExternalClass_ErrorEnum.none;
  case 1:
    return ExternalClass_ErrorEnum.crashed;
  default:
    throw StateError("Invalid numeric value $handle for ExternalClass_ErrorEnum enum.");
  }
}

void smokeExternalclassErrorenumReleaseFfiHandle(int handle) {}

final _smokeExternalclassErrorenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExternalClass_ErrorEnum_create_handle_nullable'));
final _smokeExternalclassErrorenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_ErrorEnum_release_handle_nullable'));
final _smokeExternalclassErrorenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalClass_ErrorEnum_get_value_nullable'));

Pointer<Void> smokeExternalclassErrorenumToFfiNullable(ExternalClass_ErrorEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeExternalclassErrorenumToFfi(value);
  final result = _smokeExternalclassErrorenumCreateHandleNullable(_handle);
  smokeExternalclassErrorenumReleaseFfiHandle(_handle);
  return result;
}

ExternalClass_ErrorEnum? smokeExternalclassErrorenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeExternalclassErrorenumGetValueNullable(handle);
  final result = smokeExternalclassErrorenumFromFfi(_handle);
  smokeExternalclassErrorenumReleaseFfiHandle(_handle);
  return result;
}

void smokeExternalclassErrorenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExternalclassErrorenumReleaseHandleNullable(handle);

// End of ExternalClass_ErrorEnum "private" section.
class ExternalClass_ConstructorExplodedException implements Exception {
  final ExternalClass_ErrorEnum error;
  ExternalClass_ConstructorExplodedException(this.error);
}
abstract class ExternalClass_InternalOne implements Finalizable {

  factory ExternalClass_InternalOne() => $prototype.$init();

  factory ExternalClass_InternalOne.WithParameter(int value) => $prototype.WithParameter(value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = ExternalClass_InternalOne$Impl(Pointer<Void>.fromAddress(0));
}


// ExternalClass_InternalOne "private" section, not exported.

final _smokeExternalclassInternaloneRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ExternalClass_InternalOne_register_finalizer'));
final _smokeExternalclassInternaloneCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalOne_copy_handle'));
final _smokeExternalclassInternaloneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalOne_release_handle'));


final _$initsmokeExternalclassInternaloneCreateReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalOne_create_return_release_handle'));
final _$initsmokeExternalclassInternaloneCreateReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalOne_create_return_get_result'));
final _$initsmokeExternalclassInternaloneCreateReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalOne_create_return_get_error'));
final _$initsmokeExternalclassInternaloneCreateReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalOne_create_return_has_error'));


final _WithParametersmokeExternalclassInternaloneCreateUlongReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalOne_create__ULong_return_release_handle'));
final _WithParametersmokeExternalclassInternaloneCreateUlongReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalOne_create__ULong_return_get_result'));
final _WithParametersmokeExternalclassInternaloneCreateUlongReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalOne_create__ULong_return_get_error'));
final _WithParametersmokeExternalclassInternaloneCreateUlongReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalOne_create__ULong_return_has_error'));


/// @nodoc
@visibleForTesting
class ExternalClass_InternalOne$Impl extends __lib.NativeBase implements ExternalClass_InternalOne {

  ExternalClass_InternalOne$Impl(Pointer<Void> handle) : super(handle);


  ExternalClass_InternalOne $init() {
    final _result_handle = _$init();
    final _result = ExternalClass_InternalOne$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeExternalclassInternaloneRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  ExternalClass_InternalOne WithParameter(int value) {
    final _result_handle = _WithParameter(value);
    final _result = ExternalClass_InternalOne$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeExternalclassInternaloneRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_ExternalClass_InternalOne_create'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initsmokeExternalclassInternaloneCreateReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsmokeExternalclassInternaloneCreateReturnGetError(__callResultHandle);
        _$initsmokeExternalclassInternaloneCreateReturnReleaseHandle(__callResultHandle);
        try {
          throw ExternalClass_ConstructorExplodedException(smokeExternalclassErrorenumFromFfi(__errorHandle));
        } finally {
          smokeExternalclassErrorenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsmokeExternalclassInternaloneCreateReturnGetResult(__callResultHandle);
    _$initsmokeExternalclassInternaloneCreateReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _WithParameter(int value) {
    final _WithParameterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint64), Pointer<Void> Function(int, int)>('library_smoke_ExternalClass_InternalOne_create__ULong'));
    final _valueHandle = (value);
    final __callResultHandle = _WithParameterFfi(__lib.LibraryContext.isolateId, _valueHandle);

    if (_WithParametersmokeExternalclassInternaloneCreateUlongReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _WithParametersmokeExternalclassInternaloneCreateUlongReturnGetError(__callResultHandle);
        _WithParametersmokeExternalclassInternaloneCreateUlongReturnReleaseHandle(__callResultHandle);
        try {
          throw ExternalClass_ConstructorExplodedException(smokeExternalclassErrorenumFromFfi(__errorHandle));
        } finally {
          smokeExternalclassErrorenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _WithParametersmokeExternalclassInternaloneCreateUlongReturnGetResult(__callResultHandle);
    _WithParametersmokeExternalclassInternaloneCreateUlongReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }


}

Pointer<Void> smokeExternalclassInternaloneToFfi(ExternalClass_InternalOne value) =>
  _smokeExternalclassInternaloneCopyHandle((value as __lib.NativeBase).handle);

ExternalClass_InternalOne smokeExternalclassInternaloneFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ExternalClass_InternalOne) return instance;

  final _copiedHandle = _smokeExternalclassInternaloneCopyHandle(handle);
  final result = ExternalClass_InternalOne$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeExternalclassInternaloneRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeExternalclassInternaloneReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeExternalclassInternaloneReleaseHandle(handle);

Pointer<Void> smokeExternalclassInternaloneToFfiNullable(ExternalClass_InternalOne? value) =>
  value != null ? smokeExternalclassInternaloneToFfi(value) : Pointer<Void>.fromAddress(0);

ExternalClass_InternalOne? smokeExternalclassInternaloneFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeExternalclassInternaloneFromFfi(handle) : null;

void smokeExternalclassInternaloneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExternalclassInternaloneReleaseHandle(handle);

// End of ExternalClass_InternalOne "private" section.
abstract class ExternalClass_InternalTwo implements Finalizable {

  factory ExternalClass_InternalTwo() => $prototype.$init();


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = ExternalClass_InternalTwo$Impl(Pointer<Void>.fromAddress(0));
}


// ExternalClass_InternalTwo "private" section, not exported.

final _smokeExternalclassInternaltwoRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ExternalClass_InternalTwo_register_finalizer'));
final _smokeExternalclassInternaltwoCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalTwo_copy_handle'));
final _smokeExternalclassInternaltwoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalTwo_release_handle'));


final _$initsmokeExternalclassInternaltwoCreateReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalTwo_create_return_release_handle'));
final _$initsmokeExternalclassInternaltwoCreateReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalTwo_create_return_get_result'));
final _$initsmokeExternalclassInternaltwoCreateReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalTwo_create_return_get_error'));
final _$initsmokeExternalclassInternaltwoCreateReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalClass_InternalTwo_create_return_has_error'));


/// @nodoc
@visibleForTesting
class ExternalClass_InternalTwo$Impl extends __lib.NativeBase implements ExternalClass_InternalTwo {

  ExternalClass_InternalTwo$Impl(Pointer<Void> handle) : super(handle);


  ExternalClass_InternalTwo $init() {
    final _result_handle = _$init();
    final _result = ExternalClass_InternalTwo$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeExternalclassInternaltwoRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_ExternalClass_InternalTwo_create'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initsmokeExternalclassInternaltwoCreateReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsmokeExternalclassInternaltwoCreateReturnGetError(__callResultHandle);
        _$initsmokeExternalclassInternaltwoCreateReturnReleaseHandle(__callResultHandle);
        try {
          throw ExternalClass_ConstructorExplodedException(smokeExternalclassErrorenumFromFfi(__errorHandle));
        } finally {
          smokeExternalclassErrorenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsmokeExternalclassInternaltwoCreateReturnGetResult(__callResultHandle);
    _$initsmokeExternalclassInternaltwoCreateReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }


}

Pointer<Void> smokeExternalclassInternaltwoToFfi(ExternalClass_InternalTwo value) =>
  _smokeExternalclassInternaltwoCopyHandle((value as __lib.NativeBase).handle);

ExternalClass_InternalTwo smokeExternalclassInternaltwoFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ExternalClass_InternalTwo) return instance;

  final _copiedHandle = _smokeExternalclassInternaltwoCopyHandle(handle);
  final result = ExternalClass_InternalTwo$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeExternalclassInternaltwoRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeExternalclassInternaltwoReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeExternalclassInternaltwoReleaseHandle(handle);

Pointer<Void> smokeExternalclassInternaltwoToFfiNullable(ExternalClass_InternalTwo? value) =>
  value != null ? smokeExternalclassInternaltwoToFfi(value) : Pointer<Void>.fromAddress(0);

ExternalClass_InternalTwo? smokeExternalclassInternaltwoFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeExternalclassInternaltwoFromFfi(handle) : null;

void smokeExternalclassInternaltwoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExternalclassInternaltwoReleaseHandle(handle);

// End of ExternalClass_InternalTwo "private" section.

// ExternalClass "private" section, not exported.

final _smokeExternalclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ExternalClass_register_finalizer'));
final _smokeExternalclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_copy_handle'));
final _smokeExternalclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_release_handle'));
final _smokeExternalclassGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_get_type_id'));


final _$initsmokeExternalclassCreateReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_create_return_release_handle'));
final _$initsmokeExternalclassCreateReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_create_return_get_result'));
final _$initsmokeExternalclassCreateReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalClass_create_return_get_error'));
final _$initsmokeExternalclassCreateReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalClass_create_return_has_error'));


/// @nodoc
@visibleForTesting
class ExternalClass$Impl extends __lib.NativeBase implements ExternalClass {

  ExternalClass$Impl(Pointer<Void> handle) : super(handle);


  ExternalClass $init() {
    final _result_handle = _$init();
    final _result = ExternalClass$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeExternalclassRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_ExternalClass_create'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initsmokeExternalclassCreateReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsmokeExternalclassCreateReturnGetError(__callResultHandle);
        _$initsmokeExternalclassCreateReturnReleaseHandle(__callResultHandle);
        try {
          throw ExternalClass_ConstructorExplodedException(smokeExternalclassErrorenumFromFfi(__errorHandle));
        } finally {
          smokeExternalclassErrorenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsmokeExternalclassCreateReturnGetResult(__callResultHandle);
    _$initsmokeExternalclassCreateReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }


}

Pointer<Void> smokeExternalclassToFfi(ExternalClass value) =>
  _smokeExternalclassCopyHandle((value as __lib.NativeBase).handle);

ExternalClass smokeExternalclassFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ExternalClass) return instance;

  final _typeIdHandle = _smokeExternalclassGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeExternalclassCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ExternalClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeExternalclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeExternalclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeExternalclassReleaseHandle(handle);

Pointer<Void> smokeExternalclassToFfiNullable(ExternalClass? value) =>
  value != null ? smokeExternalclassToFfi(value) : Pointer<Void>.fromAddress(0);

ExternalClass? smokeExternalclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeExternalclassFromFfi(handle) : null;

void smokeExternalclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExternalclassReleaseHandle(handle);

// End of ExternalClass "private" section.


