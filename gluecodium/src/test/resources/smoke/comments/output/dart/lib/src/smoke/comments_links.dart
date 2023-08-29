import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/comments.dart';
/// The nested types like [CommentsLinks.randomMethod2] don't need full name prefix, but it's
/// possible to references other interfaces like [CommentsInterface] or other members
/// [Comments.someMethodWithAllComments].
///
/// Weblinks are not modified like this [example1], [example2](http://www.example.com/2) or <https://www.example.com/3>.
///
/// [example1]: http://example.com/1
abstract class CommentsLinks {
  /// Link types:
  /// * constant: [Comments.veryUseful]
  /// * struct: [Comments_SomeStruct]
  /// * struct field: [Comments_SomeStruct.someField]
  /// * enum: [Comments_SomeEnum]
  /// * enum item: [Comments_SomeEnum.useful]
  /// * property: [Comments.isSomeProperty]
  /// * property setter: [Comments.isSomeProperty]
  /// * property getter: [Comments.isSomeProperty]
  /// * method: [Comments.someMethodWithAllComments]
  /// * method with signature: [Comments.oneParameterCommentOnly]
  /// * method with signature with no spaces: [Comments.oneParameterCommentOnly]
  /// * parameter: [CommentsLinks.randomMethod.inputParameter]
  /// * top level constant: [CommentsTypeCollection.typeCollectionConstant]
  /// * top level struct: [CommentsTypeCollection_TypeCollectionStruct]
  /// * top level struct field: [CommentsTypeCollection_TypeCollectionStruct.field]
  /// * top level enum: [CommentsTypeCollection_TypeCollectionEnum]
  /// * top level enum item: [CommentsTypeCollection_TypeCollectionEnum.item]
  /// * error: [Comments_SomethingWrongException]
  /// * lambda: [Comments_SomeLambda]
  /// * type from aux sources, same package: [AuxClass]
  /// * type from aux sources, different package: [AuxStruct]
  ///   * we can also have
  ///   * nested lists
  ///
  /// Not working for Java:
  /// * typedef: [bool]
  /// * top level typedef: [bool]
  ///
  /// Not working for Swift:
  /// * named comment: [][Comments.veryUseful]
  ///
  /// [inputParameter] Sometimes takes [Comments_SomeEnum.useful]
  ///
  /// Returns [Comments_SomeEnum]. Sometimes returns [Comments_SomeEnum.useful]
  ///
  /// Throws [Comments_SomethingWrongException]. May or may not throw [Comments_SomethingWrongException]
  ///
  Comments_SomeEnum randomMethod(Comments_SomeEnum inputParameter);
  /// Links to method overloads:
  /// * other one: [CommentsLinks.randomMethod]
  /// * this one: [CommentsLinks.randomMethod2]
  /// * ambiguous one: [CommentsLinks.randomMethod2]
  ///
  void randomMethod2(String text, bool flag);
}
/// Links also work in:
class CommentsLinks_RandomStruct {
  /// Some random field [Comments_SomeStruct]
  Comments_SomeStruct randomField;
  /// constructor comments [Comments_SomeStruct]
  /// [randomField] Some random field [Comments_SomeStruct]
  CommentsLinks_RandomStruct(this.randomField);
}
// CommentsLinks_RandomStruct "private" section, not exported.
final _smokeCommentslinksRandomstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_create_handle'));
final _smokeCommentslinksRandomstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_release_handle'));
final _smokeCommentslinksRandomstructGetFieldrandomField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_get_field_randomField'));
Pointer<Void> smokeCommentslinksRandomstructToFfi(CommentsLinks_RandomStruct value) {
  final _randomFieldHandle = smokeCommentsSomestructToFfi(value.randomField);
  final _result = _smokeCommentslinksRandomstructCreateHandle(_randomFieldHandle);
  smokeCommentsSomestructReleaseFfiHandle(_randomFieldHandle);
  return _result;
}
CommentsLinks_RandomStruct smokeCommentslinksRandomstructFromFfi(Pointer<Void> handle) {
  final _randomFieldHandle = _smokeCommentslinksRandomstructGetFieldrandomField(handle);
  try {
    return CommentsLinks_RandomStruct(
      smokeCommentsSomestructFromFfi(_randomFieldHandle)
    );
  } finally {
    smokeCommentsSomestructReleaseFfiHandle(_randomFieldHandle);
  }
}
void smokeCommentslinksRandomstructReleaseFfiHandle(Pointer<Void> handle) => _smokeCommentslinksRandomstructReleaseHandle(handle);
// Nullable CommentsLinks_RandomStruct
final _smokeCommentslinksRandomstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_create_handle_nullable'));
final _smokeCommentslinksRandomstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_release_handle_nullable'));
final _smokeCommentslinksRandomstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_get_value_nullable'));
Pointer<Void> smokeCommentslinksRandomstructToFfiNullable(CommentsLinks_RandomStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeCommentslinksRandomstructToFfi(value);
  final result = _smokeCommentslinksRandomstructCreateHandleNullable(_handle);
  smokeCommentslinksRandomstructReleaseFfiHandle(_handle);
  return result;
}
CommentsLinks_RandomStruct? smokeCommentslinksRandomstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeCommentslinksRandomstructGetValueNullable(handle);
  final result = smokeCommentslinksRandomstructFromFfi(_handle);
  smokeCommentslinksRandomstructReleaseFfiHandle(_handle);
  return result;
}
void smokeCommentslinksRandomstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCommentslinksRandomstructReleaseHandleNullable(handle);
// End of CommentsLinks_RandomStruct "private" section.
// CommentsLinks "private" section, not exported.
final _smokeCommentslinksRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_CommentsLinks_register_finalizer'));
final _smokeCommentslinksCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_copy_handle'));
final _smokeCommentslinksReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_release_handle'));
final _randomMethodsmokeCommentslinksRandommethodSomeenumReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_release_handle'));
final _randomMethodsmokeCommentslinksRandommethodSomeenumReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_get_result'));
final _randomMethodsmokeCommentslinksRandommethodSomeenumReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_get_error'));
final _randomMethodsmokeCommentslinksRandommethodSomeenumReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_has_error'));
class CommentsLinks$Impl extends __lib.NativeBase implements CommentsLinks {
  CommentsLinks$Impl(Pointer<Void> handle) : super(handle);
  @override
  Comments_SomeEnum randomMethod(Comments_SomeEnum inputParameter) {
    final _randomMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int)>('library_smoke_CommentsLinks_randomMethod__SomeEnum'));
    final _inputParameterHandle = smokeCommentsSomeenumToFfi(inputParameter);
    final _handle = this.handle;
    final __callResultHandle = _randomMethodFfi(_handle, __lib.LibraryContext.isolateId, _inputParameterHandle);
    smokeCommentsSomeenumReleaseFfiHandle(_inputParameterHandle);
    if (_randomMethodsmokeCommentslinksRandommethodSomeenumReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _randomMethodsmokeCommentslinksRandommethodSomeenumReturnGetError(__callResultHandle);
        _randomMethodsmokeCommentslinksRandommethodSomeenumReturnReleaseHandle(__callResultHandle);
        try {
          throw Comments_SomethingWrongException(smokeCommentsSomeenumFromFfi(__errorHandle));
        } finally {
          smokeCommentsSomeenumReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _randomMethodsmokeCommentslinksRandommethodSomeenumReturnGetResult(__callResultHandle);
    _randomMethodsmokeCommentslinksRandommethodSomeenumReturnReleaseHandle(__callResultHandle);
    try {
      return smokeCommentsSomeenumFromFfi(__resultHandle);
    } finally {
      smokeCommentsSomeenumReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  void randomMethod2(String text, bool flag) {
    final _randomMethod2Ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_CommentsLinks_randomMethod__String_Boolean'));
    final _textHandle = stringToFfi(text);
    final _flagHandle = booleanToFfi(flag);
    final _handle = this.handle;
    _randomMethod2Ffi(_handle, __lib.LibraryContext.isolateId, _textHandle, _flagHandle);
    stringReleaseFfiHandle(_textHandle);
    booleanReleaseFfiHandle(_flagHandle);
  }
}
Pointer<Void> smokeCommentslinksToFfi(CommentsLinks value) =>
  _smokeCommentslinksCopyHandle((value as __lib.NativeBase).handle);
CommentsLinks smokeCommentslinksFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CommentsLinks) return instance;
  final _copiedHandle = _smokeCommentslinksCopyHandle(handle);
  final result = CommentsLinks$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeCommentslinksRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeCommentslinksReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeCommentslinksReleaseHandle(handle);
Pointer<Void> smokeCommentslinksToFfiNullable(CommentsLinks? value) =>
  value != null ? smokeCommentslinksToFfi(value) : Pointer<Void>.fromAddress(0);
CommentsLinks? smokeCommentslinksFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeCommentslinksFromFfi(handle) : null;
void smokeCommentslinksReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeCommentslinksReleaseHandle(handle);
// End of CommentsLinks "private" section.