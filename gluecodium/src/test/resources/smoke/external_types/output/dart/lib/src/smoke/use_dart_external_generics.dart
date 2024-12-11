

import 'dart:ffi';
import 'dart:math' as math;
import 'package:foo/bar.dart' as bar;
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';

abstract class UseDartExternalGenerics implements Finalizable {


  Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> useGenerics(List<math.Rectangle<int>> list, Set<bar.HttpClientResponseCompressionState> set);
}


// UseDartExternalGenerics "private" section, not exported.

final _smokeUsedartexternalgenericsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_UseDartExternalGenerics_register_finalizer'));
final _smokeUsedartexternalgenericsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseDartExternalGenerics_copy_handle'));
final _smokeUsedartexternalgenericsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseDartExternalGenerics_release_handle'));



class UseDartExternalGenerics$Impl extends __lib.NativeBase implements UseDartExternalGenerics {

  UseDartExternalGenerics$Impl(Pointer<Void> handle) : super(handle);

  @override
  Map<bar.HttpClientResponseCompressionState, math.Rectangle<int>> useGenerics(List<math.Rectangle<int>> list, Set<bar.HttpClientResponseCompressionState> set) {
    final _useGenericsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('library_smoke_UseDartExternalGenerics_useGenerics__ListOf_smoke_Rectangle_SetOf_smoke_CompressionState'));
    final _listHandle = foobarListofSmokeRectangleToFfi(list);
    final _setHandle = foobarSetofSmokeCompressionstateToFfi(set);
    final _handle = this.handle;
    final __resultHandle = _useGenericsFfi(_handle, __lib.LibraryContext.isolateId, _listHandle, _setHandle);
    foobarListofSmokeRectangleReleaseFfiHandle(_listHandle);
    foobarSetofSmokeCompressionstateReleaseFfiHandle(_setHandle);
    try {
      return foobarMapofSmokeCompressionstateToSmokeRectangleFromFfi(__resultHandle);
    } finally {
      foobarMapofSmokeCompressionstateToSmokeRectangleReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> smokeUsedartexternalgenericsToFfi(UseDartExternalGenerics value) =>
  _smokeUsedartexternalgenericsCopyHandle((value as __lib.NativeBase).handle);

UseDartExternalGenerics smokeUsedartexternalgenericsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is UseDartExternalGenerics) return instance;

  final _copiedHandle = _smokeUsedartexternalgenericsCopyHandle(handle);
  final result = UseDartExternalGenerics$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeUsedartexternalgenericsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeUsedartexternalgenericsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeUsedartexternalgenericsReleaseHandle(handle);

Pointer<Void> smokeUsedartexternalgenericsToFfiNullable(UseDartExternalGenerics? value) =>
  value != null ? smokeUsedartexternalgenericsToFfi(value) : Pointer<Void>.fromAddress(0);

UseDartExternalGenerics? smokeUsedartexternalgenericsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeUsedartexternalgenericsFromFfi(handle) : null;

void smokeUsedartexternalgenericsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeUsedartexternalgenericsReleaseHandle(handle);

// End of UseDartExternalGenerics "private" section.


