import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/free_enum.dart';
import 'package:library/src/smoke/free_exception.dart';
import 'package:library/src/smoke/free_point.dart';
abstract class UseFreeTypes {
  DateTime doStuff(FreePoint point, FreeEnum mode);
}
// UseFreeTypes "private" section, not exported.
final _smokeUsefreetypesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_UseFreeTypes_register_finalizer'));
final _smokeUsefreetypesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_copy_handle'));
final _smokeUsefreetypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_release_handle'));
final _doStuffsmokeUsefreetypesDostuffFreepointFreeenumReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_release_handle'));
final _doStuffsmokeUsefreetypesDostuffFreepointFreeenumReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_get_result'));
final _doStuffsmokeUsefreetypesDostuffFreepointFreeenumReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_get_error'));
final _doStuffsmokeUsefreetypesDostuffFreepointFreeenumReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_has_error'));
class UseFreeTypes$Impl extends __lib.NativeBase implements UseFreeTypes {
  UseFreeTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  DateTime doStuff(FreePoint point, FreeEnum mode) {
    final _doStuffFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum'));
    final _pointHandle = smokeFreepointToFfi(point);
    final _modeHandle = smokeFreeenumToFfi(mode);
    final _handle = this.handle;
    final __callResultHandle = _doStuffFfi(_handle, __lib.LibraryContext.isolateId, _pointHandle, _modeHandle);
    smokeFreepointReleaseFfiHandle(_pointHandle);
    smokeFreeenumReleaseFfiHandle(_modeHandle);
    if (_doStuffsmokeUsefreetypesDostuffFreepointFreeenumReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _doStuffsmokeUsefreetypesDostuffFreepointFreeenumReturnGetError(__callResultHandle);
        _doStuffsmokeUsefreetypesDostuffFreepointFreeenumReturnReleaseHandle(__callResultHandle);
        try {
          throw FreeException(smokeFreeenumFromFfi(__errorHandle));
        } finally {
          smokeFreeenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _doStuffsmokeUsefreetypesDostuffFreepointFreeenumReturnGetResult(__callResultHandle);
    _doStuffsmokeUsefreetypesDostuffFreepointFreeenumReturnReleaseHandle(__callResultHandle);
    try {
      return dateFromFfi(__resultHandle);
    } finally {
      dateReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeUsefreetypesToFfi(UseFreeTypes value) =>
  _smokeUsefreetypesCopyHandle((value as __lib.NativeBase).handle);
UseFreeTypes smokeUsefreetypesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is UseFreeTypes) return instance;
  final _copiedHandle = _smokeUsefreetypesCopyHandle(handle);
  final result = UseFreeTypes$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeUsefreetypesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeUsefreetypesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeUsefreetypesReleaseHandle(handle);
Pointer<Void> smokeUsefreetypesToFfiNullable(UseFreeTypes? value) =>
  value != null ? smokeUsefreetypesToFfi(value) : Pointer<Void>.fromAddress(0);
UseFreeTypes? smokeUsefreetypesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeUsefreetypesFromFfi(handle) : null;
void smokeUsefreetypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeUsefreetypesReleaseHandle(handle);
// End of UseFreeTypes "private" section.