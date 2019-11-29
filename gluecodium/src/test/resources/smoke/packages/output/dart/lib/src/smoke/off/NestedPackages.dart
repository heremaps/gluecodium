import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
import 'package:library/src/smoke/off/SomeStruct.dart';
class NestedPackages {
  class SomeStruct {
    String someField;
  }
  static SomeStruct basicMethod(SomeStruct input) {
    final _basicMethod_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_off_NestedPackages_basicMethod__SomeStruct');
    final _input_handle = __lib.smoke_off_SomeStruct_toFfi(input);
    final _result_handle = _basicMethod_ffi(_input_handle);
    final _result = __lib.smoke_off_SomeStruct_fromFfi(_result_handle);
    __lib.smoke_off_SomeStruct_releaseFfiHandle(_result_handle);
    __lib.smoke_off_SomeStruct_releaseFfiHandle(_input_handle);
    return _result;
  }
}
