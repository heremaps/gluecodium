import 'dart:async';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/throw_me_exception.dart';
import 'package:meta/meta.dart';
class AsyncStruct {
  String stringField;
  AsyncStruct(this.stringField);
  Future<void> asyncVoid(bool input) => $prototype.asyncVoid(this, input);
  Future<void> asyncVoidThrows(bool input) => $prototype.asyncVoidThrows(this, input);
  Future<int> asyncInt(bool input) => $prototype.asyncInt(this, input);
  Future<int> asyncIntThrows(bool input) => $prototype.asyncIntThrows(this, input);
  static Future<void> asyncStatic(bool input) => $prototype.asyncStatic(input);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = AsyncStruct$Impl();
}
// AsyncStruct "private" section, not exported.
final _smokeAsyncstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_create_handle'));
final _smokeAsyncstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_release_handle'));
final _smokeAsyncstructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_get_field_stringField'));
/// @nodoc
@visibleForTesting
class AsyncStruct$Impl {
  Future<void> asyncVoid(AsyncStruct $that, bool input) {
    final $completer = Completer<void>();
    _asyncVoid__async($that,
      () => $completer.complete(),
      input
    );
    return $completer.future;
  }
  void _asyncVoid__async(AsyncStruct $that, AsyncStruct_asyncVoid__resultLambda _resultLambda, bool input) {
    final __asyncVoid__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncStruct_asyncVoid__asyncVoid__resultLambda_Boolean'));
    final __resultLambdaHandle = smokeAsyncstructAsyncvoidresultlambdaToFfi(_resultLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = smokeAsyncstructToFfi($that);
    __asyncVoid__asyncFfi(_handle, __lib.LibraryContext.isolateId, __resultLambdaHandle, _inputHandle);
    smokeAsyncstructReleaseFfiHandle(_handle);
    smokeAsyncstructAsyncvoidresultlambdaReleaseFfiHandle(__resultLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  Future<void> asyncVoidThrows(AsyncStruct $that, bool input) {
    final $completer = Completer<void>();
    _asyncVoidThrows__async($that,
      () => $completer.complete(),
      (String $error) => $completer.completeError(ThrowMeException($error)),
      input
    );
    return $completer.future;
  }
  void _asyncVoidThrows__async(AsyncStruct $that, AsyncStruct_asyncVoidThrows__resultLambda _resultLambda, AsyncStruct_asyncVoidThrows__errorLambda _errorLambda, bool input) {
    final __asyncVoidThrows__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, int)>('library_smoke_AsyncStruct_asyncVoidThrows__asyncVoidThrows__resultLambda_asyncVoidThrows__errorLambda_Boolean'));
    final __resultLambdaHandle = smokeAsyncstructAsyncvoidthrowsresultlambdaToFfi(_resultLambda);
    final __errorLambdaHandle = smokeAsyncstructAsyncvoidthrowserrorlambdaToFfi(_errorLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = smokeAsyncstructToFfi($that);
    __asyncVoidThrows__asyncFfi(_handle, __lib.LibraryContext.isolateId, __resultLambdaHandle, __errorLambdaHandle, _inputHandle);
    smokeAsyncstructReleaseFfiHandle(_handle);
    smokeAsyncstructAsyncvoidthrowsresultlambdaReleaseFfiHandle(__resultLambdaHandle);
    smokeAsyncstructAsyncvoidthrowserrorlambdaReleaseFfiHandle(__errorLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  Future<int> asyncInt(AsyncStruct $that, bool input) {
    final $completer = Completer<int>();
    _asyncInt__async($that,
      (int $result) => $completer.complete($result),
      input
    );
    return $completer.future;
  }
  void _asyncInt__async(AsyncStruct $that, AsyncStruct_asyncInt__resultLambda _resultLambda, bool input) {
    final __asyncInt__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncStruct_asyncInt__asyncInt__resultLambda_Boolean'));
    final __resultLambdaHandle = smokeAsyncstructAsyncintresultlambdaToFfi(_resultLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = smokeAsyncstructToFfi($that);
    __asyncInt__asyncFfi(_handle, __lib.LibraryContext.isolateId, __resultLambdaHandle, _inputHandle);
    smokeAsyncstructReleaseFfiHandle(_handle);
    smokeAsyncstructAsyncintresultlambdaReleaseFfiHandle(__resultLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  Future<int> asyncIntThrows(AsyncStruct $that, bool input) {
    final $completer = Completer<int>();
    _asyncIntThrows__async($that,
      (int $result) => $completer.complete($result),
      (String $error) => $completer.completeError(ThrowMeException($error)),
      input
    );
    return $completer.future;
  }
  void _asyncIntThrows__async(AsyncStruct $that, AsyncStruct_asyncIntThrows__resultLambda _resultLambda, AsyncStruct_asyncIntThrows__errorLambda _errorLambda, bool input) {
    final __asyncIntThrows__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, int)>('library_smoke_AsyncStruct_asyncIntThrows__asyncIntThrows__resultLambda_asyncIntThrows__errorLambda_Boolean'));
    final __resultLambdaHandle = smokeAsyncstructAsyncintthrowsresultlambdaToFfi(_resultLambda);
    final __errorLambdaHandle = smokeAsyncstructAsyncintthrowserrorlambdaToFfi(_errorLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = smokeAsyncstructToFfi($that);
    __asyncIntThrows__asyncFfi(_handle, __lib.LibraryContext.isolateId, __resultLambdaHandle, __errorLambdaHandle, _inputHandle);
    smokeAsyncstructReleaseFfiHandle(_handle);
    smokeAsyncstructAsyncintthrowsresultlambdaReleaseFfiHandle(__resultLambdaHandle);
    smokeAsyncstructAsyncintthrowserrorlambdaReleaseFfiHandle(__errorLambdaHandle);
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
  void _asyncStatic__async(AsyncStruct_asyncStatic__resultLambda _resultLambda, bool input) {
    final __asyncStatic__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Uint8), void Function(int, Pointer<Void>, int)>('library_smoke_AsyncStruct_asyncStatic__asyncStatic__resultLambda_Boolean'));
    final __resultLambdaHandle = smokeAsyncstructAsyncstaticresultlambdaToFfi(_resultLambda);
    final _inputHandle = booleanToFfi(input);
    __asyncStatic__asyncFfi(__lib.LibraryContext.isolateId, __resultLambdaHandle, _inputHandle);
    smokeAsyncstructAsyncstaticresultlambdaReleaseFfiHandle(__resultLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
}
Pointer<Void> smokeAsyncstructToFfi(AsyncStruct value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeAsyncstructCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
AsyncStruct smokeAsyncstructFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeAsyncstructGetFieldstringField(handle);
  try {
    return AsyncStruct(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeAsyncstructReleaseFfiHandle(Pointer<Void> handle) => _smokeAsyncstructReleaseHandle(handle);
// Nullable AsyncStruct
final _smokeAsyncstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_create_handle_nullable'));
final _smokeAsyncstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_release_handle_nullable'));
final _smokeAsyncstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_get_value_nullable'));
Pointer<Void> smokeAsyncstructToFfiNullable(AsyncStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeAsyncstructToFfi(value);
  final result = _smokeAsyncstructCreateHandleNullable(_handle);
  smokeAsyncstructReleaseFfiHandle(_handle);
  return result;
}
AsyncStruct? smokeAsyncstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeAsyncstructGetValueNullable(handle);
  final result = smokeAsyncstructFromFfi(_handle);
  smokeAsyncstructReleaseFfiHandle(_handle);
  return result;
}
void smokeAsyncstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAsyncstructReleaseHandleNullable(handle);
// End of AsyncStruct "private" section.
typedef AsyncStruct_asyncVoid__resultLambda = void Function();
// AsyncStruct_asyncVoid__resultLambda "private" section, not exported.
final _smokeAsyncstructAsyncvoidresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncvoidResultlambda_release_handle'));
final _smokeAsyncstructAsyncvoidresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncvoidResultlambda_create_proxy'));
class AsyncStruct_asyncVoid__resultLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncVoid__resultLambda$Impl(this.handle);
  void asyncVoid__resultLambda() {
    final _asyncVoid__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncStruct_AsyncvoidResultlambda_call'));
    final _handle = this.handle;
    _asyncVoid__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeAsyncstructAsyncvoidresultlambdaasyncVoid__resultLambdaStatic(Object _obj) {
  try {
    (_obj as AsyncStruct_asyncVoid__resultLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncvoidresultlambdaToFfi(AsyncStruct_asyncVoid__resultLambda value) =>
  _smokeAsyncstructAsyncvoidresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncstructAsyncvoidresultlambdaasyncVoid__resultLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncvoidresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncvoidresultlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncVoid__resultLambda "private" section.
typedef AsyncStruct_asyncVoidThrows__resultLambda = void Function();
// AsyncStruct_asyncVoidThrows__resultLambda "private" section, not exported.
final _smokeAsyncstructAsyncvoidthrowsresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncvoidthrowsResultlambda_release_handle'));
final _smokeAsyncstructAsyncvoidthrowsresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncvoidthrowsResultlambda_create_proxy'));
class AsyncStruct_asyncVoidThrows__resultLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncVoidThrows__resultLambda$Impl(this.handle);
  void asyncVoidThrows__resultLambda() {
    final _asyncVoidThrows__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncStruct_AsyncvoidthrowsResultlambda_call'));
    final _handle = this.handle;
    _asyncVoidThrows__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeAsyncstructAsyncvoidthrowsresultlambdaasyncVoidThrows__resultLambdaStatic(Object _obj) {
  try {
    (_obj as AsyncStruct_asyncVoidThrows__resultLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncvoidthrowsresultlambdaToFfi(AsyncStruct_asyncVoidThrows__resultLambda value) =>
  _smokeAsyncstructAsyncvoidthrowsresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncstructAsyncvoidthrowsresultlambdaasyncVoidThrows__resultLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncvoidthrowsresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncvoidthrowsresultlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncVoidThrows__resultLambda "private" section.
typedef AsyncStruct_asyncVoidThrows__errorLambda = void Function(String);
// AsyncStruct_asyncVoidThrows__errorLambda "private" section, not exported.
final _smokeAsyncstructAsyncvoidthrowserrorlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncvoidthrowsErrorlambda_release_handle'));
final _smokeAsyncstructAsyncvoidthrowserrorlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncvoidthrowsErrorlambda_create_proxy'));
class AsyncStruct_asyncVoidThrows__errorLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncVoidThrows__errorLambda$Impl(this.handle);
  void asyncVoidThrows__errorLambda(String p0) {
    final _asyncVoidThrows__errorLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AsyncStruct_AsyncvoidthrowsErrorlambda_call__String'));
    final _p0Handle = stringToFfi(p0);
    final _handle = this.handle;
    _asyncVoidThrows__errorLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    stringReleaseFfiHandle(_p0Handle);
  }
}
int _smokeAsyncstructAsyncvoidthrowserrorlambdaasyncVoidThrows__errorLambdaStatic(Object _obj, Pointer<Void> p0) {
  try {
    (_obj as AsyncStruct_asyncVoidThrows__errorLambda)(stringFromFfi(p0));
  } finally {
    stringReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncvoidthrowserrorlambdaToFfi(AsyncStruct_asyncVoidThrows__errorLambda value) =>
  _smokeAsyncstructAsyncvoidthrowserrorlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_smokeAsyncstructAsyncvoidthrowserrorlambdaasyncVoidThrows__errorLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncvoidthrowserrorlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncvoidthrowserrorlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncVoidThrows__errorLambda "private" section.
typedef AsyncStruct_asyncInt__resultLambda = void Function(int);
// AsyncStruct_asyncInt__resultLambda "private" section, not exported.
final _smokeAsyncstructAsyncintresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncintResultlambda_release_handle'));
final _smokeAsyncstructAsyncintresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncintResultlambda_create_proxy'));
class AsyncStruct_asyncInt__resultLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncInt__resultLambda$Impl(this.handle);
  void asyncInt__resultLambda(int p0) {
    final _asyncInt__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('library_smoke_AsyncStruct_AsyncintResultlambda_call__Int'));
    final _p0Handle = (p0);
    final _handle = this.handle;
    _asyncInt__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
  }
}
int _smokeAsyncstructAsyncintresultlambdaasyncInt__resultLambdaStatic(Object _obj, int p0) {
  try {
    (_obj as AsyncStruct_asyncInt__resultLambda)((p0));
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncintresultlambdaToFfi(AsyncStruct_asyncInt__resultLambda value) =>
  _smokeAsyncstructAsyncintresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Int32)>(_smokeAsyncstructAsyncintresultlambdaasyncInt__resultLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncintresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncintresultlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncInt__resultLambda "private" section.
typedef AsyncStruct_asyncIntThrows__resultLambda = void Function(int);
// AsyncStruct_asyncIntThrows__resultLambda "private" section, not exported.
final _smokeAsyncstructAsyncintthrowsresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncintthrowsResultlambda_release_handle'));
final _smokeAsyncstructAsyncintthrowsresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncintthrowsResultlambda_create_proxy'));
class AsyncStruct_asyncIntThrows__resultLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncIntThrows__resultLambda$Impl(this.handle);
  void asyncIntThrows__resultLambda(int p0) {
    final _asyncIntThrows__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('library_smoke_AsyncStruct_AsyncintthrowsResultlambda_call__Int'));
    final _p0Handle = (p0);
    final _handle = this.handle;
    _asyncIntThrows__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
  }
}
int _smokeAsyncstructAsyncintthrowsresultlambdaasyncIntThrows__resultLambdaStatic(Object _obj, int p0) {
  try {
    (_obj as AsyncStruct_asyncIntThrows__resultLambda)((p0));
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncintthrowsresultlambdaToFfi(AsyncStruct_asyncIntThrows__resultLambda value) =>
  _smokeAsyncstructAsyncintthrowsresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Int32)>(_smokeAsyncstructAsyncintthrowsresultlambdaasyncIntThrows__resultLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncintthrowsresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncintthrowsresultlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncIntThrows__resultLambda "private" section.
typedef AsyncStruct_asyncIntThrows__errorLambda = void Function(String);
// AsyncStruct_asyncIntThrows__errorLambda "private" section, not exported.
final _smokeAsyncstructAsyncintthrowserrorlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncintthrowsErrorlambda_release_handle'));
final _smokeAsyncstructAsyncintthrowserrorlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncintthrowsErrorlambda_create_proxy'));
class AsyncStruct_asyncIntThrows__errorLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncIntThrows__errorLambda$Impl(this.handle);
  void asyncIntThrows__errorLambda(String p0) {
    final _asyncIntThrows__errorLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AsyncStruct_AsyncintthrowsErrorlambda_call__String'));
    final _p0Handle = stringToFfi(p0);
    final _handle = this.handle;
    _asyncIntThrows__errorLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    stringReleaseFfiHandle(_p0Handle);
  }
}
int _smokeAsyncstructAsyncintthrowserrorlambdaasyncIntThrows__errorLambdaStatic(Object _obj, Pointer<Void> p0) {
  try {
    (_obj as AsyncStruct_asyncIntThrows__errorLambda)(stringFromFfi(p0));
  } finally {
    stringReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncintthrowserrorlambdaToFfi(AsyncStruct_asyncIntThrows__errorLambda value) =>
  _smokeAsyncstructAsyncintthrowserrorlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_smokeAsyncstructAsyncintthrowserrorlambdaasyncIntThrows__errorLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncintthrowserrorlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncintthrowserrorlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncIntThrows__errorLambda "private" section.
typedef AsyncStruct_asyncStatic__resultLambda = void Function();
// AsyncStruct_asyncStatic__resultLambda "private" section, not exported.
final _smokeAsyncstructAsyncstaticresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncstaticResultlambda_release_handle'));
final _smokeAsyncstructAsyncstaticresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncstaticResultlambda_create_proxy'));
class AsyncStruct_asyncStatic__resultLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncStatic__resultLambda$Impl(this.handle);
  void asyncStatic__resultLambda() {
    final _asyncStatic__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncStruct_AsyncstaticResultlambda_call'));
    final _handle = this.handle;
    _asyncStatic__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeAsyncstructAsyncstaticresultlambdaasyncStatic__resultLambdaStatic(Object _obj) {
  try {
    (_obj as AsyncStruct_asyncStatic__resultLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncstaticresultlambdaToFfi(AsyncStruct_asyncStatic__resultLambda value) =>
  _smokeAsyncstructAsyncstaticresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncstructAsyncstaticresultlambdaasyncStatic__resultLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncstaticresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncstaticresultlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncStatic__resultLambda "private" section.
