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
Pointer<Void> smokeSimpleequatablestructToFfi(SimpleEquatableStruct value) {
  final _classFieldHandle = smokeNonequatableclassToFfi(value.classField);
  final _interfaceFieldHandle = smokeNonequatableinterfaceToFfi(value.interfaceField);
  final _nullableClassFieldHandle = smokeNonequatableclassToFfiNullable(value.nullableClassField);
  final _nullableInterfaceFieldHandle = smokeNonequatableinterfaceToFfiNullable(value.nullableInterfaceField);
  final _result = _smokeSimpleequatablestructCreateHandle(_classFieldHandle, _interfaceFieldHandle, _nullableClassFieldHandle, _nullableInterfaceFieldHandle);
  smokeNonequatableclassReleaseFfiHandle(_classFieldHandle);
  smokeNonequatableinterfaceReleaseFfiHandle(_interfaceFieldHandle);
  smokeNonequatableclassReleaseFfiHandleNullable(_nullableClassFieldHandle);
  smokeNonequatableinterfaceReleaseFfiHandleNullable(_nullableInterfaceFieldHandle);
  return _result;
}
SimpleEquatableStruct smokeSimpleequatablestructFromFfi(Pointer<Void> handle) {
  final _classFieldHandle = _smokeSimpleequatablestructGetFieldclassField(handle);
  final _interfaceFieldHandle = _smokeSimpleequatablestructGetFieldinterfaceField(handle);
  final _nullableClassFieldHandle = _smokeSimpleequatablestructGetFieldnullableClassField(handle);
  final _nullableInterfaceFieldHandle = _smokeSimpleequatablestructGetFieldnullableInterfaceField(handle);
  try {
    return SimpleEquatableStruct(
      smokeNonequatableclassFromFfi(_classFieldHandle),
      smokeNonequatableinterfaceFromFfi(_interfaceFieldHandle),
      smokeNonequatableclassFromFfiNullable(_nullableClassFieldHandle),
      smokeNonequatableinterfaceFromFfiNullable(_nullableInterfaceFieldHandle)
    );
  } finally {
    smokeNonequatableclassReleaseFfiHandle(_classFieldHandle);
    smokeNonequatableinterfaceReleaseFfiHandle(_interfaceFieldHandle);
    smokeNonequatableclassReleaseFfiHandleNullable(_nullableClassFieldHandle);
    smokeNonequatableinterfaceReleaseFfiHandleNullable(_nullableInterfaceFieldHandle);
  }
}
void smokeSimpleequatablestructReleaseFfiHandle(Pointer<Void> handle) => _smokeSimpleequatablestructReleaseHandle(handle);
// Nullable SimpleEquatableStruct
final _smokeSimpleequatablestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_create_handle_nullable'));
final _smokeSimpleequatablestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_release_handle_nullable'));
final _smokeSimpleequatablestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleEquatableStruct_get_value_nullable'));
Pointer<Void> smokeSimpleequatablestructToFfiNullable(SimpleEquatableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeSimpleequatablestructToFfi(value);
  final result = _smokeSimpleequatablestructCreateHandleNullable(_handle);
  smokeSimpleequatablestructReleaseFfiHandle(_handle);
  return result;
}
SimpleEquatableStruct smokeSimpleequatablestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeSimpleequatablestructGetValueNullable(handle);
  final result = smokeSimpleequatablestructFromFfi(_handle);
  smokeSimpleequatablestructReleaseFfiHandle(_handle);
  return result;
}
void smokeSimpleequatablestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSimpleequatablestructReleaseHandleNullable(handle);
// End of SimpleEquatableStruct "private" section.
