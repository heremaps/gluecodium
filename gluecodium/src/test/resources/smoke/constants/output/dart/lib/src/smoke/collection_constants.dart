import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class CollectionConstants {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static final List<String> listConstant = ["foo", "bar"];
  static final Set<String> setConstant = {"foo", "bar"};
  static final Map<String, String> mapConstant = {"foo": "bar"};
  static final Map<List<String>, Set<String>> mixedConstant = {["foo"]: {"bar"}};
}
// CollectionConstants "private" section, not exported.
final _smokeCollectionconstantsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CollectionConstants_copy_handle'));
final _smokeCollectionconstantsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CollectionConstants_release_handle'));
class CollectionConstants$Impl extends __lib.NativeBase implements CollectionConstants {
  CollectionConstants$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeCollectionconstantsReleaseHandle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_CollectionConstants_toFfi(CollectionConstants value) =>
  _smokeCollectionconstantsCopyHandle((value as __lib.NativeBase).handle);
CollectionConstants smoke_CollectionConstants_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as CollectionConstants;
  if (instance != null) return instance;
  final _copiedHandle = _smokeCollectionconstantsCopyHandle(handle);
  final result = CollectionConstants$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_CollectionConstants_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeCollectionconstantsReleaseHandle(handle);
Pointer<Void> smoke_CollectionConstants_toFfi_nullable(CollectionConstants value) =>
  value != null ? smoke_CollectionConstants_toFfi(value) : Pointer<Void>.fromAddress(0);
CollectionConstants smoke_CollectionConstants_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_CollectionConstants_fromFfi(handle) : null;
void smoke_CollectionConstants_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeCollectionconstantsReleaseHandle(handle);
// End of CollectionConstants "private" section.
