import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/payload.dart';
import 'package:library/src/smoke/with_payload_exception.dart';
import 'package:meta/meta.dart';
abstract class ErrorsInterface {
  factory ErrorsInterface(
    void Function() methodWithErrorsLambda,
    void Function() methodWithExternalErrorsLambda,
    String Function() methodWithErrorsAndReturnValueLambda,
  ) => ErrorsInterface$Lambdas(
    methodWithErrorsLambda,
    methodWithExternalErrorsLambda,
    methodWithErrorsAndReturnValueLambda,
  );
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
  void methodWithErrors();
  void methodWithExternalErrors();
  String methodWithErrorsAndReturnValue();
  static void methodWithPayloadError() => $prototype.methodWithPayloadError();
  static String methodWithPayloadErrorAndReturnValue() => $prototype.methodWithPayloadErrorAndReturnValue();
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = ErrorsInterface$Impl(Pointer<Void>.fromAddress(0));
}
enum ErrorsInterface_InternalError {
    errorNone,
    errorFatal
}
// ErrorsInterface_InternalError "private" section, not exported.
int smokeErrorsinterfaceInternalerrorToFfi(ErrorsInterface_InternalError value) {
  switch (value) {
  case ErrorsInterface_InternalError.errorNone:
    return 0;
  case ErrorsInterface_InternalError.errorFatal:
    return 1;
  default:
    throw StateError("Invalid enum value $value for ErrorsInterface_InternalError enum.");
  }
}
ErrorsInterface_InternalError smokeErrorsinterfaceInternalerrorFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ErrorsInterface_InternalError.errorNone;
  case 1:
    return ErrorsInterface_InternalError.errorFatal;
  default:
    throw StateError("Invalid numeric value $handle for ErrorsInterface_InternalError enum.");
  }
}
void smokeErrorsinterfaceInternalerrorReleaseFfiHandle(int handle) {}
final _smokeErrorsinterfaceInternalerrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ErrorsInterface_InternalError_create_handle_nullable'));
final _smokeErrorsinterfaceInternalerrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_InternalError_release_handle_nullable'));
final _smokeErrorsinterfaceInternalerrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_InternalError_get_value_nullable'));
Pointer<Void> smokeErrorsinterfaceInternalerrorToFfiNullable(ErrorsInterface_InternalError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeErrorsinterfaceInternalerrorToFfi(value);
  final result = _smokeErrorsinterfaceInternalerrorCreateHandleNullable(_handle);
  smokeErrorsinterfaceInternalerrorReleaseFfiHandle(_handle);
  return result;
}
ErrorsInterface_InternalError? smokeErrorsinterfaceInternalerrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeErrorsinterfaceInternalerrorGetValueNullable(handle);
  final result = smokeErrorsinterfaceInternalerrorFromFfi(_handle);
  smokeErrorsinterfaceInternalerrorReleaseFfiHandle(_handle);
  return result;
}
void smokeErrorsinterfaceInternalerrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeErrorsinterfaceInternalerrorReleaseHandleNullable(handle);
// End of ErrorsInterface_InternalError "private" section.
enum ErrorsInterface_ExternalErrors {
    none,
    boom,
    bust
}
// ErrorsInterface_ExternalErrors "private" section, not exported.
int smokeErrorsinterfaceExternalerrorsToFfi(ErrorsInterface_ExternalErrors value) {
  switch (value) {
  case ErrorsInterface_ExternalErrors.none:
    return 0;
  case ErrorsInterface_ExternalErrors.boom:
    return 1;
  case ErrorsInterface_ExternalErrors.bust:
    return 2;
  default:
    throw StateError("Invalid enum value $value for ErrorsInterface_ExternalErrors enum.");
  }
}
ErrorsInterface_ExternalErrors smokeErrorsinterfaceExternalerrorsFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ErrorsInterface_ExternalErrors.none;
  case 1:
    return ErrorsInterface_ExternalErrors.boom;
  case 2:
    return ErrorsInterface_ExternalErrors.bust;
  default:
    throw StateError("Invalid numeric value $handle for ErrorsInterface_ExternalErrors enum.");
  }
}
void smokeErrorsinterfaceExternalerrorsReleaseFfiHandle(int handle) {}
final _smokeErrorsinterfaceExternalerrorsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ErrorsInterface_ExternalErrors_create_handle_nullable'));
final _smokeErrorsinterfaceExternalerrorsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_ExternalErrors_release_handle_nullable'));
final _smokeErrorsinterfaceExternalerrorsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_ExternalErrors_get_value_nullable'));
Pointer<Void> smokeErrorsinterfaceExternalerrorsToFfiNullable(ErrorsInterface_ExternalErrors? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeErrorsinterfaceExternalerrorsToFfi(value);
  final result = _smokeErrorsinterfaceExternalerrorsCreateHandleNullable(_handle);
  smokeErrorsinterfaceExternalerrorsReleaseFfiHandle(_handle);
  return result;
}
ErrorsInterface_ExternalErrors? smokeErrorsinterfaceExternalerrorsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeErrorsinterfaceExternalerrorsGetValueNullable(handle);
  final result = smokeErrorsinterfaceExternalerrorsFromFfi(_handle);
  smokeErrorsinterfaceExternalerrorsReleaseFfiHandle(_handle);
  return result;
}
void smokeErrorsinterfaceExternalerrorsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeErrorsinterfaceExternalerrorsReleaseHandleNullable(handle);
// End of ErrorsInterface_ExternalErrors "private" section.
class ErrorsInterface_InternalException implements Exception {
  final ErrorsInterface_InternalError error;
  ErrorsInterface_InternalException(this.error);
}
class ErrorsInterface_ExternalException implements Exception {
  final ErrorsInterface_ExternalErrors error;
  ErrorsInterface_ExternalException(this.error);
}
// ErrorsInterface "private" section, not exported.
final _smokeErrorsinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ErrorsInterface_register_finalizer'));
final _smokeErrorsinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_copy_handle'));
final _smokeErrorsinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_release_handle'));
final _smokeErrorsinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('library_smoke_ErrorsInterface_create_proxy'));
final _smokeErrorsinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_get_type_id'));
final _methodWithErrorsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrors_return_release_handle'));
final _methodWithErrorsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrors_return_get_error'));
final _methodWithErrorsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrors_return_has_error'));
final _methodWithExternalErrorsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithExternalErrors_return_release_handle'));
final _methodWithExternalErrorsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithExternalErrors_return_get_error'));
final _methodWithExternalErrorsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithExternalErrors_return_has_error'));
final _methodWithErrorsAndReturnValueReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_release_handle'));
final _methodWithErrorsAndReturnValueReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_get_result'));
final _methodWithErrorsAndReturnValueReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_get_error'));
final _methodWithErrorsAndReturnValueReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_has_error'));
final _methodWithPayloadErrorReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadError_return_release_handle'));
final _methodWithPayloadErrorReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadError_return_get_error'));
final _methodWithPayloadErrorReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadError_return_has_error'));
final _methodWithPayloadErrorAndReturnValueReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_return_release_handle'));
final _methodWithPayloadErrorAndReturnValueReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_return_get_result'));
final _methodWithPayloadErrorAndReturnValueReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_return_get_error'));
final _methodWithPayloadErrorAndReturnValueReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_return_has_error'));
class ErrorsInterface$Lambdas implements ErrorsInterface {
  void Function() methodWithErrorsLambda;
  void Function() methodWithExternalErrorsLambda;
  String Function() methodWithErrorsAndReturnValueLambda;
  ErrorsInterface$Lambdas(
    this.methodWithErrorsLambda,
    this.methodWithExternalErrorsLambda,
    this.methodWithErrorsAndReturnValueLambda,
  );
  @override
  void release() {}
  @override
  void methodWithErrors() =>
    methodWithErrorsLambda();
  @override
  void methodWithExternalErrors() =>
    methodWithExternalErrorsLambda();
  @override
  String methodWithErrorsAndReturnValue() =>
    methodWithErrorsAndReturnValueLambda();
}
/// @nodoc
@visibleForTesting
class ErrorsInterface$Impl extends __lib.NativeBase implements ErrorsInterface {
  ErrorsInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  void methodWithErrors() {
    final _methodWithErrorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ErrorsInterface_methodWithErrors'));
    final _handle = this.handle;
    final __callResultHandle = _methodWithErrorsFfi(_handle, __lib.LibraryContext.isolateId);
    if (_methodWithErrorsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithErrorsReturnGetError(__callResultHandle);
        _methodWithErrorsReturnReleaseHandle(__callResultHandle);
        try {
          throw ErrorsInterface_InternalException(smokeErrorsinterfaceInternalerrorFromFfi(__errorHandle));
        } finally {
          smokeErrorsinterfaceInternalerrorReleaseFfiHandle(__errorHandle);
        }
    }
    _methodWithErrorsReturnReleaseHandle(__callResultHandle);
  }
  @override
  void methodWithExternalErrors() {
    final _methodWithExternalErrorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ErrorsInterface_methodWithExternalErrors'));
    final _handle = this.handle;
    final __callResultHandle = _methodWithExternalErrorsFfi(_handle, __lib.LibraryContext.isolateId);
    if (_methodWithExternalErrorsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithExternalErrorsReturnGetError(__callResultHandle);
        _methodWithExternalErrorsReturnReleaseHandle(__callResultHandle);
        try {
          throw ErrorsInterface_ExternalException(smokeErrorsinterfaceExternalerrorsFromFfi(__errorHandle));
        } finally {
          smokeErrorsinterfaceExternalerrorsReleaseFfiHandle(__errorHandle);
        }
    }
    _methodWithExternalErrorsReturnReleaseHandle(__callResultHandle);
  }
  @override
  String methodWithErrorsAndReturnValue() {
    final _methodWithErrorsAndReturnValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue'));
    final _handle = this.handle;
    final __callResultHandle = _methodWithErrorsAndReturnValueFfi(_handle, __lib.LibraryContext.isolateId);
    if (_methodWithErrorsAndReturnValueReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithErrorsAndReturnValueReturnGetError(__callResultHandle);
        _methodWithErrorsAndReturnValueReturnReleaseHandle(__callResultHandle);
        try {
          throw ErrorsInterface_InternalException(smokeErrorsinterfaceInternalerrorFromFfi(__errorHandle));
        } finally {
          smokeErrorsinterfaceInternalerrorReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _methodWithErrorsAndReturnValueReturnGetResult(__callResultHandle);
    _methodWithErrorsAndReturnValueReturnReleaseHandle(__callResultHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  void methodWithPayloadError() {
    final _methodWithPayloadErrorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_ErrorsInterface_methodWithPayloadError'));
    final __callResultHandle = _methodWithPayloadErrorFfi(__lib.LibraryContext.isolateId);
    if (_methodWithPayloadErrorReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithPayloadErrorReturnGetError(__callResultHandle);
        _methodWithPayloadErrorReturnReleaseHandle(__callResultHandle);
        try {
          throw WithPayloadException(smokePayloadFromFfi(__errorHandle));
        } finally {
          smokePayloadReleaseFfiHandle(__errorHandle);
        }
    }
    _methodWithPayloadErrorReturnReleaseHandle(__callResultHandle);
  }
  @override
  String methodWithPayloadErrorAndReturnValue() {
    final _methodWithPayloadErrorAndReturnValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue'));
    final __callResultHandle = _methodWithPayloadErrorAndReturnValueFfi(__lib.LibraryContext.isolateId);
    if (_methodWithPayloadErrorAndReturnValueReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithPayloadErrorAndReturnValueReturnGetError(__callResultHandle);
        _methodWithPayloadErrorAndReturnValueReturnReleaseHandle(__callResultHandle);
        try {
          throw WithPayloadException(smokePayloadFromFfi(__errorHandle));
        } finally {
          smokePayloadReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _methodWithPayloadErrorAndReturnValueReturnGetResult(__callResultHandle);
    _methodWithPayloadErrorAndReturnValueReturnReleaseHandle(__callResultHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeErrorsinterfacemethodWithErrorsStatic(Object _obj, Pointer<Uint32> _error) {
  bool _errorFlag = false;
  try {
    (_obj as ErrorsInterface).methodWithErrors();
  } on ErrorsInterface_InternalException catch(e) {
    _errorFlag = true;
    final _errorObject = e.error;
    _error.value = smokeErrorsinterfaceInternalerrorToFfi(_errorObject);
  } finally {
  }
  return _errorFlag ? 1 : 0;
}
int _smokeErrorsinterfacemethodWithExternalErrorsStatic(Object _obj, Pointer<Uint32> _error) {
  bool _errorFlag = false;
  try {
    (_obj as ErrorsInterface).methodWithExternalErrors();
  } on ErrorsInterface_ExternalException catch(e) {
    _errorFlag = true;
    final _errorObject = e.error;
    _error.value = smokeErrorsinterfaceExternalerrorsToFfi(_errorObject);
  } finally {
  }
  return _errorFlag ? 1 : 0;
}
int _smokeErrorsinterfacemethodWithErrorsAndReturnValueStatic(Object _obj, Pointer<Pointer<Void>> _result, Pointer<Uint32> _error) {
  bool _errorFlag = false;
  String? _resultObject;
  try {
    _resultObject = (_obj as ErrorsInterface).methodWithErrorsAndReturnValue();
    _result.value = stringToFfi(_resultObject);
  } on ErrorsInterface_InternalException catch(e) {
    _errorFlag = true;
    final _errorObject = e.error;
    _error.value = smokeErrorsinterfaceInternalerrorToFfi(_errorObject);
  } finally {
  }
  return _errorFlag ? 1 : 0;
}
Pointer<Void> smokeErrorsinterfaceToFfi(ErrorsInterface value) {
  if (value is __lib.NativeBase) return _smokeErrorsinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeErrorsinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint32>)>(_smokeErrorsinterfacemethodWithErrorsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint32>)>(_smokeErrorsinterfacemethodWithExternalErrorsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>, Pointer<Uint32>)>(_smokeErrorsinterfacemethodWithErrorsAndReturnValueStatic, __lib.unknownError)
  );
  return result;
}
ErrorsInterface smokeErrorsinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ErrorsInterface) return instance;
  final _typeIdHandle = _smokeErrorsinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeErrorsinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ErrorsInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeErrorsinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeErrorsinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeErrorsinterfaceReleaseHandle(handle);
Pointer<Void> smokeErrorsinterfaceToFfiNullable(ErrorsInterface? value) =>
  value != null ? smokeErrorsinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
ErrorsInterface? smokeErrorsinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeErrorsinterfaceFromFfi(handle) : null;
void smokeErrorsinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeErrorsinterfaceReleaseHandle(handle);
// End of ErrorsInterface "private" section.
