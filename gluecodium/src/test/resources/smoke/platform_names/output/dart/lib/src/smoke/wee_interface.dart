import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/wee_types.dart';
abstract class weeInterface {
  factory weeInterface.make(String makeParameter) => weeInterface$Impl.make(makeParameter);
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  weeStruct WeeMethod(String WeeParameter);
  int get WEE_PROPERTY;
  set WEE_PROPERTY(int value);
}
// weeInterface "private" section, not exported.
final _smokePlatformnamesinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNamesInterface_copy_handle'));
final _smokePlatformnamesinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNamesInterface_release_handle'));
class weeInterface$Impl extends __lib.NativeBase implements weeInterface {
  weeInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokePlatformnamesinterfaceReleaseHandle(handle);
    handle = null;
  }
  weeInterface$Impl.make(String makeParameter) : super(_make(makeParameter)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  @override
  weeStruct WeeMethod(String WeeParameter) {
    final _WeeMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PlatformNamesInterface_basicMethod__String'));
    final _WeeParameterHandle = stringToFfi(WeeParameter);
    final _handle = this.handle;
    final __resultHandle = _WeeMethodFfi(_handle, __lib.LibraryContext.isolateId, _WeeParameterHandle);
    stringReleaseFfiHandle(_WeeParameterHandle);
    try {
      return smokePlatformnamesBasicstructFromFfi(__resultHandle);
    } finally {
      smokePlatformnamesBasicstructReleaseFfiHandle(__resultHandle);
    }
  }
  static Pointer<Void> _make(String makeParameter) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_PlatformNamesInterface_create__String'));
    final _makeParameterHandle = stringToFfi(makeParameter);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _makeParameterHandle);
    stringReleaseFfiHandle(_makeParameterHandle);
    return __resultHandle;
  }
  @override
  int get WEE_PROPERTY {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_PlatformNamesInterface_basicProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  set WEE_PROPERTY(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_smoke_PlatformNamesInterface_basicProperty_set__UInt'));
    final _valueHandle = (value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
Pointer<Void> smokePlatformnamesinterfaceToFfi(weeInterface value) =>
  _smokePlatformnamesinterfaceCopyHandle((value as __lib.NativeBase).handle);
weeInterface smokePlatformnamesinterfaceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as weeInterface;
  if (instance != null) return instance;
  final _copiedHandle = _smokePlatformnamesinterfaceCopyHandle(handle);
  final result = weeInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokePlatformnamesinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokePlatformnamesinterfaceReleaseHandle(handle);
Pointer<Void> smokePlatformnamesinterfaceToFfiNullable(weeInterface value) =>
  value != null ? smokePlatformnamesinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
weeInterface smokePlatformnamesinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokePlatformnamesinterfaceFromFfi(handle) : null;
void smokePlatformnamesinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePlatformnamesinterfaceReleaseHandle(handle);
// End of weeInterface "private" section.
