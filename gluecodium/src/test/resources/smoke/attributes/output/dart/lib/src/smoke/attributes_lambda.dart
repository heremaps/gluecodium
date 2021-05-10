import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@OnLambda
typedef AttributesLambda = void Function();
// AttributesLambda "private" section, not exported.
final _smokeAttributeslambdaCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_copy_handle'));
final _smokeAttributeslambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_release_handle'));
final _smokeAttributeslambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_AttributesLambda_create_proxy'));
class AttributesLambda$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  AttributesLambda$Impl(this.handle);
  void release() => _smokeAttributeslambdaReleaseHandle(handle);
  call() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AttributesLambda_call'));
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _AttributesLambda_call_static(int _token) {
  try {
    (__lib.instanceCache[_token] as AttributesLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smoke_AttributesLambda_toFfi(AttributesLambda value) {
  final result = _smokeAttributeslambdaCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64)>(_AttributesLambda_call_static, __lib.unknownError)
  );
  return result;
}
AttributesLambda smoke_AttributesLambda_fromFfi(Pointer<Void> handle) {
  final _impl = AttributesLambda$Impl(_smokeAttributeslambdaCopyHandle(handle));
  return () {
    final _result =_impl.call();
    _impl.release();
    return _result;
  };
}
void smoke_AttributesLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeAttributeslambdaReleaseHandle(handle);
// Nullable AttributesLambda
final _smoke_AttributesLambdaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_create_handle_nullable'));
final _smoke_AttributesLambdaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_release_handle_nullable'));
final _smoke_AttributesLambdaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_get_value_nullable'));
Pointer<Void> smoke_AttributesLambda_toFfi_nullable(AttributesLambda value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_AttributesLambda_toFfi(value);
  final result = _smoke_AttributesLambdaCreateHandleNullable(_handle);
  smoke_AttributesLambda_releaseFfiHandle(_handle);
  return result;
}
AttributesLambda smoke_AttributesLambda_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_AttributesLambdaGetValueNullable(handle);
  final result = smoke_AttributesLambda_fromFfi(_handle);
  smoke_AttributesLambda_releaseFfiHandle(_handle);
  return result;
}
void smoke_AttributesLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesLambdaReleaseHandleNullable(handle);
// End of AttributesLambda "private" section.
