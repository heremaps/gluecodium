

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

abstract class SkipTagsInDart implements Finalizable {

  factory SkipTagsInDart(
    void Function() dontSkipTaggedLambda,

  ) => SkipTagsInDart$Lambdas(
    dontSkipTaggedLambda,

  );


  void dontSkipTagged();
}


// SkipTagsInDart "private" section, not exported.

final _smokeSkiptagsindartRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SkipTagsInDart_register_finalizer'));
final _smokeSkiptagsindartCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTagsInDart_copy_handle'));
final _smokeSkiptagsindartReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTagsInDart_release_handle'));
final _smokeSkiptagsindartCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('library_smoke_SkipTagsInDart_create_proxy'));
final _smokeSkiptagsindartGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTagsInDart_get_type_id'));


class SkipTagsInDart$Lambdas implements SkipTagsInDart {
  void Function() dontSkipTaggedLambda;

  SkipTagsInDart$Lambdas(
    this.dontSkipTaggedLambda,

  );

  @override
  void dontSkipTagged() =>
    dontSkipTaggedLambda();
}

class SkipTagsInDart$Impl extends __lib.NativeBase implements SkipTagsInDart {

  SkipTagsInDart$Impl(Pointer<Void> handle) : super(handle);

  @override
  void dontSkipTagged() {
    final _dontSkipTaggedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SkipTagsInDart_dontSkipTagged'));
    final _handle = this.handle;
    _dontSkipTaggedFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

void _smokeSkiptagsindartdontSkipTaggedStatic(SkipTagsInDart _obj) {

  try {
    _obj.dontSkipTagged();
  } finally {
  }
}


Pointer<Void> smokeSkiptagsindartToFfi(SkipTagsInDart __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeSkiptagsindartCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __dontSkipTaggedCaller() { _smokeSkiptagsindartdontSkipTaggedStatic(__interfaceObj); }
  final __dontSkipTaggedCallback = NativeCallable<Void Function()>.isolateLocal(__dontSkipTaggedCaller);
  __dontSkipTaggedCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __dontSkipTaggedCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeSkiptagsindartCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __dontSkipTaggedCallback.nativeFunction
  );

  return result;
}

SkipTagsInDart smokeSkiptagsindartFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SkipTagsInDart) return instance;

  final _typeIdHandle = _smokeSkiptagsindartGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeSkiptagsindartCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SkipTagsInDart$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeSkiptagsindartRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeSkiptagsindartReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSkiptagsindartReleaseHandle(handle);

Pointer<Void> smokeSkiptagsindartToFfiNullable(SkipTagsInDart? value) =>
  value != null ? smokeSkiptagsindartToFfi(value) : Pointer<Void>.fromAddress(0);

SkipTagsInDart? smokeSkiptagsindartFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSkiptagsindartFromFfi(handle) : null;

void smokeSkiptagsindartReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkiptagsindartReleaseHandle(handle);

// End of SkipTagsInDart "private" section.


