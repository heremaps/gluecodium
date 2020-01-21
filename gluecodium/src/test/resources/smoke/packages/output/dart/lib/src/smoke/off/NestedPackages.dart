import 'package:library/src/String__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_off_NestedPackages_release_handle');
class NestedPackages {
  final Pointer<Void> _handle;
  NestedPackages._(this._handle);
  void release() => __release_handle(_handle);
  static NestedPackages_SomeStruct basicMethod(NestedPackages_SomeStruct input) {
    final _basicMethod_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_off_NestedPackages_basicMethod__SomeStruct');
    final _input_handle = smoke_off_NestedPackages_SomeStruct_toFfi(input);
    final __result_handle = _basicMethod_ffi(_input_handle);
    smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(_input_handle);
    final _result = smoke_off_NestedPackages_SomeStruct_fromFfi(__result_handle);
    smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_off_NestedPackages_toFfi(NestedPackages value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
NestedPackages smoke_off_NestedPackages_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? NestedPackages._(handle) : null;
void smoke_off_NestedPackages_releaseFfiHandle(Pointer<Void> handle) {}
class NestedPackages_SomeStruct {
  String someField;
  NestedPackages_SomeStruct(this.someField);
}
// NestedPackages_SomeStruct "private" section, not exported.
final _smoke_off_NestedPackages_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_off_NestedPackages_SomeStruct_create_handle');
final _smoke_off_NestedPackages_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_off_NestedPackages_SomeStruct_release_handle');
final _smoke_off_NestedPackages_SomeStruct_get_field_someField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_off_NestedPackages_SomeStruct_get_field_someField');
Pointer<Void> smoke_off_NestedPackages_SomeStruct_toFfi(NestedPackages_SomeStruct value) {
  final _someField_handle = String_toFfi(value.someField);
  final _result = _smoke_off_NestedPackages_SomeStruct_create_handle(_someField_handle);
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
NestedPackages_SomeStruct smoke_off_NestedPackages_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_off_NestedPackages_SomeStruct_get_field_someField(handle);
  final _result = NestedPackages_SomeStruct(
    String_fromFfi(_someField_handle)
  );
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
void smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_off_NestedPackages_SomeStruct_release_handle(handle);
// End of NestedPackages_SomeStruct "private" section.
