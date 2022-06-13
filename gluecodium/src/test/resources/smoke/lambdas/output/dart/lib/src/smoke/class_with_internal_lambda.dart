import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
abstract class ClassWithInternalLambda {
  static bool invokeInternalLambda(ClassWithInternalLambda_InternalNestedLambda lambda, String value) => $prototype.invokeInternalLambda(lambda, value);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = ClassWithInternalLambda$Impl(Pointer<Void>.fromAddress(0));
}
/// @nodoc
@internal
typedef ClassWithInternalLambda_InternalNestedLambda = bool Function(String);
// ClassWithInternalLambda_InternalNestedLambda "private" section, not exported.
final _smokeClasswithinternallambdaInternalnestedlambdaRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ClassWithInternalLambda_InternalNestedLambda_register_finalizer'));
final _smokeClasswithinternallambdaInternalnestedlambdaCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalNestedLambda_copy_handle'));
final _smokeClasswithinternallambdaInternalnestedlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalNestedLambda_release_handle'));
final _smokeClasswithinternallambdaInternalnestedlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_ClassWithInternalLambda_InternalNestedLambda_create_proxy'));
class ClassWithInternalLambda_InternalNestedLambda$Impl {
  final Pointer<Void> handle;
  ClassWithInternalLambda_InternalNestedLambda$Impl(this.handle);
  bool call(String p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ClassWithInternalLambda_InternalNestedLambda_call__String'));
    final _p0Handle = stringToFfi(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    stringReleaseFfiHandle(_p0Handle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeClasswithinternallambdaInternalnestedlambdacallStatic(Object _obj, Pointer<Void> p0, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as ClassWithInternalLambda_InternalNestedLambda)(stringFromFfi(p0));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeClasswithinternallambdaInternalnestedlambdaToFfi(ClassWithInternalLambda_InternalNestedLambda value) =>
  _smokeClasswithinternallambdaInternalnestedlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Uint8>)>(_smokeClasswithinternallambdaInternalnestedlambdacallStatic, __lib.unknownError)
  );
ClassWithInternalLambda_InternalNestedLambda smokeClasswithinternallambdaInternalnestedlambdaFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeClasswithinternallambdaInternalnestedlambdaCopyHandle(handle);
  final _impl = ClassWithInternalLambda_InternalNestedLambda$Impl(_copiedHandle);
  final result = (String p0) => _impl.call(p0);
  _smokeClasswithinternallambdaInternalnestedlambdaRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeClasswithinternallambdaInternalnestedlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeClasswithinternallambdaInternalnestedlambdaReleaseHandle(handle);
// Nullable ClassWithInternalLambda_InternalNestedLambda
final _smokeClasswithinternallambdaInternalnestedlambdaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalNestedLambda_create_handle_nullable'));
final _smokeClasswithinternallambdaInternalnestedlambdaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalNestedLambda_release_handle_nullable'));
final _smokeClasswithinternallambdaInternalnestedlambdaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalNestedLambda_get_value_nullable'));
Pointer<Void> smokeClasswithinternallambdaInternalnestedlambdaToFfiNullable(ClassWithInternalLambda_InternalNestedLambda? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeClasswithinternallambdaInternalnestedlambdaToFfi(value);
  final result = _smokeClasswithinternallambdaInternalnestedlambdaCreateHandleNullable(_handle);
  smokeClasswithinternallambdaInternalnestedlambdaReleaseFfiHandle(_handle);
  return result;
}
ClassWithInternalLambda_InternalNestedLambda? smokeClasswithinternallambdaInternalnestedlambdaFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeClasswithinternallambdaInternalnestedlambdaGetValueNullable(handle);
  final result = smokeClasswithinternallambdaInternalnestedlambdaFromFfi(_handle);
  smokeClasswithinternallambdaInternalnestedlambdaReleaseFfiHandle(_handle);
  return result;
}
void smokeClasswithinternallambdaInternalnestedlambdaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeClasswithinternallambdaInternalnestedlambdaReleaseHandleNullable(handle);
// End of ClassWithInternalLambda_InternalNestedLambda "private" section.
// ClassWithInternalLambda "private" section, not exported.
final _smokeClasswithinternallambdaRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ClassWithInternalLambda_register_finalizer'));
final _smokeClasswithinternallambdaCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_copy_handle'));
final _smokeClasswithinternallambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_release_handle'));
/// @nodoc
@visibleForTesting
class ClassWithInternalLambda$Impl extends __lib.NativeBase implements ClassWithInternalLambda {
  ClassWithInternalLambda$Impl(Pointer<Void> handle) : super(handle);
  bool invokeInternalLambda(ClassWithInternalLambda_InternalNestedLambda lambda, String value) {
    final _invokeInternalLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Pointer<Void>, Pointer<Void>), int Function(int, Pointer<Void>, Pointer<Void>)>('library_smoke_ClassWithInternalLambda_invokeInternalLambda__InternalNestedLambda_String'));
    final _lambdaHandle = smokeClasswithinternallambdaInternalnestedlambdaToFfi(lambda);
    final _valueHandle = stringToFfi(value);
    final __resultHandle = _invokeInternalLambdaFfi(__lib.LibraryContext.isolateId, _lambdaHandle, _valueHandle);
    smokeClasswithinternallambdaInternalnestedlambdaReleaseFfiHandle(_lambdaHandle);
    stringReleaseFfiHandle(_valueHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeClasswithinternallambdaToFfi(ClassWithInternalLambda value) =>
  _smokeClasswithinternallambdaCopyHandle((value as __lib.NativeBase).handle);
ClassWithInternalLambda smokeClasswithinternallambdaFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ClassWithInternalLambda) return instance;
  final _copiedHandle = _smokeClasswithinternallambdaCopyHandle(handle);
  final result = ClassWithInternalLambda$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeClasswithinternallambdaRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeClasswithinternallambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeClasswithinternallambdaReleaseHandle(handle);
Pointer<Void> smokeClasswithinternallambdaToFfiNullable(ClassWithInternalLambda? value) =>
  value != null ? smokeClasswithinternallambdaToFfi(value) : Pointer<Void>.fromAddress(0);
ClassWithInternalLambda? smokeClasswithinternallambdaFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeClasswithinternallambdaFromFfi(handle) : null;
void smokeClasswithinternallambdaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeClasswithinternallambdaReleaseHandle(handle);
// End of ClassWithInternalLambda "private" section.
