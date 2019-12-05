import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
import 'package:library/src/smoke/off/NestedPackages_SomeStruct__conversion.dart' as __lib;
class NestedPackages {
  static NestedPackages_SomeStruct basicMethod(NestedPackages_SomeStruct input) {
    final _basicMethod_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_off_NestedPackages_basicMethod__SomeStruct');
    final _input_handle = __lib.smoke_off_NestedPackages_SomeStruct_toFfi(input);
    final __result_handle = _basicMethod_ffi(_input_handle);
    final _result = __lib.smoke_off_NestedPackages_SomeStruct_fromFfi(__result_handle);
    __lib.smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(__result_handle);
    __lib.smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(_input_handle);
    return _result;
  }
}
class NestedPackages_SomeStruct {
  String someField;
  NestedPackages_SomeStruct(this.someField);
}
