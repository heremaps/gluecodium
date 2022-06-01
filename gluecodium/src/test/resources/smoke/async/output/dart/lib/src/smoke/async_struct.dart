import 'dart:async';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/throw_me_exception.dart';
import 'package:meta/meta.dart';
final _asyncVoidThrowsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_asyncVoidThrows__Boolean_return_release_handle'));
final _asyncVoidThrowsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_asyncVoidThrows__Boolean_return_get_error'));
final _asyncVoidThrowsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_asyncVoidThrows__Boolean_return_has_error'));
final _asyncIntThrowsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_asyncIntThrows__Boolean_return_release_handle'));
final _asyncIntThrowsReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_asyncIntThrows__Boolean_return_get_result'));
final _asyncIntThrowsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_asyncIntThrows__Boolean_return_get_error'));
final _asyncIntThrowsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_asyncIntThrows__Boolean_return_has_error'));
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
    _asyncVoid__async($that, () {
      $completer.complete();
    }, input);
    return $completer.future;
  }
  void _asyncVoid__async(AsyncStruct $that, AsyncStruct_asyncVoid__completerLambda _completerLambda, bool input) {
    final __asyncVoid__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncStruct_asyncVoid__asyncVoid__completerLambda_Boolean'));
    final __completerLambdaHandle = smokeAsyncstructAsyncvoidcompleterlambdaToFfi(_completerLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = smokeAsyncstructToFfi($that);
    __asyncVoid__asyncFfi(_handle, __lib.LibraryContext.isolateId, __completerLambdaHandle, _inputHandle);
    smokeAsyncstructReleaseFfiHandle(_handle);
    smokeAsyncstructAsyncvoidcompleterlambdaReleaseFfiHandle(__completerLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  Future<void> asyncVoidThrows(AsyncStruct $that, bool input) {
    final $completer = Completer<void>();
    _asyncVoidThrows__async($that, (bool $hasValue, String $error) {
      if ($hasValue) {
        $completer.complete();
      } else {
        $completer.completeError(ThrowMeException($error));
      }
    }, input);
    return $completer.future;
  }
  void _asyncVoidThrows__async(AsyncStruct $that, AsyncStruct_asyncVoidThrows__completerLambda _completerLambda, bool input) {
    final __asyncVoidThrows__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncStruct_asyncVoidThrows__asyncVoidThrows__completerLambda_Boolean'));
    final __completerLambdaHandle = smokeAsyncstructAsyncvoidthrowscompleterlambdaToFfi(_completerLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = smokeAsyncstructToFfi($that);
    __asyncVoidThrows__asyncFfi(_handle, __lib.LibraryContext.isolateId, __completerLambdaHandle, _inputHandle);
    smokeAsyncstructReleaseFfiHandle(_handle);
    smokeAsyncstructAsyncvoidthrowscompleterlambdaReleaseFfiHandle(__completerLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  Future<int> asyncInt(AsyncStruct $that, bool input) {
    final $completer = Completer<int>();
    _asyncInt__async($that, (int $result) {
      $completer.complete($result);
    }, input);
    return $completer.future;
  }
  void _asyncInt__async(AsyncStruct $that, AsyncStruct_asyncInt__completerLambda _completerLambda, bool input) {
    final __asyncInt__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncStruct_asyncInt__asyncInt__completerLambda_Boolean'));
    final __completerLambdaHandle = smokeAsyncstructAsyncintcompleterlambdaToFfi(_completerLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = smokeAsyncstructToFfi($that);
    __asyncInt__asyncFfi(_handle, __lib.LibraryContext.isolateId, __completerLambdaHandle, _inputHandle);
    smokeAsyncstructReleaseFfiHandle(_handle);
    smokeAsyncstructAsyncintcompleterlambdaReleaseFfiHandle(__completerLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  Future<int> asyncIntThrows(AsyncStruct $that, bool input) {
    final $completer = Completer<int>();
    _asyncIntThrows__async($that, (bool $hasValue, int $result, String $error) {
      if ($hasValue) {
        $completer.complete($result);
      } else {
        $completer.completeError(ThrowMeException($error));
      }
    }, input);
    return $completer.future;
  }
  void _asyncIntThrows__async(AsyncStruct $that, AsyncStruct_asyncIntThrows__completerLambda _completerLambda, bool input) {
    final __asyncIntThrows__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_AsyncStruct_asyncIntThrows__asyncIntThrows__completerLambda_Boolean'));
    final __completerLambdaHandle = smokeAsyncstructAsyncintthrowscompleterlambdaToFfi(_completerLambda);
    final _inputHandle = booleanToFfi(input);
    final _handle = smokeAsyncstructToFfi($that);
    __asyncIntThrows__asyncFfi(_handle, __lib.LibraryContext.isolateId, __completerLambdaHandle, _inputHandle);
    smokeAsyncstructReleaseFfiHandle(_handle);
    smokeAsyncstructAsyncintthrowscompleterlambdaReleaseFfiHandle(__completerLambdaHandle);
    booleanReleaseFfiHandle(_inputHandle);
  }
  Future<void> asyncStatic(bool input) {
    final $completer = Completer<void>();
    _asyncStatic__async(() {
      $completer.complete();
    }, input);
    return $completer.future;
  }
  void _asyncStatic__async(AsyncStruct_asyncStatic__completerLambda _completerLambda, bool input) {
    final __asyncStatic__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Uint8), void Function(int, Pointer<Void>, int)>('library_smoke_AsyncStruct_asyncStatic__asyncStatic__completerLambda_Boolean'));
    final __completerLambdaHandle = smokeAsyncstructAsyncstaticcompleterlambdaToFfi(_completerLambda);
    final _inputHandle = booleanToFfi(input);
    __asyncStatic__asyncFfi(__lib.LibraryContext.isolateId, __completerLambdaHandle, _inputHandle);
    smokeAsyncstructAsyncstaticcompleterlambdaReleaseFfiHandle(__completerLambdaHandle);
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
typedef AsyncStruct_asyncVoid__completerLambda = void Function();
// AsyncStruct_asyncVoid__completerLambda "private" section, not exported.
final _smokeAsyncstructAsyncvoidcompleterlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncvoidCompleterlambda_release_handle'));
final _smokeAsyncstructAsyncvoidcompleterlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncvoidCompleterlambda_create_proxy'));
class AsyncStruct_asyncVoid__completerLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncVoid__completerLambda$Impl(this.handle);
  void asyncVoid__completerLambda() {
    final _asyncVoid__completerLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncStruct_AsyncvoidCompleterlambda_call'));
    final _handle = this.handle;
    _asyncVoid__completerLambdaFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeAsyncstructAsyncvoidcompleterlambdaasyncVoid__completerLambdaStatic(Object _obj) {
  try {
    (_obj as AsyncStruct_asyncVoid__completerLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncvoidcompleterlambdaToFfi(AsyncStruct_asyncVoid__completerLambda value) =>
  _smokeAsyncstructAsyncvoidcompleterlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncstructAsyncvoidcompleterlambdaasyncVoid__completerLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncvoidcompleterlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncvoidcompleterlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncVoid__completerLambda "private" section.
typedef AsyncStruct_asyncVoidThrows__completerLambda = void Function(bool, String);
// AsyncStruct_asyncVoidThrows__completerLambda "private" section, not exported.
final _smokeAsyncstructAsyncvoidthrowscompleterlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncvoidthrowsCompleterlambda_release_handle'));
final _smokeAsyncstructAsyncvoidthrowscompleterlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncvoidthrowsCompleterlambda_create_proxy'));
class AsyncStruct_asyncVoidThrows__completerLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncVoidThrows__completerLambda$Impl(this.handle);
  void asyncVoidThrows__completerLambda(bool p0, String p1) {
    final _asyncVoidThrows__completerLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>)>('library_smoke_AsyncStruct_AsyncvoidthrowsCompleterlambda_call__Boolean_String'));
    final _p0Handle = booleanToFfi(p0);
    final _p1Handle = stringToFfi(p1);
    final _handle = this.handle;
    _asyncVoidThrows__completerLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    booleanReleaseFfiHandle(_p0Handle);
    stringReleaseFfiHandle(_p1Handle);
  }
}
int _smokeAsyncstructAsyncvoidthrowscompleterlambdaasyncVoidThrows__completerLambdaStatic(Object _obj, int p0, Pointer<Void> p1) {
  try {
    (_obj as AsyncStruct_asyncVoidThrows__completerLambda)(booleanFromFfi(p0), stringFromFfi(p1));
  } finally {
    booleanReleaseFfiHandle(p0);
    stringReleaseFfiHandle(p1);
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncvoidthrowscompleterlambdaToFfi(AsyncStruct_asyncVoidThrows__completerLambda value) =>
  _smokeAsyncstructAsyncvoidthrowscompleterlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Uint8, Pointer<Void>)>(_smokeAsyncstructAsyncvoidthrowscompleterlambdaasyncVoidThrows__completerLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncvoidthrowscompleterlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncvoidthrowscompleterlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncVoidThrows__completerLambda "private" section.
typedef AsyncStruct_asyncInt__completerLambda = void Function(int);
// AsyncStruct_asyncInt__completerLambda "private" section, not exported.
final _smokeAsyncstructAsyncintcompleterlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncintCompleterlambda_release_handle'));
final _smokeAsyncstructAsyncintcompleterlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncintCompleterlambda_create_proxy'));
class AsyncStruct_asyncInt__completerLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncInt__completerLambda$Impl(this.handle);
  void asyncInt__completerLambda(int p0) {
    final _asyncInt__completerLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('library_smoke_AsyncStruct_AsyncintCompleterlambda_call__Int'));
    final _p0Handle = (p0);
    final _handle = this.handle;
    _asyncInt__completerLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
  }
}
int _smokeAsyncstructAsyncintcompleterlambdaasyncInt__completerLambdaStatic(Object _obj, int p0) {
  try {
    (_obj as AsyncStruct_asyncInt__completerLambda)((p0));
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncintcompleterlambdaToFfi(AsyncStruct_asyncInt__completerLambda value) =>
  _smokeAsyncstructAsyncintcompleterlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Int32)>(_smokeAsyncstructAsyncintcompleterlambdaasyncInt__completerLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncintcompleterlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncintcompleterlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncInt__completerLambda "private" section.
typedef AsyncStruct_asyncIntThrows__completerLambda = void Function(bool, int, String);
// AsyncStruct_asyncIntThrows__completerLambda "private" section, not exported.
final _smokeAsyncstructAsyncintthrowscompleterlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncintthrowsCompleterlambda_release_handle'));
final _smokeAsyncstructAsyncintthrowscompleterlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncintthrowsCompleterlambda_create_proxy'));
class AsyncStruct_asyncIntThrows__completerLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncIntThrows__completerLambda$Impl(this.handle);
  void asyncIntThrows__completerLambda(bool p0, int p1, String p2) {
    final _asyncIntThrows__completerLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8, Int32, Pointer<Void>), void Function(Pointer<Void>, int, int, int, Pointer<Void>)>('library_smoke_AsyncStruct_AsyncintthrowsCompleterlambda_call__Boolean_Int_String'));
    final _p0Handle = booleanToFfi(p0);
    final _p1Handle = (p1);
    final _p2Handle = stringToFfi(p2);
    final _handle = this.handle;
    _asyncIntThrows__completerLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle, _p2Handle);
    booleanReleaseFfiHandle(_p0Handle);
    stringReleaseFfiHandle(_p2Handle);
  }
}
int _smokeAsyncstructAsyncintthrowscompleterlambdaasyncIntThrows__completerLambdaStatic(Object _obj, int p0, int p1, Pointer<Void> p2) {
  try {
    (_obj as AsyncStruct_asyncIntThrows__completerLambda)(booleanFromFfi(p0), (p1), stringFromFfi(p2));
  } finally {
    booleanReleaseFfiHandle(p0);
    stringReleaseFfiHandle(p2);
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncintthrowscompleterlambdaToFfi(AsyncStruct_asyncIntThrows__completerLambda value) =>
  _smokeAsyncstructAsyncintthrowscompleterlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Uint8, Int32, Pointer<Void>)>(_smokeAsyncstructAsyncintthrowscompleterlambdaasyncIntThrows__completerLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncintthrowscompleterlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncintthrowscompleterlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncIntThrows__completerLambda "private" section.
typedef AsyncStruct_asyncStatic__completerLambda = void Function();
// AsyncStruct_asyncStatic__completerLambda "private" section, not exported.
final _smokeAsyncstructAsyncstaticcompleterlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AsyncStruct_AsyncstaticCompleterlambda_release_handle'));
final _smokeAsyncstructAsyncstaticcompleterlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AsyncStruct_AsyncstaticCompleterlambda_create_proxy'));
class AsyncStruct_asyncStatic__completerLambda$Impl {
  final Pointer<Void> handle;
  AsyncStruct_asyncStatic__completerLambda$Impl(this.handle);
  void asyncStatic__completerLambda() {
    final _asyncStatic__completerLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AsyncStruct_AsyncstaticCompleterlambda_call'));
    final _handle = this.handle;
    _asyncStatic__completerLambdaFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
int _smokeAsyncstructAsyncstaticcompleterlambdaasyncStatic__completerLambdaStatic(Object _obj) {
  try {
    (_obj as AsyncStruct_asyncStatic__completerLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smokeAsyncstructAsyncstaticcompleterlambdaToFfi(AsyncStruct_asyncStatic__completerLambda value) =>
  _smokeAsyncstructAsyncstaticcompleterlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAsyncstructAsyncstaticcompleterlambdaasyncStatic__completerLambdaStatic, __lib.unknownError)
  );
void smokeAsyncstructAsyncstaticcompleterlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAsyncstructAsyncstaticcompleterlambdaReleaseHandle(handle);
// End of AsyncStruct_asyncStatic__completerLambda "private" section.
