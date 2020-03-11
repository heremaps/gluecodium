import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
/// This is some very useful interface.
@Deprecated("Unfortunately, this interface is deprecated. Use [comments] instead.")
abstract class DeprecationComments {
  void release();
  /// This is some very useful constant.
  @Deprecated("Unfortunately, this constant is deprecated. Use [comments.VeryUseful] instead.")
  static final bool veryUseful = true;
  /// This is some very useful method that measures the usefulness of its input.
  /// @param[input] Very useful input parameter
  /// @return Usefulness of the input
  @Deprecated("Unfortunately, this method is deprecated.
  Use [comments.someMethodWithAllComments] instead.")
  bool someMethodWithAllComments(String input);
  /// Gets some very useful property.
  @Deprecated("Unfortunately, this property's getter is deprecated.
  Use [comments.SomeProperty.get] instead.")
  bool get isSomeProperty;
  /// Sets some very useful property.
  @Deprecated("Unfortunately, this property's setter is deprecated.
  Use [comments.SomeProperty.set] instead.")
  set isSomeProperty(bool value);
}
/// This is some very useful enum.
@Deprecated("Unfortunately, this enum is deprecated. Use [comments.SomeEnum] instead.")
enum DeprecationComments_SomeEnum {
    /// Not quite useful
    @Deprecated("Unfortunately, this item is deprecated.
    Use [comments.SomeEnum.Useless] instead.")
    useless
}
// DeprecationComments_SomeEnum "private" section, not exported.
int smoke_DeprecationComments_SomeEnum_toFfi(DeprecationComments_SomeEnum value) {
  switch (value) {
  case DeprecationComments_SomeEnum.useless:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for DeprecationComments_SomeEnum enum.");
  }
}
DeprecationComments_SomeEnum smoke_DeprecationComments_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return DeprecationComments_SomeEnum.useless;
  break;
  default:
    throw StateError("Invalid numeric value $handle for DeprecationComments_SomeEnum enum.");
  }
}
void smoke_DeprecationComments_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_DeprecationComments_SomeEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationComments_SomeEnum_create_handle_nullable');
final _smoke_DeprecationComments_SomeEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeEnum_release_handle_nullable');
final _smoke_DeprecationComments_SomeEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeEnum_get_value_nullable');
Pointer<Void> smoke_DeprecationComments_SomeEnum_toFfi_nullable(DeprecationComments_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DeprecationComments_SomeEnum_toFfi(value);
  final result = _smoke_DeprecationComments_SomeEnum_create_handle_nullable(_handle);
  smoke_DeprecationComments_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
DeprecationComments_SomeEnum smoke_DeprecationComments_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DeprecationComments_SomeEnum_get_value_nullable(handle);
  final result = smoke_DeprecationComments_SomeEnum_fromFfi(_handle);
  smoke_DeprecationComments_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_DeprecationComments_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecationComments_SomeEnum_release_handle_nullable(handle);
// End of DeprecationComments_SomeEnum "private" section.
@Deprecated("Unfortunately, this exception is deprecated, please use [comments.SomethingWrong] instead.")
class DeprecationComments_SomethingWrongException implements Exception {
  final DeprecationComments_SomeEnum error;
  DeprecationComments_SomethingWrongException(this.error);
}
/// This is some very useful struct.
@Deprecated("Unfortunately, this struct is deprecated. Use [comments.SomeStruct] instead.")
class DeprecationComments_SomeStruct {
  /// How useful this struct is.
  @Deprecated("Unfortunately, this field is deprecated.
  Use [comments.SomeStruct.someField] instead.")
  bool someField;
  DeprecationComments_SomeStruct(this.someField);
}
// DeprecationComments_SomeStruct "private" section, not exported.
final _smoke_DeprecationComments_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationComments_SomeStruct_create_handle');
final _smoke_DeprecationComments_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeStruct_release_handle');
final _smoke_DeprecationComments_SomeStruct_get_field_someField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeStruct_get_field_someField');
Pointer<Void> smoke_DeprecationComments_SomeStruct_toFfi(DeprecationComments_SomeStruct value) {
  final _someField_handle = Boolean_toFfi(value.someField);
  final _result = _smoke_DeprecationComments_SomeStruct_create_handle(_someField_handle);
  Boolean_releaseFfiHandle(_someField_handle);
  return _result;
}
DeprecationComments_SomeStruct smoke_DeprecationComments_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_DeprecationComments_SomeStruct_get_field_someField(handle);
  final _result = DeprecationComments_SomeStruct(
    Boolean_fromFfi(_someField_handle)
  );
  Boolean_releaseFfiHandle(_someField_handle);
  return _result;
}
void smoke_DeprecationComments_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_DeprecationComments_SomeStruct_release_handle(handle);
// Nullable DeprecationComments_SomeStruct
final _smoke_DeprecationComments_SomeStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeStruct_create_handle_nullable');
final _smoke_DeprecationComments_SomeStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeStruct_release_handle_nullable');
final _smoke_DeprecationComments_SomeStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_SomeStruct_get_value_nullable');
Pointer<Void> smoke_DeprecationComments_SomeStruct_toFfi_nullable(DeprecationComments_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DeprecationComments_SomeStruct_toFfi(value);
  final result = _smoke_DeprecationComments_SomeStruct_create_handle_nullable(_handle);
  smoke_DeprecationComments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
DeprecationComments_SomeStruct smoke_DeprecationComments_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DeprecationComments_SomeStruct_get_value_nullable(handle);
  final result = smoke_DeprecationComments_SomeStruct_fromFfi(_handle);
  smoke_DeprecationComments_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_DeprecationComments_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecationComments_SomeStruct_release_handle_nullable(handle);
// End of DeprecationComments_SomeStruct "private" section.
// DeprecationComments "private" section, not exported.
final _smoke_DeprecationComments_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_copy_handle');
final _smoke_DeprecationComments_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_release_handle');
final _smoke_DeprecationComments_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_DeprecationComments_create_proxy');
final _smoke_DeprecationComments_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_DeprecationComments_get_raw_pointer');
final _smoke_DeprecationComments_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationComments_get_type_id');
class DeprecationComments__Impl implements DeprecationComments {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  DeprecationComments__Impl(this.handle);
  @override
  void release() => _smoke_DeprecationComments_release_handle(handle);
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, Pointer<Void>)>('library_smoke_DeprecationComments_someMethodWithAllComments__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _someMethodWithAllComments_ffi(_handle, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  /// Gets some very useful property.
  @Deprecated("Unfortunately, this property's getter is deprecated.
  Use [comments.SomeProperty.get] instead.")
  bool get isSomeProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>), int Function(Pointer<Void>)>('library_smoke_DeprecationComments_isSomeProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  /// Sets some very useful property.
  @Deprecated("Unfortunately, this property's setter is deprecated.
  Use [comments.SomeProperty.set] instead.")
  set isSomeProperty(bool value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Uint8), void Function(Pointer<Void>, int)>('library_smoke_DeprecationComments_isSomeProperty_set__Boolean');
    final _value_handle = Boolean_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    Boolean_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _DeprecationComments_someMethodWithAllComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  final _result_object = (__lib.instanceCache[_token] as DeprecationComments).someMethodWithAllComments(String_fromFfi(input));
  _result.value = Boolean_toFfi(_result_object);
  String_releaseFfiHandle(input);
  return 0;
}
int _DeprecationComments_isSomeProperty_get_static(int _token, Pointer<Uint8> _result) {
  _result.value = Boolean_toFfi((__lib.instanceCache[_token] as DeprecationComments).isSomeProperty);
  return 0;
}
int _DeprecationComments_isSomeProperty_set_static(int _token, int _value) {
  (__lib.instanceCache[_token] as DeprecationComments).isSomeProperty = Boolean_fromFfi(_value);
  Boolean_releaseFfiHandle(_value);
  return 0;
}
Pointer<Void> smoke_DeprecationComments_toFfi(DeprecationComments value) {
  if (value is DeprecationComments__Impl) return _smoke_DeprecationComments_copy_handle(value.handle);
  final result = _smoke_DeprecationComments_create_proxy(
    __lib.cacheObject(value),
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_DeprecationComments_someMethodWithAllComments_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Uint8>)>(_DeprecationComments_isSomeProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Uint8)>(_DeprecationComments_isSomeProperty_set_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_DeprecationComments_get_raw_pointer(result)] = value;
  return result;
}
DeprecationComments smoke_DeprecationComments_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_DeprecationComments_get_raw_pointer(handle)] as DeprecationComments;
  if (instance != null) return instance;
  final _copied_handle = _smoke_DeprecationComments_copy_handle(handle);
  final _type_id_handle = _smoke_DeprecationComments_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? DeprecationComments__Impl(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_DeprecationComments_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_DeprecationComments_release_handle(handle);
Pointer<Void> smoke_DeprecationComments_toFfi_nullable(DeprecationComments value) =>
  value != null ? smoke_DeprecationComments_toFfi(value) : Pointer<Void>.fromAddress(0);
DeprecationComments smoke_DeprecationComments_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_DeprecationComments_fromFfi(handle) : null;
void smoke_DeprecationComments_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecationComments_release_handle(handle);
// End of DeprecationComments "private" section.
