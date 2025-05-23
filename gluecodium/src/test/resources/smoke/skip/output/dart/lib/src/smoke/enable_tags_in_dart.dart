

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

abstract class EnableTagsInDart implements Finalizable {

  factory EnableTagsInDart(
    void Function() enableTaggedLambda,
    void Function() enableTaggedListLambda,

  ) => EnableTagsInDart$Lambdas(
    enableTaggedLambda,
    enableTaggedListLambda,

  );


  void enableTagged();

  void enableTaggedList();
}


// EnableTagsInDart "private" section, not exported.

final _smokeEnabletagsindartRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_EnableTagsInDart_register_finalizer'));
final _smokeEnabletagsindartCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnableTagsInDart_copy_handle'));
final _smokeEnabletagsindartReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnableTagsInDart_release_handle'));
final _smokeEnabletagsindartCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('library_smoke_EnableTagsInDart_create_proxy'));
final _smokeEnabletagsindartGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnableTagsInDart_get_type_id'));



class EnableTagsInDart$Lambdas implements EnableTagsInDart {
  void Function() enableTaggedLambda;
  void Function() enableTaggedListLambda;

  EnableTagsInDart$Lambdas(
    this.enableTaggedLambda,
    this.enableTaggedListLambda,

  );

  @override
  void enableTagged() =>
    enableTaggedLambda();
  @override
  void enableTaggedList() =>
    enableTaggedListLambda();
}

class EnableTagsInDart$Impl extends __lib.NativeBase implements EnableTagsInDart {

  EnableTagsInDart$Impl(Pointer<Void> handle) : super(handle);

  @override
  void enableTagged() {
    final _enableTaggedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_EnableTagsInDart_enableTagged'));
    final _handle = this.handle;
    _enableTaggedFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void enableTaggedList() {
    final _enableTaggedListFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_EnableTagsInDart_enableTaggedList'));
    final _handle = this.handle;
    _enableTaggedListFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

void _smokeEnabletagsindartenableTaggedStatic(EnableTagsInDart _obj) {

  try {
    _obj.enableTagged();
  } finally {
  }
}
void _smokeEnabletagsindartenableTaggedListStatic(EnableTagsInDart _obj) {

  try {
    _obj.enableTaggedList();
  } finally {
  }
}


Pointer<Void> smokeEnabletagsindartToFfi(EnableTagsInDart __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeEnabletagsindartCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  void __enableTaggedCaller() { _smokeEnabletagsindartenableTaggedStatic(__interfaceObj); }
  final __enableTaggedCallback = NativeCallable<Void Function()>.isolateLocal(__enableTaggedCaller);
  __enableTaggedCallback.keepIsolateAlive = false;

  void __enableTaggedListCaller() { _smokeEnabletagsindartenableTaggedListStatic(__interfaceObj); }
  final __enableTaggedListCallback = NativeCallable<Void Function()>.isolateLocal(__enableTaggedListCaller);
  __enableTaggedListCallback.keepIsolateAlive = false;

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __enableTaggedCallback.close();
    __enableTaggedListCallback.close();
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeEnabletagsindartCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction,
    __enableTaggedCallback.nativeFunction,
    __enableTaggedListCallback.nativeFunction
  );

  return result;
}

EnableTagsInDart smokeEnabletagsindartFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is EnableTagsInDart) return instance;

  final _typeIdHandle = _smokeEnabletagsindartGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeEnabletagsindartCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : EnableTagsInDart$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeEnabletagsindartRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeEnabletagsindartReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeEnabletagsindartReleaseHandle(handle);

Pointer<Void> smokeEnabletagsindartToFfiNullable(EnableTagsInDart? value) =>
  value != null ? smokeEnabletagsindartToFfi(value) : Pointer<Void>.fromAddress(0);

EnableTagsInDart? smokeEnabletagsindartFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeEnabletagsindartFromFfi(handle) : null;

void smokeEnabletagsindartReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnabletagsindartReleaseHandle(handle);

// End of EnableTagsInDart "private" section.


