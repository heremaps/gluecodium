import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
/// Text leading line break
abstract class PlatformCommentsLineBreaks {
}
// PlatformCommentsLineBreaks "private" section, not exported.
final _smokePlatformcommentslinebreaksRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_PlatformCommentsLineBreaks_register_finalizer'));
final _smokePlatformcommentslinebreaksCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformCommentsLineBreaks_copy_handle'));
final _smokePlatformcommentslinebreaksReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformCommentsLineBreaks_release_handle'));
class PlatformCommentsLineBreaks$Impl extends __lib.NativeBase implements PlatformCommentsLineBreaks {
  PlatformCommentsLineBreaks$Impl(Pointer<Void> handle) : super(handle);
}
Pointer<Void> smokePlatformcommentslinebreaksToFfi(PlatformCommentsLineBreaks value) =>
  _smokePlatformcommentslinebreaksCopyHandle((value as __lib.NativeBase).handle);
PlatformCommentsLineBreaks smokePlatformcommentslinebreaksFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PlatformCommentsLineBreaks) return instance;
  final _copiedHandle = _smokePlatformcommentslinebreaksCopyHandle(handle);
  final result = PlatformCommentsLineBreaks$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokePlatformcommentslinebreaksRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokePlatformcommentslinebreaksReleaseFfiHandle(Pointer<Void> handle) =>
  _smokePlatformcommentslinebreaksReleaseHandle(handle);
Pointer<Void> smokePlatformcommentslinebreaksToFfiNullable(PlatformCommentsLineBreaks? value) =>
  value != null ? smokePlatformcommentslinebreaksToFfi(value) : Pointer<Void>.fromAddress(0);
PlatformCommentsLineBreaks? smokePlatformcommentslinebreaksFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokePlatformcommentslinebreaksFromFfi(handle) : null;
void smokePlatformcommentslinebreaksReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePlatformcommentslinebreaksReleaseHandle(handle);
// End of PlatformCommentsLineBreaks "private" section.
