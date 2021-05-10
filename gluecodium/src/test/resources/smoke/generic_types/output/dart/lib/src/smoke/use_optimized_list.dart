import 'package:library/src/_lazy_list.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/unreasonably_lazy_class.dart';
import 'package:library/src/smoke/very_big_struct.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class UseOptimizedList {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static List<VeryBigStruct> fetchTheBigOnes() => UseOptimizedList$Impl.fetchTheBigOnes();
  static List<UnreasonablyLazyClass> get lazyOnes => UseOptimizedList$Impl.lazyOnes;
}
// UseOptimizedList "private" section, not exported.
final _smokeUseoptimizedlistCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseOptimizedList_copy_handle'));
final _smokeUseoptimizedlistReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedList_release_handle'));
final _smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get_size = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get_size'));
final _smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('library_smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get'));
final _smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_release_handle'));
final _smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get_size = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get_size'));
final _smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get'));
final _smoke_UseOptimizedList_smoke_VeryBigStructLazyList_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_release_handle'));
class UseOptimizedList$Impl extends __lib.NativeBase implements UseOptimizedList {
  UseOptimizedList$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeUseoptimizedlistReleaseHandle(handle);
    handle = null;
  }
  static List<VeryBigStruct> fetchTheBigOnes() {
    final _fetchTheBigOnesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_UseOptimizedList_fetchTheBigOnes'));
    final __resultHandle = _fetchTheBigOnesFfi(__lib.LibraryContext.isolateId);
    return __lib.LazyList(
        __resultHandle,
        _smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get_size(__resultHandle),
        (index) {
          final __elementHandle = _smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get(__resultHandle, index);
          final __elementResult = smoke_VeryBigStruct_fromFfi(__elementHandle);
          smoke_VeryBigStruct_releaseFfiHandle(__elementHandle);
          return __elementResult;
        },
        () => _smoke_UseOptimizedList_smoke_VeryBigStructLazyList_release_handle(__resultHandle)
      );
  }
  static List<UnreasonablyLazyClass> get lazyOnes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_UseOptimizedList_lazyOnes_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    return __lib.LazyList(
        __resultHandle,
        _smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get_size(__resultHandle),
        (index) {
          final __elementHandle = _smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get(__resultHandle, index);
          final __elementResult = smoke_UnreasonablyLazyClass_fromFfi(__elementHandle);
          smoke_UnreasonablyLazyClass_releaseFfiHandle(__elementHandle);
          return __elementResult;
        },
        () => _smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_release_handle(__resultHandle)
      );
  }
}
Pointer<Void> smoke_UseOptimizedList_toFfi(UseOptimizedList value) =>
  _smokeUseoptimizedlistCopyHandle((value as __lib.NativeBase).handle);
UseOptimizedList smoke_UseOptimizedList_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as UseOptimizedList;
  if (instance != null) return instance;
  final _copiedHandle = _smokeUseoptimizedlistCopyHandle(handle);
  final result = UseOptimizedList$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_UseOptimizedList_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeUseoptimizedlistReleaseHandle(handle);
Pointer<Void> smoke_UseOptimizedList_toFfi_nullable(UseOptimizedList value) =>
  value != null ? smoke_UseOptimizedList_toFfi(value) : Pointer<Void>.fromAddress(0);
UseOptimizedList smoke_UseOptimizedList_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_UseOptimizedList_fromFfi(handle) : null;
void smoke_UseOptimizedList_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeUseoptimizedlistReleaseHandle(handle);
// End of UseOptimizedList "private" section.
