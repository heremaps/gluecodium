import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/String__conversion.dart';
import 'package:library/src/_library_init.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_BasicTypes_release_handle');
class BasicTypes {
  final Pointer<Void> _handle;
  BasicTypes._(this._handle);
  void release() => __release_handle(_handle);
  static String stringFunction(String input) {
    final _stringFunction_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_BasicTypes_stringFunction__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _stringFunction_ffi(_input_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    String_releaseFfiHandle(_input_handle);
    return _result;
  }
  static bool boolFunction(bool input) {
    final _boolFunction_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Uint8), int Function(int)>('smoke_BasicTypes_boolFunction__Boolean');
    final _input_handle = Boolean_toFfi(input);
    final __result_handle = _boolFunction_ffi(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    Boolean_releaseFfiHandle(_input_handle);
    return _result;
  }
  static double floatFunction(double input) {
    final _floatFunction_ffi = __lib.nativeLibrary.lookupFunction<Float Function(Float), double Function(double)>('smoke_BasicTypes_floatFunction__Float');
    final _input_handle = (input);
    final __result_handle = _floatFunction_ffi(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    (_input_handle);
    return _result;
  }
  static double doubleFunction(double input) {
    final _doubleFunction_ffi = __lib.nativeLibrary.lookupFunction<Double Function(Double), double Function(double)>('smoke_BasicTypes_doubleFunction__Double');
    final _input_handle = (input);
    final __result_handle = _doubleFunction_ffi(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    (_input_handle);
    return _result;
  }
  static int byteFunction(int input) {
    final _byteFunction_ffi = __lib.nativeLibrary.lookupFunction<Int8 Function(Int8), int Function(int)>('smoke_BasicTypes_byteFunction__Byte');
    final _input_handle = (input);
    final __result_handle = _byteFunction_ffi(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    (_input_handle);
    return _result;
  }
  static int shortFunction(int input) {
    final _shortFunction_ffi = __lib.nativeLibrary.lookupFunction<Int16 Function(Int16), int Function(int)>('smoke_BasicTypes_shortFunction__Short');
    final _input_handle = (input);
    final __result_handle = _shortFunction_ffi(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    (_input_handle);
    return _result;
  }
  static int intFunction(int input) {
    final _intFunction_ffi = __lib.nativeLibrary.lookupFunction<Int32 Function(Int32), int Function(int)>('smoke_BasicTypes_intFunction__Int');
    final _input_handle = (input);
    final __result_handle = _intFunction_ffi(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    (_input_handle);
    return _result;
  }
  static int longFunction(int input) {
    final _longFunction_ffi = __lib.nativeLibrary.lookupFunction<Int64 Function(Int64), int Function(int)>('smoke_BasicTypes_longFunction__Long');
    final _input_handle = (input);
    final __result_handle = _longFunction_ffi(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    (_input_handle);
    return _result;
  }
  static int ubyteFunction(int input) {
    final _ubyteFunction_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Uint8), int Function(int)>('smoke_BasicTypes_ubyteFunction__UByte');
    final _input_handle = (input);
    final __result_handle = _ubyteFunction_ffi(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    (_input_handle);
    return _result;
  }
  static int ushortFunction(int input) {
    final _ushortFunction_ffi = __lib.nativeLibrary.lookupFunction<Uint16 Function(Uint16), int Function(int)>('smoke_BasicTypes_ushortFunction__UShort');
    final _input_handle = (input);
    final __result_handle = _ushortFunction_ffi(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    (_input_handle);
    return _result;
  }
  static int uintFunction(int input) {
    final _uintFunction_ffi = __lib.nativeLibrary.lookupFunction<Uint32 Function(Uint32), int Function(int)>('smoke_BasicTypes_uintFunction__UInt');
    final _input_handle = (input);
    final __result_handle = _uintFunction_ffi(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    (_input_handle);
    return _result;
  }
  static int ulongFunction(int input) {
    final _ulongFunction_ffi = __lib.nativeLibrary.lookupFunction<Uint64 Function(Uint64), int Function(int)>('smoke_BasicTypes_ulongFunction__ULong');
    final _input_handle = (input);
    final __result_handle = _ulongFunction_ffi(_input_handle);
    final _result = (__result_handle);
    (__result_handle);
    (_input_handle);
    return _result;
  }
}
Pointer<Void> smoke_BasicTypes_toFfi(BasicTypes value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
BasicTypes smoke_BasicTypes_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? BasicTypes._(handle) : null;
void smoke_BasicTypes_releaseFfiHandle(Pointer<Void> handle) {}
