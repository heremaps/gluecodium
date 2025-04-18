

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

/// This is some very useful interface.
/// @nodoc
abstract class ExcludedCommentsInterface implements Finalizable {

}


// ExcludedCommentsInterface "private" section, not exported.

final _smokeExcludedcommentsinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_ExcludedCommentsInterface_register_finalizer'));
final _smokeExcludedcommentsinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_copy_handle'));
final _smokeExcludedcommentsinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_release_handle'));
final _smokeExcludedcommentsinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_ExcludedCommentsInterface_create_proxy'));
final _smokeExcludedcommentsinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExcludedCommentsInterface_get_type_id'));


class ExcludedCommentsInterface$Impl extends __lib.NativeBase implements ExcludedCommentsInterface {

  ExcludedCommentsInterface$Impl(Pointer<Void> handle) : super(handle);


}



Pointer<Void> smokeExcludedcommentsinterfaceToFfi(ExcludedCommentsInterface __interfaceObj) {
  if (__interfaceObj is __lib.NativeBase) return _smokeExcludedcommentsinterfaceCopyHandle((__interfaceObj as __lib.NativeBase).handle);

  late final NativeCallable<Void Function()> __closeAllCallback;
  void __closeAll() {
    __closeAllCallback.close();
  }
  __closeAllCallback = NativeCallable<Void Function()>.isolateLocal(__closeAll);
  __closeAllCallback.keepIsolateAlive = false;

  final result = _smokeExcludedcommentsinterfaceCreateProxy(
    __lib.getObjectToken(__interfaceObj),
    __lib.LibraryContext.isolateId,
    __interfaceObj,
    __closeAllCallback.nativeFunction
  );

  return result;
}

ExcludedCommentsInterface smokeExcludedcommentsinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ExcludedCommentsInterface) return instance;

  final _typeIdHandle = _smokeExcludedcommentsinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _smokeExcludedcommentsinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ExcludedCommentsInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeExcludedcommentsinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeExcludedcommentsinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeExcludedcommentsinterfaceReleaseHandle(handle);

Pointer<Void> smokeExcludedcommentsinterfaceToFfiNullable(ExcludedCommentsInterface? value) =>
  value != null ? smokeExcludedcommentsinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

ExcludedCommentsInterface? smokeExcludedcommentsinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeExcludedcommentsinterfaceFromFfi(handle) : null;

void smokeExcludedcommentsinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeExcludedcommentsinterfaceReleaseHandle(handle);

// End of ExcludedCommentsInterface "private" section.


