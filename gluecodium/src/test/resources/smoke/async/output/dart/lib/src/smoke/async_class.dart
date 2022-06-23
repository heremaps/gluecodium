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
    _asyncVoid__async(
      () => $completer.complete(),
      input
    );
    return $completer.future;
  }
  void _asyncVoid__async(AsyncClass_asyncVoid__resultLambda _resultLambda, bool input) {
    final __asyncVoid__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncClass_asyncVoid__asyncVoid__resultLambda_Boolean'));
    final __resultLambdaHandle = smokeAsyncclassAsyncvoidresultlambdaToFfi(_resultLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = this.handle;
    __asyncVoid__asyncFfi(_handle, __lib.LibraryContext.isolateId, __resultLambdaHandle, _inputHandle);
    smokeAsyncclassAsyncvoidresultlambdaReleaseFfiHandle(__resultLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  @override
  Future<void> asyncVoidThrows(bool input) {
    final $completer = Completer<void>();
    _asyncVoidThrows__async(
      () => $completer.complete(),
      (AsyncErrorCode $error) => $completer.completeError(AsyncException($error)),
      input
    );
    return $completer.future;
  }
  void _asyncVoidThrows__async(AsyncClass_asyncVoidThrows__resultLambda _resultLambda, AsyncClass_asyncVoidThrows__errorLambda _errorLambda, bool input) {
    final __asyncVoidThrows__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, int)>('library_smoke_AsyncClass_asyncVoidThrows__asyncVoidThrows__resultLambda_asyncVoidThrows__errorLambda_Boolean'));
    final __resultLambdaHandle = smokeAsyncclassAsyncvoidthrowsresultlambdaToFfi(_resultLambda);
    final __errorLambdaHandle = smokeAsyncclassAsyncvoidthrowserrorlambdaToFfi(_errorLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = this.handle;
    __asyncVoidThrows__asyncFfi(_handle, __lib.LibraryContext.isolateId, __resultLambdaHandle, __errorLambdaHandle, _inputHandle);
    smokeAsyncclassAsyncvoidthrowsresultlambdaReleaseFfiHandle(__resultLambdaHandle);
    smokeAsyncclassAsyncvoidthrowserrorlambdaReleaseFfiHandle(__errorLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  @override
  Future<int> asyncInt(bool input) {
    final $completer = Completer<int>();
    _asyncInt__async(
      (int $result) => $completer.complete($result),
      input
    );
    return $completer.future;
  }
  void _asyncInt__async(AsyncClass_asyncInt__resultLambda _resultLambda, bool input) {
    final __asyncInt__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncClass_asyncInt__asyncInt__resultLambda_Boolean'));
    final __resultLambdaHandle = smokeAsyncclassAsyncintresultlambdaToFfi(_resultLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = this.handle;
    __asyncInt__asyncFfi(_handle, __lib.LibraryContext.isolateId, __resultLambdaHandle, _inputHandle);
    smokeAsyncclassAsyncintresultlambdaReleaseFfiHandle(__resultLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  @override
  Future<int> asyncIntThrows(bool input) {
    final $completer = Completer<int>();
    _asyncIntThrows__async(
      (int $result) => $completer.complete($result),
      (AsyncErrorCode $error) => $completer.completeError(AsyncException($error)),
      input
    );
    return $completer.future;
  }
  void _asyncIntThrows__async(AsyncClass_asyncIntThrows__resultLambda _resultLambda, AsyncClass_asyncIntThrows__errorLambda _errorLambda, bool input) {
    final __asyncIntThrows__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, int)>('library_smoke_AsyncClass_asyncIntThrows__asyncIntThrows__resultLambda_asyncIntThrows__errorLambda_Boolean'));
    final __resultLambdaHandle = smokeAsyncclassAsyncintthrowsresultlambdaToFfi(_resultLambda);
    final __errorLambdaHandle = smokeAsyncclassAsyncintthrowserrorlambdaToFfi(_errorLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = this.handle;
    __asyncIntThrows__asyncFfi(_handle, __lib.LibraryContext.isolateId, __resultLambdaHandle, __errorLambdaHandle, _inputHandle);
    smokeAsyncclassAsyncintthrowsresultlambdaReleaseFfiHandle(__resultLambdaHandle);
    smokeAsyncclassAsyncintthrowserrorlambdaReleaseFfiHandle(__errorLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  Future<void> asyncStatic(bool input) {
    final $completer = Completer<void>();
    _asyncStatic__async(
      () => $completer.complete(),
      input
    );
    return $completer.future;
  }
  void _asyncStatic__async(AsyncClass_asyncStatic__resultLambda _resultLambda, bool input) {
    final __asyncStatic__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Uint8), void Function(int, Pointer<Void>, int)>('library_smoke_AsyncClass_asyncStatic__asyncStatic__resultLambda_Boolean'));
    final __resultLambdaHandle = smokeAsyncclassAsyncstaticresultlambdaToFfi(_resultLambda);
    final _inputHandle = booleanToFfi(input);
    __asyncStatic__asyncFfi(__lib.LibraryContext.isolateId, __resultLambdaHandle, _inputHandle);
    smokeAsyncclassAsyncstaticresultlambdaReleaseFfiHandle(__resultLambdaHandle);
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
typedef AsyncClass_asyncVoid__resultLambda = void Function();
// AsyncClass_asyncVoid__resultLambda "private" section, not exported.
final _smokeAsyncclassAsyncvoidresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncvoidResultlambda_release_handle'));
final _smokeAsyncclassAsyncvoidresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncvoidResultlambda_create_proxy'));
class AsyncClass_asyncVoid__resultLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncVoid__resultLambda$Impl(this.handle);
  void asyncVoid__resultLambda() {
    final _asyncVoid__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncClass_AsyncvoidResultlambda_call'));
    final _handle = this.handle;
    _asyncVoid__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeAsyncclassAsyncvoidresultlambdaasyncVoid__resultLambdaStatic(Object _obj) {
  try {
    (_obj as AsyncClass_asyncVoid__resultLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncvoidresultlambdaToFfi(AsyncClass_asyncVoid__resultLambda value) =>
  _smokeAsyncclassAsyncvoidresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncclassAsyncvoidresultlambdaasyncVoid__resultLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncvoidresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncvoidresultlambdaReleaseHandle(handle);
// End of AsyncClass_asyncVoid__resultLambda "private" section.
typedef AsyncClass_asyncVoidThrows__resultLambda = void Function();
// AsyncClass_asyncVoidThrows__resultLambda "private" section, not exported.
final _smokeAsyncclassAsyncvoidthrowsresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncvoidthrowsResultlambda_release_handle'));
final _smokeAsyncclassAsyncvoidthrowsresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncvoidthrowsResultlambda_create_proxy'));
class AsyncClass_asyncVoidThrows__resultLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncVoidThrows__resultLambda$Impl(this.handle);
  void asyncVoidThrows__resultLambda() {
    final _asyncVoidThrows__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncClass_AsyncvoidthrowsResultlambda_call'));
    final _handle = this.handle;
    _asyncVoidThrows__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeAsyncclassAsyncvoidthrowsresultlambdaasyncVoidThrows__resultLambdaStatic(Object _obj) {
  try {
    (_obj as AsyncClass_asyncVoidThrows__resultLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncvoidthrowsresultlambdaToFfi(AsyncClass_asyncVoidThrows__resultLambda value) =>
  _smokeAsyncclassAsyncvoidthrowsresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncclassAsyncvoidthrowsresultlambdaasyncVoidThrows__resultLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncvoidthrowsresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncvoidthrowsresultlambdaReleaseHandle(handle);
// End of AsyncClass_asyncVoidThrows__resultLambda "private" section.
typedef AsyncClass_asyncVoidThrows__errorLambda = void Function(AsyncErrorCode);
// AsyncClass_asyncVoidThrows__errorLambda "private" section, not exported.
final _smokeAsyncclassAsyncvoidthrowserrorlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncvoidthrowsErrorlambda_release_handle'));
final _smokeAsyncclassAsyncvoidthrowserrorlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncvoidthrowsErrorlambda_create_proxy'));
class AsyncClass_asyncVoidThrows__errorLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncVoidThrows__errorLambda$Impl(this.handle);
  void asyncVoidThrows__errorLambda(AsyncErrorCode p0) {
    final _asyncVoidThrows__errorLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_smoke_AsyncClass_AsyncvoidthrowsErrorlambda_call__AsyncErrorCode'));
    final _p0Handle = smokeAsyncerrorcodeToFfi(p0);
    final _handle = this.handle;
    _asyncVoidThrows__errorLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    smokeAsyncerrorcodeReleaseFfiHandle(_p0Handle);
  }
}
int _smokeAsyncclassAsyncvoidthrowserrorlambdaasyncVoidThrows__errorLambdaStatic(Object _obj, int p0) {
  try {
    (_obj as AsyncClass_asyncVoidThrows__errorLambda)(smokeAsyncerrorcodeFromFfi(p0));
  } finally {
    smokeAsyncerrorcodeReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncvoidthrowserrorlambdaToFfi(AsyncClass_asyncVoidThrows__errorLambda value) =>
  _smokeAsyncclassAsyncvoidthrowserrorlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Uint32)>(_smokeAsyncclassAsyncvoidthrowserrorlambdaasyncVoidThrows__errorLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncvoidthrowserrorlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncvoidthrowserrorlambdaReleaseHandle(handle);
// End of AsyncClass_asyncVoidThrows__errorLambda "private" section.
typedef AsyncClass_asyncInt__resultLambda = void Function(int);
// AsyncClass_asyncInt__resultLambda "private" section, not exported.
final _smokeAsyncclassAsyncintresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncintResultlambda_release_handle'));
final _smokeAsyncclassAsyncintresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncintResultlambda_create_proxy'));
class AsyncClass_asyncInt__resultLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncInt__resultLambda$Impl(this.handle);
  void asyncInt__resultLambda(int p0) {
    final _asyncInt__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('library_smoke_AsyncClass_AsyncintResultlambda_call__Int'));
    final _p0Handle = (p0);
    final _handle = this.handle;
    _asyncInt__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
  }
}
int _smokeAsyncclassAsyncintresultlambdaasyncInt__resultLambdaStatic(Object _obj, int p0) {
  try {
    (_obj as AsyncClass_asyncInt__resultLambda)((p0));
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncintresultlambdaToFfi(AsyncClass_asyncInt__resultLambda value) =>
  _smokeAsyncclassAsyncintresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Int32)>(_smokeAsyncclassAsyncintresultlambdaasyncInt__resultLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncintresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncintresultlambdaReleaseHandle(handle);
// End of AsyncClass_asyncInt__resultLambda "private" section.
typedef AsyncClass_asyncIntThrows__resultLambda = void Function(int);
// AsyncClass_asyncIntThrows__resultLambda "private" section, not exported.
final _smokeAsyncclassAsyncintthrowsresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncintthrowsResultlambda_release_handle'));
final _smokeAsyncclassAsyncintthrowsresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncintthrowsResultlambda_create_proxy'));
class AsyncClass_asyncIntThrows__resultLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncIntThrows__resultLambda$Impl(this.handle);
  void asyncIntThrows__resultLambda(int p0) {
    final _asyncIntThrows__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('library_smoke_AsyncClass_AsyncintthrowsResultlambda_call__Int'));
    final _p0Handle = (p0);
    final _handle = this.handle;
    _asyncIntThrows__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
  }
}
int _smokeAsyncclassAsyncintthrowsresultlambdaasyncIntThrows__resultLambdaStatic(Object _obj, int p0) {
  try {
    (_obj as AsyncClass_asyncIntThrows__resultLambda)((p0));
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncintthrowsresultlambdaToFfi(AsyncClass_asyncIntThrows__resultLambda value) =>
  _smokeAsyncclassAsyncintthrowsresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Int32)>(_smokeAsyncclassAsyncintthrowsresultlambdaasyncIntThrows__resultLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncintthrowsresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncintthrowsresultlambdaReleaseHandle(handle);
// End of AsyncClass_asyncIntThrows__resultLambda "private" section.
typedef AsyncClass_asyncIntThrows__errorLambda = void Function(AsyncErrorCode);
// AsyncClass_asyncIntThrows__errorLambda "private" section, not exported.
final _smokeAsyncclassAsyncintthrowserrorlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncintthrowsErrorlambda_release_handle'));
final _smokeAsyncclassAsyncintthrowserrorlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncintthrowsErrorlambda_create_proxy'));
class AsyncClass_asyncIntThrows__errorLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncIntThrows__errorLambda$Impl(this.handle);
  void asyncIntThrows__errorLambda(AsyncErrorCode p0) {
    final _asyncIntThrows__errorLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_smoke_AsyncClass_AsyncintthrowsErrorlambda_call__AsyncErrorCode'));
    final _p0Handle = smokeAsyncerrorcodeToFfi(p0);
    final _handle = this.handle;
    _asyncIntThrows__errorLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    smokeAsyncerrorcodeReleaseFfiHandle(_p0Handle);
  }
}
int _smokeAsyncclassAsyncintthrowserrorlambdaasyncIntThrows__errorLambdaStatic(Object _obj, int p0) {
  try {
    (_obj as AsyncClass_asyncIntThrows__errorLambda)(smokeAsyncerrorcodeFromFfi(p0));
  } finally {
    smokeAsyncerrorcodeReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncintthrowserrorlambdaToFfi(AsyncClass_asyncIntThrows__errorLambda value) =>
  _smokeAsyncclassAsyncintthrowserrorlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Uint32)>(_smokeAsyncclassAsyncintthrowserrorlambdaasyncIntThrows__errorLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncintthrowserrorlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncintthrowserrorlambdaReleaseHandle(handle);
// End of AsyncClass_asyncIntThrows__errorLambda "private" section.
typedef AsyncClass_asyncStatic__resultLambda = void Function();
// AsyncClass_asyncStatic__resultLambda "private" section, not exported.
final _smokeAsyncclassAsyncstaticresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncClass_AsyncstaticResultlambda_release_handle'));
final _smokeAsyncclassAsyncstaticresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncClass_AsyncstaticResultlambda_create_proxy'));
class AsyncClass_asyncStatic__resultLambda$Impl {
  final Pointer<Void> handle;
  AsyncClass_asyncStatic__resultLambda$Impl(this.handle);
  void asyncStatic__resultLambda() {
    final _asyncStatic__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncClass_AsyncstaticResultlambda_call'));
    final _handle = this.handle;
    _asyncStatic__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeAsyncclassAsyncstaticresultlambdaasyncStatic__resultLambdaStatic(Object _obj) {
  try {
    (_obj as AsyncClass_asyncStatic__resultLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncclassAsyncstaticresultlambdaToFfi(AsyncClass_asyncStatic__resultLambda value) =>
  _smokeAsyncclassAsyncstaticresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncclassAsyncstaticresultlambdaasyncStatic__resultLambdaStatic, __lib.unknownError)
  );
void smokeAsyncclassAsyncstaticresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncclassAsyncstaticresultlambdaReleaseHandle(handle);
// End of AsyncClass_asyncStatic__resultLambda "private" section.
