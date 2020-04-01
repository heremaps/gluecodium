import 'package:library/src/smoke/Comments.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_library_init.dart' as __lib;
/// The nested types like [random_method] don't need full name prefix, but it's
/// possible to references other interfaces like [CommentsInterface] or other members
/// [comments.someMethodWithAllComments].
///
/// Weblinks are not modified like this [example] or [www.example.com].
///
/// [example]: http://example.com
abstract class CommentsLinks {
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
  /// * method: [comments.someMethodWithAllComments]
  /// * parameter: [inputParameter]
  /// * top level constant: [CommentsTypeCollection.typeCollectionConstant]
  /// * top level struct: [TypeCollectionStruct]
  /// * top level struct field: [TypeCollectionStruct.field]
  /// * top level enum: [TypeCollectionEnum]
  /// * top level enum item: [TypeCollectionEnum.item]
  /// * error: [Comments_SomethingWrongException]
  /// * type from aux sources, same package: [AuxClass]
  /// * type from aux sources, different package: [AuxStruct]
  ///
  /// Not working for Java:
  /// * typedef: [bool]
  /// * top level typedef: [bool]
  ///
  /// Not working for Swift:
  /// * named comment: [][Comments.veryUseful]
  /// @param[inputParameter] Sometimes takes [Comments_SomeEnum.useful]
  /// @return Sometimes returns [Comments_SomeEnum.useful]
  /// @throws May or may not throw [Comments_SomethingWrongException]
  Comments_SomeEnum randomMethod(Comments_SomeEnum inputParameter);
}
/// Links also work in:
class CommentsLinks_RandomStruct {
  /// Some random field [Comments_SomeStruct]
  Comments_SomeStruct randomField;
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
  final _result = CommentsLinks_RandomStruct(
    smoke_Comments_SomeStruct_fromFfi(_randomField_handle)
  );
  smoke_Comments_SomeStruct_releaseFfiHandle(_randomField_handle);
  return _result;
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
  final Pointer<Void> handle;
  CommentsLinks$Impl(this.handle);
  @override
  void release() => _smoke_CommentsLinks_release_handle(handle);
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
        final _error_value = smoke_Comments_SomeEnum_fromFfi(__error_handle);
        smoke_Comments_SomeEnum_releaseFfiHandle(__error_handle);
        throw Comments_SomethingWrongException(_error_value);
    }
    final __result_handle = _randomMethod_return_get_result(__call_result_handle);
    _randomMethod_return_release_handle(__call_result_handle);
    final _result = smoke_Comments_SomeEnum_fromFfi(__result_handle);
    smoke_Comments_SomeEnum_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_CommentsLinks_toFfi(CommentsLinks value) =>
  _smoke_CommentsLinks_copy_handle((value as CommentsLinks$Impl).handle);
CommentsLinks smoke_CommentsLinks_fromFfi(Pointer<Void> handle) =>
  CommentsLinks$Impl(_smoke_CommentsLinks_copy_handle(handle));
void smoke_CommentsLinks_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_CommentsLinks_release_handle(handle);
Pointer<Void> smoke_CommentsLinks_toFfi_nullable(CommentsLinks value) =>
  value != null ? smoke_CommentsLinks_toFfi(value) : Pointer<Void>.fromAddress(0);
CommentsLinks smoke_CommentsLinks_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_CommentsLinks_fromFfi(handle) : null;
void smoke_CommentsLinks_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CommentsLinks_release_handle(handle);
// End of CommentsLinks "private" section.
