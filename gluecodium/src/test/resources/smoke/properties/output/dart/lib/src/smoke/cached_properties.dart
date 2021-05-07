import 'dart:typed_data';
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class CachedProperties {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  List<String> get cachedProperty;
  static Uint8List get staticCachedProperty => CachedProperties$Impl.staticCachedProperty;
}
// CachedProperties "private" section, not exported.
final _smoke_CachedProperties_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CachedProperties_copy_handle'));
final _smoke_CachedProperties_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CachedProperties_release_handle'));
class CachedProperties$Impl extends __lib.NativeBase implements CachedProperties {
  CachedProperties$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_CachedProperties_release_handle(handle);
    handle = null;
  }
  List<String> _cache_cachedProperty;
  bool _is_cached_cachedProperty = false;
  @override
  List<String> get cachedProperty {
    if (!_is_cached_cachedProperty) {
      final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_CachedProperties_cachedProperty_get'));
      final __result_handle = _get_ffi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _cache_cachedProperty = foobar_ListOf_String_fromFfi(__result_handle);
      } finally {
        foobar_ListOf_String_releaseFfiHandle(__result_handle);
      }
      _is_cached_cachedProperty = true;
    }
    return _cache_cachedProperty;
  }
  static Uint8List _cache_staticCachedProperty;
  static bool _is_cached_staticCachedProperty = false;
  static Uint8List get staticCachedProperty {
    if (!_is_cached_staticCachedProperty) {
      final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_CachedProperties_staticCachedProperty_get'));
      final __result_handle = _get_ffi(__lib.LibraryContext.isolateId);
      try {
        _cache_staticCachedProperty = Blob_fromFfi(__result_handle);
      } finally {
        Blob_releaseFfiHandle(__result_handle);
      }
      _is_cached_staticCachedProperty = true;
    }
    return _cache_staticCachedProperty;
  }
}
Pointer<Void> smoke_CachedProperties_toFfi(CachedProperties value) =>
  _smoke_CachedProperties_copy_handle((value as __lib.NativeBase).handle);
CachedProperties smoke_CachedProperties_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as CachedProperties;
  if (instance != null) return instance;
  final _copied_handle = _smoke_CachedProperties_copy_handle(handle);
  final result = CachedProperties$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_CachedProperties_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_CachedProperties_release_handle(handle);
Pointer<Void> smoke_CachedProperties_toFfi_nullable(CachedProperties value) =>
  value != null ? smoke_CachedProperties_toFfi(value) : Pointer<Void>.fromAddress(0);
CachedProperties smoke_CachedProperties_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_CachedProperties_fromFfi(handle) : null;
void smoke_CachedProperties_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CachedProperties_release_handle(handle);
// End of CachedProperties "private" section.
