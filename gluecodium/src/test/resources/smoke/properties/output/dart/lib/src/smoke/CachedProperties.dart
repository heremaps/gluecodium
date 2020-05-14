import 'dart:typed_data';
import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
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
final _smoke_CachedProperties_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CachedProperties_copy_handle');
final _smoke_CachedProperties_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CachedProperties_release_handle');
final _smoke_CachedProperties_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_CachedProperties_get_raw_pointer');
class CachedProperties$Impl implements CachedProperties {
  @protected
  Pointer<Void> handle;
  CachedProperties$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_CachedProperties_get_raw_pointer(handle));
    _smoke_CachedProperties_release_handle(handle);
    handle = null;
  }
  List<String> _cache_cachedProperty;
  bool _is_cached_cachedProperty = false;
  @override
  List<String> get cachedProperty {
    if (!_is_cached_cachedProperty) {
      final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_CachedProperties_cachedProperty_get');
      final __result_handle = _get_ffi(this.handle, __lib.LibraryContext.isolateId);
      _cache_cachedProperty = ListOf_String_fromFfi(__result_handle);
      ListOf_String_releaseFfiHandle(__result_handle);
      _is_cached_cachedProperty = true;
    }
    return _cache_cachedProperty;
  }
  static Uint8List _cache_staticCachedProperty;
  static bool _is_cached_staticCachedProperty = false;
  static Uint8List get staticCachedProperty {
    if (!_is_cached_staticCachedProperty) {
      final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_CachedProperties_staticCachedProperty_get');
      final __result_handle = _get_ffi(__lib.LibraryContext.isolateId);
      _cache_staticCachedProperty = Blob_fromFfi(__result_handle);
      Blob_releaseFfiHandle(__result_handle);
      _is_cached_staticCachedProperty = true;
    }
    return _cache_staticCachedProperty;
  }
}
Pointer<Void> smoke_CachedProperties_toFfi(CachedProperties value) =>
  _smoke_CachedProperties_copy_handle((value as CachedProperties$Impl).handle);
CachedProperties smoke_CachedProperties_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_CachedProperties_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as CachedProperties;
  if (instance != null) return instance;
  final _copied_handle = _smoke_CachedProperties_copy_handle(handle);
  final result = CachedProperties$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
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
