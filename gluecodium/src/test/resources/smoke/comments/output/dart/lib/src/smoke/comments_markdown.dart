import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
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
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
// CommentsMarkdown "private" section, not exported.
final _smoke_CommentsMarkdown_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsMarkdown_copy_handle'));
final _smoke_CommentsMarkdown_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsMarkdown_release_handle'));
class CommentsMarkdown$Impl extends __lib.NativeBase implements CommentsMarkdown {
  CommentsMarkdown$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_CommentsMarkdown_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
}
Pointer<Void> smoke_CommentsMarkdown_toFfi(CommentsMarkdown value) =>
  _smoke_CommentsMarkdown_copy_handle((value as __lib.NativeBase).handle);
CommentsMarkdown smoke_CommentsMarkdown_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is CommentsMarkdown) return instance;
  final _copied_handle = _smoke_CommentsMarkdown_copy_handle(handle);
  final result = CommentsMarkdown$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_CommentsMarkdown_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_CommentsMarkdown_release_handle(handle);
Pointer<Void> smoke_CommentsMarkdown_toFfi_nullable(CommentsMarkdown? value) =>
  value != null ? smoke_CommentsMarkdown_toFfi(value) : Pointer<Void>.fromAddress(0);
CommentsMarkdown? smoke_CommentsMarkdown_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_CommentsMarkdown_fromFfi(handle) : null;
void smoke_CommentsMarkdown_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CommentsMarkdown_release_handle(handle);
// End of CommentsMarkdown "private" section.
