import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// This is some very useful interface.
abstract class Comments {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// This is some very useful constant.
  static final bool veryUseful = true;
  /// This is some very useful method that measures the usefulness of its input.
  /// [inputParameter] Very useful input parameter
  /// Returns [bool]. Usefulness of the input
  /// Throws [Comments_SomethingWrongException]. Sometimes it happens.
  bool someMethodWithAllComments(String inputParameter);
  /// This is some very useful method that measures the usefulness of its input.
  /// [input] Very useful input parameter
  bool someMethodWithInputComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  /// Returns [bool]. Usefulness of the input
  bool someMethodWithOutputComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  bool someMethodWithNoComments(String input);
  /// This is some very useful method that does not measure the usefulness of its input.
  /// [input] Very useful input parameter
  someMethodWithoutReturnTypeWithAllComments(String input);
  /// This is some very useful method that does not measure the usefulness of its input.
  someMethodWithoutReturnTypeWithNoComments(String input);
  /// This is some very useful method that measures the usefulness of something.
  /// Returns [bool]. Usefulness of the input
  bool someMethodWithoutInputParametersWithAllComments();
  /// This is some very useful method that measures the usefulness of something.
  bool someMethodWithoutInputParametersWithNoComments();
  someMethodWithNothing();
  /// This is some very useful method that does nothing.
  someMethodWithoutReturnTypeOrInputParameters();
  /// [documented] nicely documented
  String oneParameterCommentOnly(String undocumented, String documented);
  /// Returns [String]. nicely documented
  String returnCommentOnly(String undocumented);
  /// Gets some very useful property.
  bool get isSomeProperty;
  /// Sets some very useful property.
  set isSomeProperty(bool value);
}
/// This is some very useful enum.
enum Comments_SomeEnum {
    /// Not quite useful
    useless,
    /// Somewhat useful
    useful
}
// Comments_SomeEnum "private" section, not exported.
int smoke_Comments_SomeEnum_toFfi(Comments_SomeEnum value) {
  switch (value) {
  case Comments_SomeEnum.useless:
    return 0;
  break;
  case Comments_SomeEnum.useful:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Comments_SomeEnum enum.");
  }
}
Comments_SomeEnum smoke_Comments_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Comments_SomeEnum.useless;
  break;
  case 1:
    return Comments_SomeEnum.useful;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Comments_SomeEnum enum.");
  }
}
void smoke_Comments_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_Comments_SomeEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Comments_SomeEnum_create_handle_nullable');
final _smoke_Comments_SomeEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_SomeEnum_release_handle_nullable');
final _smoke_Comments_SomeEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Comments_SomeEnum_get_value_nullable');
Pointer<Void> smoke_Comments_SomeEnum_toFfi_nullable(Comments_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Comments_SomeEnum_toFfi(value);
  final result = _smoke_Comments_SomeEnum_create_handle_nullable(_handle);
  smoke_Comments_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
Comments_SomeEnum smoke_Comments_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Comments_SomeEnum_get_value_nullable(handle);
  final result = smoke_Comments_SomeEnum_fromFfi(_handle);
  smoke_Comments_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Comments_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Comments_SomeEnum_release_handle_nullable(handle);
// End of Comments_SomeEnum "private" section.
/// This is some very useful exception.
class Comments_SomethingWrongException implements Exception {
  final Comments_SomeEnum error;
  Comments_SomethingWrongException(this.error);
}
/// This is some very useful struct.
class Comments_SomeStruct {
  /// How useful this struct is
  /// remains to be seen
  bool someField;
  /// Can be `null`
  String nullableField;
  /// This is how easy it is to construct.
  /// [someField] How useful this struct is
  /// remains to be seen
  /// [nullableField] Can be `null`
  Comments_SomeStruct(this.someField, this.nullableField);
}
// Comments_SomeStruct "private" section, not exported.
final _smoke_Comments_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_create_handle');
final _smoke_Comments_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_release_handle');
final _smoke_Comments_SomeStruct_get_field_someField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_get_field_someField');
final _smoke_Comments_SomeStruct_get_field_nullableField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_get_field_nullableField');
Pointer<Void> smoke_Comments_SomeStruct_toFfi(Comments_SomeStruct value) {
  final _someField_handle = Boolean_toFfi(value.someField);
  final _nullableField_handle = String_toFfi_nullable(value.nullableField);
  final _result = _smoke_Comments_SomeStruct_create_handle(_someField_handle, _nullableField_handle);
  Boolean_releaseFfiHandle(_someField_handle);
  String_releaseFfiHandle_nullable(_nullableField_handle);
  return _result;
}
Comments_SomeStruct smoke_Comments_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_Comments_SomeStruct_get_field_someField(handle);
  final _nullableField_handle = _smoke_Comments_SomeStruct_get_field_nullableField(handle);
  final _result = Comments_SomeStruct(
    Boolean_fromFfi(_someField_handle),
    String_fromFfi_nullable(_nullableField_handle)
  );
  Boolean_releaseFfiHandle(_someField_handle);
  String_releaseFfiHandle_nullable(_nullableField_handle);
  return _result;
}
void smoke_Comments_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Comments_SomeStruct_release_handle(handle);
// Nullable Comments_SomeStruct
final _smoke_Comments_SomeStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_create_handle_nullable');
final _smoke_Comments_SomeStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_release_handle_nullable');
final _smoke_Comments_SomeStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeStruct_get_value_nullable');
Pointer<Void> smoke_Comments_SomeStruct_toFfi_nullable(Comments_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Comments_SomeStruct_toFfi(value);
  final result = _smoke_Comments_SomeStruct_create_handle_nullable(_handle);
  smoke_Comments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
Comments_SomeStruct smoke_Comments_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Comments_SomeStruct_get_value_nullable(handle);
  final result = smoke_Comments_SomeStruct_fromFfi(_handle);
  smoke_Comments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Comments_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Comments_SomeStruct_release_handle_nullable(handle);
// End of Comments_SomeStruct "private" section.
/// This is some very useful lambda that does it.
typedef Comments_SomeLambda = double Function(String, int);
// Comments_SomeLambda "private" section, not exported.
final _smoke_Comments_SomeLambda_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeLambda_copy_handle');
final _smoke_Comments_SomeLambda_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_SomeLambda_release_handle');
final _smoke_Comments_SomeLambda_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_Comments_SomeLambda_create_proxy');
final _smoke_Comments_SomeLambda_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_Comments_SomeLambda_get_raw_pointer');
class Comments_SomeLambda$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Comments_SomeLambda$Impl(this.handle);
  void release() => _smoke_Comments_SomeLambda_release_handle(handle);
  double call(String p0, int p1) {
    final _call_ffi = __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>, Int32), double Function(Pointer<Void>, int, Pointer<Void>, int)>('library_smoke_Comments_SomeLambda_call__String_Int');
    final _p0_handle = String_toFfi(p0);
    final _p1_handle = (p1);
    final _handle = this.handle;
    final __result_handle = _call_ffi(_handle, __lib.LibraryContext.isolateId, _p0_handle, _p1_handle);
    String_releaseFfiHandle(_p0_handle);
    (_p1_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _Comments_SomeLambda_call_static(int _token, Pointer<Void> p0, int p1, Pointer<Double> _result) {
  final _result_object = (__lib.instanceCache[_token] as Comments_SomeLambda)(String_fromFfi(p0), (p1));
  _result.value = (_result_object);
  String_releaseFfiHandle(p0);
  (p1);
  return 0;
}
Pointer<Void> smoke_Comments_SomeLambda_toFfi(Comments_SomeLambda value) {
  final result = _smoke_Comments_SomeLambda_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Int32, Pointer<Double>)>(_Comments_SomeLambda_call_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_Comments_SomeLambda_get_raw_pointer(result)] = value;
  return result;
}
Comments_SomeLambda smoke_Comments_SomeLambda_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_Comments_SomeLambda_get_raw_pointer(handle)] as Comments_SomeLambda;
  if (instance != null) return instance;
  final _impl = Comments_SomeLambda$Impl(_smoke_Comments_SomeLambda_copy_handle(handle));
  return (String p0, int p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}
void smoke_Comments_SomeLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Comments_SomeLambda_release_handle(handle);
// Nullable Comments_SomeLambda
final _smoke_Comments_SomeLambda_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeLambda_create_handle_nullable');
final _smoke_Comments_SomeLambda_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_SomeLambda_release_handle_nullable');
final _smoke_Comments_SomeLambda_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_SomeLambda_get_value_nullable');
Pointer<Void> smoke_Comments_SomeLambda_toFfi_nullable(Comments_SomeLambda value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Comments_SomeLambda_toFfi(value);
  final result = _smoke_Comments_SomeLambda_create_handle_nullable(_handle);
  smoke_Comments_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
Comments_SomeLambda smoke_Comments_SomeLambda_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Comments_SomeLambda_get_value_nullable(handle);
  final result = smoke_Comments_SomeLambda_fromFfi(_handle);
  smoke_Comments_SomeLambda_releaseFfiHandle(_handle);
  return result;
}
void smoke_Comments_SomeLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Comments_SomeLambda_release_handle_nullable(handle);
// End of Comments_SomeLambda "private" section.
// Comments "private" section, not exported.
final _smoke_Comments_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Comments_copy_handle');
final _smoke_Comments_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_release_handle');
final _smoke_Comments_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_Comments_get_raw_pointer');
final _someMethodWithAllComments_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Comments_someMethodWithAllComments__String_return_release_handle');
final _someMethodWithAllComments_return_get_result = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Comments_someMethodWithAllComments__String_return_get_result');
final _someMethodWithAllComments_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Comments_someMethodWithAllComments__String_return_get_error');
final _someMethodWithAllComments_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Comments_someMethodWithAllComments__String_return_has_error');
class Comments$Impl implements Comments {
  @protected
  Pointer<Void> handle;
  Comments$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_Comments_get_raw_pointer(handle));
    _smoke_Comments_release_handle(handle);
    handle = null;
  }
  @override
  bool someMethodWithAllComments(String inputParameter) {
    final _someMethodWithAllComments_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithAllComments__String');
    final _inputParameter_handle = String_toFfi(inputParameter);
    final _handle = this.handle;
    final __call_result_handle = _someMethodWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId, _inputParameter_handle);
    String_releaseFfiHandle(_inputParameter_handle);
    if (_someMethodWithAllComments_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _someMethodWithAllComments_return_get_error(__call_result_handle);
        _someMethodWithAllComments_return_release_handle(__call_result_handle);
        final _error_value = smoke_Comments_SomeEnum_fromFfi(__error_handle);
        smoke_Comments_SomeEnum_releaseFfiHandle(__error_handle);
        throw Comments_SomethingWrongException(_error_value);
    }
    final __result_handle = _someMethodWithAllComments_return_get_result(__call_result_handle);
    _someMethodWithAllComments_return_release_handle(__call_result_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool someMethodWithInputComments(String input) {
    final _someMethodWithInputComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithInputComments__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithInputComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool someMethodWithOutputComments(String input) {
    final _someMethodWithOutputComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithOutputComments__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithOutputComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool someMethodWithNoComments(String input) {
    final _someMethodWithNoComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithNoComments__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithNoComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  someMethodWithoutReturnTypeWithAllComments(String input) {
    final _someMethodWithoutReturnTypeWithAllComments_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithoutReturnTypeWithAllComments__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutReturnTypeWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  someMethodWithoutReturnTypeWithNoComments(String input) {
    final _someMethodWithoutReturnTypeWithNoComments_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_someMethodWithoutReturnTypeWithNoComments__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutReturnTypeWithNoComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  bool someMethodWithoutInputParametersWithAllComments() {
    final _someMethodWithoutInputParametersWithAllComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Comments_someMethodWithoutInputParametersWithAllComments');
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutInputParametersWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool someMethodWithoutInputParametersWithNoComments() {
    final _someMethodWithoutInputParametersWithNoComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Comments_someMethodWithoutInputParametersWithNoComments');
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutInputParametersWithNoComments_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  someMethodWithNothing() {
    final _someMethodWithNothing_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_Comments_someMethodWithNothing');
    final _handle = this.handle;
    final __result_handle = _someMethodWithNothing_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  someMethodWithoutReturnTypeOrInputParameters() {
    final _someMethodWithoutReturnTypeOrInputParameters_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_Comments_someMethodWithoutReturnTypeOrInputParameters');
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutReturnTypeOrInputParameters_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  String oneParameterCommentOnly(String undocumented, String documented) {
    final _oneParameterCommentOnly_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('library_smoke_Comments_oneParameterCommentOnly__String_String');
    final _undocumented_handle = String_toFfi(undocumented);
    final _documented_handle = String_toFfi(documented);
    final _handle = this.handle;
    final __result_handle = _oneParameterCommentOnly_ffi(_handle, __lib.LibraryContext.isolateId, _undocumented_handle, _documented_handle);
    String_releaseFfiHandle(_undocumented_handle);
    String_releaseFfiHandle(_documented_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  String returnCommentOnly(String undocumented) {
    final _returnCommentOnly_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Comments_returnCommentOnly__String');
    final _undocumented_handle = String_toFfi(undocumented);
    final _handle = this.handle;
    final __result_handle = _returnCommentOnly_ffi(_handle, __lib.LibraryContext.isolateId, _undocumented_handle);
    String_releaseFfiHandle(_undocumented_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool get isSomeProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_Comments_isSomeProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  set isSomeProperty(bool value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_Comments_isSomeProperty_set__Boolean');
    final _value_handle = Boolean_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    Boolean_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_Comments_toFfi(Comments value) =>
  _smoke_Comments_copy_handle((value as Comments$Impl).handle);
Comments smoke_Comments_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_Comments_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Comments;
  if (instance != null) return instance;
  final _copied_handle = _smoke_Comments_copy_handle(handle);
  final result = Comments$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_Comments_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Comments_release_handle(handle);
Pointer<Void> smoke_Comments_toFfi_nullable(Comments value) =>
  value != null ? smoke_Comments_toFfi(value) : Pointer<Void>.fromAddress(0);
Comments smoke_Comments_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Comments_fromFfi(handle) : null;
void smoke_Comments_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Comments_release_handle(handle);
// End of Comments "private" section.
