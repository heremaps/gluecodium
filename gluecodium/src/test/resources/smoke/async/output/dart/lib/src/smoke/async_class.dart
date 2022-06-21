import 'dart:async';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/async_error_code.dart';
import 'package:library/src/smoke/async_exception.dart';
import 'package:meta/meta.dart';
abstract class AsyncClass {
  Future<void> asyncVoid(bool input);
  Future<void> asyncVoidThrows(bool input);
  Future<int> asyncInt(bool input);
  Future<int> asyncIntThrows(bool input);
  static Future<void> asyncStatic(bool input) => $prototype.asyncStatic(input);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = AsyncClass$Impl(Pointer<Void>.fromAddress(0));
}
// AsyncClass "private" section, not exported.
final _smokeAsyncclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_AsyncClass_register_finalizer'));
final _smokeAsyncclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AsyncClass_copy_handle'));
final _smokeAsyncclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_release_handle'));
/// @nodoc
@visibleForTesting
class AsyncClass$Impl extends __lib.NativeBase implements AsyncClass {
  AsyncClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  Future<void> asyncVoid(bool input) {
    final $completer = Completer<void>();
    _asyncVoid__async(() {
      $completer.complete();
    }, input);
    return $completer.future;
  }
  void _asyncVoid__async(AsyncClass_asyncVoid__completerLambda _completerLambda, bool input) {
    final __asyncVoid__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncClass_asyncVoid__asyncVoid__completerLambda_Boolean'));
    final __completerLambdaHandle = smokeAsyncclassAsyncvoidcompleterlambdaToFfi(_completerLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = this.handle;
    __asyncVoid__asyncFfi(_handle, __lib.LibraryContext.isolateId, __completerLambdaHandle, _inputHandle);
    smokeAsyncclassAsyncvoidcompleterlambdaReleaseFfiHandle(__completerLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  @override
  Future<void> asyncVoidThrows(bool input) {
    final $completer = Completer<void>();
    _asyncVoidThrows__async((bool $hasValue, AsyncErrorCode $error) {
      if ($hasValue) {
        $completer.complete();
      } else {
        $completer.completeError(AsyncException($error));
      }
    }, input);
    return $completer.future;
  }
  void _asyncVoidThrows__async(AsyncClass_asyncVoidThrows__completerLambda _completerLambda, bool input) {
    final __asyncVoidThrows__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncClass_asyncVoidThrows__asyncVoidThrows__completerLambda_Boolean'));
    final __completerLambdaHandle = smokeAsyncclassAsyncvoidthrowscompleterlambdaToFfi(_completerLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = this.handle;
    __asyncVoidThrows__asyncFfi(_handle, __lib.LibraryContext.isolateId, __completerLambdaHandle, _inputHandle);
    smokeAsyncclassAsyncvoidthrowscompleterlambdaReleaseFfiHandle(__completerLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  @override
  Future<int> asyncInt(bool input) {
    final $completer = Completer<int>();
    _asyncInt__async((int $result) {
      $completer.complete($result);
    }, input);
    return $completer.future;
  }
  void _asyncInt__async(AsyncClass_asyncInt__completerLambda _completerLambda, bool input) {
    final __asyncInt__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncClass_asyncInt__asyncInt__completerLambda_Boolean'));
    final __completerLambdaHandle = smokeAsyncclassAsyncintcompleterlambdaToFfi(_completerLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = this.handle;
    __asyncInt__asyncFfi(_handle, __lib.LibraryContext.isolateId, __completerLambdaHandle, _inputHandle);
    smokeAsyncclassAsyncintcompleterlambdaReleaseFfiHandle(__completerLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  @override
  Future<int> asyncIntThrows(bool input) {
    final $completer = Completer<int>();
    _asyncIntThrows__async((bool $hasValue, int $result, AsyncErrorCode $error) {
      if ($hasValue) {
        $completer.complete($result);
      } else {
        $completer.completeError(AsyncException($error));
      }
    }, input);
    return $completer.future;
  }
  void _asyncIntThrows__async(AsyncClass_asyncIntThrows__completerLambda _completerLambda, bool input) {
    final __asyncIntThrows__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncClass_asyncIntThrows__asyncIntThrows__completerLambda_Boolean'));
    final __completerLambdaHandle = smokeAsyncclassAsyncintthrowscompleterlambdaToFfi(_completerLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = this.handle;
    __asyncIntThrows__asyncFfi(_handle, __lib.LibraryContext.isolateId, __completerLambdaHandle, _inputHandle);
    smokeAsyncclassAsyncintthrowscompleterlambdaReleaseFfiHandle(__completerLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  Future<void> asyncStatic(bool input) {
    final $completer = Completer<void>();
    _asyncStatic__async(() {
      $completer.complete();
    }, input);
    return $completer.future;
  }
  void _asyncStatic__async(AsyncClass_asyncStatic__completerLambda _completerLambda, bool input) {
    final __asyncStatic__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Uint8), void Function(int, Pointer<Void>, int)>('library_smoke_AsyncClass_asyncStatic__asyncStatic__completerLambda_Boolean'));
    final __completerLambdaHandle = smokeAsyncclassAsyncstaticcompleterlambdaToFfi(_completerLambda);
    final _inputHandle = booleanToFfi(input);
    __asyncStatic__asyncFfi(__lib.LibraryContext.isolateId, __completerLambdaHandle, _inputHandle);
    smokeAsyncclassAsyncstaticcompleterlambdaReleaseFfiHandle(__completerLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
}
Pointer<Void> smokeAsyncclassToFfi(AsyncClass value) =>
  _smokeAsyncclassCopyHandle((value as __lib.NativeBase).handle);
AsyncClass smokeAsyncclassFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is AsyncClass) return instance;
  final _copiedHandle = _smokeAsyncclassCopyHandle(handle);
  final result = AsyncClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeAsyncclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeAsyncclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassReleaseHandle(handle);
Pointer<Void> smokeAsyncclassToFfiNullable(AsyncClass? value) =>
  value != null ? smokeAsyncclassToFfi(value) : Pointer<Void>.fromAddress(0);
AsyncClass? smokeAsyncclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeAsyncclassFromFfi(handle) : null;
void smokeAsyncclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAsyncclassReleaseHandle(handle);
// End of AsyncClass "private" section.
typedef AsyncClass_asyncVoid__completerLambda = void Function();
// AsyncClass_asyncVoid__completerLambda "private" section, not exported.
final _smokeAsyncclassAsyncvoidcompleterlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncvoidCompleterlambda_release_handle'));
final _smokeAsyncclassAsyncvoidcompleterlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncvoidCompleterlambda_create_proxy'));
class AsyncClass_asyncVoid__completerLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncVoid__completerLambda$Impl(this.handle);
  void asyncVoid__completerLambda() {
    final _asyncVoid__completerLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncClass_AsyncvoidCompleterlambda_call'));
    final _handle = this.handle;
    _asyncVoid__completerLambdaFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeAsyncclassAsyncvoidcompleterlambdaasyncVoid__completerLambdaStatic(Object _obj) {
  try {
    (_obj as AsyncClass_asyncVoid__completerLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncvoidcompleterlambdaToFfi(AsyncClass_asyncVoid__completerLambda value) =>
  _smokeAsyncclassAsyncvoidcompleterlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncclassAsyncvoidcompleterlambdaasyncVoid__completerLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncvoidcompleterlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncvoidcompleterlambdaReleaseHandle(handle);
// End of AsyncClass_asyncVoid__completerLambda "private" section.
typedef AsyncClass_asyncVoidThrows__completerLambda = void Function(bool, AsyncErrorCode);
// AsyncClass_asyncVoidThrows__completerLambda "private" section, not exported.
final _smokeAsyncclassAsyncvoidthrowscompleterlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_release_handle'));
final _smokeAsyncclassAsyncvoidthrowscompleterlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_create_proxy'));
class AsyncClass_asyncVoidThrows__completerLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncVoidThrows__completerLambda$Impl(this.handle);
  void asyncVoidThrows__completerLambda(bool p0, AsyncErrorCode p1) {
    final _asyncVoidThrows__completerLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8, Uint32), void Function(Pointer<Void>, int, int, int)>('library_smoke_AsyncClass_AsyncvoidthrowsCompleterlambda_call__Boolean_AsyncErrorCode'));
    final _p0Handle = booleanToFfi(p0);
    final _p1Handle = smokeAsyncerrorcodeToFfi(p1);
    final _handle = this.handle;
    _asyncVoidThrows__completerLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    booleanReleaseFfiHandle(_p0Handle);
    smokeAsyncerrorcodeReleaseFfiHandle(_p1Handle);
  }
}
int _smokeAsyncclassAsyncvoidthrowscompleterlambdaasyncVoidThrows__completerLambdaStatic(Object _obj, int p0, int p1) {
  try {
    (_obj as AsyncClass_asyncVoidThrows__completerLambda)(booleanFromFfi(p0), smokeAsyncerrorcodeFromFfi(p1));
  } finally {
    booleanReleaseFfiHandle(p0);
    smokeAsyncerrorcodeReleaseFfiHandle(p1);
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncvoidthrowscompleterlambdaToFfi(AsyncClass_asyncVoidThrows__completerLambda value) =>
  _smokeAsyncclassAsyncvoidthrowscompleterlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Uint8, Uint32)>(_smokeAsyncclassAsyncvoidthrowscompleterlambdaasyncVoidThrows__completerLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncvoidthrowscompleterlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncvoidthrowscompleterlambdaReleaseHandle(handle);
// End of AsyncClass_asyncVoidThrows__completerLambda "private" section.
typedef AsyncClass_asyncInt__completerLambda = void Function(int);
// AsyncClass_asyncInt__completerLambda "private" section, not exported.
final _smokeAsyncclassAsyncintcompleterlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncintCompleterlambda_release_handle'));
final _smokeAsyncclassAsyncintcompleterlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncintCompleterlambda_create_proxy'));
class AsyncClass_asyncInt__completerLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncInt__completerLambda$Impl(this.handle);
  void asyncInt__completerLambda(int p0) {
    final _asyncInt__completerLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('library_smoke_AsyncClass_AsyncintCompleterlambda_call__Int'));
    final _p0Handle = (p0);
    final _handle = this.handle;
    _asyncInt__completerLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
  }
}
int _smokeAsyncclassAsyncintcompleterlambdaasyncInt__completerLambdaStatic(Object _obj, int p0) {
  try {
    (_obj as AsyncClass_asyncInt__completerLambda)((p0));
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncintcompleterlambdaToFfi(AsyncClass_asyncInt__completerLambda value) =>
  _smokeAsyncclassAsyncintcompleterlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Int32)>(_smokeAsyncclassAsyncintcompleterlambdaasyncInt__completerLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncintcompleterlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncintcompleterlambdaReleaseHandle(handle);
// End of AsyncClass_asyncInt__completerLambda "private" section.
typedef AsyncClass_asyncIntThrows__completerLambda = void Function(bool, int, AsyncErrorCode);
// AsyncClass_asyncIntThrows__completerLambda "private" section, not exported.
final _smokeAsyncclassAsyncintthrowscompleterlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncintthrowsCompleterlambda_release_handle'));
final _smokeAsyncclassAsyncintthrowscompleterlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncintthrowsCompleterlambda_create_proxy'));
class AsyncClass_asyncIntThrows__completerLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncIntThrows__completerLambda$Impl(this.handle);
  void asyncIntThrows__completerLambda(bool p0, int p1, AsyncErrorCode p2) {
    final _asyncIntThrows__completerLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8, Int32, Uint32), void Function(Pointer<Void>, int, int, int, int)>('library_smoke_AsyncClass_AsyncintthrowsCompleterlambda_call__Boolean_Int_AsyncErrorCode'));
    final _p0Handle = booleanToFfi(p0);
    final _p1Handle = (p1);
    final _p2Handle = smokeAsyncerrorcodeToFfi(p2);
    final _handle = this.handle;
    _asyncIntThrows__completerLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle, _p2Handle);
    booleanReleaseFfiHandle(_p0Handle);
    smokeAsyncerrorcodeReleaseFfiHandle(_p2Handle);
  }
}
int _smokeAsyncclassAsyncintthrowscompleterlambdaasyncIntThrows__completerLambdaStatic(Object _obj, int p0, int p1, int p2) {
  try {
    (_obj as AsyncClass_asyncIntThrows__completerLambda)(booleanFromFfi(p0), (p1), smokeAsyncerrorcodeFromFfi(p2));
  } finally {
    booleanReleaseFfiHandle(p0);
    smokeAsyncerrorcodeReleaseFfiHandle(p2);
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncintthrowscompleterlambdaToFfi(AsyncClass_asyncIntThrows__completerLambda value) =>
  _smokeAsyncclassAsyncintthrowscompleterlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Uint8, Int32, Uint32)>(_smokeAsyncclassAsyncintthrowscompleterlambdaasyncIntThrows__completerLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncintthrowscompleterlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncintthrowscompleterlambdaReleaseHandle(handle);
// End of AsyncClass_asyncIntThrows__completerLambda "private" section.
typedef AsyncClass_asyncStatic__completerLambda = void Function();
// AsyncClass_asyncStatic__completerLambda "private" section, not exported.
final _smokeAsyncclassAsyncstaticcompleterlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncstaticCompleterlambda_release_handle'));
final _smokeAsyncclassAsyncstaticcompleterlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncstaticCompleterlambda_create_proxy'));
class AsyncClass_asyncStatic__completerLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncStatic__completerLambda$Impl(this.handle);
  void asyncStatic__completerLambda() {
    final _asyncStatic__completerLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncClass_AsyncstaticCompleterlambda_call'));
    final _handle = this.handle;
    _asyncStatic__completerLambdaFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeAsyncclassAsyncstaticcompleterlambdaasyncStatic__completerLambdaStatic(Object _obj) {
  try {
    (_obj as AsyncClass_asyncStatic__completerLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncstaticcompleterlambdaToFfi(AsyncClass_asyncStatic__completerLambda value) =>
  _smokeAsyncclassAsyncstaticcompleterlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncclassAsyncstaticcompleterlambdaasyncStatic__completerLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncstaticcompleterlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncstaticcompleterlambdaReleaseHandle(handle);
// End of AsyncClass_asyncStatic__completerLambda "private" section.
