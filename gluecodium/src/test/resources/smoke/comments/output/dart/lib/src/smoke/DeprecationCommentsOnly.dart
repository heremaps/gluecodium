import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
@Deprecated("Unfortunately, this interface is deprecated.")
abstract class DeprecationCommentsOnly {
  void release();
  @Deprecated("Unfortunately, this constant is deprecated.")
  static final bool veryUseful = true;
  /// @param[input] Very useful input parameter
  /// @return Usefulness of the input
  @Deprecated("Unfortunately, this method is deprecated.")
  bool someMethodWithAllComments(String input);
  @Deprecated("Unfortunately, this property's getter is deprecated.")
  bool get isSomeProperty;
  @Deprecated("Unfortunately, this property's setter is deprecated.")
  set isSomeProperty(bool value);
}
@Deprecated("Unfortunately, this enum is deprecated.")
enum DeprecationCommentsOnly_SomeEnum {
    @Deprecated("Unfortunately, this item is deprecated.")
    useless
}
// DeprecationCommentsOnly_SomeEnum "private" section, not exported.
int smoke_DeprecationCommentsOnly_SomeEnum_toFfi(DeprecationCommentsOnly_SomeEnum value) {
  switch (value) {
  case DeprecationCommentsOnly_SomeEnum.useless:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for DeprecationCommentsOnly_SomeEnum enum.");
  }
}
DeprecationCommentsOnly_SomeEnum smoke_DeprecationCommentsOnly_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return DeprecationCommentsOnly_SomeEnum.useless;
  break;
  default:
    throw StateError("Invalid numeric value $handle for DeprecationCommentsOnly_SomeEnum enum.");
  }
}
void smoke_DeprecationCommentsOnly_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_DeprecationCommentsOnly_SomeEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_create_handle_nullable');
final _smoke_DeprecationCommentsOnly_SomeEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_release_handle_nullable');
final _smoke_DeprecationCommentsOnly_SomeEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeEnum_get_value_nullable');
Pointer<Void> smoke_DeprecationCommentsOnly_SomeEnum_toFfi_nullable(DeprecationCommentsOnly_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DeprecationCommentsOnly_SomeEnum_toFfi(value);
  final result = _smoke_DeprecationCommentsOnly_SomeEnum_create_handle_nullable(_handle);
  smoke_DeprecationCommentsOnly_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
DeprecationCommentsOnly_SomeEnum smoke_DeprecationCommentsOnly_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DeprecationCommentsOnly_SomeEnum_get_value_nullable(handle);
  final result = smoke_DeprecationCommentsOnly_SomeEnum_fromFfi(_handle);
  smoke_DeprecationCommentsOnly_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_DeprecationCommentsOnly_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecationCommentsOnly_SomeEnum_release_handle_nullable(handle);
// End of DeprecationCommentsOnly_SomeEnum "private" section.
@Deprecated("Unfortunately, this struct is deprecated.")
class DeprecationCommentsOnly_SomeStruct {
  @Deprecated("Unfortunately, this field is deprecated.")
  bool someField;
  DeprecationCommentsOnly_SomeStruct(this.someField);
}
// DeprecationCommentsOnly_SomeStruct "private" section, not exported.
final _smoke_DeprecationCommentsOnly_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_create_handle');
final _smoke_DeprecationCommentsOnly_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_release_handle');
final _smoke_DeprecationCommentsOnly_SomeStruct_get_field_someField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_get_field_someField');
Pointer<Void> smoke_DeprecationCommentsOnly_SomeStruct_toFfi(DeprecationCommentsOnly_SomeStruct value) {
  final _someField_handle = Boolean_toFfi(value.someField);
  final _result = _smoke_DeprecationCommentsOnly_SomeStruct_create_handle(_someField_handle);
  Boolean_releaseFfiHandle(_someField_handle);
  return _result;
}
DeprecationCommentsOnly_SomeStruct smoke_DeprecationCommentsOnly_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_DeprecationCommentsOnly_SomeStruct_get_field_someField(handle);
  final _result = DeprecationCommentsOnly_SomeStruct(
    Boolean_fromFfi(_someField_handle)
  );
  Boolean_releaseFfiHandle(_someField_handle);
  return _result;
}
void smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_DeprecationCommentsOnly_SomeStruct_release_handle(handle);
// Nullable DeprecationCommentsOnly_SomeStruct
final _smoke_DeprecationCommentsOnly_SomeStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_create_handle_nullable');
final _smoke_DeprecationCommentsOnly_SomeStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_release_handle_nullable');
final _smoke_DeprecationCommentsOnly_SomeStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_SomeStruct_get_value_nullable');
Pointer<Void> smoke_DeprecationCommentsOnly_SomeStruct_toFfi_nullable(DeprecationCommentsOnly_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DeprecationCommentsOnly_SomeStruct_toFfi(value);
  final result = _smoke_DeprecationCommentsOnly_SomeStruct_create_handle_nullable(_handle);
  smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
DeprecationCommentsOnly_SomeStruct smoke_DeprecationCommentsOnly_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DeprecationCommentsOnly_SomeStruct_get_value_nullable(handle);
  final result = smoke_DeprecationCommentsOnly_SomeStruct_fromFfi(_handle);
  smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_DeprecationCommentsOnly_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecationCommentsOnly_SomeStruct_release_handle_nullable(handle);
// End of DeprecationCommentsOnly_SomeStruct "private" section.
// DeprecationCommentsOnly "private" section, not exported.
final _smoke_DeprecationCommentsOnly_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_copy_handle');
final _smoke_DeprecationCommentsOnly_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_release_handle');
final _smoke_DeprecationCommentsOnly_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_DeprecationCommentsOnly_create_proxy');
final _smoke_DeprecationCommentsOnly_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_DeprecationCommentsOnly_get_raw_pointer');
final _smoke_DeprecationCommentsOnly_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecationCommentsOnly_get_type_id');
class DeprecationCommentsOnly__Impl implements DeprecationCommentsOnly {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  DeprecationCommentsOnly__Impl(this.handle);
  @override
  void release() => _smoke_DeprecationCommentsOnly_release_handle(handle);
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllComments_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, Pointer<Void>)>('library_smoke_DeprecationCommentsOnly_someMethodWithAllComments__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _someMethodWithAllComments_ffi(_handle, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @Deprecated("Unfortunately, this property's getter is deprecated.")
  bool get isSomeProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>), int Function(Pointer<Void>)>('library_smoke_DeprecationCommentsOnly_isSomeProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @Deprecated("Unfortunately, this property's setter is deprecated.")
  set isSomeProperty(bool value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Uint8), void Function(Pointer<Void>, int)>('library_smoke_DeprecationCommentsOnly_isSomeProperty_set__Boolean');
    final _value_handle = Boolean_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    Boolean_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _DeprecationCommentsOnly_someMethodWithAllComments_static(int _token, Pointer<Void> input, Pointer<Uint8> _result) {
  final _result_object = (__lib.instanceCache[_token] as DeprecationCommentsOnly).someMethodWithAllComments(String_fromFfi(input));
  _result.value = Boolean_toFfi(_result_object);
  String_releaseFfiHandle(input);
  return 0;
}
int _DeprecationCommentsOnly_isSomeProperty_get_static(int _token, Pointer<Uint8> _result) {
  _result.value = Boolean_toFfi((__lib.instanceCache[_token] as DeprecationCommentsOnly).isSomeProperty);
  return 0;
}
int _DeprecationCommentsOnly_isSomeProperty_set_static(int _token, int _value) {
  (__lib.instanceCache[_token] as DeprecationCommentsOnly).isSomeProperty = Boolean_fromFfi(_value);
  Boolean_releaseFfiHandle(_value);
  return 0;
}
Pointer<Void> smoke_DeprecationCommentsOnly_toFfi(DeprecationCommentsOnly value) {
  if (value is DeprecationCommentsOnly__Impl) return _smoke_DeprecationCommentsOnly_copy_handle(value.handle);
  final result = _smoke_DeprecationCommentsOnly_create_proxy(
    __lib.cacheObject(value),
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_DeprecationCommentsOnly_someMethodWithAllComments_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Uint8>)>(_DeprecationCommentsOnly_isSomeProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Uint8)>(_DeprecationCommentsOnly_isSomeProperty_set_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_DeprecationCommentsOnly_get_raw_pointer(result)] = value;
  return result;
}
DeprecationCommentsOnly smoke_DeprecationCommentsOnly_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_DeprecationCommentsOnly_get_raw_pointer(handle)] as DeprecationCommentsOnly;
  if (instance != null) return instance;
  final _copied_handle = _smoke_DeprecationCommentsOnly_copy_handle(handle);
  final _type_id_handle = _smoke_DeprecationCommentsOnly_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? DeprecationCommentsOnly__Impl(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_DeprecationCommentsOnly_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_DeprecationCommentsOnly_release_handle(handle);
Pointer<Void> smoke_DeprecationCommentsOnly_toFfi_nullable(DeprecationCommentsOnly value) =>
  value != null ? smoke_DeprecationCommentsOnly_toFfi(value) : Pointer<Void>.fromAddress(0);
DeprecationCommentsOnly smoke_DeprecationCommentsOnly_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_DeprecationCommentsOnly_fromFfi(handle) : null;
void smoke_DeprecationCommentsOnly_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecationCommentsOnly_release_handle(handle);
// End of DeprecationCommentsOnly "private" section.
