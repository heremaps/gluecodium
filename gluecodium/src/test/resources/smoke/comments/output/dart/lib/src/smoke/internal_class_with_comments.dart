

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;

/// This looks internal
/// @nodoc
abstract class InternalClassWithComments implements Finalizable {

  /// This is definitely internal
  ///
  void doNothing();
}


// InternalClassWithComments "private" section, not exported.

final _smokeInternalclasswithcommentsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_InternalClassWithComments_register_finalizer'));
final _smokeInternalclasswithcommentsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClassWithComments_copy_handle'));
final _smokeInternalclasswithcommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClassWithComments_release_handle'));



class InternalClassWithComments$Impl extends __lib.NativeBase implements InternalClassWithComments {

  InternalClassWithComments$Impl(Pointer<Void> handle) : super(handle);

  @override
  void doNothing() {
    final _doNothingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalClassWithComments_doNothing'));
    final _handle = this.handle;
    _doNothingFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

Pointer<Void> smokeInternalclasswithcommentsToFfi(InternalClassWithComments value) =>
  _smokeInternalclasswithcommentsCopyHandle((value as __lib.NativeBase).handle);

InternalClassWithComments smokeInternalclasswithcommentsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InternalClassWithComments) return instance;

  final _copiedHandle = _smokeInternalclasswithcommentsCopyHandle(handle);
  final result = InternalClassWithComments$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeInternalclasswithcommentsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeInternalclasswithcommentsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeInternalclasswithcommentsReleaseHandle(handle);

Pointer<Void> smokeInternalclasswithcommentsToFfiNullable(InternalClassWithComments? value) =>
  value != null ? smokeInternalclasswithcommentsToFfi(value) : Pointer<Void>.fromAddress(0);

InternalClassWithComments? smokeInternalclasswithcommentsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeInternalclasswithcommentsFromFfi(handle) : null;

void smokeInternalclasswithcommentsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInternalclasswithcommentsReleaseHandle(handle);

// End of InternalClassWithComments "private" section.


