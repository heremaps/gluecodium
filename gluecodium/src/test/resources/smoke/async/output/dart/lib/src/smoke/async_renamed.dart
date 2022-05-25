import 'dart:async';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
abstract class AsyncRenamed {
  Future<void> dispose();
}
// AsyncRenamed "private" section, not exported.
final _smokeAsyncrenamedRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_AsyncRenamed_register_finalizer'));
final _smokeAsyncrenamedCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AsyncRenamed_copy_handle'));
final _smokeAsyncrenamedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncRenamed_release_handle'));
class AsyncRenamed$Impl extends __lib.NativeBase implements AsyncRenamed {
  AsyncRenamed$Impl(Pointer<Void> handle) : super(handle);
  @override
  Future<void> dispose() {
    final $completer = Completer<void>();
    _dispose__async(() {
      $completer.complete();
    });
    return $completer.future;
  }
  void _dispose__async(AsyncRenamed_dispose__completerLambda _completerLambda) {
    final __dispose__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AsyncRenamed_dispose__dispose__completerLambda'));
    final __completerLambdaHandle = smokeAsyncrenamedDisposecompleterlambdaToFfi(_completerLambda);
    final _handle = this.handle;
    __dispose__asyncFfi(_handle, __lib.LibraryContext.isolateId, __completerLambdaHandle);
    smokeAsyncrenamedDisposecompleterlambdaReleaseFfiHandle(__completerLambdaHandle);
  }
}
Pointer<Void> smokeAsyncrenamedToFfi(AsyncRenamed value) =>
  _smokeAsyncrenamedCopyHandle((value as __lib.NativeBase).handle);
AsyncRenamed smokeAsyncrenamedFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is AsyncRenamed) return instance;
  final _copiedHandle = _smokeAsyncrenamedCopyHandle(handle);
  final result = AsyncRenamed$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeAsyncrenamedRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeAsyncrenamedReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncrenamedReleaseHandle(handle);
Pointer<Void> smokeAsyncrenamedToFfiNullable(AsyncRenamed? value) =>
  value != null ? smokeAsyncrenamedToFfi(value) : Pointer<Void>.fromAddress(0);
AsyncRenamed? smokeAsyncrenamedFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeAsyncrenamedFromFfi(handle) : null;
void smokeAsyncrenamedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAsyncrenamedReleaseHandle(handle);
// End of AsyncRenamed "private" section.
typedef AsyncRenamed_dispose__completerLambda = void Function();
// AsyncRenamed_dispose__completerLambda "private" section, not exported.
final _smokeAsyncrenamedDisposecompleterlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncRenamed_DisposeCompleterlambda_release_handle'));
final _smokeAsyncrenamedDisposecompleterlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncRenamed_DisposeCompleterlambda_create_proxy'));
class AsyncRenamed_dispose__completerLambda$Impl {
  final Pointer<Void> handle;
  AsyncRenamed_dispose__completerLambda$Impl(this.handle);
  void dispose__completerLambda() {
    final _dispose__completerLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncRenamed_DisposeCompleterlambda_call'));
    final _handle = this.handle;
    _dispose__completerLambdaFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeAsyncrenamedDisposecompleterlambdadispose__completerLambdaStatic(Object _obj) {
  try {
    (_obj as AsyncRenamed_dispose__completerLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncrenamedDisposecompleterlambdaToFfi(AsyncRenamed_dispose__completerLambda value) =>
  _smokeAsyncrenamedDisposecompleterlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncrenamedDisposecompleterlambdadispose__completerLambdaStatic, __lib.unknownError)
  );
void smokeAsyncrenamedDisposecompleterlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncrenamedDisposecompleterlambdaReleaseHandle(handle);
// End of AsyncRenamed_dispose__completerLambda "private" section.
