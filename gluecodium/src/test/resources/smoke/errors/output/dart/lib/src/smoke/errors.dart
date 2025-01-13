

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/payload.dart';
import 'package:library/src/smoke/with_payload_exception.dart';
import 'package:meta/meta.dart';

abstract class Errors implements Finalizable {


  static void methodWithErrors() => $prototype.methodWithErrors();

  static void methodWithExternalErrors() => $prototype.methodWithExternalErrors();

  static String methodWithErrorsAndReturnValue() => $prototype.methodWithErrorsAndReturnValue();

  static void methodWithPayloadError() => $prototype.methodWithPayloadError();

  static String methodWithPayloadErrorAndReturnValue() => $prototype.methodWithPayloadErrorAndReturnValue();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Errors$Impl(Pointer<Void>.fromAddress(0));
}

enum Errors_InternalErrorCode {
    errorNone,
    errorFatal
}

// Errors_InternalErrorCode "private" section, not exported.

int smokeErrorsInternalerrorcodeToFfi(Errors_InternalErrorCode value) {
  switch (value) {
  case Errors_InternalErrorCode.errorNone:
    return 0;
  case Errors_InternalErrorCode.errorFatal:
    return 1;
  }
}

Errors_InternalErrorCode smokeErrorsInternalerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Errors_InternalErrorCode.errorNone;
  case 1:
    return Errors_InternalErrorCode.errorFatal;
  default:
    throw StateError("Invalid numeric value $handle for Errors_InternalErrorCode enum.");
  }
}

void smokeErrorsInternalerrorcodeReleaseFfiHandle(int handle) {}

final _smokeErrorsInternalerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Errors_InternalErrorCode_create_handle_nullable'));
final _smokeErrorsInternalerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_InternalErrorCode_release_handle_nullable'));
final _smokeErrorsInternalerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_InternalErrorCode_get_value_nullable'));

Pointer<Void> smokeErrorsInternalerrorcodeToFfiNullable(Errors_InternalErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeErrorsInternalerrorcodeToFfi(value);
  final result = _smokeErrorsInternalerrorcodeCreateHandleNullable(_handle);
  smokeErrorsInternalerrorcodeReleaseFfiHandle(_handle);
  return result;
}

Errors_InternalErrorCode? smokeErrorsInternalerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeErrorsInternalerrorcodeGetValueNullable(handle);
  final result = smokeErrorsInternalerrorcodeFromFfi(_handle);
  smokeErrorsInternalerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void smokeErrorsInternalerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeErrorsInternalerrorcodeReleaseHandleNullable(handle);

// End of Errors_InternalErrorCode "private" section.
enum Errors_ExternalErrors {
    none,
    boom,
    bust
}

// Errors_ExternalErrors "private" section, not exported.

int smokeErrorsExternalerrorsToFfi(Errors_ExternalErrors value) {
  switch (value) {
  case Errors_ExternalErrors.none:
    return 0;
  case Errors_ExternalErrors.boom:
    return 1;
  case Errors_ExternalErrors.bust:
    return 2;
  }
}

Errors_ExternalErrors smokeErrorsExternalerrorsFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Errors_ExternalErrors.none;
  case 1:
    return Errors_ExternalErrors.boom;
  case 2:
    return Errors_ExternalErrors.bust;
  default:
    throw StateError("Invalid numeric value $handle for Errors_ExternalErrors enum.");
  }
}

void smokeErrorsExternalerrorsReleaseFfiHandle(int handle) {}

final _smokeErrorsExternalerrorsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Errors_ExternalErrors_create_handle_nullable'));
final _smokeErrorsExternalerrorsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_ExternalErrors_release_handle_nullable'));
final _smokeErrorsExternalerrorsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_ExternalErrors_get_value_nullable'));

Pointer<Void> smokeErrorsExternalerrorsToFfiNullable(Errors_ExternalErrors? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeErrorsExternalerrorsToFfi(value);
  final result = _smokeErrorsExternalerrorsCreateHandleNullable(_handle);
  smokeErrorsExternalerrorsReleaseFfiHandle(_handle);
  return result;
}

Errors_ExternalErrors? smokeErrorsExternalerrorsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeErrorsExternalerrorsGetValueNullable(handle);
  final result = smokeErrorsExternalerrorsFromFfi(_handle);
  smokeErrorsExternalerrorsReleaseFfiHandle(_handle);
  return result;
}

void smokeErrorsExternalerrorsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeErrorsExternalerrorsReleaseHandleNullable(handle);

// End of Errors_ExternalErrors "private" section.
class Errors_InternalException implements Exception {
  final Errors_InternalErrorCode error;
  Errors_InternalException(this.error);
}
class Errors_ExternalException implements Exception {
  final Errors_ExternalErrors error;
  Errors_ExternalException(this.error);
}

// Errors "private" section, not exported.

final _smokeErrorsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Errors_register_finalizer'));
final _smokeErrorsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_copy_handle'));
final _smokeErrorsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_release_handle'));


final _methodWithErrorssmokeErrorsMethodwitherrorsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrors_return_release_handle'));
final _methodWithErrorssmokeErrorsMethodwitherrorsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrors_return_get_error'));
final _methodWithErrorssmokeErrorsMethodwitherrorsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrors_return_has_error'));


final _methodWithExternalErrorssmokeErrorsMethodwithexternalerrorsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithExternalErrors_return_release_handle'));
final _methodWithExternalErrorssmokeErrorsMethodwithexternalerrorsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithExternalErrors_return_get_error'));
final _methodWithExternalErrorssmokeErrorsMethodwithexternalerrorsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithExternalErrors_return_has_error'));


final _methodWithErrorsAndReturnValuesmokeErrorsMethodwitherrorsandreturnvalueReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_release_handle'));
final _methodWithErrorsAndReturnValuesmokeErrorsMethodwitherrorsandreturnvalueReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_get_result'));
final _methodWithErrorsAndReturnValuesmokeErrorsMethodwitherrorsandreturnvalueReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_get_error'));
final _methodWithErrorsAndReturnValuesmokeErrorsMethodwitherrorsandreturnvalueReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_has_error'));


final _methodWithPayloadErrorsmokeErrorsMethodwithpayloaderrorReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadError_return_release_handle'));
final _methodWithPayloadErrorsmokeErrorsMethodwithpayloaderrorReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadError_return_get_error'));
final _methodWithPayloadErrorsmokeErrorsMethodwithpayloaderrorReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadError_return_has_error'));


final _methodWithPayloadErrorAndReturnValuesmokeErrorsMethodwithpayloaderrorandreturnvalueReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_release_handle'));
final _methodWithPayloadErrorAndReturnValuesmokeErrorsMethodwithpayloaderrorandreturnvalueReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_get_result'));
final _methodWithPayloadErrorAndReturnValuesmokeErrorsMethodwithpayloaderrorandreturnvalueReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_get_error'));
final _methodWithPayloadErrorAndReturnValuesmokeErrorsMethodwithpayloaderrorandreturnvalueReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_has_error'));


/// @nodoc
@visibleForTesting
class Errors$Impl extends __lib.NativeBase implements Errors {

  Errors$Impl(Pointer<Void> handle) : super(handle);

  void methodWithErrors() {
    final _methodWithErrorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithErrors'));
    final __callResultHandle = _methodWithErrorsFfi(__lib.LibraryContext.isolateId);
    if (_methodWithErrorssmokeErrorsMethodwitherrorsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithErrorssmokeErrorsMethodwitherrorsReturnGetError(__callResultHandle);
        _methodWithErrorssmokeErrorsMethodwitherrorsReturnReleaseHandle(__callResultHandle);
        try {
          throw Errors_InternalException(smokeErrorsInternalerrorcodeFromFfi(__errorHandle));
        } finally {
          smokeErrorsInternalerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    _methodWithErrorssmokeErrorsMethodwitherrorsReturnReleaseHandle(__callResultHandle);

  }

  void methodWithExternalErrors() {
    final _methodWithExternalErrorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithExternalErrors'));
    final __callResultHandle = _methodWithExternalErrorsFfi(__lib.LibraryContext.isolateId);
    if (_methodWithExternalErrorssmokeErrorsMethodwithexternalerrorsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithExternalErrorssmokeErrorsMethodwithexternalerrorsReturnGetError(__callResultHandle);
        _methodWithExternalErrorssmokeErrorsMethodwithexternalerrorsReturnReleaseHandle(__callResultHandle);
        try {
          throw Errors_ExternalException(smokeErrorsExternalerrorsFromFfi(__errorHandle));
        } finally {
          smokeErrorsExternalerrorsReleaseFfiHandle(__errorHandle);
        }
    }
    _methodWithExternalErrorssmokeErrorsMethodwithexternalerrorsReturnReleaseHandle(__callResultHandle);

  }

  String methodWithErrorsAndReturnValue() {
    final _methodWithErrorsAndReturnValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithErrorsAndReturnValue'));
    final __callResultHandle = _methodWithErrorsAndReturnValueFfi(__lib.LibraryContext.isolateId);
    if (_methodWithErrorsAndReturnValuesmokeErrorsMethodwitherrorsandreturnvalueReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithErrorsAndReturnValuesmokeErrorsMethodwitherrorsandreturnvalueReturnGetError(__callResultHandle);
        _methodWithErrorsAndReturnValuesmokeErrorsMethodwitherrorsandreturnvalueReturnReleaseHandle(__callResultHandle);
        try {
          throw Errors_InternalException(smokeErrorsInternalerrorcodeFromFfi(__errorHandle));
        } finally {
          smokeErrorsInternalerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _methodWithErrorsAndReturnValuesmokeErrorsMethodwitherrorsandreturnvalueReturnGetResult(__callResultHandle);
    _methodWithErrorsAndReturnValuesmokeErrorsMethodwitherrorsandreturnvalueReturnReleaseHandle(__callResultHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  void methodWithPayloadError() {
    final _methodWithPayloadErrorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithPayloadError'));
    final __callResultHandle = _methodWithPayloadErrorFfi(__lib.LibraryContext.isolateId);
    if (_methodWithPayloadErrorsmokeErrorsMethodwithpayloaderrorReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithPayloadErrorsmokeErrorsMethodwithpayloaderrorReturnGetError(__callResultHandle);
        _methodWithPayloadErrorsmokeErrorsMethodwithpayloaderrorReturnReleaseHandle(__callResultHandle);
        try {
          throw WithPayloadException(smokePayloadFromFfi(__errorHandle));
        } finally {
          smokePayloadReleaseFfiHandle(__errorHandle);
        }
    }
    _methodWithPayloadErrorsmokeErrorsMethodwithpayloaderrorReturnReleaseHandle(__callResultHandle);

  }

  String methodWithPayloadErrorAndReturnValue() {
    final _methodWithPayloadErrorAndReturnValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithPayloadErrorAndReturnValue'));
    final __callResultHandle = _methodWithPayloadErrorAndReturnValueFfi(__lib.LibraryContext.isolateId);
    if (_methodWithPayloadErrorAndReturnValuesmokeErrorsMethodwithpayloaderrorandreturnvalueReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithPayloadErrorAndReturnValuesmokeErrorsMethodwithpayloaderrorandreturnvalueReturnGetError(__callResultHandle);
        _methodWithPayloadErrorAndReturnValuesmokeErrorsMethodwithpayloaderrorandreturnvalueReturnReleaseHandle(__callResultHandle);
        try {
          throw WithPayloadException(smokePayloadFromFfi(__errorHandle));
        } finally {
          smokePayloadReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _methodWithPayloadErrorAndReturnValuesmokeErrorsMethodwithpayloaderrorandreturnvalueReturnGetResult(__callResultHandle);
    _methodWithPayloadErrorAndReturnValuesmokeErrorsMethodwithpayloaderrorandreturnvalueReturnReleaseHandle(__callResultHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> smokeErrorsToFfi(Errors value) =>
  _smokeErrorsCopyHandle((value as __lib.NativeBase).handle);

Errors smokeErrorsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Errors) return instance;

  final _copiedHandle = _smokeErrorsCopyHandle(handle);
  final result = Errors$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeErrorsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeErrorsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeErrorsReleaseHandle(handle);

Pointer<Void> smokeErrorsToFfiNullable(Errors? value) =>
  value != null ? smokeErrorsToFfi(value) : Pointer<Void>.fromAddress(0);

Errors? smokeErrorsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeErrorsFromFfi(handle) : null;

void smokeErrorsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeErrorsReleaseHandle(handle);

// End of Errors "private" section.


