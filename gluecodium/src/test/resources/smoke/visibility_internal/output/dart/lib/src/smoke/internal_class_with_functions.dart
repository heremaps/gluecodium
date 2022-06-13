import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
/// @nodoc
@internal
abstract class InternalClassWithFunctions {
  /// @nodoc
  factory InternalClassWithFunctions.make() => $prototype.make();
  /// @nodoc
  factory InternalClassWithFunctions.remake(String foo) => $prototype.remake(foo);
  /// @nodoc
  void fooBar();
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = InternalClassWithFunctions$Impl(Pointer<Void>.fromAddress(0));
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
/// @nodoc
@visibleForTesting
class InternalClassWithFunctions$Impl extends __lib.NativeBase implements InternalClassWithFunctions {
  InternalClassWithFunctions$Impl(Pointer<Void> handle) : super(handle);
  InternalClassWithFunctions make() {
    final _result_handle = _make();
    final _result = InternalClassWithFunctions$Impl(_result_handle);
    __lib.cacheInstance(_result_handle, _result);
    _smokeInternalclasswithfunctionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }
  InternalClassWithFunctions remake(String foo) {
    final _result_handle = _remake(foo);
    final _result = InternalClassWithFunctions$Impl(_result_handle);
    __lib.cacheInstance(_result_handle, _result);
    _smokeInternalclasswithfunctionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }
  @override
  void fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalClassWithFunctions_fooBar'));
    final _handle = this.handle;
    _fooBarFfi(_handle, __lib.LibraryContext.isolateId);
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
  if (instance != null && instance is InternalClassWithFunctions) return instance;
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
