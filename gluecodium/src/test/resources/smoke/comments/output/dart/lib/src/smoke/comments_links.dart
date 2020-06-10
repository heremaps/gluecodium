import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/comments.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// The nested types like [randomMethod2] don't need full name prefix, but it's
/// possible to references other interfaces like [CommentsInterface] or other members
/// [someMethodWithAllComments].
///
/// Weblinks are not modified like this [example] or [www.example.com].
///
/// [example]: http://example.com
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
  /// * property setter: [isSomeProperty]
  /// * property getter: [isSomeProperty]
  /// * method: [someMethodWithAllComments]
  /// * method with signature: [oneParameterCommentOnly]
  /// * method with signature with no spaces: [oneParameterCommentOnly]
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
  /// [inputParameter] Sometimes takes [Comments_SomeEnum.useful]
  /// Returns [Comments_SomeEnum]. Sometimes returns [Comments_SomeEnum.useful]
  /// Throws [Comments_SomethingWrongException]. May or may not throw [Comments_SomethingWrongException]
  Comments_SomeEnum randomMethod(Comments_SomeEnum inputParameter);
  /// Links to method overloads:
  /// * other one: [randomMethod]
  /// * this one: [randomMethod2]
  /// * ambiguous one: [randomMethod2]
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
final _smoke_CommentsLinks_RandomStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_create_handle');
final _smoke_CommentsLinks_RandomStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_release_handle');
final _smoke_CommentsLinks_RandomStruct_get_field_randomField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_get_field_randomField');
Pointer<Void> smoke_CommentsLinks_RandomStruct_toFfi(CommentsLinks_RandomStruct value) {
  final _randomField_handle = smoke_Comments_SomeStruct_toFfi(value.randomField);
  final _result = _smoke_CommentsLinks_RandomStruct_create_handle(_randomField_handle);
  smoke_Comments_SomeStruct_releaseFfiHandle(_randomField_handle);
  return _result;
}
CommentsLinks_RandomStruct smoke_CommentsLinks_RandomStruct_fromFfi(Pointer<Void> handle) {
  final _randomField_handle = _smoke_CommentsLinks_RandomStruct_get_field_randomField(handle);
  try {
    return CommentsLinks_RandomStruct(
      smoke_Comments_SomeStruct_fromFfi(_randomField_handle)
    );
  } finally {
    smoke_Comments_SomeStruct_releaseFfiHandle(_randomField_handle);
  }
}
void smoke_CommentsLinks_RandomStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_CommentsLinks_RandomStruct_release_handle(handle);
// Nullable CommentsLinks_RandomStruct
final _smoke_CommentsLinks_RandomStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_create_handle_nullable');
final _smoke_CommentsLinks_RandomStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_release_handle_nullable');
final _smoke_CommentsLinks_RandomStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_RandomStruct_get_value_nullable');
Pointer<Void> smoke_CommentsLinks_RandomStruct_toFfi_nullable(CommentsLinks_RandomStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_CommentsLinks_RandomStruct_toFfi(value);
  final result = _smoke_CommentsLinks_RandomStruct_create_handle_nullable(_handle);
  smoke_CommentsLinks_RandomStruct_releaseFfiHandle(_handle);
  return result;
}
CommentsLinks_RandomStruct smoke_CommentsLinks_RandomStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_CommentsLinks_RandomStruct_get_value_nullable(handle);
  final result = smoke_CommentsLinks_RandomStruct_fromFfi(_handle);
  smoke_CommentsLinks_RandomStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_CommentsLinks_RandomStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CommentsLinks_RandomStruct_release_handle_nullable(handle);
// End of CommentsLinks_RandomStruct "private" section.
// CommentsLinks "private" section, not exported.
final _smoke_CommentsLinks_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_copy_handle');
final _smoke_CommentsLinks_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_release_handle');
final _smoke_CommentsLinks_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_CommentsLinks_get_raw_pointer');
final _randomMethod_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_release_handle');
final _randomMethod_return_get_result = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_get_result');
final _randomMethod_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_get_error');
final _randomMethod_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsLinks_randomMethod__SomeEnum_return_has_error');
class CommentsLinks$Impl implements CommentsLinks {
  @protected
  Pointer<Void> handle;
  CommentsLinks$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_CommentsLinks_get_raw_pointer(handle));
    _smoke_CommentsLinks_release_handle(handle);
    handle = null;
  }
  @override
  Comments_SomeEnum randomMethod(Comments_SomeEnum inputParameter) {
    final _randomMethod_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int)>('library_smoke_CommentsLinks_randomMethod__SomeEnum');
    final _inputParameter_handle = smoke_Comments_SomeEnum_toFfi(inputParameter);
    final _handle = this.handle;
    final __call_result_handle = _randomMethod_ffi(_handle, __lib.LibraryContext.isolateId, _inputParameter_handle);
    smoke_Comments_SomeEnum_releaseFfiHandle(_inputParameter_handle);
    if (_randomMethod_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _randomMethod_return_get_error(__call_result_handle);
        _randomMethod_return_release_handle(__call_result_handle);
        try {
          throw Comments_SomethingWrongException(smoke_Comments_SomeEnum_fromFfi(__error_handle));
        } finally {
          smoke_Comments_SomeEnum_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _randomMethod_return_get_result(__call_result_handle);
    _randomMethod_return_release_handle(__call_result_handle);
    try {
      return smoke_Comments_SomeEnum_fromFfi(__result_handle);
    } finally {
      smoke_Comments_SomeEnum_releaseFfiHandle(__result_handle);
    }
  }
  @override
  randomMethod2(String text, bool flag) {
    final _randomMethod2_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint8), void Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_CommentsLinks_randomMethod__String_Boolean');
    final _text_handle = String_toFfi(text);
    final _flag_handle = Boolean_toFfi(flag);
    final _handle = this.handle;
    final __result_handle = _randomMethod2_ffi(_handle, __lib.LibraryContext.isolateId, _text_handle, _flag_handle);
    String_releaseFfiHandle(_text_handle);
    Boolean_releaseFfiHandle(_flag_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_CommentsLinks_toFfi(CommentsLinks value) =>
  _smoke_CommentsLinks_copy_handle((value as CommentsLinks$Impl).handle);
CommentsLinks smoke_CommentsLinks_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_CommentsLinks_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as CommentsLinks;
  if (instance != null) return instance;
  final _copied_handle = _smoke_CommentsLinks_copy_handle(handle);
  final result = CommentsLinks$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_CommentsLinks_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_CommentsLinks_release_handle(handle);
Pointer<Void> smoke_CommentsLinks_toFfi_nullable(CommentsLinks value) =>
  value != null ? smoke_CommentsLinks_toFfi(value) : Pointer<Void>.fromAddress(0);
CommentsLinks smoke_CommentsLinks_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_CommentsLinks_fromFfi(handle) : null;
void smoke_CommentsLinks_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CommentsLinks_release_handle(handle);
// End of CommentsLinks "private" section.
