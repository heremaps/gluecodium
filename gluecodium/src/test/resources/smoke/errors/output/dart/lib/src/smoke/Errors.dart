import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/smoke/Payload.dart';
import 'package:library/src/smoke/WithPayloadException.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
final _smoke_Errors_InternalErrorCode_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Errors_InternalErrorCode_create_handle_nullable');
final _smoke_Errors_InternalErrorCode_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_InternalErrorCode_release_handle_nullable');
final _smoke_Errors_InternalErrorCode_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_InternalErrorCode_get_value_nullable');
Pointer<Void> smoke_Errors_InternalErrorCode_toFfi_nullable(Errors_InternalErrorCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Errors_InternalErrorCode_toFfi(value);
  final result = _smoke_Errors_InternalErrorCode_create_handle_nullable(_handle);
  smoke_Errors_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
Errors_InternalErrorCode smoke_Errors_InternalErrorCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Errors_InternalErrorCode_get_value_nullable(handle);
  final result = smoke_Errors_InternalErrorCode_fromFfi(_handle);
  smoke_Errors_InternalErrorCode_releaseFfiHandle(_handle);
  return result;
}
void smoke_Errors_InternalErrorCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Errors_InternalErrorCode_release_handle_nullable(handle);
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
final _smoke_Errors_ExternalErrors_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Errors_ExternalErrors_create_handle_nullable');
final _smoke_Errors_ExternalErrors_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_ExternalErrors_release_handle_nullable');
final _smoke_Errors_ExternalErrors_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_ExternalErrors_get_value_nullable');
Pointer<Void> smoke_Errors_ExternalErrors_toFfi_nullable(Errors_ExternalErrors value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Errors_ExternalErrors_toFfi(value);
  final result = _smoke_Errors_ExternalErrors_create_handle_nullable(_handle);
  smoke_Errors_ExternalErrors_releaseFfiHandle(_handle);
  return result;
}
Errors_ExternalErrors smoke_Errors_ExternalErrors_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Errors_ExternalErrors_get_value_nullable(handle);
  final result = smoke_Errors_ExternalErrors_fromFfi(_handle);
  smoke_Errors_ExternalErrors_releaseFfiHandle(_handle);
  return result;
}
void smoke_Errors_ExternalErrors_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Errors_ExternalErrors_release_handle_nullable(handle);
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
final _smoke_Errors_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_copy_handle');
final _smoke_Errors_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_release_handle');
final _smoke_Errors_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_Errors_get_raw_pointer');
final _methodWithErrors_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrors_return_release_handle');
final _methodWithErrors_return_get_result = (Pointer) {};
final _methodWithErrors_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrors_return_get_error');
final _methodWithErrors_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrors_return_has_error');
final _methodWithExternalErrors_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithExternalErrors_return_release_handle');
final _methodWithExternalErrors_return_get_result = (Pointer) {};
final _methodWithExternalErrors_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithExternalErrors_return_get_error');
final _methodWithExternalErrors_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithExternalErrors_return_has_error');
final _methodWithErrorsAndReturnValue_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_release_handle');
final _methodWithErrorsAndReturnValue_return_get_result = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_get_result');
final _methodWithErrorsAndReturnValue_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_get_error');
final _methodWithErrorsAndReturnValue_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithErrorsAndReturnValue_return_has_error');
final _methodWithPayloadError_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadError_return_release_handle');
final _methodWithPayloadError_return_get_result = (Pointer) {};
final _methodWithPayloadError_return_get_error = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadError_return_get_error');
final _methodWithPayloadError_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadError_return_has_error');
final _methodWithPayloadErrorAndReturnValue_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_release_handle');
final _methodWithPayloadErrorAndReturnValue_return_get_result = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_get_result');
final _methodWithPayloadErrorAndReturnValue_return_get_error = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_get_error');
final _methodWithPayloadErrorAndReturnValue_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Errors_methodWithPayloadErrorAndReturnValue_return_has_error');
class Errors$Impl implements Errors {
  @protected
  Pointer<Void> handle;
  Errors$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_Errors_get_raw_pointer(handle));
    _smoke_Errors_release_handle(handle);
    handle = null;
  }
  static methodWithErrors() {
    final _methodWithErrors_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithErrors');
    final __call_result_handle = _methodWithErrors_ffi(__lib.LibraryContext.isolateId);
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
    final _methodWithExternalErrors_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithExternalErrors');
    final __call_result_handle = _methodWithExternalErrors_ffi(__lib.LibraryContext.isolateId);
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
    final _methodWithErrorsAndReturnValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithErrorsAndReturnValue');
    final __call_result_handle = _methodWithErrorsAndReturnValue_ffi(__lib.LibraryContext.isolateId);
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
    final _methodWithPayloadError_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithPayloadError');
    final __call_result_handle = _methodWithPayloadError_ffi(__lib.LibraryContext.isolateId);
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
    final _methodWithPayloadErrorAndReturnValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_Errors_methodWithPayloadErrorAndReturnValue');
    final __call_result_handle = _methodWithPayloadErrorAndReturnValue_ffi(__lib.LibraryContext.isolateId);
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
  _smoke_Errors_copy_handle((value as Errors$Impl).handle);
Errors smoke_Errors_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_Errors_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Errors;
  if (instance != null) return instance;
  final _copied_handle = _smoke_Errors_copy_handle(handle);
  final result = Errors$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_Errors_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Errors_release_handle(handle);
Pointer<Void> smoke_Errors_toFfi_nullable(Errors value) =>
  value != null ? smoke_Errors_toFfi(value) : Pointer<Void>.fromAddress(0);
Errors smoke_Errors_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Errors_fromFfi(handle) : null;
void smoke_Errors_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Errors_release_handle(handle);
// End of Errors "private" section.
