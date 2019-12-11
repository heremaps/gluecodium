import 'package:library/src/_library_init.dart' as __lib;
import 'package:library/src/smoke/off/NestedPackages_SomeStruct__conversion.dart';
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
    final _input_handle = smoke_off_NestedPackages_1SomeStruct_toFfi(input);
    final __result_handle = _basicMethod_ffi(_input_handle);
    final _result = smoke_off_NestedPackages_1SomeStruct_fromFfi(__result_handle);
    smoke_off_NestedPackages_1SomeStruct_releaseFfiHandle(__result_handle);
    smoke_off_NestedPackages_1SomeStruct_releaseFfiHandle(_input_handle);
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
