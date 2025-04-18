

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/payload.dart';
import 'package:library/src/smoke/with_payload_exception.dart';
import 'package:meta/meta.dart';

abstract class ErrorsInterface implements Finalizable {

  factory ErrorsInterface(
    void Function() methodWithErrorsLambda,
    void Function() methodWithExternalErrorsLambda,
    String Function() methodWithErrorsAndReturnValueLambda,

  ) => ErrorsInterface$Lambdas(
    methodWithErrorsLambda,
    methodWithExternalErrorsLambda,
    methodWithErrorsAndReturnValueLambda,

  );

  static final String errorMessage = "Some error message constant";


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
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ErrorsInterface_create_proxy'));
final _smokeErrorsinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_get_type_id'));

final _methodWithErrorssmokeErrorsinterfaceMethodwitherrorsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrors_return_release_handle'));
final _methodWithErrorssmokeErrorsinterfaceMethodwitherrorsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrors_return_get_error'));
final _methodWithErrorssmokeErrorsinterfaceMethodwitherrorsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrors_return_has_error'));


final _methodWithExternalErrorssmokeErrorsinterfaceMethodwithexternalerrorsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithExternalErrors_return_release_handle'));
final _methodWithExternalErrorssmokeErrorsinterfaceMethodwithexternalerrorsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithExternalErrors_return_get_error'));
final _methodWithExternalErrorssmokeErrorsinterfaceMethodwithexternalerrorsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithExternalErrors_return_has_error'));


final _methodWithErrorsAndReturnValuesmokeErrorsinterfaceMethodwitherrorsandreturnvalueReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_release_handle'));
final _methodWithErrorsAndReturnValuesmokeErrorsinterfaceMethodwitherrorsandreturnvalueReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_get_result'));
final _methodWithErrorsAndReturnValuesmokeErrorsinterfaceMethodwitherrorsandreturnvalueReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_get_error'));
final _methodWithErrorsAndReturnValuesmokeErrorsinterfaceMethodwitherrorsandreturnvalueReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue_return_has_error'));


final _methodWithPayloadErrorsmokeErrorsinterfaceMethodwithpayloaderrorReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadError_return_release_handle'));
final _methodWithPayloadErrorsmokeErrorsinterfaceMethodwithpayloaderrorReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadError_return_get_error'));
final _methodWithPayloadErrorsmokeErrorsinterfaceMethodwithpayloaderrorReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadError_return_has_error'));


final _methodWithPayloadErrorAndReturnValuesmokeErrorsinterfaceMethodwithpayloaderrorandreturnvalueReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_return_release_handle'));
final _methodWithPayloadErrorAndReturnValuesmokeErrorsinterfaceMethodwithpayloaderrorandreturnvalueReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_return_get_result'));
final _methodWithPayloadErrorAndReturnValuesmokeErrorsinterfaceMethodwithpayloaderrorandreturnvalueReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue_return_get_error'));
final _methodWithPayloadErrorAndReturnValuesmokeErrorsinterfaceMethodwithpayloaderrorandreturnvalueReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
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
  void methodWithErrors() {
    final _methodWithErrorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ErrorsInterface_methodWithErrors'));
    final _handle = this.handle;
    final __callResultHandle = _methodWithErrorsFfi(_handle, __lib.LibraryContext.isolateId);
    if (_methodWithErrorssmokeErrorsinterfaceMethodwitherrorsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithErrorssmokeErrorsinterfaceMethodwitherrorsReturnGetError(__callResultHandle);
        _methodWithErrorssmokeErrorsinterfaceMethodwitherrorsReturnReleaseHandle(__callResultHandle);
        try {
          throw ErrorsInterface_InternalException(smokeErrorsinterfaceInternalerrorFromFfi(__errorHandle));
        } finally {
          smokeErrorsinterfaceInternalerrorReleaseFfiHandle(__errorHandle);
        }
    }
    _methodWithErrorssmokeErrorsinterfaceMethodwitherrorsReturnReleaseHandle(__callResultHandle);

  }

  @override
  void methodWithExternalErrors() {
    final _methodWithExternalErrorsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ErrorsInterface_methodWithExternalErrors'));
    final _handle = this.handle;
    final __callResultHandle = _methodWithExternalErrorsFfi(_handle, __lib.LibraryContext.isolateId);
    if (_methodWithExternalErrorssmokeErrorsinterfaceMethodwithexternalerrorsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithExternalErrorssmokeErrorsinterfaceMethodwithexternalerrorsReturnGetError(__callResultHandle);
        _methodWithExternalErrorssmokeErrorsinterfaceMethodwithexternalerrorsReturnReleaseHandle(__callResultHandle);
        try {
          throw ErrorsInterface_ExternalException(smokeErrorsinterfaceExternalerrorsFromFfi(__errorHandle));
        } finally {
          smokeErrorsinterfaceExternalerrorsReleaseFfiHandle(__errorHandle);
        }
    }
    _methodWithExternalErrorssmokeErrorsinterfaceMethodwithexternalerrorsReturnReleaseHandle(__callResultHandle);

  }

  @override
  String methodWithErrorsAndReturnValue() {
    final _methodWithErrorsAndReturnValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ErrorsInterface_methodWithErrorsAndReturnValue'));
    final _handle = this.handle;
    final __callResultHandle = _methodWithErrorsAndReturnValueFfi(_handle, __lib.LibraryContext.isolateId);
    if (_methodWithErrorsAndReturnValuesmokeErrorsinterfaceMethodwitherrorsandreturnvalueReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithErrorsAndReturnValuesmokeErrorsinterfaceMethodwitherrorsandreturnvalueReturnGetError(__callResultHandle);
        _methodWithErrorsAndReturnValuesmokeErrorsinterfaceMethodwitherrorsandreturnvalueReturnReleaseHandle(__callResultHandle);
        try {
          throw ErrorsInterface_InternalException(smokeErrorsinterfaceInternalerrorFromFfi(__errorHandle));
        } finally {
          smokeErrorsinterfaceInternalerrorReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _methodWithErrorsAndReturnValuesmokeErrorsinterfaceMethodwitherrorsandreturnvalueReturnGetResult(__callResultHandle);
    _methodWithErrorsAndReturnValuesmokeErrorsinterfaceMethodwitherrorsandreturnvalueReturnReleaseHandle(__callResultHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  void methodWithPayloadError() {
    final _methodWithPayloadErrorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_ErrorsInterface_methodWithPayloadError'));
    final __callResultHandle = _methodWithPayloadErrorFfi(__lib.LibraryContext.isolateId);
    if (_methodWithPayloadErrorsmokeErrorsinterfaceMethodwithpayloaderrorReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithPayloadErrorsmokeErrorsinterfaceMethodwithpayloaderrorReturnGetError(__callResultHandle);
        _methodWithPayloadErrorsmokeErrorsinterfaceMethodwithpayloaderrorReturnReleaseHandle(__callResultHandle);
        try {
          throw WithPayloadException(smokePayloadFromFfi(__errorHandle));
        } finally {
          smokePayloadReleaseFfiHandle(__errorHandle);
        }
    }
    _methodWithPayloadErrorsmokeErrorsinterfaceMethodwithpayloaderrorReturnReleaseHandle(__callResultHandle);

  }

  String methodWithPayloadErrorAndReturnValue() {
    final _methodWithPayloadErrorAndReturnValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_ErrorsInterface_methodWithPayloadErrorAndReturnValue'));
    final __callResultHandle = _methodWithPayloadErrorAndReturnValueFfi(__lib.LibraryContext.isolateId);
    if (_methodWithPayloadErrorAndReturnValuesmokeErrorsinterfaceMethodwithpayloaderrorandreturnvalueReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _methodWithPayloadErrorAndReturnValuesmokeErrorsinterfaceMethodwithpayloaderrorandreturnvalueReturnGetError(__callResultHandle);
        _methodWithPayloadErrorAndReturnValuesmokeErrorsinterfaceMethodwithpayloaderrorandreturnvalueReturnReleaseHandle(__callResultHandle);
        try {
          throw WithPayloadException(smokePayloadFromFfi(__errorHandle));
        } finally {
          smokePayloadReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _methodWithPayloadErrorAndReturnValuesmokeErrorsinterfaceMethodwithpayloaderrorandreturnvalueReturnGetResult(__callResultHandle);
    _methodWithPayloadErrorAndReturnValuesmokeErrorsinterfaceMethodwithpayloaderrorandreturnvalueReturnReleaseHandle(__callResultHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


}

void _smokeErrorsinterfacemethodWithErrorsStatic(ErrorsInterface _obj, Pointer<Uint32> _error, Pointer<Int8> _errorFlag) {

  try {
    _obj.methodWithErrors();
    _errorFlag.value = booleanToFfi(false);
  } on ErrorsInterface_InternalException catch(e) {
    _errorFlag.value = booleanToFfi(true);
    final _errorObject = e.error;
    _error.value = smokeErrorsinterfaceInternalerrorToFfi(_errorObject);
  } finally {
  }
}
void _smokeErrorsinterfacemethodWithExternalErrorsStatic(ErrorsInterface _obj, Pointer<Uint32> _error, Pointer<Int8> _errorFlag) {

  try {
    _obj.methodWithExternalErrors();
    _errorFlag.value = booleanToFfi(false);
  } on ErrorsInterface_ExternalException catch(e) {
    _errorFlag.value = booleanToFfi(true);
    final _errorObject = e.error;
    _error.value = smokeErrorsinterfaceExternalerrorsToFfi(_errorObject);
  } finally {
  }
}
void _smokeErrorsinterfacemethodWithErrorsAndReturnValueStatic(ErrorsInterface _obj, Pointer<Pointer<Void>> _result, Pointer<Uint32> _error, Pointer<Int8> _errorFlag) {
  String? _resultObject;
  try {
    _resultObject = _obj.methodWithErrorsAndReturnValue();
    _result.value = stringToFfi(_resultObject);
    _errorFlag.value = booleanToFfi(false);
  } on ErrorsInterface_InternalException catch(e) {
    _errorFlag.value = booleanToFfi(true);
    final _errorObject = e.error;
    _error.value = smokeErrorsinterfaceInternalerrorToFfi(_errorObject);
  } finally {
  }
}


Pointer<Void> smokeErrorsinterfaceToFfi(ErrorsInterface __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeErrorsinterfaceCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __methodWithErrorsCaller(Pointer<Uint32> _error, Pointer<Int8> _errorFlag) { _smokeErrorsinterfacemethodWithErrorsStatic(__interfaceObj, _error, _errorFlag); }
  final __methodWithErrorsCallback = NativeCallable<Void Function(Pointer<Uint32>, Pointer<Int8>)>.isolateLocal(__methodWithErrorsCaller);
  __methodWithErrorsCallback.keepIsolateAlive = false;

  void __methodWithExternalErrorsCaller(Pointer<Uint32> _error, Pointer<Int8> _errorFlag) { _smokeErrorsinterfacemethodWithExternalErrorsStatic(__interfaceObj, _error, _errorFlag); }
  final __methodWithExternalErrorsCallback = NativeCallable<Void Function(Pointer<Uint32>, Pointer<Int8>)>.isolateLocal(__methodWithExternalErrorsCaller);
  __methodWithExternalErrorsCallback.keepIsolateAlive = false;

  void __methodWithErrorsAndReturnValueCaller(Pointer<Pointer<Void>> _result, Pointer<Uint32> _error, Pointer<Int8> _errorFlag) { _smokeErrorsinterfacemethodWithErrorsAndReturnValueStatic(__interfaceObj, _result, _error, _errorFlag); }
  final __methodWithErrorsAndReturnValueCallback = NativeCallable<Void Function(Pointer<Pointer<Void>>, Pointer<Uint32>, Pointer<Int8>)>.isolateLocal(__methodWithErrorsAndReturnValueCaller);
  __methodWithErrorsAndReturnValueCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __methodWithErrorsCallback.close();
    __methodWithExternalErrorsCallback.close();
    __methodWithErrorsAndReturnValueCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeErrorsinterfaceCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __methodWithErrorsCallback.nativeFunction,
    __methodWithExternalErrorsCallback.nativeFunction,
    __methodWithErrorsAndReturnValueCallback.nativeFunction
  );

  return result;
}

ErrorsInterface smokeErrorsinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
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


