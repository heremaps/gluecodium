import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
/// Something lorem something ipsum.
///
/// |  Tables  |      Are      |  Cool |
/// |----------|:-------------:|------:|
/// | col 1 is | left-aligned  | $1600 |
/// | col 2 is |   centered    |   $12 |
/// | col 3 is | right-aligned |    $1 |
abstract class CommentsTable {
}
// CommentsTable "private" section, not exported.
final _smokeCommentstableRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CommentsTable_register_finalizer'));
final _smokeCommentstableCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsTable_copy_handle'));
final _smokeCommentstableReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsTable_release_handle'));
class CommentsTable$Impl extends __lib.NativeBase implements CommentsTable {
  CommentsTable$Impl(Pointer<Void> handle) : super(handle);
}
Pointer<Void> smokeCommentstableToFfi(CommentsTable value) =>
  _smokeCommentstableCopyHandle((value as __lib.NativeBase).handle);
CommentsTable smokeCommentstableFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CommentsTable) return instance;
  final _copiedHandle = _smokeCommentstableCopyHandle(handle);
  final result = CommentsTable$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeCommentstableRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeCommentstableReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCommentstableReleaseHandle(handle);
Pointer<Void> smokeCommentstableToFfiNullable(CommentsTable? value) =>
  value != null ? smokeCommentstableToFfi(value) : Pointer<Void>.fromAddress(0);
CommentsTable? smokeCommentstableFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCommentstableFromFfi(handle) : null;
void smokeCommentstableReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCommentstableReleaseHandle(handle);
// End of CommentsTable "private" section.
