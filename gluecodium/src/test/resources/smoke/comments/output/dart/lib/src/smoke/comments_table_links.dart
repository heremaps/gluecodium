

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;

/// Something lorem something ipsum.
///
/// | Tables | Are | Cool |
/// |----------|:-------------:|------:|
/// | col 1 is |  [CommentsTable] | $1600 |
/// | col 2 is |[Comments_SomeEnum]|   $12 |
/// | col 3 is |[Comments_SomeEnum.useful]|    $1 |
abstract class CommentsTableLinks implements Finalizable {

}


// CommentsTableLinks "private" section, not exported.

final _smokeCommentstablelinksRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CommentsTableLinks_register_finalizer'));
final _smokeCommentstablelinksCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsTableLinks_copy_handle'));
final _smokeCommentstablelinksReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsTableLinks_release_handle'));


class CommentsTableLinks$Impl extends __lib.NativeBase implements CommentsTableLinks {

  CommentsTableLinks$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> smokeCommentstablelinksToFfi(CommentsTableLinks value) =>
  _smokeCommentstablelinksCopyHandle((value as __lib.NativeBase).handle);

CommentsTableLinks smokeCommentstablelinksFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CommentsTableLinks) return instance;

  final _copiedHandle = _smokeCommentstablelinksCopyHandle(handle);
  final result = CommentsTableLinks$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeCommentstablelinksRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeCommentstablelinksReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCommentstablelinksReleaseHandle(handle);

Pointer<Void> smokeCommentstablelinksToFfiNullable(CommentsTableLinks? value) =>
  value != null ? smokeCommentstablelinksToFfi(value) : Pointer<Void>.fromAddress(0);

CommentsTableLinks? smokeCommentstablelinksFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCommentstablelinksFromFfi(handle) : null;

void smokeCommentstablelinksReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCommentstablelinksReleaseHandle(handle);

// End of CommentsTableLinks "private" section.


