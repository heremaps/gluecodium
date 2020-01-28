import 'package:library/src/smoke/SimpleClass.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
class StructWithClass {
  SimpleClass classInstance;
  StructWithClass(this.classInstance);
}
// StructWithClass "private" section, not exported.
final _smoke_StructWithClass_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructWithClass_create_handle');
final _smoke_StructWithClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_StructWithClass_release_handle');
final _smoke_StructWithClass_get_field_classInstance = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructWithClass_get_field_classInstance');
Pointer<Void> smoke_StructWithClass_toFfi(StructWithClass value) {
  final _classInstance_handle = smoke_SimpleClass_toFfi(value.classInstance);
  final _result = _smoke_StructWithClass_create_handle(_classInstance_handle);
  smoke_SimpleClass_releaseFfiHandle(_classInstance_handle);
  return _result;
}
StructWithClass smoke_StructWithClass_fromFfi(Pointer<Void> handle) {
  final _classInstance_handle = _smoke_StructWithClass_get_field_classInstance(handle);
  final _result = StructWithClass(
    smoke_SimpleClass_fromFfi(_classInstance_handle)
  );
  smoke_SimpleClass_releaseFfiHandle(_classInstance_handle);
  return _result;
}
void smoke_StructWithClass_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructWithClass_release_handle(handle);
// End of StructWithClass "private" section.
