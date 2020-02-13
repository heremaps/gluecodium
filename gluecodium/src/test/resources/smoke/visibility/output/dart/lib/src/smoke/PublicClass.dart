import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_PublicClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PublicClass_release_handle');
class PublicClass {
  final Pointer<Void> _handle;
  PublicClass._(this._handle);
  void release() => _smoke_PublicClass_release_handle(_handle);
  PublicClass_InternalStruct _internalMethod(PublicClass_InternalStruct input) {
    final _internalMethod_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_PublicClass_internalMethod__InternalStruct');
    final _input_handle = smoke_PublicClass_InternalStruct_toFfi(input);
    final __result_handle = _internalMethod_ffi(_handle, _input_handle);
    smoke_PublicClass_InternalStruct_releaseFfiHandle(_input_handle);
    final _result = smoke_PublicClass_InternalStruct_fromFfi(__result_handle);
    smoke_PublicClass_InternalStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  PublicClass_InternalStruct get _internalStructProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_PublicClass_internalStructProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = smoke_PublicClass_InternalStruct_fromFfi(__result_handle);
    smoke_PublicClass_InternalStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  set _internalStructProperty(PublicClass_InternalStruct value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_PublicClass_internalStructProperty_set__InternalStruct');
    final _value_handle = smoke_PublicClass_InternalStruct_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    smoke_PublicClass_InternalStruct_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  String get internalSetterProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_PublicClass_internalSetterProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  set _internalSetterProperty(String value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_PublicClass_internalSetterProperty_set__String');
    final _value_handle = String_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    String_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_PublicClass_toFfi(PublicClass value) => value._handle;
PublicClass smoke_PublicClass_fromFfi(Pointer<Void> handle) => PublicClass._(handle);
void smoke_PublicClass_releaseFfiHandle(Pointer<Void> handle) {}
Pointer<Void> smoke_PublicClass_toFfi_nullable(PublicClass value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
PublicClass smoke_PublicClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? PublicClass._(handle) : null;
void smoke_PublicClass_releaseFfiHandle_nullable(Pointer<Void> handle) {}
enum PublicClass_InternalEnum {
    foo,
    bar
}
// PublicClass_InternalEnum "private" section, not exported.
int smoke_PublicClass_InternalEnum_toFfi(PublicClass_InternalEnum value) {
  switch (value) {
  case PublicClass_InternalEnum.foo:
    return 0;
  break;
  case PublicClass_InternalEnum.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for PublicClass_InternalEnum enum.");
  }
}
PublicClass_InternalEnum smoke_PublicClass_InternalEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return PublicClass_InternalEnum.foo;
  break;
  case 1:
    return PublicClass_InternalEnum.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for PublicClass_InternalEnum enum.");
  }
}
void smoke_PublicClass_InternalEnum_releaseFfiHandle(int handle) {}
final _smoke_PublicClass_InternalEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('smoke_PublicClass_InternalEnum_create_handle_nullable');
final _smoke_PublicClass_InternalEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PublicClass_InternalEnum_release_handle_nullable');
final _smoke_PublicClass_InternalEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_PublicClass_InternalEnum_get_value_nullable');
Pointer<Void> smoke_PublicClass_InternalEnum_toFfi_nullable(PublicClass_InternalEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicClass_InternalEnum_toFfi(value);
  final result = _smoke_PublicClass_InternalEnum_create_handle_nullable(_handle);
  smoke_PublicClass_InternalEnum_releaseFfiHandle(_handle);
  return result;
}
PublicClass_InternalEnum smoke_PublicClass_InternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicClass_InternalEnum_get_value_nullable(handle);
  final result = smoke_PublicClass_InternalEnum_fromFfi(_handle);
  smoke_PublicClass_InternalEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicClass_InternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicClass_InternalEnum_release_handle_nullable(handle);
// End of PublicClass_InternalEnum "private" section.
class PublicClass_InternalStruct {
  String _stringField;
  PublicClass_InternalStruct(this.stringField);
}
// PublicClass_InternalStruct "private" section, not exported.
final _smoke_PublicClass_InternalStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicClass_InternalStruct_create_handle');
final _smoke_PublicClass_InternalStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PublicClass_InternalStruct_release_handle');
final _smoke_PublicClass_InternalStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicClass_InternalStruct_get_field_stringField');
Pointer<Void> smoke_PublicClass_InternalStruct_toFfi(PublicClass_InternalStruct value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _result = _smoke_PublicClass_InternalStruct_create_handle(_stringField_handle);
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
PublicClass_InternalStruct smoke_PublicClass_InternalStruct_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_PublicClass_InternalStruct_get_field_stringField(handle);
  final _result = PublicClass_InternalStruct(
    String_fromFfi(_stringField_handle)
  );
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
void smoke_PublicClass_InternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_PublicClass_InternalStruct_release_handle(handle);
// Nullable PublicClass_InternalStruct
final _smoke_PublicClass_InternalStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicClass_InternalStruct_create_handle_nullable');
final _smoke_PublicClass_InternalStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PublicClass_InternalStruct_release_handle_nullable');
final _smoke_PublicClass_InternalStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicClass_InternalStruct_get_value_nullable');
Pointer<Void> smoke_PublicClass_InternalStruct_toFfi_nullable(PublicClass_InternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicClass_InternalStruct_toFfi(value);
  final result = _smoke_PublicClass_InternalStruct_create_handle_nullable(_handle);
  smoke_PublicClass_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
PublicClass_InternalStruct smoke_PublicClass_InternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicClass_InternalStruct_get_value_nullable(handle);
  final result = smoke_PublicClass_InternalStruct_fromFfi(_handle);
  smoke_PublicClass_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicClass_InternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicClass_InternalStruct_release_handle_nullable(handle);
// End of PublicClass_InternalStruct "private" section.
class PublicClass_PublicStruct {
  PublicClass_InternalStruct _internalField;
  PublicClass_PublicStruct(this.internalField);
}
// PublicClass_PublicStruct "private" section, not exported.
final _smoke_PublicClass_PublicStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStruct_create_handle');
final _smoke_PublicClass_PublicStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStruct_release_handle');
final _smoke_PublicClass_PublicStruct_get_field_internalField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStruct_get_field_internalField');
Pointer<Void> smoke_PublicClass_PublicStruct_toFfi(PublicClass_PublicStruct value) {
  final _internalField_handle = smoke_PublicClass_InternalStruct_toFfi(value.internalField);
  final _result = _smoke_PublicClass_PublicStruct_create_handle(_internalField_handle);
  smoke_PublicClass_InternalStruct_releaseFfiHandle(_internalField_handle);
  return _result;
}
PublicClass_PublicStruct smoke_PublicClass_PublicStruct_fromFfi(Pointer<Void> handle) {
  final _internalField_handle = _smoke_PublicClass_PublicStruct_get_field_internalField(handle);
  final _result = PublicClass_PublicStruct(
    smoke_PublicClass_InternalStruct_fromFfi(_internalField_handle)
  );
  smoke_PublicClass_InternalStruct_releaseFfiHandle(_internalField_handle);
  return _result;
}
void smoke_PublicClass_PublicStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_PublicClass_PublicStruct_release_handle(handle);
// Nullable PublicClass_PublicStruct
final _smoke_PublicClass_PublicStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStruct_create_handle_nullable');
final _smoke_PublicClass_PublicStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStruct_release_handle_nullable');
final _smoke_PublicClass_PublicStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStruct_get_value_nullable');
Pointer<Void> smoke_PublicClass_PublicStruct_toFfi_nullable(PublicClass_PublicStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicClass_PublicStruct_toFfi(value);
  final result = _smoke_PublicClass_PublicStruct_create_handle_nullable(_handle);
  smoke_PublicClass_PublicStruct_releaseFfiHandle(_handle);
  return result;
}
PublicClass_PublicStruct smoke_PublicClass_PublicStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicClass_PublicStruct_get_value_nullable(handle);
  final result = smoke_PublicClass_PublicStruct_fromFfi(_handle);
  smoke_PublicClass_PublicStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicClass_PublicStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicClass_PublicStruct_release_handle_nullable(handle);
// End of PublicClass_PublicStruct "private" section.
class PublicClass_PublicStructWithInternalDefaults {
  String _internalField;
  double publicField;
  PublicClass_PublicStructWithInternalDefaults(this.internalField, this.publicField);
  PublicClass_PublicStructWithInternalDefaults.withDefaults(double publicField)
    : internalField = "foo", publicField = publicField;
}
// PublicClass_PublicStructWithInternalDefaults "private" section, not exported.
final _smoke_PublicClass_PublicStructWithInternalDefaults_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Float),
    Pointer<Void> Function(Pointer<Void>, double)
  >('smoke_PublicClass_PublicStructWithInternalDefaults_create_handle');
final _smoke_PublicClass_PublicStructWithInternalDefaults_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStructWithInternalDefaults_release_handle');
final _smoke_PublicClass_PublicStructWithInternalDefaults_get_field_internalField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStructWithInternalDefaults_get_field_internalField');
final _smoke_PublicClass_PublicStructWithInternalDefaults_get_field_publicField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStructWithInternalDefaults_get_field_publicField');
Pointer<Void> smoke_PublicClass_PublicStructWithInternalDefaults_toFfi(PublicClass_PublicStructWithInternalDefaults value) {
  final _internalField_handle = String_toFfi(value.internalField);
  final _publicField_handle = (value.publicField);
  final _result = _smoke_PublicClass_PublicStructWithInternalDefaults_create_handle(_internalField_handle, _publicField_handle);
  String_releaseFfiHandle(_internalField_handle);
  (_publicField_handle);
  return _result;
}
PublicClass_PublicStructWithInternalDefaults smoke_PublicClass_PublicStructWithInternalDefaults_fromFfi(Pointer<Void> handle) {
  final _internalField_handle = _smoke_PublicClass_PublicStructWithInternalDefaults_get_field_internalField(handle);
  final _publicField_handle = _smoke_PublicClass_PublicStructWithInternalDefaults_get_field_publicField(handle);
  final _result = PublicClass_PublicStructWithInternalDefaults(
    String_fromFfi(_internalField_handle),
    (_publicField_handle)
  );
  String_releaseFfiHandle(_internalField_handle);
  (_publicField_handle);
  return _result;
}
void smoke_PublicClass_PublicStructWithInternalDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_PublicClass_PublicStructWithInternalDefaults_release_handle(handle);
// Nullable PublicClass_PublicStructWithInternalDefaults
final _smoke_PublicClass_PublicStructWithInternalDefaults_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStructWithInternalDefaults_create_handle_nullable');
final _smoke_PublicClass_PublicStructWithInternalDefaults_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStructWithInternalDefaults_release_handle_nullable');
final _smoke_PublicClass_PublicStructWithInternalDefaults_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PublicClass_PublicStructWithInternalDefaults_get_value_nullable');
Pointer<Void> smoke_PublicClass_PublicStructWithInternalDefaults_toFfi_nullable(PublicClass_PublicStructWithInternalDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicClass_PublicStructWithInternalDefaults_toFfi(value);
  final result = _smoke_PublicClass_PublicStructWithInternalDefaults_create_handle_nullable(_handle);
  smoke_PublicClass_PublicStructWithInternalDefaults_releaseFfiHandle(_handle);
  return result;
}
PublicClass_PublicStructWithInternalDefaults smoke_PublicClass_PublicStructWithInternalDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicClass_PublicStructWithInternalDefaults_get_value_nullable(handle);
  final result = smoke_PublicClass_PublicStructWithInternalDefaults_fromFfi(_handle);
  smoke_PublicClass_PublicStructWithInternalDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicClass_PublicStructWithInternalDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicClass_PublicStructWithInternalDefaults_release_handle_nullable(handle);
// End of PublicClass_PublicStructWithInternalDefaults "private" section.
