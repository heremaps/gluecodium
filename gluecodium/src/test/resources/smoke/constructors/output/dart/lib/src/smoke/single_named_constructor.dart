

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:meta/meta.dart';

abstract class SingleNamedConstructor implements Finalizable {

  factory SingleNamedConstructor.fooBar() => $prototype.fooBar();


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SingleNamedConstructor$Impl(Pointer<Void>.fromAddress(0));
}


// SingleNamedConstructor "private" section, not exported.

final _smokeSinglenamedconstructorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SingleNamedConstructor_register_finalizer'));
final _smokeSinglenamedconstructorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SingleNamedConstructor_copy_handle'));
final _smokeSinglenamedconstructorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SingleNamedConstructor_release_handle'));



/// @nodoc
@visibleForTesting
class SingleNamedConstructor$Impl extends __lib.NativeBase implements SingleNamedConstructor {

  SingleNamedConstructor$Impl(Pointer<Void> handle) : super(handle);


  SingleNamedConstructor fooBar() {
    final _result_handle = _fooBar();
    final _result = SingleNamedConstructor$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _smokeSinglenamedconstructorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_SingleNamedConstructor_create'));
    final __resultHandle = _fooBarFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }


}

Pointer<Void> smokeSinglenamedconstructorToFfi(SingleNamedConstructor value) =>
  _smokeSinglenamedconstructorCopyHandle((value as __lib.NativeBase).handle);

SingleNamedConstructor smokeSinglenamedconstructorFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SingleNamedConstructor) return instance;

  final _copiedHandle = _smokeSinglenamedconstructorCopyHandle(handle);
  final result = SingleNamedConstructor$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeSinglenamedconstructorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeSinglenamedconstructorReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSinglenamedconstructorReleaseHandle(handle);

Pointer<Void> smokeSinglenamedconstructorToFfiNullable(SingleNamedConstructor? value) =>
  value != null ? smokeSinglenamedconstructorToFfi(value) : Pointer<Void>.fromAddress(0);

SingleNamedConstructor? smokeSinglenamedconstructorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSinglenamedconstructorFromFfi(handle) : null;

void smokeSinglenamedconstructorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSinglenamedconstructorReleaseHandle(handle);

// End of SingleNamedConstructor "private" section.


