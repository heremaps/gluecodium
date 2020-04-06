import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;

/// This is some very useful interface.
abstract class CommentsInterface {
  void release() {}
  /// This is some very useful constant.
  static final bool veryUseful = true;
  /// This is some very useful method that measures the usefulness of its input.
  /// @param[input] Very useful input parameter
  /// @return Usefulness of the input
  bool someMethodWithAllComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  /// @param[input] Very useful input parameter
  bool someMethodWithInputComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  /// @return Usefulness of the input
  bool someMethodWithOutputComments(String input);
  /// This is some very useful method that measures the usefulness of its input.
  bool someMethodWithNoComments(String input);
  /// This is some very useful method that does not measure the usefulness of its input.
  /// @param[input] Very useful input parameter
  someMethodWithoutReturnTypeWithAllComments(String input);
  /// This is some very useful method that does not measure the usefulness of its input.
  someMethodWithoutReturnTypeWithNoComments(String input);
  /// This is some very useful method that measures the usefulness of something.
  /// @return Usefulness of the input
  bool someMethodWithoutInputParametersWithAllComments();
  /// This is some very useful method that measures the usefulness of something.
  bool someMethodWithoutInputParametersWithNoComments();
  someMethodWithNothing();
  /// This is some very useful method that does nothing.
  someMethodWithoutReturnTypeOrInputParameters();
  /// Gets some very useful property.
  bool get isSomeProperty;
  /// Sets some very useful property.
  set isSomeProperty(bool value);
}
/// This is some very useful enum.
enum CommentsInterface_SomeEnum {
    /// Not quite useful
    useless,
    /// Somewhat useful
    useful
}
// CommentsInterface_SomeEnum "private" section, not exported.
int smoke_CommentsInterface_SomeEnum_toFfi(CommentsInterface_SomeEnum value) {
  switch (value) {
  case CommentsInterface_SomeEnum.useless:
    return 0;
  break;
  case CommentsInterface_SomeEnum.useful:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for CommentsInterface_SomeEnum enum.");
  }
}
CommentsInterface_SomeEnum smoke_CommentsInterface_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return CommentsInterface_SomeEnum.useless;
  break;
  case 1:
    return CommentsInterface_SomeEnum.useful;
  break;
  default:
    throw StateError("Invalid numeric value $handle for CommentsInterface_SomeEnum enum.");
  }
}
void smoke_CommentsInterface_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_CommentsInterface_SomeEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_CommentsInterface_SomeEnum_create_handle_nullable');
final _smoke_CommentsInterface_SomeEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeEnum_release_handle_nullable');
final _smoke_CommentsInterface_SomeEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeEnum_get_value_nullable');
Pointer<Void> smoke_CommentsInterface_SomeEnum_toFfi_nullable(CommentsInterface_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_CommentsInterface_SomeEnum_toFfi(value);
  final result = _smoke_CommentsInterface_SomeEnum_create_handle_nullable(_handle);
  smoke_CommentsInterface_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
CommentsInterface_SomeEnum smoke_CommentsInterface_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_CommentsInterface_SomeEnum_get_value_nullable(handle);
  final result = smoke_CommentsInterface_SomeEnum_fromFfi(_handle);
  smoke_CommentsInterface_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_CommentsInterface_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CommentsInterface_SomeEnum_release_handle_nullable(handle);
// End of CommentsInterface_SomeEnum "private" section.
/// This is some very useful struct.
class CommentsInterface_SomeStruct {
  /// How useful this struct is
  bool someField;
  CommentsInterface_SomeStruct(this.someField);
}
// CommentsInterface_SomeStruct "private" section, not exported.
final _smoke_CommentsInterface_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_CommentsInterface_SomeStruct_create_handle');
final _smoke_CommentsInterface_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_release_handle');
final _smoke_CommentsInterface_SomeStruct_get_field_someField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_get_field_someField');
Pointer<Void> smoke_CommentsInterface_SomeStruct_toFfi(CommentsInterface_SomeStruct value) {
  final _someField_handle = Boolean_toFfi(value.someField);
  final _result = _smoke_CommentsInterface_SomeStruct_create_handle(_someField_handle);
  Boolean_releaseFfiHandle(_someField_handle);
  return _result;
}
CommentsInterface_SomeStruct smoke_CommentsInterface_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_CommentsInterface_SomeStruct_get_field_someField(handle);
  final _result = CommentsInterface_SomeStruct(
    Boolean_fromFfi(_someField_handle)
  );
  Boolean_releaseFfiHandle(_someField_handle);
  return _result;
}
void smoke_CommentsInterface_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_CommentsInterface_SomeStruct_release_handle(handle);
// Nullable CommentsInterface_SomeStruct
final _smoke_CommentsInterface_SomeStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_create_handle_nullable');
final _smoke_CommentsInterface_SomeStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_release_handle_nullable');
final _smoke_CommentsInterface_SomeStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_SomeStruct_get_value_nullable');
Pointer<Void> smoke_CommentsInterface_SomeStruct_toFfi_nullable(CommentsInterface_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_CommentsInterface_SomeStruct_toFfi(value);
  final result = _smoke_CommentsInterface_SomeStruct_create_handle_nullable(_handle);
  smoke_CommentsInterface_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
CommentsInterface_SomeStruct smoke_CommentsInterface_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_CommentsInterface_SomeStruct_get_value_nullable(handle);
  final result = smoke_CommentsInterface_SomeStruct_fromFfi(_handle);
  smoke_CommentsInterface_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_CommentsInterface_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CommentsInterface_SomeStruct_release_handle_nullable(handle);
// End of CommentsInterface_SomeStruct "private" section.
// CommentsInterface "private" section, not exported.
final _smoke_CommentsInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_copy_handle');
final _smoke_CommentsInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_release_handle');
final _smoke_CommentsInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_CommentsInterface_create_proxy');
final _smoke_CommentsInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_CommentsInterface_get_raw_pointer');
final _smoke_CommentsInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_CommentsInterface_get_type_id');
class CommentsInterface$Impl implements CommentsInterface {
  final Pointer<Void> handle;
  CommentsInterface$Impl(this.handle);
  @override
  void release() => _smoke_CommentsInterface_release_handle(handle);
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithAllComments__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _someMethodWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool someMethodWithInputComments(String input) {
    final _someMethodWithInputComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithInputComments__String');
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
    final _someMethodWithOutputComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithOutputComments__String');
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
    final _someMethodWithNoComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithNoComments__String');
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
    final _someMethodWithoutReturnTypeWithAllComments_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithoutReturnTypeWithAllComments__String');
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
    final _someMethodWithoutReturnTypeWithNoComments_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_CommentsInterface_someMethodWithoutReturnTypeWithNoComments__String');
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
    final _someMethodWithoutInputParametersWithAllComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithoutInputParametersWithAllComments');
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutInputParametersWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool someMethodWithoutInputParametersWithNoComments() {
    final _someMethodWithoutInputParametersWithNoComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithoutInputParametersWithNoComments');
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutInputParametersWithNoComments_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  someMethodWithNothing() {
    final _someMethodWithNothing_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithNothing');
    final _handle = this.handle;
    final __result_handle = _someMethodWithNothing_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  someMethodWithoutReturnTypeOrInputParameters() {
    final _someMethodWithoutReturnTypeOrInputParameters_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_someMethodWithoutReturnTypeOrInputParameters');
    final _handle = this.handle;
    final __result_handle = _someMethodWithoutReturnTypeOrInputParameters_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  /// Gets some very useful property.
  bool get isSomeProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_CommentsInterface_isSomeProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  /// Sets some very useful property.
  set isSomeProperty(bool value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_CommentsInterface_isSomeProperty_set__Boolean');
    final _value_handle = Boolean_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    Boolean_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _CommentsInterface_someMethodWithAllComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  final __input = String_fromFfi(input);
  String_releaseFfiHandle(input);
  final _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithAllComments(__input);
  _result.value = Boolean_toFfi(_result_object);
  return 0;
}
int _CommentsInterface_someMethodWithInputComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  final __input = String_fromFfi(input);
  String_releaseFfiHandle(input);
  final _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithInputComments(__input);
  _result.value = Boolean_toFfi(_result_object);
  return 0;
}
int _CommentsInterface_someMethodWithOutputComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  final __input = String_fromFfi(input);
  String_releaseFfiHandle(input);
  final _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithOutputComments(__input);
  _result.value = Boolean_toFfi(_result_object);
  return 0;
}
int _CommentsInterface_someMethodWithNoComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  final __input = String_fromFfi(input);
  String_releaseFfiHandle(input);
  final _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithNoComments(__input);
  _result.value = Boolean_toFfi(_result_object);
  return 0;
}
int _CommentsInterface_someMethodWithoutReturnTypeWithAllComments_static(int _token, Pointer<Void> input) {
  final __input = String_fromFfi(input);
  String_releaseFfiHandle(input);
  (__lib.instanceCache[_token] as CommentsInterface).someMethodWithoutReturnTypeWithAllComments(__input);
  return 0;
}
int _CommentsInterface_someMethodWithoutReturnTypeWithNoComments_static(int _token, Pointer<Void> input) {
  final __input = String_fromFfi(input);
  String_releaseFfiHandle(input);
  (__lib.instanceCache[_token] as CommentsInterface).someMethodWithoutReturnTypeWithNoComments(__input);
  return 0;
}
int _CommentsInterface_someMethodWithoutInputParametersWithAllComments_static(int _token, Pointer<Uint8> _result) {
  final _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithoutInputParametersWithAllComments();
  _result.value = Boolean_toFfi(_result_object);
  return 0;
}
int _CommentsInterface_someMethodWithoutInputParametersWithNoComments_static(int _token, Pointer<Uint8> _result) {
  final _result_object = (__lib.instanceCache[_token] as CommentsInterface).someMethodWithoutInputParametersWithNoComments();
  _result.value = Boolean_toFfi(_result_object);
  return 0;
}
int _CommentsInterface_someMethodWithNothing_static(int _token) {
  (__lib.instanceCache[_token] as CommentsInterface).someMethodWithNothing();
  return 0;
}
int _CommentsInterface_someMethodWithoutReturnTypeOrInputParameters_static(int _token) {
  (__lib.instanceCache[_token] as CommentsInterface).someMethodWithoutReturnTypeOrInputParameters();
  return 0;
}
int _CommentsInterface_isSomeProperty_get_static(int _token, Pointer<Uint8> _result) {
  _result.value = Boolean_toFfi((__lib.instanceCache[_token] as CommentsInterface).isSomeProperty);
  return 0;
}
int _CommentsInterface_isSomeProperty_set_static(int _token, int _value) {
  final __value = Boolean_fromFfi(_value);
  Boolean_releaseFfiHandle(_value);
  (__lib.instanceCache[_token] as CommentsInterface).isSomeProperty = __value;
  return 0;
}
Pointer<Void> smoke_CommentsInterface_toFfi(CommentsInterface value) {
  if (value is CommentsInterface$Impl) return _smoke_CommentsInterface_copy_handle(value.handle);
  final result = _smoke_CommentsInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_CommentsInterface_someMethodWithAllComments_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_CommentsInterface_someMethodWithInputComments_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_CommentsInterface_someMethodWithOutputComments_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_CommentsInterface_someMethodWithNoComments_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_CommentsInterface_someMethodWithoutReturnTypeWithAllComments_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_CommentsInterface_someMethodWithoutReturnTypeWithNoComments_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Uint8>)>(_CommentsInterface_someMethodWithoutInputParametersWithAllComments_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Uint8>)>(_CommentsInterface_someMethodWithoutInputParametersWithNoComments_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64)>(_CommentsInterface_someMethodWithNothing_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64)>(_CommentsInterface_someMethodWithoutReturnTypeOrInputParameters_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Uint8>)>(_CommentsInterface_isSomeProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Uint8)>(_CommentsInterface_isSomeProperty_set_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_CommentsInterface_get_raw_pointer(result)] = value;
  return result;
}
CommentsInterface smoke_CommentsInterface_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_CommentsInterface_get_raw_pointer(handle)] as CommentsInterface;
  if (instance != null) return instance;
  final _copied_handle = _smoke_CommentsInterface_copy_handle(handle);
  final _type_id_handle = _smoke_CommentsInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  final result = factoryConstructor == null
    ? CommentsInterface$Impl(_copied_handle)
    : factoryConstructor(_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_CommentsInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_CommentsInterface_release_handle(handle);
Pointer<Void> smoke_CommentsInterface_toFfi_nullable(CommentsInterface value) =>
  value != null ? smoke_CommentsInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
CommentsInterface smoke_CommentsInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_CommentsInterface_fromFfi(handle) : null;
void smoke_CommentsInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_CommentsInterface_release_handle(handle);
// End of CommentsInterface "private" section.
