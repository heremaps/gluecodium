import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/payload.dart';
import 'package:library/src/smoke/with_payload_exception.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Errors {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static methodWithErrors() => Errors$Impl.methodWithErrors();
  static methodWithExternalErrors() => Errors$Impl.methodWithExternalErrors();
  static String methodWithErrorsAndReturnValue() => Errors$Impl.methodWithErrorsAndReturnValue();
  static methodWithPayloadError() => Errors$Impl.methodWithPayloadError();
  static String methodWithPayloadErrorAndReturnValue() => Errors$Impl.methodWithPayloadErrorAndReturnValue();
}
enum Errors_InternalErrorCode {
    errorNone,
    errorFatal
}
// Errors_InternalErrorCode "private" section, not exported.
int smoke_Errors_InternalErrorCode_toFfi(Errors_InternalErrorCode value) {
  switch (value) {
  case Errors_InternalErrorCode.errorNone:
    return 0;
  break;
  case Errors_InternalErrorCode.errorFatal:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Errors_InternalErrorCode enum.");
  }
}
Errors_InternalErrorCode smoke_Errors_InternalErrorCode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Errors_InternalErrorCode.errorNone;
  break;
  case 1:
    return Errors_InternalErrorCode.errorFatal;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Errors_InternalErrorCode enum.");
  }
}
void smoke_Errors_InternalErrorCode_releaseFfiHandle(int handle) {}
final _smoke_Errors_InternalErrorCodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Errors_InternalErrorCode_create_handle_nullable'));
final _smoke_Errors_InternalErrorCodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_InternalErrorCode_release_handle_nullable'));
final _smoke_Errors_InternalErrorCodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_InternalErrorCode_get_value_nullable'));
Pointer<Void> smoke_Errors_InternalErrorCode_toFfi_nullable(Errors_InternalErrorCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Errors_InternalErrorCode_toFfi(value);
  final result = _smoke_Errors_InternalErrorCodeCreateHandleNullable(_handle);
  smoke_Errors_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
Errors_InternalErrorCode smoke_Errors_InternalErrorCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Errors_InternalErrorCodeGetValueNullable(handle);
  final result = smoke_Errors_InternalErrorCode_fromFfi(_handle);
  smoke_Errors_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
void smoke_Errors_InternalErrorCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Errors_InternalErrorCodeReleaseHandleNullable(handle);
// End of Errors_InternalErrorCode "private" section.
enum Errors_ExternalErrors {
    none,
    boom,
    bust
}
// Errors_ExternalErrors "private" section, not exported.
int smoke_Errors_ExternalErrors_toFfi(Errors_ExternalErrors value) {
  switch (value) {
  case Errors_ExternalErrors.none:
    return 0;
  break;
  case Errors_ExternalErrors.boom:
    return 1;
  break;
  case Errors_ExternalErrors.bust:
    return 2;
  break;
  default:
    throw StateError("Invalid enum value $value for Errors_ExternalErrors enum.");
  }
}
Errors_ExternalErrors smoke_Errors_ExternalErrors_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Errors_ExternalErrors.none;
  break;
  case 1:
    return Errors_ExternalErrors.boom;
  break;
  case 2:
    return Errors_ExternalErrors.bust;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Errors_ExternalErrors enum.");
  }
}
void smoke_Errors_ExternalErrors_releaseFfiHandle(int handle) {}
final _smoke_Errors_ExternalErrorsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Errors_ExternalErrors_create_handle_nullable'));
final _smoke_Errors_ExternalErrorsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_ExternalErrors_release_handle_nullable'));
final _smoke_Errors_ExternalErrorsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_ExternalErrors_get_value_nullable'));
Pointer<Void> smoke_Errors_ExternalErrors_toFfi_nullable(Errors_ExternalErrors value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Errors_ExternalErrors_toFfi(value);
  final result = _smoke_Errors_ExternalErrorsCreateHandleNullable(_handle);
  smoke_Errors_ExternalErrors_releaseFfiHandle(_handle);
  return result;
}
Errors_ExternalErrors smoke_Errors_ExternalErrors_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Errors_ExternalErrorsGetValueNullable(handle);
  final result = smoke_Errors_ExternalErrors_fromFfi(_handle);
  smoke_Errors_ExternalErrors_releaseFfiHandle(_handle);
  return result;
}
void smoke_Errors_ExternalErrors_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Errors_ExternalErrorsReleaseHandleNullable(handle);
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
final _smokeErrorsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_copy_handle'));
final _smokeErrorsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_release_handle'));
final _methodWithErrorsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrors_return_release_handle'));
final _methodWithErrorsReturnGetResult = (Pointer) {};
final _methodWithErrorsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrors_return_get_error'));
final _methodWithErrorsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrors_return_has_error'));
final _methodWithExternalErrorsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithExternalErrors_return_release_handle'));
final _methodWithExternalErrorsReturnGetResult = (Pointer) {};
final _methodWithExternalErrorsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithExternalErrors_return_get_error'));
final _methodWithExternalErrorsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithExternalErrors_return_has_error'));
final _methodWithErrorsAndReturnValueReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_release_handle'));
final _methodWithErrorsAndReturnValueReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_get_result'));
final _methodWithErrorsAndReturnValueReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_get_error'));
final _methodWithErrorsAndReturnValueReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_has_error'));
final _methodWithPayloadErrorReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadError_return_release_handle'));
final _methodWithPayloadErrorReturnGetResult = (Pointer) {};
final _methodWithPayloadErrorReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadError_return_get_error'));
final _methodWithPayloadErrorReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadError_return_has_error'));
final _methodWithPayloadErrorAndReturnValueReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_release_handle'));
final _methodWithPayloadErrorAndReturnValueReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_get_result'));
final _methodWithPayloadErrorAndReturnValueReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_get_error'));
final _methodWithPayloadErrorAndReturnValueReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_has_error'));
class Errors$Impl extends __lib.NativeBase implements Errors {
  Errors$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeErrorsReleaseHandle(handle);
    handle = null;
  }
  static methodWithErrors() {
    final _methodWithErrorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithErrors'));
    final __callResultHandle = _methodWithErrorsFfi(__lib.LibraryContext.isolateId);
    if (_methodWithErrorsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithErrorsReturnGetError(__callResultHandle);
        _methodWithErrorsReturnReleaseHandle(__callResultHandle);
        try {
          throw Errors_InternalException(smoke_Errors_InternalErrorCode_fromFfi(__errorHandle));
        } finally {
          smoke_Errors_InternalErrorCode_releaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _methodWithErrorsReturnGetResult(__callResultHandle);
    _methodWithErrorsReturnReleaseHandle(__callResultHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static methodWithExternalErrors() {
    final _methodWithExternalErrorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithExternalErrors'));
    final __callResultHandle = _methodWithExternalErrorsFfi(__lib.LibraryContext.isolateId);
    if (_methodWithExternalErrorsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithExternalErrorsReturnGetError(__callResultHandle);
        _methodWithExternalErrorsReturnReleaseHandle(__callResultHandle);
        try {
          throw Errors_ExternalException(smoke_Errors_ExternalErrors_fromFfi(__errorHandle));
        } finally {
          smoke_Errors_ExternalErrors_releaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _methodWithExternalErrorsReturnGetResult(__callResultHandle);
    _methodWithExternalErrorsReturnReleaseHandle(__callResultHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static String methodWithErrorsAndReturnValue() {
    final _methodWithErrorsAndReturnValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithErrorsAndReturnValue'));
    final __callResultHandle = _methodWithErrorsAndReturnValueFfi(__lib.LibraryContext.isolateId);
    if (_methodWithErrorsAndReturnValueReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithErrorsAndReturnValueReturnGetError(__callResultHandle);
        _methodWithErrorsAndReturnValueReturnReleaseHandle(__callResultHandle);
        try {
          throw Errors_InternalException(smoke_Errors_InternalErrorCode_fromFfi(__errorHandle));
        } finally {
          smoke_Errors_InternalErrorCode_releaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _methodWithErrorsAndReturnValueReturnGetResult(__callResultHandle);
    _methodWithErrorsAndReturnValueReturnReleaseHandle(__callResultHandle);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
  static methodWithPayloadError() {
    final _methodWithPayloadErrorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithPayloadError'));
    final __callResultHandle = _methodWithPayloadErrorFfi(__lib.LibraryContext.isolateId);
    if (_methodWithPayloadErrorReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithPayloadErrorReturnGetError(__callResultHandle);
        _methodWithPayloadErrorReturnReleaseHandle(__callResultHandle);
        try {
          throw WithPayloadException(smoke_Payload_fromFfi(__errorHandle));
        } finally {
          smoke_Payload_releaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _methodWithPayloadErrorReturnGetResult(__callResultHandle);
    _methodWithPayloadErrorReturnReleaseHandle(__callResultHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  static String methodWithPayloadErrorAndReturnValue() {
    final _methodWithPayloadErrorAndReturnValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithPayloadErrorAndReturnValue'));
    final __callResultHandle = _methodWithPayloadErrorAndReturnValueFfi(__lib.LibraryContext.isolateId);
    if (_methodWithPayloadErrorAndReturnValueReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithPayloadErrorAndReturnValueReturnGetError(__callResultHandle);
        _methodWithPayloadErrorAndReturnValueReturnReleaseHandle(__callResultHandle);
        try {
          throw WithPayloadException(smoke_Payload_fromFfi(__errorHandle));
        } finally {
          smoke_Payload_releaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _methodWithPayloadErrorAndReturnValueReturnGetResult(__callResultHandle);
    _methodWithPayloadErrorAndReturnValueReturnReleaseHandle(__callResultHandle);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_Errors_toFfi(Errors value) =>
  _smokeErrorsCopyHandle((value as __lib.NativeBase).handle);
Errors smoke_Errors_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Errors;
  if (instance != null) return instance;
  final _copiedHandle = _smokeErrorsCopyHandle(handle);
  final result = Errors$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_Errors_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeErrorsReleaseHandle(handle);
Pointer<Void> smoke_Errors_toFfi_nullable(Errors value) =>
  value != null ? smoke_Errors_toFfi(value) : Pointer<Void>.fromAddress(0);
Errors smoke_Errors_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Errors_fromFfi(handle) : null;
void smoke_Errors_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeErrorsReleaseHandle(handle);
// End of Errors "private" section.
