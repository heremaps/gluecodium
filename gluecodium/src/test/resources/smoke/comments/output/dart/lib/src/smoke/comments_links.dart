import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/comments.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// The nested types like [CommentsLinks.randomMethod2] don't need full name prefix, but it's
/// possible to references other interfaces like [CommentsInterface] or other members
/// [Comments.someMethodWithAllComments].
///
/// Weblinks are not modified like this [example1], [example2](http://www.example.com/2) or <https://www.example.com/3>.
///
/// [example1]: http://example.com/1
abstract class CommentsLinks {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
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
  /// * top level struct: [TypeCollectionStruct]
  /// * top level struct field: [TypeCollectionStruct.field]
  /// * top level enum: [TypeCollectionEnum]
  /// * top level enum item: [TypeCollectionEnum.item]
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
  randomMethod2(String text, bool flag);
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
Pointer<Void> smoke_CommentsLinks_RandomStruct_toFfi(CommentsLinks_RandomStruct value) {
  final _randomFieldHandle = smoke_Comments_SomeStruct_toFfi(value.randomField);
  final _result = _smokeCommentslinksRandomstructCreateHandle(_randomFieldHandle);
  smoke_Comments_SomeStruct_releaseFfiHandle(_randomFieldHandle);
  return _result;
}
CommentsLinks_RandomStruct smoke_CommentsLinks_RandomStruct_fromFfi(Pointer<Void> handle) {
  final _randomFieldHandle = _smokeCommentslinksRandomstructGetFieldrandomField(handle);
  try {
    return CommentsLinks_RandomStruct(
      smoke_Comments_SomeStruct_fromFfi(_randomFieldHandle)
    );
  } finally {
    smoke_Comments_SomeStruct_releaseFfiHandle(_randomFieldHandle);
  }
}
void smoke_CommentsLinks_RandomStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeCommentslinksRandomstructReleaseHandle(handle);
// Nullable CommentsLinks_RandomStruct
final _smoke_CommentsLinks_RandomStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_create_handle_nullable'));
final _smoke_CommentsLinks_RandomStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_release_handle_nullable'));
final _smoke_CommentsLinks_RandomStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_get_value_nullable'));
Pointer<Void> smoke_CommentsLinks_RandomStruct_toFfi_nullable(CommentsLinks_RandomStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_CommentsLinks_RandomStruct_toFfi(value);
  final result = _smoke_CommentsLinks_RandomStructCreateHandleNullable(_handle);
  smoke_CommentsLinks_RandomStruct_releaseFfiHandle(_handle);
  return result;
}
CommentsLinks_RandomStruct smoke_CommentsLinks_RandomStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_CommentsLinks_RandomStructGetValueNullable(handle);
  final result = smoke_CommentsLinks_RandomStruct_fromFfi(_handle);
  smoke_CommentsLinks_RandomStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_CommentsLinks_RandomStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CommentsLinks_RandomStructReleaseHandleNullable(handle);
// End of CommentsLinks_RandomStruct "private" section.
// CommentsLinks "private" section, not exported.
final _smokeCommentslinksCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_copy_handle'));
final _smokeCommentslinksReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_release_handle'));
final _randomMethodReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_release_handle'));
final _randomMethodReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_get_result'));
final _randomMethodReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_get_error'));
final _randomMethodReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_has_error'));
class CommentsLinks$Impl extends __lib.NativeBase implements CommentsLinks {
  CommentsLinks$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeCommentslinksReleaseHandle(handle);
    handle = null;
  }
  @override
  Comments_SomeEnum randomMethod(Comments_SomeEnum inputParameter) {
    final _randomMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int)>('library_smoke_CommentsLinks_randomMethod__SomeEnum'));
    final _inputParameterHandle = smoke_Comments_SomeEnum_toFfi(inputParameter);
    final _handle = this.handle;
    final __callResultHandle = _randomMethodFfi(_handle, __lib.LibraryContext.isolateId, _inputParameterHandle);
    smoke_Comments_SomeEnum_releaseFfiHandle(_inputParameterHandle);
    if (_randomMethodReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _randomMethodReturnGetError(__callResultHandle);
        _randomMethodReturnReleaseHandle(__callResultHandle);
        try {
          throw Comments_SomethingWrongException(smoke_Comments_SomeEnum_fromFfi(__errorHandle));
        } finally {
          smoke_Comments_SomeEnum_releaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _randomMethodReturnGetResult(__callResultHandle);
    _randomMethodReturnReleaseHandle(__callResultHandle);
    try {
      return smoke_Comments_SomeEnum_fromFfi(__resultHandle);
    } finally {
      smoke_Comments_SomeEnum_releaseFfiHandle(__resultHandle);
    }
  }
  @override
  randomMethod2(String text, bool flag) {
    final _randomMethod2Ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_CommentsLinks_randomMethod__String_Boolean'));
    final _textHandle = String_toFfi(text);
    final _flagHandle = Boolean_toFfi(flag);
    final _handle = this.handle;
    final __resultHandle = _randomMethod2Ffi(_handle, __lib.LibraryContext.isolateId, _textHandle, _flagHandle);
    String_releaseFfiHandle(_textHandle);
    Boolean_releaseFfiHandle(_flagHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_CommentsLinks_toFfi(CommentsLinks value) =>
  _smokeCommentslinksCopyHandle((value as __lib.NativeBase).handle);
CommentsLinks smoke_CommentsLinks_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as CommentsLinks;
  if (instance != null) return instance;
  final _copiedHandle = _smokeCommentslinksCopyHandle(handle);
  final result = CommentsLinks$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_CommentsLinks_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeCommentslinksReleaseHandle(handle);
Pointer<Void> smoke_CommentsLinks_toFfi_nullable(CommentsLinks value) =>
  value != null ? smoke_CommentsLinks_toFfi(value) : Pointer<Void>.fromAddress(0);
CommentsLinks smoke_CommentsLinks_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_CommentsLinks_fromFfi(handle) : null;
void smoke_CommentsLinks_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeCommentslinksReleaseHandle(handle);
// End of CommentsLinks "private" section.
