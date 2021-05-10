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
Pointer<Void> smoke_StructWithInterface_toFfi(StructWithInterface value) {
  final _interfaceInstanceHandle = smoke_SimpleInterface_toFfi(value.interfaceInstance);
  final _result = _smokeStructwithinterfaceCreateHandle(_interfaceInstanceHandle);
  smoke_SimpleInterface_releaseFfiHandle(_interfaceInstanceHandle);
  return _result;
}
StructWithInterface smoke_StructWithInterface_fromFfi(Pointer<Void> handle) {
  final _interfaceInstanceHandle = _smokeStructwithinterfaceGetFieldinterfaceInstance(handle);
  try {
    return StructWithInterface(
      smoke_SimpleInterface_fromFfi(_interfaceInstanceHandle)
    );
  } finally {
    smoke_SimpleInterface_releaseFfiHandle(_interfaceInstanceHandle);
  }
}
void smoke_StructWithInterface_releaseFfiHandle(Pointer<Void> handle) => _smokeStructwithinterfaceReleaseHandle(handle);
// Nullable StructWithInterface
final _smoke_StructWithInterfaceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInterface_create_handle_nullable'));
final _smoke_StructWithInterfaceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithInterface_release_handle_nullable'));
final _smoke_StructWithInterfaceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithInterface_get_value_nullable'));
Pointer<Void> smoke_StructWithInterface_toFfi_nullable(StructWithInterface value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithInterface_toFfi(value);
  final result = _smoke_StructWithInterfaceCreateHandleNullable(_handle);
  smoke_StructWithInterface_releaseFfiHandle(_handle);
  return result;
}
StructWithInterface smoke_StructWithInterface_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithInterfaceGetValueNullable(handle);
  final result = smoke_StructWithInterface_fromFfi(_handle);
  smoke_StructWithInterface_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithInterfaceReleaseHandleNullable(handle);
// End of StructWithInterface "private" section.
