import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/comments.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class UnicodeComments {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// Süßölgefäß
  ///
  /// [input] שלום
  ///
  /// Returns [bool]. товарищ
  ///
  /// Throws [Comments_SomethingWrongException]. ネコ
  ///
  bool someMethodWithAllComments(String input);
}
// UnicodeComments "private" section, not exported.
final _smokeUnicodecommentsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_copy_handle'));
final _smokeUnicodecommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_release_handle'));
final _someMethodWithAllCommentsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_release_handle'));
final _someMethodWithAllCommentsReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_get_result'));
final _someMethodWithAllCommentsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_get_error'));
final _someMethodWithAllCommentsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_has_error'));
class UnicodeComments$Impl extends __lib.NativeBase implements UnicodeComments {
  UnicodeComments$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeUnicodecommentsReleaseHandle(handle);
    handle = null;
  }
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_UnicodeComments_someMethodWithAllComments__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __callResultHandle = _someMethodWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    if (_someMethodWithAllCommentsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _someMethodWithAllCommentsReturnGetError(__callResultHandle);
        _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
        try {
          throw Comments_SomethingWrongException(smoke_Comments_SomeEnum_fromFfi(__errorHandle));
        } finally {
          smoke_Comments_SomeEnum_releaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _someMethodWithAllCommentsReturnGetResult(__callResultHandle);
    _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_UnicodeComments_toFfi(UnicodeComments value) =>
  _smokeUnicodecommentsCopyHandle((value as __lib.NativeBase).handle);
UnicodeComments smoke_UnicodeComments_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as UnicodeComments;
  if (instance != null) return instance;
  final _copiedHandle = _smokeUnicodecommentsCopyHandle(handle);
  final result = UnicodeComments$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_UnicodeComments_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeUnicodecommentsReleaseHandle(handle);
Pointer<Void> smoke_UnicodeComments_toFfi_nullable(UnicodeComments value) =>
  value != null ? smoke_UnicodeComments_toFfi(value) : Pointer<Void>.fromAddress(0);
UnicodeComments smoke_UnicodeComments_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_UnicodeComments_fromFfi(handle) : null;
void smoke_UnicodeComments_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeUnicodecommentsReleaseHandle(handle);
// End of UnicodeComments "private" section.
