import 'package:library/src/String__conversion.dart';
import 'package:library/src/smoke/Errors_ExternalErrors__conversion.dart';
import 'package:library/src/smoke/Errors_InternalErrorCode__conversion.dart';
import 'package:library/src/smoke/Payload.dart';
import 'package:library/src/smoke/Payload__conversion.dart';
import 'package:library/src/smoke/WithPayloadException.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Errors_release_handle');
final _methodWithErrors_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Errors_methodWithErrors_return_release_handle');
final _methodWithErrors_return_get_result = (Pointer) {};
final _methodWithErrors_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Errors_methodWithErrors_return_get_error');
final _methodWithErrors_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Errors_methodWithErrors_return_has_error');
final _methodWithExternalErrors_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Errors_methodWithExternalErrors_return_release_handle');
final _methodWithExternalErrors_return_get_result = (Pointer) {};
final _methodWithExternalErrors_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Errors_methodWithExternalErrors_return_get_error');
final _methodWithExternalErrors_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Errors_methodWithExternalErrors_return_has_error');
final _methodWithErrorsAndReturnValue_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Errors_methodWithErrorsAndReturnValue_return_release_handle');
final _methodWithErrorsAndReturnValue_return_get_result = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Errors_methodWithErrorsAndReturnValue_return_get_result');
final _methodWithErrorsAndReturnValue_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Errors_methodWithErrorsAndReturnValue_return_get_error');
final _methodWithErrorsAndReturnValue_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Errors_methodWithErrorsAndReturnValue_return_has_error');
final _methodWithPayloadError_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Errors_methodWithPayloadError_return_release_handle');
final _methodWithPayloadError_return_get_result = (Pointer) {};
final _methodWithPayloadError_return_get_error = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Errors_methodWithPayloadError_return_get_error');
final _methodWithPayloadError_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Errors_methodWithPayloadError_return_has_error');
final _methodWithPayloadErrorAndReturnValue_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Errors_methodWithPayloadErrorAndReturnValue_return_release_handle');
final _methodWithPayloadErrorAndReturnValue_return_get_result = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Errors_methodWithPayloadErrorAndReturnValue_return_get_result');
final _methodWithPayloadErrorAndReturnValue_return_get_error = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Errors_methodWithPayloadErrorAndReturnValue_return_get_error');
final _methodWithPayloadErrorAndReturnValue_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Errors_methodWithPayloadErrorAndReturnValue_return_has_error');
class Errors {
  final Pointer<Void> _handle;
  Errors._(this._handle);
  void release() => __release_handle(_handle);
  static methodWithErrors() {
    final _methodWithErrors_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Errors_methodWithErrors');
    final __call_result_handle = _methodWithErrors_ffi();
    if (_methodWithErrors_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _methodWithErrors_return_get_error(__call_result_handle);
        _methodWithErrors_return_release_handle(__call_result_handle);
        final _error_value = smoke_Errors_InternalErrorCode_fromFfi(__error_handle);
        smoke_Errors_InternalErrorCode_releaseFfiHandle(__error_handle);
        throw Errors_InternalException(_error_value);
    }
    final __result_handle = _methodWithErrors_return_get_result(__call_result_handle);
    _methodWithErrors_return_release_handle(__call_result_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  static methodWithExternalErrors() {
    final _methodWithExternalErrors_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Errors_methodWithExternalErrors');
    final __call_result_handle = _methodWithExternalErrors_ffi();
    if (_methodWithExternalErrors_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _methodWithExternalErrors_return_get_error(__call_result_handle);
        _methodWithExternalErrors_return_release_handle(__call_result_handle);
        final _error_value = smoke_Errors_ExternalErrors_fromFfi(__error_handle);
        smoke_Errors_ExternalErrors_releaseFfiHandle(__error_handle);
        throw Errors_ExternalException(_error_value);
    }
    final __result_handle = _methodWithExternalErrors_return_get_result(__call_result_handle);
    _methodWithExternalErrors_return_release_handle(__call_result_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  static String methodWithErrorsAndReturnValue() {
    final _methodWithErrorsAndReturnValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Errors_methodWithErrorsAndReturnValue');
    final __call_result_handle = _methodWithErrorsAndReturnValue_ffi();
    if (_methodWithErrorsAndReturnValue_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _methodWithErrorsAndReturnValue_return_get_error(__call_result_handle);
        _methodWithErrorsAndReturnValue_return_release_handle(__call_result_handle);
        final _error_value = smoke_Errors_InternalErrorCode_fromFfi(__error_handle);
        smoke_Errors_InternalErrorCode_releaseFfiHandle(__error_handle);
        throw Errors_InternalException(_error_value);
    }
    final __result_handle = _methodWithErrorsAndReturnValue_return_get_result(__call_result_handle);
    _methodWithErrorsAndReturnValue_return_release_handle(__call_result_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  static methodWithPayloadError() {
    final _methodWithPayloadError_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Errors_methodWithPayloadError');
    final __call_result_handle = _methodWithPayloadError_ffi();
    if (_methodWithPayloadError_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _methodWithPayloadError_return_get_error(__call_result_handle);
        _methodWithPayloadError_return_release_handle(__call_result_handle);
        final _error_value = smoke_Payload_fromFfi(__error_handle);
        smoke_Payload_releaseFfiHandle(__error_handle);
        throw WithPayloadException(_error_value);
    }
    final __result_handle = _methodWithPayloadError_return_get_result(__call_result_handle);
    _methodWithPayloadError_return_release_handle(__call_result_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  static String methodWithPayloadErrorAndReturnValue() {
    final _methodWithPayloadErrorAndReturnValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Errors_methodWithPayloadErrorAndReturnValue');
    final __call_result_handle = _methodWithPayloadErrorAndReturnValue_ffi();
    if (_methodWithPayloadErrorAndReturnValue_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _methodWithPayloadErrorAndReturnValue_return_get_error(__call_result_handle);
        _methodWithPayloadErrorAndReturnValue_return_release_handle(__call_result_handle);
        final _error_value = smoke_Payload_fromFfi(__error_handle);
        smoke_Payload_releaseFfiHandle(__error_handle);
        throw WithPayloadException(_error_value);
    }
    final __result_handle = _methodWithPayloadErrorAndReturnValue_return_get_result(__call_result_handle);
    _methodWithPayloadErrorAndReturnValue_return_release_handle(__call_result_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_Errors_toFfi(Errors value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
Errors smoke_Errors_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? Errors._(handle) : null;
void smoke_Errors_releaseFfiHandle(Pointer<Void> handle) {}
enum Errors_InternalErrorCode {
    errorNone,
    errorFatal
}
enum Errors_ExternalErrors {
    none,
    boom,
    bust
}
class Errors_InternalException implements Exception {
  final Errors_InternalErrorCode error;
  Errors_InternalException(this.error);
}
class Errors_ExternalException implements Exception {
  final Errors_ExternalErrors error;
  Errors_ExternalException(this.error);
}
