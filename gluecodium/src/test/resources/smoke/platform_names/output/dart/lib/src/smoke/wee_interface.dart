import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/wee_types.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
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
final _smoke_PlatformNamesInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNamesInterface_copy_handle'));
final _smoke_PlatformNamesInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNamesInterface_release_handle'));
class weeInterface$Impl extends __lib.NativeBase implements weeInterface {
  weeInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_PlatformNamesInterface_release_handle(handle);
    handle = null;
  }
  weeInterface$Impl.make(String makeParameter) : super(_make(makeParameter)) {
    __lib.ffi_cache_token(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  @override
  weeStruct WeeMethod(String WeeParameter) {
    final _WeeMethod_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PlatformNamesInterface_basicMethod__String'));
    final _WeeParameter_handle = String_toFfi(WeeParameter);
    final _handle = this.handle;
    final __result_handle = _WeeMethod_ffi(_handle, __lib.LibraryContext.isolateId, _WeeParameter_handle);
    String_releaseFfiHandle(_WeeParameter_handle);
    try {
      return smoke_PlatformNames_BasicStruct_fromFfi(__result_handle);
    } finally {
      smoke_PlatformNames_BasicStruct_releaseFfiHandle(__result_handle);
    }
  }
  static Pointer<Void> _make(String makeParameter) {
    final _make_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_PlatformNamesInterface_create__String'));
    final _makeParameter_handle = String_toFfi(makeParameter);
    final __result_handle = _make_ffi(__lib.LibraryContext.isolateId, _makeParameter_handle);
    String_releaseFfiHandle(_makeParameter_handle);
    return __result_handle;
  }
  @override
  int get WEE_PROPERTY {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_PlatformNamesInterface_basicProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  set WEE_PROPERTY(int value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_smoke_PlatformNamesInterface_basicProperty_set__UInt'));
    final _value_handle = (value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    (_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_PlatformNamesInterface_toFfi(weeInterface value) =>
  _smoke_PlatformNamesInterface_copy_handle((value as __lib.NativeBase).handle);
weeInterface smoke_PlatformNamesInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as weeInterface;
  if (instance != null) return instance;
  final _copied_handle = _smoke_PlatformNamesInterface_copy_handle(handle);
  final result = weeInterface$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_PlatformNamesInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_PlatformNamesInterface_release_handle(handle);
Pointer<Void> smoke_PlatformNamesInterface_toFfi_nullable(weeInterface value) =>
  value != null ? smoke_PlatformNamesInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
weeInterface smoke_PlatformNamesInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_PlatformNamesInterface_fromFfi(handle) : null;
void smoke_PlatformNamesInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PlatformNamesInterface_release_handle(handle);
// End of weeInterface "private" section.
