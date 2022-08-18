import 'dart:ffi';
import 'package:library/src/_lazy_list.dart' as __lib;
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/unreasonably_lazy_class.dart';
import 'package:library/src/smoke/very_big_struct.dart';
import 'package:meta/meta.dart';
abstract class UseOptimizedList {

  static List<VeryBigStruct> fetchTheBigOnes() => $prototype.fetchTheBigOnes();
  static List<UnreasonablyLazyClass> get lazyOnes => $prototype.lazyOnes;
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = UseOptimizedList$Impl(Pointer<Void>.fromAddress(0));
}
// UseOptimizedList "private" section, not exported.
final _smokeUseoptimizedlistRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_UseOptimizedList_register_finalizer'));
final _smokeUseoptimizedlistCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UseOptimizedList_copy_handle'));
final _smokeUseoptimizedlistReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UseOptimizedList_release_handle'));
final _smokeUseoptimizedlistsmokeUnreasonablylazyclassLazyListGetSize = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get_size'));
final _smokeUseoptimizedlistsmokeUnreasonablylazyclassLazyListGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('library_smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_get'));
final _smokeUseoptimizedlistsmokeUnreasonablylazyclassLazyListRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_UseOptimizedList_smoke_UnreasonablyLazyClassLazyList_register_finalizer'));
final _smokeUseoptimizedlistsmokeVerybigstructLazyListGetSize = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get_size'));
final _smokeUseoptimizedlistsmokeVerybigstructLazyListGet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_get'));
final _smokeUseoptimizedlistsmokeVerybigstructLazyListRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_UseOptimizedList_smoke_VeryBigStructLazyList_register_finalizer'));
/// @nodoc
@visibleForTesting
class UseOptimizedList$Impl extends __lib.NativeBase implements UseOptimizedList {
  UseOptimizedList$Impl(Pointer<Void> handle) : super(handle);

  List<VeryBigStruct> fetchTheBigOnes() {
    final _fetchTheBigOnesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_UseOptimizedList_fetchTheBigOnes'));
    final __resultHandle = _fetchTheBigOnesFfi(__lib.LibraryContext.isolateId);
    return __lib.LazyList(
        __resultHandle,
        _smokeUseoptimizedlistsmokeVerybigstructLazyListGetSize(__resultHandle),
        (index) {
          final __elementHandle = _smokeUseoptimizedlistsmokeVerybigstructLazyListGet(__resultHandle, index);
          final __elementResult = smokeVerybigstructFromFfi(__elementHandle);
          smokeVerybigstructReleaseFfiHandle(__elementHandle);
          return __elementResult;
        },
        (obj) => _smokeUseoptimizedlistsmokeVerybigstructLazyListRegisterFinalizer(__resultHandle, __lib.LibraryContext.isolateId, obj)
      );
  }
  List<UnreasonablyLazyClass> get lazyOnes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_UseOptimizedList_lazyOnes_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    return __lib.LazyList(
        __resultHandle,
        _smokeUseoptimizedlistsmokeUnreasonablylazyclassLazyListGetSize(__resultHandle),
        (index) {
          final __elementHandle = _smokeUseoptimizedlistsmokeUnreasonablylazyclassLazyListGet(__resultHandle, index);
          final __elementResult = smokeUnreasonablylazyclassFromFfi(__elementHandle);
          smokeUnreasonablylazyclassReleaseFfiHandle(__elementHandle);
          return __elementResult;
        },
        (obj) => _smokeUseoptimizedlistsmokeUnreasonablylazyclassLazyListRegisterFinalizer(__resultHandle, __lib.LibraryContext.isolateId, obj)
      );
  }
}
Pointer<Void> smokeUseoptimizedlistToFfi(UseOptimizedList value) =>
  _smokeUseoptimizedlistCopyHandle((value as __lib.NativeBase).handle);
UseOptimizedList smokeUseoptimizedlistFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is UseOptimizedList) return instance;
  final _copiedHandle = _smokeUseoptimizedlistCopyHandle(handle);
  final result = UseOptimizedList$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeUseoptimizedlistRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeUseoptimizedlistReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeUseoptimizedlistReleaseHandle(handle);
Pointer<Void> smokeUseoptimizedlistToFfiNullable(UseOptimizedList? value) =>
  value != null ? smokeUseoptimizedlistToFfi(value) : Pointer<Void>.fromAddress(0);
UseOptimizedList? smokeUseoptimizedlistFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeUseoptimizedlistFromFfi(handle) : null;
void smokeUseoptimizedlistReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeUseoptimizedlistReleaseHandle(handle);
// End of UseOptimizedList "private" section.
