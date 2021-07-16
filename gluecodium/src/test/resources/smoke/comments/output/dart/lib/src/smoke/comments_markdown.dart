import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
/// First line.
///
/// Second line.
///
/// Another paragraph. **bold** and *italic* and `code`.
///
/// > blockquote
///
/// # Heading one
///
/// ## Heading two
///
/// ### Heading three
///
/// Unordered list:
/// - A
/// - B
///
/// Ordered list:
/// 1. foo
/// 2. bar
///
/// ---
///
/// [title](https://www.markdownguide.org/cheat-sheet/)
abstract class CommentsMarkdown {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
}
// CommentsMarkdown "private" section, not exported.
final _smokeCommentsmarkdownRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CommentsMarkdown_register_finalizer'));
final _smokeCommentsmarkdownCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsMarkdown_copy_handle'));
final _smokeCommentsmarkdownReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsMarkdown_release_handle'));
class CommentsMarkdown$Impl extends __lib.NativeBase implements CommentsMarkdown {
  CommentsMarkdown$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
}
Pointer<Void> smokeCommentsmarkdownToFfi(CommentsMarkdown value) =>
  _smokeCommentsmarkdownCopyHandle((value as __lib.NativeBase).handle);
CommentsMarkdown smokeCommentsmarkdownFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CommentsMarkdown) return instance;
  final _copiedHandle = _smokeCommentsmarkdownCopyHandle(handle);
  final result = CommentsMarkdown$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeCommentsmarkdownRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeCommentsmarkdownReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCommentsmarkdownReleaseHandle(handle);
Pointer<Void> smokeCommentsmarkdownToFfiNullable(CommentsMarkdown? value) =>
  value != null ? smokeCommentsmarkdownToFfi(value) : Pointer<Void>.fromAddress(0);
CommentsMarkdown? smokeCommentsmarkdownFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCommentsmarkdownFromFfi(handle) : null;
void smokeCommentsmarkdownReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCommentsmarkdownReleaseHandle(handle);
// End of CommentsMarkdown "private" section.
