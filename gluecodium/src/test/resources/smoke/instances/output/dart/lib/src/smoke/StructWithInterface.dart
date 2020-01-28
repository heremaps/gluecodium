import 'package:library/src/smoke/SimpleInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
class StructWithInterface {
  SimpleInterface interfaceInstance;
  StructWithInterface(this.interfaceInstance);
}
// StructWithInterface "private" section, not exported.
final _smoke_StructWithInterface_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructWithInterface_create_handle');
final _smoke_StructWithInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_StructWithInterface_release_handle');
final _smoke_StructWithInterface_get_field_interfaceInstance = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructWithInterface_get_field_interfaceInstance');
Pointer<Void> smoke_StructWithInterface_toFfi(StructWithInterface value) {
  final _interfaceInstance_handle = smoke_SimpleInterface_toFfi(value.interfaceInstance);
  final _result = _smoke_StructWithInterface_create_handle(_interfaceInstance_handle);
  smoke_SimpleInterface_releaseFfiHandle(_interfaceInstance_handle);
  return _result;
}
StructWithInterface smoke_StructWithInterface_fromFfi(Pointer<Void> handle) {
  final _interfaceInstance_handle = _smoke_StructWithInterface_get_field_interfaceInstance(handle);
  final _result = StructWithInterface(
    smoke_SimpleInterface_fromFfi(_interfaceInstance_handle)
  );
  smoke_SimpleInterface_releaseFfiHandle(_interfaceInstance_handle);
  return _result;
}
void smoke_StructWithInterface_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructWithInterface_release_handle(handle);
// End of StructWithInterface "private" section.
