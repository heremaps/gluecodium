import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
/// Referencing some type [MapScene.loadSceneWithInt].
abstract class MapScene {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  loadSceneWithInt(int mapScheme, MapScene_LoadSceneCallback callback);
  loadSceneWithString(String configurationFile, MapScene_LoadSceneCallback callback);
}
typedef MapScene_LoadSceneCallback = void Function(String);
// MapScene_LoadSceneCallback "private" section, not exported.
final _smokeMapsceneLoadscenecallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MapScene_LoadSceneCallback_copy_handle'));
final _smokeMapsceneLoadscenecallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MapScene_LoadSceneCallback_release_handle'));
final _smokeMapsceneLoadscenecallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_MapScene_LoadSceneCallback_create_proxy'));
class MapScene_LoadSceneCallback$Impl {
  final Pointer<Void> handle;
  MapScene_LoadSceneCallback$Impl(this.handle);
  void release() => _smokeMapsceneLoadscenecallbackReleaseHandle(handle);
  call(String p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MapScene_LoadSceneCallback_call__String'));
    final _p0Handle = stringToFfiNullable(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    stringReleaseFfiHandleNullable(_p0Handle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
int _smokeMapsceneLoadscenecallbackcallStatic(int _token, Pointer<Void> p0) {
  try {
    (__lib.instanceCache[_token] as MapScene_LoadSceneCallback)(stringFromFfiNullable(p0));
  } finally {
    stringReleaseFfiHandleNullable(p0);
  }
  return 0;
}
Pointer<Void> smokeMapsceneLoadscenecallbackToFfi(MapScene_LoadSceneCallback value) {
  final result = _smokeMapsceneLoadscenecallbackCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_smokeMapsceneLoadscenecallbackcallStatic, __lib.unknownError)
  );
  return result;
}
MapScene_LoadSceneCallback smokeMapsceneLoadscenecallbackFromFfi(Pointer<Void> handle) {
  final _impl = MapScene_LoadSceneCallback$Impl(_smokeMapsceneLoadscenecallbackCopyHandle(handle));
  return (String p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smokeMapsceneLoadscenecallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeMapsceneLoadscenecallbackReleaseHandle(handle);
// Nullable MapScene_LoadSceneCallback
final _smokeMapsceneLoadscenecallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MapScene_LoadSceneCallback_create_handle_nullable'));
final _smokeMapsceneLoadscenecallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MapScene_LoadSceneCallback_release_handle_nullable'));
final _smokeMapsceneLoadscenecallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MapScene_LoadSceneCallback_get_value_nullable'));
Pointer<Void> smokeMapsceneLoadscenecallbackToFfiNullable(MapScene_LoadSceneCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeMapsceneLoadscenecallbackToFfi(value);
  final result = _smokeMapsceneLoadscenecallbackCreateHandleNullable(_handle);
  smokeMapsceneLoadscenecallbackReleaseFfiHandle(_handle);
  return result;
}
MapScene_LoadSceneCallback smokeMapsceneLoadscenecallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeMapsceneLoadscenecallbackGetValueNullable(handle);
  final result = smokeMapsceneLoadscenecallbackFromFfi(_handle);
  smokeMapsceneLoadscenecallbackReleaseFfiHandle(_handle);
  return result;
}
void smokeMapsceneLoadscenecallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeMapsceneLoadscenecallbackReleaseHandleNullable(handle);
// End of MapScene_LoadSceneCallback "private" section.
// MapScene "private" section, not exported.
final _smokeMapsceneCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MapScene_copy_handle'));
final _smokeMapsceneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MapScene_release_handle'));
class MapScene$Impl extends __lib.NativeBase implements MapScene {
  MapScene$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeMapsceneReleaseHandle(handle);
    handle = null;
  }
  @override
  loadSceneWithInt(int mapScheme, MapScene_LoadSceneCallback callback) {
    final _loadSceneWithIntFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>)>('library_smoke_MapScene_loadScene__Int_LoadSceneCallback'));
    final _mapSchemeHandle = (mapScheme);
    final _callbackHandle = smokeMapsceneLoadscenecallbackToFfiNullable(callback);
    final _handle = this.handle;
    final __resultHandle = _loadSceneWithIntFfi(_handle, __lib.LibraryContext.isolateId, _mapSchemeHandle, _callbackHandle);
    smokeMapsceneLoadscenecallbackReleaseFfiHandleNullable(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  loadSceneWithString(String configurationFile, MapScene_LoadSceneCallback callback) {
    final _loadSceneWithStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('library_smoke_MapScene_loadScene__String_LoadSceneCallback'));
    final _configurationFileHandle = stringToFfi(configurationFile);
    final _callbackHandle = smokeMapsceneLoadscenecallbackToFfiNullable(callback);
    final _handle = this.handle;
    final __resultHandle = _loadSceneWithStringFfi(_handle, __lib.LibraryContext.isolateId, _configurationFileHandle, _callbackHandle);
    stringReleaseFfiHandle(_configurationFileHandle);
    smokeMapsceneLoadscenecallbackReleaseFfiHandleNullable(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {
    }
  }
}
Pointer<Void> smokeMapsceneToFfi(MapScene value) =>
  _smokeMapsceneCopyHandle((value as __lib.NativeBase).handle);
MapScene smokeMapsceneFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapScene;
  if (instance != null) return instance;
  final _copiedHandle = _smokeMapsceneCopyHandle(handle);
  final result = MapScene$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeMapsceneReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeMapsceneReleaseHandle(handle);
Pointer<Void> smokeMapsceneToFfiNullable(MapScene value) =>
  value != null ? smokeMapsceneToFfi(value) : Pointer<Void>.fromAddress(0);
MapScene smokeMapsceneFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeMapsceneFromFfi(handle) : null;
void smokeMapsceneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeMapsceneReleaseHandle(handle);
// End of MapScene "private" section.
