import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_ExternalClass_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalClass_copy_handle');
final _smoke_ExternalClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ExternalClass_release_handle');
class ExternalClass {
  final Pointer<Void> _handle;
  ExternalClass._(this._handle);
  void release() => _smoke_ExternalClass_release_handle(_handle);
  someMethod(int someParameter) {
    final _someMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int8), void Function(Pointer<Void>, int)>('smoke_ExternalClass_someMethod__Byte');
    final _someParameter_handle = (someParameter);
    final __result_handle = _someMethod_ffi(_handle, _someParameter_handle);
    (_someParameter_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  String get someProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_ExternalClass_someProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_ExternalClass_toFfi(ExternalClass value) =>
  _smoke_ExternalClass_copy_handle(value._handle);
ExternalClass smoke_ExternalClass_fromFfi(Pointer<Void> handle) =>
  ExternalClass._(_smoke_ExternalClass_copy_handle(handle));
void smoke_ExternalClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ExternalClass_release_handle(handle);
Pointer<Void> smoke_ExternalClass_toFfi_nullable(ExternalClass value) =>
  value != null ? smoke_ExternalClass_toFfi(value) : Pointer<Void>.fromAddress(0);
ExternalClass smoke_ExternalClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ExternalClass_fromFfi(handle) : null;
void smoke_ExternalClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalClass_release_handle(handle);
enum ExternalClass_SomeEnum {
    someValue
}
// ExternalClass_SomeEnum "private" section, not exported.
int smoke_ExternalClass_SomeEnum_toFfi(ExternalClass_SomeEnum value) {
  switch (value) {
  case ExternalClass_SomeEnum.someValue:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for ExternalClass_SomeEnum enum.");
  }
}
ExternalClass_SomeEnum smoke_ExternalClass_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExternalClass_SomeEnum.someValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ExternalClass_SomeEnum enum.");
  }
}
void smoke_ExternalClass_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_ExternalClass_SomeEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('smoke_ExternalClass_SomeEnum_create_handle_nullable');
final _smoke_ExternalClass_SomeEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ExternalClass_SomeEnum_release_handle_nullable');
final _smoke_ExternalClass_SomeEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_ExternalClass_SomeEnum_get_value_nullable');
Pointer<Void> smoke_ExternalClass_SomeEnum_toFfi_nullable(ExternalClass_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExternalClass_SomeEnum_toFfi(value);
  final result = _smoke_ExternalClass_SomeEnum_create_handle_nullable(_handle);
  smoke_ExternalClass_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
ExternalClass_SomeEnum smoke_ExternalClass_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExternalClass_SomeEnum_get_value_nullable(handle);
  final result = smoke_ExternalClass_SomeEnum_fromFfi(_handle);
  smoke_ExternalClass_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExternalClass_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalClass_SomeEnum_release_handle_nullable(handle);
// End of ExternalClass_SomeEnum "private" section.
class ExternalClass_SomeStruct {
  String someField;
  ExternalClass_SomeStruct(this.someField);
}
// ExternalClass_SomeStruct "private" section, not exported.
final _smoke_ExternalClass_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalClass_SomeStruct_create_handle');
final _smoke_ExternalClass_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ExternalClass_SomeStruct_release_handle');
final _smoke_ExternalClass_SomeStruct_get_field_someField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalClass_SomeStruct_get_field_someField');
Pointer<Void> smoke_ExternalClass_SomeStruct_toFfi(ExternalClass_SomeStruct value) {
  final _someField_handle = String_toFfi(value.someField);
  final _result = _smoke_ExternalClass_SomeStruct_create_handle(_someField_handle);
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
ExternalClass_SomeStruct smoke_ExternalClass_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_ExternalClass_SomeStruct_get_field_someField(handle);
  final _result = ExternalClass_SomeStruct(
    String_fromFfi(_someField_handle)
  );
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
void smoke_ExternalClass_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_ExternalClass_SomeStruct_release_handle(handle);
// Nullable ExternalClass_SomeStruct
final _smoke_ExternalClass_SomeStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalClass_SomeStruct_create_handle_nullable');
final _smoke_ExternalClass_SomeStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ExternalClass_SomeStruct_release_handle_nullable');
final _smoke_ExternalClass_SomeStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalClass_SomeStruct_get_value_nullable');
Pointer<Void> smoke_ExternalClass_SomeStruct_toFfi_nullable(ExternalClass_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExternalClass_SomeStruct_toFfi(value);
  final result = _smoke_ExternalClass_SomeStruct_create_handle_nullable(_handle);
  smoke_ExternalClass_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
ExternalClass_SomeStruct smoke_ExternalClass_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExternalClass_SomeStruct_get_value_nullable(handle);
  final result = smoke_ExternalClass_SomeStruct_fromFfi(_handle);
  smoke_ExternalClass_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExternalClass_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalClass_SomeStruct_release_handle_nullable(handle);
// End of ExternalClass_SomeStruct "private" section.
