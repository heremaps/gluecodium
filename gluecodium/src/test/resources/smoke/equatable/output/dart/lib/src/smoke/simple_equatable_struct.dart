import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:library/src/smoke/non_equatable_class.dart';
import 'package:library/src/smoke/non_equatable_interface.dart';
import 'dart:ffi';
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
final _smokeSimpleequatablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_create_handle'));
final _smokeSimpleequatablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_release_handle'));
final _smokeSimpleequatablestructGetFieldclassField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_get_field_classField'));
final _smokeSimpleequatablestructGetFieldinterfaceField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_get_field_interfaceField'));
final _smokeSimpleequatablestructGetFieldnullableClassField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_get_field_nullableClassField'));
final _smokeSimpleequatablestructGetFieldnullableInterfaceField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_get_field_nullableInterfaceField'));
Pointer<Void> smoke_SimpleEquatableStruct_toFfi(SimpleEquatableStruct value) {
  final _classFieldHandle = smoke_NonEquatableClass_toFfi(value.classField);
  final _interfaceFieldHandle = smoke_NonEquatableInterface_toFfi(value.interfaceField);
  final _nullableClassFieldHandle = smoke_NonEquatableClass_toFfi_nullable(value.nullableClassField);
  final _nullableInterfaceFieldHandle = smoke_NonEquatableInterface_toFfi_nullable(value.nullableInterfaceField);
  final _result = _smokeSimpleequatablestructCreateHandle(_classFieldHandle, _interfaceFieldHandle, _nullableClassFieldHandle, _nullableInterfaceFieldHandle);
  smoke_NonEquatableClass_releaseFfiHandle(_classFieldHandle);
  smoke_NonEquatableInterface_releaseFfiHandle(_interfaceFieldHandle);
  smoke_NonEquatableClass_releaseFfiHandle_nullable(_nullableClassFieldHandle);
  smoke_NonEquatableInterface_releaseFfiHandle_nullable(_nullableInterfaceFieldHandle);
  return _result;
}
SimpleEquatableStruct smoke_SimpleEquatableStruct_fromFfi(Pointer<Void> handle) {
  final _classFieldHandle = _smokeSimpleequatablestructGetFieldclassField(handle);
  final _interfaceFieldHandle = _smokeSimpleequatablestructGetFieldinterfaceField(handle);
  final _nullableClassFieldHandle = _smokeSimpleequatablestructGetFieldnullableClassField(handle);
  final _nullableInterfaceFieldHandle = _smokeSimpleequatablestructGetFieldnullableInterfaceField(handle);
  try {
    return SimpleEquatableStruct(
      smoke_NonEquatableClass_fromFfi(_classFieldHandle),
      smoke_NonEquatableInterface_fromFfi(_interfaceFieldHandle),
      smoke_NonEquatableClass_fromFfi_nullable(_nullableClassFieldHandle),
      smoke_NonEquatableInterface_fromFfi_nullable(_nullableInterfaceFieldHandle)
    );
  } finally {
    smoke_NonEquatableClass_releaseFfiHandle(_classFieldHandle);
    smoke_NonEquatableInterface_releaseFfiHandle(_interfaceFieldHandle);
    smoke_NonEquatableClass_releaseFfiHandle_nullable(_nullableClassFieldHandle);
    smoke_NonEquatableInterface_releaseFfiHandle_nullable(_nullableInterfaceFieldHandle);
  }
}
void smoke_SimpleEquatableStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeSimpleequatablestructReleaseHandle(handle);
// Nullable SimpleEquatableStruct
final _smoke_SimpleEquatableStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_create_handle_nullable'));
final _smoke_SimpleEquatableStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_release_handle_nullable'));
final _smoke_SimpleEquatableStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_get_value_nullable'));
Pointer<Void> smoke_SimpleEquatableStruct_toFfi_nullable(SimpleEquatableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_SimpleEquatableStruct_toFfi(value);
  final result = _smoke_SimpleEquatableStructCreateHandleNullable(_handle);
  smoke_SimpleEquatableStruct_releaseFfiHandle(_handle);
  return result;
}
SimpleEquatableStruct smoke_SimpleEquatableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_SimpleEquatableStructGetValueNullable(handle);
  final result = smoke_SimpleEquatableStruct_fromFfi(_handle);
  smoke_SimpleEquatableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_SimpleEquatableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SimpleEquatableStructReleaseHandleNullable(handle);
// End of SimpleEquatableStruct "private" section.
