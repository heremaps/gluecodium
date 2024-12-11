

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;

@OnLambda
typedef AttributesLambda = void Function();

// AttributesLambda "private" section, not exported.

final _smokeAttributeslambdaRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_AttributesLambda_register_finalizer'));
final _smokeAttributeslambdaCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_copy_handle'));
final _smokeAttributeslambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_release_handle'));
final _smokeAttributeslambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_AttributesLambda_create_proxy'));

class AttributesLambda$Impl implements Finalizable {
  final Pointer<Void> handle;
  AttributesLambda$Impl(this.handle);

  void call() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AttributesLambda_call'));
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId);

  }

}

int _smokeAttributeslambdacallStatic(Object _obj) {
  
  try {
    (_obj as AttributesLambda)();
  } finally {
  }
  return 0;
}

Pointer<Void> smokeAttributeslambdaToFfi(AttributesLambda value) =>
  _smokeAttributeslambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_smokeAttributeslambdacallStatic, __lib.unknownError)
  );

AttributesLambda smokeAttributeslambdaFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _smokeAttributeslambdaCopyHandle(handle);
  final _impl = AttributesLambda$Impl(_copiedHandle);
  final result = () => _impl.call();
  _smokeAttributeslambdaRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeAttributeslambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeAttributeslambdaReleaseHandle(handle);

// Nullable AttributesLambda

final _smokeAttributeslambdaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_create_handle_nullable'));
final _smokeAttributeslambdaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_release_handle_nullable'));
final _smokeAttributeslambdaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_get_value_nullable'));

Pointer<Void> smokeAttributeslambdaToFfiNullable(AttributesLambda? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeAttributeslambdaToFfi(value);
  final result = _smokeAttributeslambdaCreateHandleNullable(_handle);
  smokeAttributeslambdaReleaseFfiHandle(_handle);
  return result;
}

AttributesLambda? smokeAttributeslambdaFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeAttributeslambdaGetValueNullable(handle);
  final result = smokeAttributeslambdaFromFfi(_handle);
  smokeAttributeslambdaReleaseFfiHandle(_handle);
  return result;
}

void smokeAttributeslambdaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAttributeslambdaReleaseHandleNullable(handle);

// End of AttributesLambda "private" section.


