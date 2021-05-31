import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
/// @nodoc
abstract class InternalClassWithFunctions {
  /// @nodoc
  factory InternalClassWithFunctions.make() => InternalClassWithFunctions$Impl.internal_make();
  /// @nodoc
  factory InternalClassWithFunctions.remake(String foo) => InternalClassWithFunctions$Impl.internal_remake(foo);
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  /// @nodoc
  internal_fooBar();
}
// InternalClassWithFunctions "private" section, not exported.
final _smokeInternalclasswithfunctionsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_InternalClassWithFunctions_register_finalizer'));
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
  void release() {}
  InternalClassWithFunctions$Impl.internal_make() : super(_make()) {
    __lib.cacheInstance(handle, this);
    _smokeInternalclasswithfunctionsRegisterFinalizer(handle, __lib.LibraryContext.isolateId, this);
  }
  InternalClassWithFunctions$Impl.internal_remake(String foo) : super(_remake(foo)) {
    __lib.cacheInstance(handle, this);
    _smokeInternalclasswithfunctionsRegisterFinalizer(handle, __lib.LibraryContext.isolateId, this);
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
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InternalClassWithFunctions) return instance as InternalClassWithFunctions;
  final _copiedHandle = _smokeInternalclasswithfunctionsCopyHandle(handle);
  final result = InternalClassWithFunctions$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeInternalclasswithfunctionsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeInternalclasswithfunctionsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeInternalclasswithfunctionsReleaseHandle(handle);
Pointer<Void> smokeInternalclasswithfunctionsToFfiNullable(InternalClassWithFunctions? value) =>
  value != null ? smokeInternalclasswithfunctionsToFfi(value) : Pointer<Void>.fromAddress(0);
InternalClassWithFunctions? smokeInternalclasswithfunctionsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeInternalclasswithfunctionsFromFfi(handle) : null;
void smokeInternalclasswithfunctionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInternalclasswithfunctionsReleaseHandle(handle);
// End of InternalClassWithFunctions "private" section.
