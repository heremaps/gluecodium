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
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
int _StandaloneProducercallStatic(int _token, Pointer<Pointer<Void>> _result) {
  String _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as StandaloneProducer)();
    _result.value = stringToFfi(_resultObject);
  } finally {
  }
  return 0;
}
Pointer<Void> smokeStandaloneproducerToFfi(StandaloneProducer value) {
  final result = _smokeStandaloneproducerCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Pointer<Void>>)>(_StandaloneProducercallStatic, __lib.unknownError)
  );
  return result;
}
StandaloneProducer smokeStandaloneproducerFromFfi(Pointer<Void> handle) {
  final _impl = StandaloneProducer$Impl(_smokeStandaloneproducerCopyHandle(handle));
  return () {
    final _result =_impl.call();
    _impl.release();
    return _result;
  };
}
void smokeStandaloneproducerReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeStandaloneproducerReleaseHandle(handle);
// Nullable StandaloneProducer
final _smokeStandaloneproducerCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StandaloneProducer_create_handle_nullable'));
final _smokeStandaloneproducerReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StandaloneProducer_release_handle_nullable'));
final _smokeStandaloneproducerGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StandaloneProducer_get_value_nullable'));
Pointer<Void> smokeStandaloneproducerToFfiNullable(StandaloneProducer value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStandaloneproducerToFfi(value);
  final result = _smokeStandaloneproducerCreateHandleNullable(_handle);
  smokeStandaloneproducerReleaseFfiHandle(_handle);
  return result;
}
StandaloneProducer smokeStandaloneproducerFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStandaloneproducerGetValueNullable(handle);
  final result = smokeStandaloneproducerFromFfi(_handle);
  smokeStandaloneproducerReleaseFfiHandle(_handle);
  return result;
}
void smokeStandaloneproducerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStandaloneproducerReleaseHandleNullable(handle);
// End of StandaloneProducer "private" section.
