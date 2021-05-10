import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
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
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  ClassWithInternalLambda_InternalLambda$Impl(this.handle);
  void release() => _smokeClasswithinternallambdaInternallambdaReleaseHandle(handle);
  bool internal_call(String p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ClassWithInternalLambda_InternalLambda_call__String'));
    final _p0Handle = String_toFfi(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    String_releaseFfiHandle(_p0Handle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
}
int _ClassWithInternalLambda_InternalLambda_call_static(int _token, Pointer<Void> p0, Pointer<Uint8> _result) {
  bool _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as ClassWithInternalLambda_InternalLambda)(String_fromFfi(p0));
    _result.value = Boolean_toFfi(_resultObject);
  } finally {
    String_releaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smoke_ClassWithInternalLambda_InternalLambda_toFfi(ClassWithInternalLambda_InternalLambda value) {
  final result = _smokeClasswithinternallambdaInternallambdaCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_ClassWithInternalLambda_InternalLambda_call_static, __lib.unknownError)
  );
  return result;
}
ClassWithInternalLambda_InternalLambda smoke_ClassWithInternalLambda_InternalLambda_fromFfi(Pointer<Void> handle) {
  final _impl = ClassWithInternalLambda_InternalLambda$Impl(_smokeClasswithinternallambdaInternallambdaCopyHandle(handle));
  return (String p0) {
    final _result =_impl.internal_call(p0);
    _impl.release();
    return _result;
  };
}
void smoke_ClassWithInternalLambda_InternalLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeClasswithinternallambdaInternallambdaReleaseHandle(handle);
// Nullable ClassWithInternalLambda_InternalLambda
final _smoke_ClassWithInternalLambda_InternalLambdaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_create_handle_nullable'));
final _smoke_ClassWithInternalLambda_InternalLambdaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_release_handle_nullable'));
final _smoke_ClassWithInternalLambda_InternalLambdaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_get_value_nullable'));
Pointer<Void> smoke_ClassWithInternalLambda_InternalLambda_toFfi_nullable(ClassWithInternalLambda_InternalLambda value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ClassWithInternalLambda_InternalLambda_toFfi(value);
  final result = _smoke_ClassWithInternalLambda_InternalLambdaCreateHandleNullable(_handle);
  smoke_ClassWithInternalLambda_InternalLambda_releaseFfiHandle(_handle);
  return result;
}
ClassWithInternalLambda_InternalLambda smoke_ClassWithInternalLambda_InternalLambda_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ClassWithInternalLambda_InternalLambdaGetValueNullable(handle);
  final result = smoke_ClassWithInternalLambda_InternalLambda_fromFfi(_handle);
  smoke_ClassWithInternalLambda_InternalLambda_releaseFfiHandle(_handle);
  return result;
}
void smoke_ClassWithInternalLambda_InternalLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ClassWithInternalLambda_InternalLambdaReleaseHandleNullable(handle);
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
    final _lambdaHandle = smoke_ClassWithInternalLambda_InternalLambda_toFfi(lambda);
    final _valueHandle = String_toFfi(value);
    final __resultHandle = _invokeInternalLambdaFfi(__lib.LibraryContext.isolateId, _lambdaHandle, _valueHandle);
    smoke_ClassWithInternalLambda_InternalLambda_releaseFfiHandle(_lambdaHandle);
    String_releaseFfiHandle(_valueHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_ClassWithInternalLambda_toFfi(ClassWithInternalLambda value) =>
  _smokeClasswithinternallambdaCopyHandle((value as __lib.NativeBase).handle);
ClassWithInternalLambda smoke_ClassWithInternalLambda_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ClassWithInternalLambda;
  if (instance != null) return instance;
  final _copiedHandle = _smokeClasswithinternallambdaCopyHandle(handle);
  final result = ClassWithInternalLambda$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ClassWithInternalLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeClasswithinternallambdaReleaseHandle(handle);
Pointer<Void> smoke_ClassWithInternalLambda_toFfi_nullable(ClassWithInternalLambda value) =>
  value != null ? smoke_ClassWithInternalLambda_toFfi(value) : Pointer<Void>.fromAddress(0);
ClassWithInternalLambda smoke_ClassWithInternalLambda_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ClassWithInternalLambda_fromFfi(handle) : null;
void smoke_ClassWithInternalLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeClasswithinternallambdaReleaseHandle(handle);
// End of ClassWithInternalLambda "private" section.
