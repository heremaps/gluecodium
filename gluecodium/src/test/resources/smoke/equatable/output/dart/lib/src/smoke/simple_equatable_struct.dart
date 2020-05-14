import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:library/src/smoke/non_equatable_class.dart';
import 'package:library/src/smoke/non_equatable_interface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class SimpleEquatableStruct {
  NonEquatableClass classField;
  NonEquatableInterface interfaceField;
  NonEquatableClass nullableClassField;
  NonEquatableInterface nullableInterfaceField;
  SimpleEquatableStruct(this.classField, this.interfaceField, this.nullableClassField, this.nullableInterfaceField);
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! SimpleEquatableStruct) return false;
    SimpleEquatableStruct _other = other;
    return classField == _other.classField &&
        interfaceField == _other.interfaceField &&
        nullableClassField == _other.nullableClassField &&
        nullableInterfaceField == _other.nullableInterfaceField;
  }
  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + classField.hashCode;
    result = 31 * result + interfaceField.hashCode;
    result = 31 * result + nullableClassField.hashCode;
    result = 31 * result + nullableInterfaceField.hashCode;
    return result;
  }
}
// SimpleEquatableStruct "private" section, not exported.
final _smoke_SimpleEquatableStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_create_handle');
final _smoke_SimpleEquatableStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_release_handle');
final _smoke_SimpleEquatableStruct_get_field_classField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_get_field_classField');
final _smoke_SimpleEquatableStruct_get_field_interfaceField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_get_field_interfaceField');
final _smoke_SimpleEquatableStruct_get_field_nullableClassField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_get_field_nullableClassField');
final _smoke_SimpleEquatableStruct_get_field_nullableInterfaceField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_get_field_nullableInterfaceField');
Pointer<Void> smoke_SimpleEquatableStruct_toFfi(SimpleEquatableStruct value) {
  final _classField_handle = smoke_NonEquatableClass_toFfi(value.classField);
  final _interfaceField_handle = smoke_NonEquatableInterface_toFfi(value.interfaceField);
  final _nullableClassField_handle = smoke_NonEquatableClass_toFfi_nullable(value.nullableClassField);
  final _nullableInterfaceField_handle = smoke_NonEquatableInterface_toFfi_nullable(value.nullableInterfaceField);
  final _result = _smoke_SimpleEquatableStruct_create_handle(_classField_handle, _interfaceField_handle, _nullableClassField_handle, _nullableInterfaceField_handle);
  smoke_NonEquatableClass_releaseFfiHandle(_classField_handle);
  smoke_NonEquatableInterface_releaseFfiHandle(_interfaceField_handle);
  smoke_NonEquatableClass_releaseFfiHandle_nullable(_nullableClassField_handle);
  smoke_NonEquatableInterface_releaseFfiHandle_nullable(_nullableInterfaceField_handle);
  return _result;
}
SimpleEquatableStruct smoke_SimpleEquatableStruct_fromFfi(Pointer<Void> handle) {
  final _classField_handle = _smoke_SimpleEquatableStruct_get_field_classField(handle);
  final _interfaceField_handle = _smoke_SimpleEquatableStruct_get_field_interfaceField(handle);
  final _nullableClassField_handle = _smoke_SimpleEquatableStruct_get_field_nullableClassField(handle);
  final _nullableInterfaceField_handle = _smoke_SimpleEquatableStruct_get_field_nullableInterfaceField(handle);
  final _result = SimpleEquatableStruct(
    smoke_NonEquatableClass_fromFfi(_classField_handle),
    smoke_NonEquatableInterface_fromFfi(_interfaceField_handle),
    smoke_NonEquatableClass_fromFfi_nullable(_nullableClassField_handle),
    smoke_NonEquatableInterface_fromFfi_nullable(_nullableInterfaceField_handle)
  );
  smoke_NonEquatableClass_releaseFfiHandle(_classField_handle);
  smoke_NonEquatableInterface_releaseFfiHandle(_interfaceField_handle);
  smoke_NonEquatableClass_releaseFfiHandle_nullable(_nullableClassField_handle);
  smoke_NonEquatableInterface_releaseFfiHandle_nullable(_nullableInterfaceField_handle);
  return _result;
}
void smoke_SimpleEquatableStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_SimpleEquatableStruct_release_handle(handle);
// Nullable SimpleEquatableStruct
final _smoke_SimpleEquatableStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_create_handle_nullable');
final _smoke_SimpleEquatableStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_release_handle_nullable');
final _smoke_SimpleEquatableStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_get_value_nullable');
Pointer<Void> smoke_SimpleEquatableStruct_toFfi_nullable(SimpleEquatableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_SimpleEquatableStruct_toFfi(value);
  final result = _smoke_SimpleEquatableStruct_create_handle_nullable(_handle);
  smoke_SimpleEquatableStruct_releaseFfiHandle(_handle);
  return result;
}
SimpleEquatableStruct smoke_SimpleEquatableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_SimpleEquatableStruct_get_value_nullable(handle);
  final result = smoke_SimpleEquatableStruct_fromFfi(_handle);
  smoke_SimpleEquatableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_SimpleEquatableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SimpleEquatableStruct_release_handle_nullable(handle);
// End of SimpleEquatableStruct "private" section.
