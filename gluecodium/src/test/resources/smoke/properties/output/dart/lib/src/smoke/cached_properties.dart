import 'dart:ffi';
import 'dart:typed_data';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
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
final _smokeCachedpropertiesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CachedProperties_copy_handle'));
final _smokeCachedpropertiesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CachedProperties_release_handle'));
class CachedProperties$Impl extends __lib.NativeBase implements CachedProperties {
  CachedProperties$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeCachedpropertiesReleaseHandle(handle);
    handle = null;
  }
  /*late*/ List<String> _cachedPropertyCache;
  bool _cachedPropertyIsCached = false;
  @override
  List<String> get cachedProperty {
    if (!_cachedPropertyIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_CachedProperties_cachedProperty_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _cachedPropertyCache = foobarListofStringFromFfi(__resultHandle);
      } finally {
        foobarListofStringReleaseFfiHandle(__resultHandle);
      }
      _cachedPropertyIsCached = true;
    }
    return _cachedPropertyCache;
  }
  static /*late*/ Uint8List _staticCachedPropertyCache;
  static bool _staticCachedPropertyIsCached = false;
  static Uint8List get staticCachedProperty {
    if (!_staticCachedPropertyIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_CachedProperties_staticCachedProperty_get'));
      final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
      try {
        _staticCachedPropertyCache = blobFromFfi(__resultHandle);
      } finally {
        blobReleaseFfiHandle(__resultHandle);
      }
      _staticCachedPropertyIsCached = true;
    }
    return _staticCachedPropertyCache;
  }
}
Pointer<Void> smokeCachedpropertiesToFfi(CachedProperties value) =>
  _smokeCachedpropertiesCopyHandle((value as __lib.NativeBase).handle);
CachedProperties smokeCachedpropertiesFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as CachedProperties;
  if (instance != null) return instance;
  final _copiedHandle = _smokeCachedpropertiesCopyHandle(handle);
  final result = CachedProperties$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeCachedpropertiesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCachedpropertiesReleaseHandle(handle);
Pointer<Void> smokeCachedpropertiesToFfiNullable(CachedProperties value) =>
  value != null ? smokeCachedpropertiesToFfi(value) : Pointer<Void>.fromAddress(0);
CachedProperties smokeCachedpropertiesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCachedpropertiesFromFfi(handle) : null;
void smokeCachedpropertiesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCachedpropertiesReleaseHandle(handle);
// End of CachedProperties "private" section.
