import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class PlatformComments {

  /// This is some very useless method that cannot have overloads.
  ///
  void doNothing();
  /// Colors everything in fuchsia.
  ///
  void doMagic();
  /// This is some very useful method that measures the usefulness of its input or \esc@pe{s}.
  ///
  /// [input] Very useful parameter that \[\esc@pe{s}\]
  ///
  /// Returns [bool]. Uselessness [PlatformComments_SomeEnum] of the input
  ///
  /// Throws [PlatformComments_SomethingWrongException]. Sometimes it happens.
  ///
  bool someMethodWithAllComments(String input);
  @Deprecated("A very useless method that is deprecated.")
  void someDeprecatedMethod();
}
enum PlatformComments_SomeEnum {
    useless,
    useful
}
// PlatformComments_SomeEnum "private" section, not exported.
int smokePlatformcommentsSomeenumToFfi(PlatformComments_SomeEnum value) {
  switch (value) {
  case PlatformComments_SomeEnum.useless:
    return 0;
  case PlatformComments_SomeEnum.useful:
    return 1;
  default:
    throw StateError("Invalid enum value $value for PlatformComments_SomeEnum enum.");
  }
}
PlatformComments_SomeEnum smokePlatformcommentsSomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return PlatformComments_SomeEnum.useless;
  case 1:
    return PlatformComments_SomeEnum.useful;
  default:
    throw StateError("Invalid numeric value $handle for PlatformComments_SomeEnum enum.");
  }
}
void smokePlatformcommentsSomeenumReleaseFfiHandle(int handle) {}
final _smokePlatformcommentsSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_PlatformComments_SomeEnum_create_handle_nullable'));
final _smokePlatformcommentsSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformComments_SomeEnum_release_handle_nullable'));
final _smokePlatformcommentsSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PlatformComments_SomeEnum_get_value_nullable'));
Pointer<Void> smokePlatformcommentsSomeenumToFfiNullable(PlatformComments_SomeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePlatformcommentsSomeenumToFfi(value);
  final result = _smokePlatformcommentsSomeenumCreateHandleNullable(_handle);
  smokePlatformcommentsSomeenumReleaseFfiHandle(_handle);
  return result;
}
PlatformComments_SomeEnum? smokePlatformcommentsSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePlatformcommentsSomeenumGetValueNullable(handle);
  final result = smokePlatformcommentsSomeenumFromFfi(_handle);
  smokePlatformcommentsSomeenumReleaseFfiHandle(_handle);
  return result;
}
void smokePlatformcommentsSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePlatformcommentsSomeenumReleaseHandleNullable(handle);
// End of PlatformComments_SomeEnum "private" section.
/// An exception when something goes wrong.
class PlatformComments_SomethingWrongException implements Exception {
  final PlatformComments_SomeEnum error;
  PlatformComments_SomethingWrongException(this.error);
}
/// This is a.
class PlatformComments_Something {
  String nothing;
  PlatformComments_Something(this.nothing);
}
// PlatformComments_Something "private" section, not exported.
final _smokePlatformcommentsSomethingCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformComments_Something_create_handle'));
final _smokePlatformcommentsSomethingReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformComments_Something_release_handle'));
final _smokePlatformcommentsSomethingGetFieldnothing = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformComments_Something_get_field_nothing'));
Pointer<Void> smokePlatformcommentsSomethingToFfi(PlatformComments_Something value) {
  final _nothingHandle = stringToFfi(value.nothing);
  final _result = _smokePlatformcommentsSomethingCreateHandle(_nothingHandle);
  stringReleaseFfiHandle(_nothingHandle);
  return _result;
}
PlatformComments_Something smokePlatformcommentsSomethingFromFfi(Pointer<Void> handle) {
  final _nothingHandle = _smokePlatformcommentsSomethingGetFieldnothing(handle);
  try {
    return PlatformComments_Something(
      stringFromFfi(_nothingHandle)
    );
  } finally {
    stringReleaseFfiHandle(_nothingHandle);
  }
}
void smokePlatformcommentsSomethingReleaseFfiHandle(Pointer<Void> handle) => _smokePlatformcommentsSomethingReleaseHandle(handle);
// Nullable PlatformComments_Something
final _smokePlatformcommentsSomethingCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformComments_Something_create_handle_nullable'));
final _smokePlatformcommentsSomethingReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformComments_Something_release_handle_nullable'));
final _smokePlatformcommentsSomethingGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformComments_Something_get_value_nullable'));
Pointer<Void> smokePlatformcommentsSomethingToFfiNullable(PlatformComments_Something? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePlatformcommentsSomethingToFfi(value);
  final result = _smokePlatformcommentsSomethingCreateHandleNullable(_handle);
  smokePlatformcommentsSomethingReleaseFfiHandle(_handle);
  return result;
}
PlatformComments_Something? smokePlatformcommentsSomethingFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePlatformcommentsSomethingGetValueNullable(handle);
  final result = smokePlatformcommentsSomethingFromFfi(_handle);
  smokePlatformcommentsSomethingReleaseFfiHandle(_handle);
  return result;
}
void smokePlatformcommentsSomethingReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePlatformcommentsSomethingReleaseHandleNullable(handle);
// End of PlatformComments_Something "private" section.
// PlatformComments "private" section, not exported.
final _smokePlatformcommentsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_PlatformComments_register_finalizer'));
final _smokePlatformcommentsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformComments_copy_handle'));
final _smokePlatformcommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformComments_release_handle'));
final _someMethodWithAllCommentsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformComments_someMethodWithAllComments__String_return_release_handle'));
final _someMethodWithAllCommentsReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PlatformComments_someMethodWithAllComments__String_return_get_result'));
final _someMethodWithAllCommentsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PlatformComments_someMethodWithAllComments__String_return_get_error'));
final _someMethodWithAllCommentsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PlatformComments_someMethodWithAllComments__String_return_has_error'));
class PlatformComments$Impl extends __lib.NativeBase implements PlatformComments {
  PlatformComments$Impl(Pointer<Void> handle) : super(handle);

  @override
  void doNothing() {
    final _doNothingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_PlatformComments_doNothing'));
    final _handle = this.handle;
    _doNothingFfi(_handle, __lib.LibraryContext.isolateId);
  }
  @override
  void doMagic() {
    final _doMagicFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_PlatformComments_doMagic'));
    final _handle = this.handle;
    _doMagicFfi(_handle, __lib.LibraryContext.isolateId);
  }
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllCommentsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PlatformComments_someMethodWithAllComments__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __callResultHandle = _someMethodWithAllCommentsFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    if (_someMethodWithAllCommentsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _someMethodWithAllCommentsReturnGetError(__callResultHandle);
        _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
        try {
          throw PlatformComments_SomethingWrongException(smokePlatformcommentsSomeenumFromFfi(__errorHandle));
        } finally {
          smokePlatformcommentsSomeenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _someMethodWithAllCommentsReturnGetResult(__callResultHandle);
    _someMethodWithAllCommentsReturnReleaseHandle(__callResultHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  void someDeprecatedMethod() {
    final _someDeprecatedMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_PlatformComments_someDeprecatedMethod'));
    final _handle = this.handle;
    _someDeprecatedMethodFfi(_handle, __lib.LibraryContext.isolateId);
  }
}
Pointer<Void> smokePlatformcommentsToFfi(PlatformComments value) =>
  _smokePlatformcommentsCopyHandle((value as __lib.NativeBase).handle);
PlatformComments smokePlatformcommentsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PlatformComments) return instance;
  final _copiedHandle = _smokePlatformcommentsCopyHandle(handle);
  final result = PlatformComments$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokePlatformcommentsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokePlatformcommentsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokePlatformcommentsReleaseHandle(handle);
Pointer<Void> smokePlatformcommentsToFfiNullable(PlatformComments? value) =>
  value != null ? smokePlatformcommentsToFfi(value) : Pointer<Void>.fromAddress(0);
PlatformComments? smokePlatformcommentsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokePlatformcommentsFromFfi(handle) : null;
void smokePlatformcommentsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePlatformcommentsReleaseHandle(handle);
// End of PlatformComments "private" section.
