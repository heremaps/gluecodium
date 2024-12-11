

import 'dart:async';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;

abstract class AsyncRenamed implements Finalizable {


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
    _dispose__async(
      () => $completer.complete()
    );
    return $completer.future;
  }

  void _dispose__async(AsyncRenamed_dispose__resultLambda _resultLambda) {
    final __dispose__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AsyncRenamed_dispose__dispose__resultLambda'));
    final __resultLambdaHandle = smokeAsyncrenamedDisposeresultlambdaToFfi(_resultLambda);
    final _handle = this.handle;
    __dispose__asyncFfi(_handle, __lib.LibraryContext.isolateId, __resultLambdaHandle);
    smokeAsyncrenamedDisposeresultlambdaReleaseFfiHandle(__resultLambdaHandle);

  }


}

Pointer<Void> smokeAsyncrenamedToFfi(AsyncRenamed value) =>
  _smokeAsyncrenamedCopyHandle((value as __lib.NativeBase).handle);

AsyncRenamed smokeAsyncrenamedFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
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


typedef AsyncRenamed_dispose__resultLambda = void Function();

// AsyncRenamed_dispose__resultLambda "private" section, not exported.

final _smokeAsyncrenamedDisposeresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncRenamed_DisposeResultlambda_release_handle'));
final _smokeAsyncrenamedDisposeresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncRenamed_DisposeResultlambda_create_proxy'));

class AsyncRenamed_dispose__resultLambda$Impl implements Finalizable {
  final Pointer<Void> handle;
  AsyncRenamed_dispose__resultLambda$Impl(this.handle);

  void dispose__resultLambda() {
    final _dispose__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncRenamed_DisposeResultlambda_call'));
    final _handle = this.handle;
    _dispose__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId);

  }

}

int _smokeAsyncrenamedDisposeresultlambdadispose__resultLambdaStatic(Object _obj) {
  
  try {
    (_obj as AsyncRenamed_dispose__resultLambda)();
  } finally {
  }
  return 0;
}

Pointer<Void> smokeAsyncrenamedDisposeresultlambdaToFfi(AsyncRenamed_dispose__resultLambda value) =>
  _smokeAsyncrenamedDisposeresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncrenamedDisposeresultlambdadispose__resultLambdaStatic, __lib.unknownError)
  );


void smokeAsyncrenamedDisposeresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncrenamedDisposeresultlambdaReleaseHandle(handle);


// End of AsyncRenamed_dispose__resultLambda "private" section.
