import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class ExternalInterface {
  void release();
  someMethod(int someParameter);
  String get someProperty;
}
enum ExternalInterface_SomeEnum {
    someValue
}
// ExternalInterface_SomeEnum "private" section, not exported.
int smoke_ExternalInterface_SomeEnum_toFfi(ExternalInterface_SomeEnum value) {
  switch (value) {
  case ExternalInterface_SomeEnum.someValue:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for ExternalInterface_SomeEnum enum.");
  }
}
ExternalInterface_SomeEnum smoke_ExternalInterface_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExternalInterface_SomeEnum.someValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ExternalInterface_SomeEnum enum.");
  }
}
void smoke_ExternalInterface_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_ExternalInterface_SomeEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('smoke_ExternalInterface_SomeEnum_create_handle_nullable');
final _smoke_ExternalInterface_SomeEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ExternalInterface_SomeEnum_release_handle_nullable');
final _smoke_ExternalInterface_SomeEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_ExternalInterface_SomeEnum_get_value_nullable');
Pointer<Void> smoke_ExternalInterface_SomeEnum_toFfi_nullable(ExternalInterface_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExternalInterface_SomeEnum_toFfi(value);
  final result = _smoke_ExternalInterface_SomeEnum_create_handle_nullable(_handle);
  smoke_ExternalInterface_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
ExternalInterface_SomeEnum smoke_ExternalInterface_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExternalInterface_SomeEnum_get_value_nullable(handle);
  final result = smoke_ExternalInterface_SomeEnum_fromFfi(_handle);
  smoke_ExternalInterface_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExternalInterface_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalInterface_SomeEnum_release_handle_nullable(handle);
// End of ExternalInterface_SomeEnum "private" section.
class ExternalInterface_SomeStruct {
  String someField;
  ExternalInterface_SomeStruct(this.someField);
}
// ExternalInterface_SomeStruct "private" section, not exported.
final _smoke_ExternalInterface_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalInterface_SomeStruct_create_handle');
final _smoke_ExternalInterface_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ExternalInterface_SomeStruct_release_handle');
final _smoke_ExternalInterface_SomeStruct_get_field_someField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalInterface_SomeStruct_get_field_someField');
Pointer<Void> smoke_ExternalInterface_SomeStruct_toFfi(ExternalInterface_SomeStruct value) {
  final _someField_handle = String_toFfi(value.someField);
  final _result = _smoke_ExternalInterface_SomeStruct_create_handle(_someField_handle);
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
ExternalInterface_SomeStruct smoke_ExternalInterface_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_ExternalInterface_SomeStruct_get_field_someField(handle);
  final _result = ExternalInterface_SomeStruct(
    String_fromFfi(_someField_handle)
  );
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
void smoke_ExternalInterface_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_ExternalInterface_SomeStruct_release_handle(handle);
// Nullable ExternalInterface_SomeStruct
final _smoke_ExternalInterface_SomeStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalInterface_SomeStruct_create_handle_nullable');
final _smoke_ExternalInterface_SomeStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ExternalInterface_SomeStruct_release_handle_nullable');
final _smoke_ExternalInterface_SomeStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalInterface_SomeStruct_get_value_nullable');
Pointer<Void> smoke_ExternalInterface_SomeStruct_toFfi_nullable(ExternalInterface_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExternalInterface_SomeStruct_toFfi(value);
  final result = _smoke_ExternalInterface_SomeStruct_create_handle_nullable(_handle);
  smoke_ExternalInterface_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
ExternalInterface_SomeStruct smoke_ExternalInterface_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExternalInterface_SomeStruct_get_value_nullable(handle);
  final result = smoke_ExternalInterface_SomeStruct_fromFfi(_handle);
  smoke_ExternalInterface_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExternalInterface_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalInterface_SomeStruct_release_handle_nullable(handle);
// End of ExternalInterface_SomeStruct "private" section.
// ExternalInterface "private" section, not exported.
final _smoke_ExternalInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalInterface_copy_handle');
final _smoke_ExternalInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ExternalInterface_release_handle');
class ExternalInterface__Impl implements ExternalInterface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  ExternalInterface__Impl(this.handle);
  @override
  void release() => _smoke_ExternalInterface_release_handle(handle);
  @override
  someMethod(int someParameter) {
    final _someMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int8), void Function(Pointer<Void>, int)>('smoke_ExternalInterface_someMethod__Byte');
    final _someParameter_handle = (someParameter);
    final __result_handle = _someMethod_ffi(_handle, _someParameter_handle);
    (_someParameter_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  String get someProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_ExternalInterface_someProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_ExternalInterface_toFfi(ExternalInterface__Impl value) =>
  _smoke_ExternalInterface_copy_handle(value._handle);
ExternalInterface smoke_ExternalInterface_fromFfi(Pointer<Void> handle) =>
  ExternalInterface__Impl(_smoke_ExternalInterface_copy_handle(handle));
void smoke_ExternalInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ExternalInterface_release_handle(handle);
Pointer<Void> smoke_ExternalInterface_toFfi_nullable(ExternalInterface__Impl value) =>
  value != null ? smoke_ExternalInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ExternalInterface smoke_ExternalInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ExternalInterface_fromFfi(handle) : null;
void smoke_ExternalInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalInterface_release_handle(handle);
// End of ExternalInterface "private" section.
