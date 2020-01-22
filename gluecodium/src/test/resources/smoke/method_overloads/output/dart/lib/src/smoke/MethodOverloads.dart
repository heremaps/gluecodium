import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/String__conversion.dart';
import 'package:library/src/smoke/MethodOverloads_Point__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_MethodOverloads_release_handle');
class MethodOverloads {
  final Pointer<Void> _handle;
  MethodOverloads._(this._handle);
  void release() => __release_handle(_handle);
  bool isBoolean(bool input) {
    final _isBoolean_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Uint8), int Function(Pointer<Void>, int)>('smoke_MethodOverloads_isBoolean__Boolean');
    final _input_handle = Boolean_toFfi(input);
    final __result_handle = _isBoolean_ffi(_handle, _input_handle);
    Boolean_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  bool isBooleanByte(int input) {
    final _isBooleanByte_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int8), int Function(Pointer<Void>, int)>('smoke_MethodOverloads_isBoolean__Byte');
    final _input_handle = (input);
    final __result_handle = _isBooleanByte_ffi(_handle, _input_handle);
    (_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  bool isBooleanString(String input) {
    final _isBooleanString_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, Pointer<Void>)>('smoke_MethodOverloads_isBoolean__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _isBooleanString_ffi(_handle, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  bool isBooleanPoint(MethodOverloads_Point input) {
    final _isBooleanPoint_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, Pointer<Void>)>('smoke_MethodOverloads_isBoolean__Point');
    final _input_handle = smoke_MethodOverloads_Point_toFfi(input);
    final __result_handle = _isBooleanPoint_ffi(_handle, _input_handle);
    smoke_MethodOverloads_Point_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  bool isBooleanMulti(bool input1, int input2, String input3, MethodOverloads_Point input4) {
    final _isBooleanMulti_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Uint8, Int8, Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, int, int, Pointer<Void>, Pointer<Void>)>('smoke_MethodOverloads_isBoolean__Boolean_Byte_String_Point');
    final _input1_handle = Boolean_toFfi(input1);
    final _input2_handle = (input2);
    final _input3_handle = String_toFfi(input3);
    final _input4_handle = smoke_MethodOverloads_Point_toFfi(input4);
    final __result_handle = _isBooleanMulti_ffi(_handle, _input1_handle, _input2_handle, _input3_handle, _input4_handle);
    Boolean_releaseFfiHandle(_input1_handle);
    (_input2_handle);
    String_releaseFfiHandle(_input3_handle);
    smoke_MethodOverloads_Point_releaseFfiHandle(_input4_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  bool isBooleanStringArray(List<String> input) {
    final _isBooleanStringArray_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, Pointer<Void>)>('smoke_MethodOverloads_isBoolean__ListOf_1String');
    final _input_handle = ListOf_String_toFfi(input);
    final __result_handle = _isBooleanStringArray_ffi(_handle, _input_handle);
    ListOf_String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  bool isBooleanIntArray(List<int> input) {
    final _isBooleanIntArray_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, Pointer<Void>)>('smoke_MethodOverloads_isBoolean__ListOf_1Byte');
    final _input_handle = ListOf_Byte_toFfi(input);
    final __result_handle = _isBooleanIntArray_ffi(_handle, _input_handle);
    ListOf_Byte_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  bool isBooleanConst() {
    final _isBooleanConst_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>), int Function(Pointer<Void>)>('smoke_MethodOverloads_isBoolean');
    final __result_handle = _isBooleanConst_ffi(_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  bool isFloatString(String input) {
    final _isFloatString_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, Pointer<Void>)>('smoke_MethodOverloads_isFloat__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _isFloatString_ffi(_handle, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  bool isFloatList(List<int> input) {
    final _isFloatList_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, Pointer<Void>)>('smoke_MethodOverloads_isFloat__ListOf_1Byte');
    final _input_handle = ListOf_Byte_toFfi(input);
    final __result_handle = _isFloatList_ffi(_handle, _input_handle);
    ListOf_Byte_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_MethodOverloads_toFfi(MethodOverloads value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
MethodOverloads smoke_MethodOverloads_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? MethodOverloads._(handle) : null;
void smoke_MethodOverloads_releaseFfiHandle(Pointer<Void> handle) {}
class MethodOverloads_Point {
  double x;
  double y;
  MethodOverloads_Point(this.x, this.y);
}
