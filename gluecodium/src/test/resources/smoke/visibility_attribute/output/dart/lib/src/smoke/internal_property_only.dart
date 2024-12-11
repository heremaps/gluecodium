

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;

abstract class InternalPropertyOnly implements Finalizable {

}


// InternalPropertyOnly "private" section, not exported.

final _smokeInternalpropertyonlyRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_InternalPropertyOnly_register_finalizer'));
final _smokeInternalpropertyonlyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalPropertyOnly_copy_handle'));
final _smokeInternalpropertyonlyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalPropertyOnly_release_handle'));


class InternalPropertyOnly$Impl extends __lib.NativeBase implements InternalPropertyOnly {

  InternalPropertyOnly$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> smokeInternalpropertyonlyToFfi(InternalPropertyOnly value) =>
  _smokeInternalpropertyonlyCopyHandle((value as __lib.NativeBase).handle);

InternalPropertyOnly smokeInternalpropertyonlyFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InternalPropertyOnly) return instance;

  final _copiedHandle = _smokeInternalpropertyonlyCopyHandle(handle);
  final result = InternalPropertyOnly$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeInternalpropertyonlyRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeInternalpropertyonlyReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeInternalpropertyonlyReleaseHandle(handle);

Pointer<Void> smokeInternalpropertyonlyToFfiNullable(InternalPropertyOnly? value) =>
  value != null ? smokeInternalpropertyonlyToFfi(value) : Pointer<Void>.fromAddress(0);

InternalPropertyOnly? smokeInternalpropertyonlyFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeInternalpropertyonlyFromFfi(handle) : null;

void smokeInternalpropertyonlyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInternalpropertyonlyReleaseHandle(handle);

// End of InternalPropertyOnly "private" section.


