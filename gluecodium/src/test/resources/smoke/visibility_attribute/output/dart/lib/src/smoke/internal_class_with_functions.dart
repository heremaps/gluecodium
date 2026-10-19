

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';

/// @nodoc
abstract class InternalClassWithFunctions implements Finalizable {

  factory InternalClassWithFunctions.make() => $prototype.make();

  factory InternalClassWithFunctions.remake(String foo) => $prototype.remake(foo);


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


final __ffi_smoke_InternalClassWithFunctions_library_smoke_InternalClassWithFunctions_fooBar = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalClassWithFunctions_fooBar'));


final __ffi_smoke_InternalClassWithFunctions_library_smoke_InternalClassWithFunctions_make = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_InternalClassWithFunctions_make'));


final __ffi_smoke_InternalClassWithFunctions_library_smoke_InternalClassWithFunctions_make__String = __lib.catchArgumentError(() =>
  __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_InternalClassWithFunctions_make__String'));



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
    final _handle = this.handle;
    __ffi_smoke_InternalClassWithFunctions_library_smoke_InternalClassWithFunctions_fooBar(_handle, __lib.LibraryContext.isolateId);

  }

  static Pointer<Void> _make() {
    final __resultHandle = __ffi_smoke_InternalClassWithFunctions_library_smoke_InternalClassWithFunctions_make(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  static Pointer<Void> _remake(String foo) {
    final _fooHandle = stringToFfi(foo);
    final __resultHandle = __ffi_smoke_InternalClassWithFunctions_library_smoke_InternalClassWithFunctions_make__String(__lib.LibraryContext.isolateId, _fooHandle);
    stringReleaseFfiHandle(_fooHandle);
    return __resultHandle;
  }


}

Pointer<Void> smokeInternalclasswithfunctionsToFfi(InternalClassWithFunctions value) =>
  _smokeInternalclasswithfunctionsCopyHandle((value as __lib.NativeBase).handle);

InternalClassWithFunctions smokeInternalclasswithfunctionsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
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


