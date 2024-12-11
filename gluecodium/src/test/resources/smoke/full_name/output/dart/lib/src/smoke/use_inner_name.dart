

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/smoke/outer_name.dart';

abstract class UseInnerName implements Finalizable {


  Futhark doFoo();
}


// UseInnerName "private" section, not exported.

final _smokeUseinnernameRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_UseInnerName_register_finalizer'));
final _smokeUseinnernameCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseInnerName_copy_handle'));
final _smokeUseinnernameReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseInnerName_release_handle'));



class UseInnerName$Impl extends __lib.NativeBase implements UseInnerName {

  UseInnerName$Impl(Pointer<Void> handle) : super(handle);

  @override
  Futhark doFoo() {
    final _doFooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_UseInnerName_doFoo'));
    final _handle = this.handle;
    final __resultHandle = _doFooFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeOuternameInnernameFromFfi(__resultHandle);
    } finally {
      smokeOuternameInnernameReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> smokeUseinnernameToFfi(UseInnerName value) =>
  _smokeUseinnernameCopyHandle((value as __lib.NativeBase).handle);

UseInnerName smokeUseinnernameFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is UseInnerName) return instance;

  final _copiedHandle = _smokeUseinnernameCopyHandle(handle);
  final result = UseInnerName$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeUseinnernameRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeUseinnernameReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeUseinnernameReleaseHandle(handle);

Pointer<Void> smokeUseinnernameToFfiNullable(UseInnerName? value) =>
  value != null ? smokeUseinnernameToFfi(value) : Pointer<Void>.fromAddress(0);

UseInnerName? smokeUseinnernameFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeUseinnernameFromFfi(handle) : null;

void smokeUseinnernameReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeUseinnernameReleaseHandle(handle);

// End of UseInnerName "private" section.


