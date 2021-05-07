import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class SkipTagsOnly {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
// SkipTagsOnly "private" section, not exported.
final _smoke_SkipTagsOnly_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTagsOnly_copy_handle'));
final _smoke_SkipTagsOnly_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTagsOnly_release_handle'));
class SkipTagsOnly$Impl extends __lib.NativeBase implements SkipTagsOnly {
  SkipTagsOnly$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_SkipTagsOnly_release_handle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_SkipTagsOnly_toFfi(SkipTagsOnly value) =>
  _smoke_SkipTagsOnly_copy_handle((value as __lib.NativeBase).handle);
SkipTagsOnly smoke_SkipTagsOnly_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as SkipTagsOnly;
  if (instance != null) return instance;
  final _copied_handle = _smoke_SkipTagsOnly_copy_handle(handle);
  final result = SkipTagsOnly$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_SkipTagsOnly_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SkipTagsOnly_release_handle(handle);
Pointer<Void> smoke_SkipTagsOnly_toFfi_nullable(SkipTagsOnly value) =>
  value != null ? smoke_SkipTagsOnly_toFfi(value) : Pointer<Void>.fromAddress(0);
SkipTagsOnly smoke_SkipTagsOnly_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SkipTagsOnly_fromFfi(handle) : null;
void smoke_SkipTagsOnly_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SkipTagsOnly_release_handle(handle);
// End of SkipTagsOnly "private" section.
