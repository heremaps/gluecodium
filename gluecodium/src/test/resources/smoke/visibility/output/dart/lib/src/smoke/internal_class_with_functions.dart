import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
abstract class InternalClassWithFunctions {
  /// @nodoc
  factory InternalClassWithFunctions.make() => InternalClassWithFunctions$Impl.internal_make();
  /// @nodoc
  factory InternalClassWithFunctions.remake(String foo) => InternalClassWithFunctions$Impl.internal_remake(foo);
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// @nodoc
  internal_fooBar();
}
// InternalClassWithFunctions "private" section, not exported.
final _smokeInternalclasswithfunctionsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClassWithFunctions_copy_handle'));
final _smokeInternalclasswithfunctionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClassWithFunctions_release_handle'));
class InternalClassWithFunctions$Impl extends __lib.NativeBase implements InternalClassWithFunctions {
  InternalClassWithFunctions$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeInternalclasswithfunctionsReleaseHandle(handle);
    handle = null;
  }
  InternalClassWithFunctions$Impl.internal_make() : super(_make()) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  InternalClassWithFunctions$Impl.internal_remake(String foo) : super(_remake(foo)) {
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  @override
  internal_fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalClassWithFunctions_fooBar'));
    final _handle = this.handle;
    final __resultHandle = _fooBarFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  static Pointer<Void> _make() {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_InternalClassWithFunctions_make'));
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }
  static Pointer<Void> _remake(String foo) {
    final _remakeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_InternalClassWithFunctions_make__String'));
    final _fooHandle = stringToFfi(foo);
    final __resultHandle = _remakeFfi(__lib.LibraryContext.isolateId, _fooHandle);
    stringReleaseFfiHandle(_fooHandle);
    return __resultHandle;
  }
}
Pointer<Void> smokeInternalclasswithfunctionsToFfi(InternalClassWithFunctions value) =>
  _smokeInternalclasswithfunctionsCopyHandle((value as __lib.NativeBase).handle);
InternalClassWithFunctions smokeInternalclasswithfunctionsFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as InternalClassWithFunctions;
  if (instance != null) return instance;
  final _copiedHandle = _smokeInternalclasswithfunctionsCopyHandle(handle);
  final result = InternalClassWithFunctions$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeInternalclasswithfunctionsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeInternalclasswithfunctionsReleaseHandle(handle);
Pointer<Void> smokeInternalclasswithfunctionsToFfiNullable(InternalClassWithFunctions value) =>
  value != null ? smokeInternalclasswithfunctionsToFfi(value) : Pointer<Void>.fromAddress(0);
InternalClassWithFunctions smokeInternalclasswithfunctionsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeInternalclasswithfunctionsFromFfi(handle) : null;
void smokeInternalclasswithfunctionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInternalclasswithfunctionsReleaseHandle(handle);
// End of InternalClassWithFunctions "private" section.
