import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class ClassWithInternalLambda {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static bool invokeInternalLambda(ClassWithInternalLambda_InternalLambda lambda, String value) => ClassWithInternalLambda$Impl.invokeInternalLambda(lambda, value);
}
/// @nodoc
typedef ClassWithInternalLambda_InternalLambda = bool Function(String);
// ClassWithInternalLambda_InternalLambda "private" section, not exported.
final _smokeClasswithinternallambdaInternallambdaCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_copy_handle'));
final _smokeClasswithinternallambdaInternallambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_release_handle'));
final _smokeClasswithinternallambdaInternallambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_create_proxy'));
class ClassWithInternalLambda_InternalLambda$Impl {
  final Pointer<Void> handle;
  ClassWithInternalLambda_InternalLambda$Impl(this.handle);
  void release() => _smokeClasswithinternallambdaInternallambdaReleaseHandle(handle);
  bool internal_call(String p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ClassWithInternalLambda_InternalLambda_call__String'));
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
int _smokeClasswithinternallambdaInternallambdacallStatic(int _token, Pointer<Void> p0, Pointer<Uint8> _result) {
  bool _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as ClassWithInternalLambda_InternalLambda)(stringFromFfi(p0));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeClasswithinternallambdaInternallambdaToFfi(ClassWithInternalLambda_InternalLambda value) {
  final result = _smokeClasswithinternallambdaInternallambdaCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_smokeClasswithinternallambdaInternallambdacallStatic, __lib.unknownError)
  );
  return result;
}
ClassWithInternalLambda_InternalLambda smokeClasswithinternallambdaInternallambdaFromFfi(Pointer<Void> handle) {
  final _impl = ClassWithInternalLambda_InternalLambda$Impl(_smokeClasswithinternallambdaInternallambdaCopyHandle(handle));
  return (String p0) {
    final _result =_impl.internal_call(p0);
    _impl.release();
    return _result;
  };
}
void smokeClasswithinternallambdaInternallambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeClasswithinternallambdaInternallambdaReleaseHandle(handle);
// Nullable ClassWithInternalLambda_InternalLambda
final _smokeClasswithinternallambdaInternallambdaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_create_handle_nullable'));
final _smokeClasswithinternallambdaInternallambdaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_release_handle_nullable'));
final _smokeClasswithinternallambdaInternallambdaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_get_value_nullable'));
Pointer<Void> smokeClasswithinternallambdaInternallambdaToFfiNullable(ClassWithInternalLambda_InternalLambda value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeClasswithinternallambdaInternallambdaToFfi(value);
  final result = _smokeClasswithinternallambdaInternallambdaCreateHandleNullable(_handle);
  smokeClasswithinternallambdaInternallambdaReleaseFfiHandle(_handle);
  return result;
}
ClassWithInternalLambda_InternalLambda smokeClasswithinternallambdaInternallambdaFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeClasswithinternallambdaInternallambdaGetValueNullable(handle);
  final result = smokeClasswithinternallambdaInternallambdaFromFfi(_handle);
  smokeClasswithinternallambdaInternallambdaReleaseFfiHandle(_handle);
  return result;
}
void smokeClasswithinternallambdaInternallambdaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeClasswithinternallambdaInternallambdaReleaseHandleNullable(handle);
// End of ClassWithInternalLambda_InternalLambda "private" section.
// ClassWithInternalLambda "private" section, not exported.
final _smokeClasswithinternallambdaCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_copy_handle'));
final _smokeClasswithinternallambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_release_handle'));
class ClassWithInternalLambda$Impl extends __lib.NativeBase implements ClassWithInternalLambda {
  ClassWithInternalLambda$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeClasswithinternallambdaReleaseHandle(handle);
    handle = null;
  }
  static bool invokeInternalLambda(ClassWithInternalLambda_InternalLambda lambda, String value) {
    final _invokeInternalLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Pointer<Void>, Pointer<Void>), int Function(int, Pointer<Void>, Pointer<Void>)>('library_smoke_ClassWithInternalLambda_invokeInternalLambda__InternalLambda_String'));
    final _lambdaHandle = smokeClasswithinternallambdaInternallambdaToFfi(lambda);
    final _valueHandle = stringToFfi(value);
    final __resultHandle = _invokeInternalLambdaFfi(__lib.LibraryContext.isolateId, _lambdaHandle, _valueHandle);
    smokeClasswithinternallambdaInternallambdaReleaseFfiHandle(_lambdaHandle);
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
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ClassWithInternalLambda;
  if (instance != null) return instance;
  final _copiedHandle = _smokeClasswithinternallambdaCopyHandle(handle);
  final result = ClassWithInternalLambda$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeClasswithinternallambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeClasswithinternallambdaReleaseHandle(handle);
Pointer<Void> smokeClasswithinternallambdaToFfiNullable(ClassWithInternalLambda value) =>
  value != null ? smokeClasswithinternallambdaToFfi(value) : Pointer<Void>.fromAddress(0);
ClassWithInternalLambda smokeClasswithinternallambdaFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeClasswithinternallambdaFromFfi(handle) : null;
void smokeClasswithinternallambdaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeClasswithinternallambdaReleaseHandle(handle);
// End of ClassWithInternalLambda "private" section.
