import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
typedef StandaloneProducer = String Function();
// StandaloneProducer "private" section, not exported.
final _smokeStandaloneproducerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StandaloneProducer_copy_handle'));
final _smokeStandaloneproducerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StandaloneProducer_release_handle'));
final _smokeStandaloneproducerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_StandaloneProducer_create_proxy'));
class StandaloneProducer$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  StandaloneProducer$Impl(this.handle);
  void release() => _smokeStandaloneproducerReleaseHandle(handle);
  String call() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_StandaloneProducer_call'));
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
}
int _StandaloneProducer_call_static(int _token, Pointer<Pointer<Void>> _result) {
  String _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as StandaloneProducer)();
    _result.value = String_toFfi(_resultObject);
  } finally {
  }
  return 0;
}
Pointer<Void> smoke_StandaloneProducer_toFfi(StandaloneProducer value) {
  final result = _smokeStandaloneproducerCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Pointer<Void>>)>(_StandaloneProducer_call_static, __lib.unknownError)
  );
  return result;
}
StandaloneProducer smoke_StandaloneProducer_fromFfi(Pointer<Void> handle) {
  final _impl = StandaloneProducer$Impl(_smokeStandaloneproducerCopyHandle(handle));
  return () {
    final _result =_impl.call();
    _impl.release();
    return _result;
  };
}
void smoke_StandaloneProducer_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeStandaloneproducerReleaseHandle(handle);
// Nullable StandaloneProducer
final _smoke_StandaloneProducerCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StandaloneProducer_create_handle_nullable'));
final _smoke_StandaloneProducerReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StandaloneProducer_release_handle_nullable'));
final _smoke_StandaloneProducerGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StandaloneProducer_get_value_nullable'));
Pointer<Void> smoke_StandaloneProducer_toFfi_nullable(StandaloneProducer value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StandaloneProducer_toFfi(value);
  final result = _smoke_StandaloneProducerCreateHandleNullable(_handle);
  smoke_StandaloneProducer_releaseFfiHandle(_handle);
  return result;
}
StandaloneProducer smoke_StandaloneProducer_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StandaloneProducerGetValueNullable(handle);
  final result = smoke_StandaloneProducer_fromFfi(_handle);
  smoke_StandaloneProducer_releaseFfiHandle(_handle);
  return result;
}
void smoke_StandaloneProducer_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StandaloneProducerReleaseHandleNullable(handle);
// End of StandaloneProducer "private" section.
