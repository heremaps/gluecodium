import 'package:library/src/smoke/simple_interface.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class StructWithInterface {
  SimpleInterface interfaceInstance;
  StructWithInterface(this.interfaceInstance);
}
// StructWithInterface "private" section, not exported.
final _smokeStructwithinterfaceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInterface_create_handle'));
final _smokeStructwithinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithInterface_release_handle'));
final _smokeStructwithinterfaceGetFieldinterfaceInstance = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInterface_get_field_interfaceInstance'));
Pointer<Void> smokeStructwithinterfaceToFfi(StructWithInterface value) {
  final _interfaceInstanceHandle = smokeSimpleinterfaceToFfi(value.interfaceInstance);
  final _result = _smokeStructwithinterfaceCreateHandle(_interfaceInstanceHandle);
  smokeSimpleinterfaceReleaseFfiHandle(_interfaceInstanceHandle);
  return _result;
}
StructWithInterface smokeStructwithinterfaceFromFfi(Pointer<Void> handle) {
  final _interfaceInstanceHandle = _smokeStructwithinterfaceGetFieldinterfaceInstance(handle);
  try {
    return StructWithInterface(
      smokeSimpleinterfaceFromFfi(_interfaceInstanceHandle)
    );
  } finally {
    smokeSimpleinterfaceReleaseFfiHandle(_interfaceInstanceHandle);
  }
}
void smokeStructwithinterfaceReleaseFfiHandle(Pointer<Void> handle) => _smokeStructwithinterfaceReleaseHandle(handle);
// Nullable StructWithInterface
final _smokeStructwithinterfaceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInterface_create_handle_nullable'));
final _smokeStructwithinterfaceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithInterface_release_handle_nullable'));
final _smokeStructwithinterfaceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInterface_get_value_nullable'));
Pointer<Void> smokeStructwithinterfaceToFfiNullable(StructWithInterface? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructwithinterfaceToFfi(value);
  final result = _smokeStructwithinterfaceCreateHandleNullable(_handle);
  smokeStructwithinterfaceReleaseFfiHandle(_handle);
  return result;
}
StructWithInterface? smokeStructwithinterfaceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructwithinterfaceGetValueNullable(handle);
  final result = smokeStructwithinterfaceFromFfi(_handle);
  smokeStructwithinterfaceReleaseFfiHandle(_handle);
  return result;
}
void smokeStructwithinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructwithinterfaceReleaseHandleNullable(handle);
// End of StructWithInterface "private" section.
