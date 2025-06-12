

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/comments.dart';

abstract class UnicodeComments implements Finalizable {

  /// Süßölgefäß
  ///
  /// - [input] שלום
  ///
  /// Returns [Comments_Usefulness]. товарищ
  ///
  /// Throws [Comments_SomethingWrongException]. ネコ
  ///
  Comments_Usefulness someMethodWithAllComments(String input);
}


// UnicodeComments "private" section, not exported.

final _smokeUnicodecommentsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_UnicodeComments_register_finalizer'));
final _smokeUnicodecommentsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_copy_handle'));
final _smokeUnicodecommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_release_handle'));


final _someMethodWithAllCommentssmokeUnicodecommentsSomemethodwithallcommentsStringReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_release_handle'));
final _someMethodWithAllCommentssmokeUnicodecommentsSomemethodwithallcommentsStringReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_get_result'));
final _someMethodWithAllCommentssmokeUnicodecommentsSomemethodwithallcommentsStringReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_get_error'));
final _someMethodWithAllCommentssmokeUnicodecommentsSomemethodwithallcommentsStringReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_has_error'));



class UnicodeComments$Impl extends __lib.NativeBase implements UnicodeComments {

  UnicodeComments$Impl(Pointer<Void> handle) : super(handle);

  @override
  Comments_Usefulness someMethodWithAllComments(String input) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_UnicodeComments_someMethodWithAllComments__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __callResultHandle = _someMethodWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    if (_someMethodWithAllCommentssmokeUnicodecommentsSomemethodwithallcommentsStringReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _someMethodWithAllCommentssmokeUnicodecommentsSomemethodwithallcommentsStringReturnGetError(__callResultHandle);
        _someMethodWithAllCommentssmokeUnicodecommentsSomemethodwithallcommentsStringReturnReleaseHandle(__callResultHandle);
        try {
          throw Comments_SomethingWrongException(smokeCommentsSomeenumFromFfi(__errorHandle));
        } finally {
          smokeCommentsSomeenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _someMethodWithAllCommentssmokeUnicodecommentsSomemethodwithallcommentsStringReturnGetResult(__callResultHandle);
    _someMethodWithAllCommentssmokeUnicodecommentsSomemethodwithallcommentsStringReturnReleaseHandle(__callResultHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> smokeUnicodecommentsToFfi(UnicodeComments value) =>
  _smokeUnicodecommentsCopyHandle((value as __lib.NativeBase).handle);

UnicodeComments smokeUnicodecommentsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is UnicodeComments) return instance;

  final _copiedHandle = _smokeUnicodecommentsCopyHandle(handle);
  final result = UnicodeComments$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeUnicodecommentsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeUnicodecommentsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeUnicodecommentsReleaseHandle(handle);

Pointer<Void> smokeUnicodecommentsToFfiNullable(UnicodeComments? value) =>
  value != null ? smokeUnicodecommentsToFfi(value) : Pointer<Void>.fromAddress(0);

UnicodeComments? smokeUnicodecommentsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeUnicodecommentsFromFfi(handle) : null;

void smokeUnicodecommentsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeUnicodecommentsReleaseHandle(handle);

// End of UnicodeComments "private" section.


