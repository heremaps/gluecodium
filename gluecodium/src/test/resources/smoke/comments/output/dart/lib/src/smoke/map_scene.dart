import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
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
final _smoke_MapScene_LoadSceneCallback_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MapScene_LoadSceneCallback_copy_handle'));
final _smoke_MapScene_LoadSceneCallback_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MapScene_LoadSceneCallback_release_handle'));
final _smoke_MapScene_LoadSceneCallback_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_MapScene_LoadSceneCallback_create_proxy'));
class MapScene_LoadSceneCallback$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  MapScene_LoadSceneCallback$Impl(this.handle);
  void release() => _smoke_MapScene_LoadSceneCallback_release_handle(handle);
  call(String p0) {
    final _call_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MapScene_LoadSceneCallback_call__String'));
    final _p0_handle = String_toFfi_nullable(p0);
    final _handle = this.handle;
    final __result_handle = _call_ffi(_handle, __lib.LibraryContext.isolateId, _p0_handle);
    String_releaseFfiHandle_nullable(_p0_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
int _MapScene_LoadSceneCallback_call_static(int _token, Pointer<Void> p0) {
  try {
    (__lib.instanceCache[_token] as MapScene_LoadSceneCallback)(String_fromFfi_nullable(p0));
  } finally {
    String_releaseFfiHandle_nullable(p0);
  }
  return 0;
}
Pointer<Void> smoke_MapScene_LoadSceneCallback_toFfi(MapScene_LoadSceneCallback value) {
  final result = _smoke_MapScene_LoadSceneCallback_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_MapScene_LoadSceneCallback_call_static, __lib.unknownError)
  );
  return result;
}
MapScene_LoadSceneCallback smoke_MapScene_LoadSceneCallback_fromFfi(Pointer<Void> handle) {
  final _impl = MapScene_LoadSceneCallback$Impl(_smoke_MapScene_LoadSceneCallback_copy_handle(handle));
  return (String p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smoke_MapScene_LoadSceneCallback_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_MapScene_LoadSceneCallback_release_handle(handle);
// Nullable MapScene_LoadSceneCallback
final _smoke_MapScene_LoadSceneCallback_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MapScene_LoadSceneCallback_create_handle_nullable'));
final _smoke_MapScene_LoadSceneCallback_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MapScene_LoadSceneCallback_release_handle_nullable'));
final _smoke_MapScene_LoadSceneCallback_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MapScene_LoadSceneCallback_get_value_nullable'));
Pointer<Void> smoke_MapScene_LoadSceneCallback_toFfi_nullable(MapScene_LoadSceneCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_MapScene_LoadSceneCallback_toFfi(value);
  final result = _smoke_MapScene_LoadSceneCallback_create_handle_nullable(_handle);
  smoke_MapScene_LoadSceneCallback_releaseFfiHandle(_handle);
  return result;
}
MapScene_LoadSceneCallback smoke_MapScene_LoadSceneCallback_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_MapScene_LoadSceneCallback_get_value_nullable(handle);
  final result = smoke_MapScene_LoadSceneCallback_fromFfi(_handle);
  smoke_MapScene_LoadSceneCallback_releaseFfiHandle(_handle);
  return result;
}
void smoke_MapScene_LoadSceneCallback_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_MapScene_LoadSceneCallback_release_handle_nullable(handle);
// End of MapScene_LoadSceneCallback "private" section.
// MapScene "private" section, not exported.
final _smoke_MapScene_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MapScene_copy_handle'));
final _smoke_MapScene_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MapScene_release_handle'));
class MapScene$Impl implements MapScene {
  @protected
  Pointer<Void> handle;
  MapScene$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_MapScene_release_handle(handle);
    handle = null;
  }
  @override
  loadSceneWithInt(int mapScheme, MapScene_LoadSceneCallback callback) {
    final _loadSceneWithInt_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>)>('library_smoke_MapScene_loadScene__Int_LoadSceneCallback'));
    final _mapScheme_handle = (mapScheme);
    final _callback_handle = smoke_MapScene_LoadSceneCallback_toFfi_nullable(callback);
    final _handle = this.handle;
    final __result_handle = _loadSceneWithInt_ffi(_handle, __lib.LibraryContext.isolateId, _mapScheme_handle, _callback_handle);
    (_mapScheme_handle);
    smoke_MapScene_LoadSceneCallback_releaseFfiHandle_nullable(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  loadSceneWithString(String configurationFile, MapScene_LoadSceneCallback callback) {
    final _loadSceneWithString_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('library_smoke_MapScene_loadScene__String_LoadSceneCallback'));
    final _configurationFile_handle = String_toFfi(configurationFile);
    final _callback_handle = smoke_MapScene_LoadSceneCallback_toFfi_nullable(callback);
    final _handle = this.handle;
    final __result_handle = _loadSceneWithString_ffi(_handle, __lib.LibraryContext.isolateId, _configurationFile_handle, _callback_handle);
    String_releaseFfiHandle(_configurationFile_handle);
    smoke_MapScene_LoadSceneCallback_releaseFfiHandle_nullable(_callback_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_MapScene_toFfi(MapScene value) =>
  _smoke_MapScene_copy_handle((value as MapScene$Impl).handle);
MapScene smoke_MapScene_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as MapScene;
  if (instance != null) return instance;
  final _copied_handle = _smoke_MapScene_copy_handle(handle);
  final result = MapScene$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_MapScene_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_MapScene_release_handle(handle);
Pointer<Void> smoke_MapScene_toFfi_nullable(MapScene value) =>
  value != null ? smoke_MapScene_toFfi(value) : Pointer<Void>.fromAddress(0);
MapScene smoke_MapScene_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_MapScene_fromFfi(handle) : null;
void smoke_MapScene_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_MapScene_release_handle(handle);
// End of MapScene "private" section.
