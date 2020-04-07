import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;

abstract class MethodOverloads {
  void release();
  bool isBoolean(bool input);
  bool isBooleanByte(int input);
  bool isBooleanString(String input);
  bool isBooleanPoint(MethodOverloads_Point input);
  bool isBooleanMulti(bool input1, int input2, String input3, MethodOverloads_Point input4);
  bool isBooleanStringArray(List<String> input);
  bool isBooleanIntArray(List<int> input);
  bool isBooleanConst();
  bool isFloatString(String input);
  bool isFloatList(List<int> input);
}
class MethodOverloads_Point {
  double x;
  double y;
  MethodOverloads_Point(this.x, this.y);
}
// MethodOverloads_Point "private" section, not exported.
final _smoke_MethodOverloads_Point_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('library_smoke_MethodOverloads_Point_create_handle');
final _smoke_MethodOverloads_Point_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_release_handle');
final _smoke_MethodOverloads_Point_get_field_x = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_get_field_x');
final _smoke_MethodOverloads_Point_get_field_y = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_get_field_y');
Pointer<Void> smoke_MethodOverloads_Point_toFfi(MethodOverloads_Point value) {
  final _x_handle = (value.x);
  final _y_handle = (value.y);
  final _result = _smoke_MethodOverloads_Point_create_handle(_x_handle, _y_handle);
  (_x_handle);
  (_y_handle);
  return _result;
}
MethodOverloads_Point smoke_MethodOverloads_Point_fromFfi(Pointer<Void> handle) {
  final _x_handle = _smoke_MethodOverloads_Point_get_field_x(handle);
  final _y_handle = _smoke_MethodOverloads_Point_get_field_y(handle);
  final _result = MethodOverloads_Point(
    (_x_handle),
    (_y_handle)
  );
  (_x_handle);
  (_y_handle);
  return _result;
}
void smoke_MethodOverloads_Point_releaseFfiHandle(Pointer<Void> handle) => _smoke_MethodOverloads_Point_release_handle(handle);
// Nullable MethodOverloads_Point
final _smoke_MethodOverloads_Point_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_create_handle_nullable');
final _smoke_MethodOverloads_Point_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_release_handle_nullable');
final _smoke_MethodOverloads_Point_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_Point_get_value_nullable');
Pointer<Void> smoke_MethodOverloads_Point_toFfi_nullable(MethodOverloads_Point value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_MethodOverloads_Point_toFfi(value);
  final result = _smoke_MethodOverloads_Point_create_handle_nullable(_handle);
  smoke_MethodOverloads_Point_releaseFfiHandle(_handle);
  return result;
}
MethodOverloads_Point smoke_MethodOverloads_Point_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_MethodOverloads_Point_get_value_nullable(handle);
  final result = smoke_MethodOverloads_Point_fromFfi(_handle);
  smoke_MethodOverloads_Point_releaseFfiHandle(_handle);
  return result;
}
void smoke_MethodOverloads_Point_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_MethodOverloads_Point_release_handle_nullable(handle);
// End of MethodOverloads_Point "private" section.
// MethodOverloads "private" section, not exported.
final _smoke_MethodOverloads_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_copy_handle');
final _smoke_MethodOverloads_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_MethodOverloads_release_handle');
class MethodOverloads$Impl implements MethodOverloads {
  final Pointer<Void> handle;
  MethodOverloads$Impl(this.handle);
  @override
  void release() => _smoke_MethodOverloads_release_handle(handle);
  @override
  bool isBoolean(bool input) {
    final _isBoolean_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint8), int Function(Pointer<Void>, int, int)>('library_smoke_MethodOverloads_isBoolean__Boolean');
    final _input_handle = Boolean_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _isBoolean_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    Boolean_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool isBooleanByte(int input) {
    final _isBooleanByte_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Int8), int Function(Pointer<Void>, int, int)>('library_smoke_MethodOverloads_isBoolean__Byte');
    final _input_handle = (input);
    final _handle = this.handle;
    final __result_handle = _isBooleanByte_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    (_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool isBooleanString(String input) {
    final _isBooleanString_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _isBooleanString_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool isBooleanPoint(MethodOverloads_Point input) {
    final _isBooleanPoint_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__Point');
    final _input_handle = smoke_MethodOverloads_Point_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _isBooleanPoint_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    smoke_MethodOverloads_Point_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool isBooleanMulti(bool input1, int input2, String input3, MethodOverloads_Point input4) {
    final _isBooleanMulti_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint8, Int8, Pointer<Void>, Pointer<Void>), int Function(Pointer<Void>, int, int, int, Pointer<Void>, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__Boolean_Byte_String_Point');
    final _input1_handle = Boolean_toFfi(input1);
    final _input2_handle = (input2);
    final _input3_handle = String_toFfi(input3);
    final _input4_handle = smoke_MethodOverloads_Point_toFfi(input4);
    final _handle = this.handle;
    final __result_handle = _isBooleanMulti_ffi(_handle, __lib.LibraryContext.isolateId, _input1_handle, _input2_handle, _input3_handle, _input4_handle);
    Boolean_releaseFfiHandle(_input1_handle);
    (_input2_handle);
    String_releaseFfiHandle(_input3_handle);
    smoke_MethodOverloads_Point_releaseFfiHandle(_input4_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool isBooleanStringArray(List<String> input) {
    final _isBooleanStringArray_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__ListOf_1String');
    final _input_handle = ListOf_String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _isBooleanStringArray_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    ListOf_String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool isBooleanIntArray(List<int> input) {
    final _isBooleanIntArray_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isBoolean__ListOf_1Byte');
    final _input_handle = ListOf_Byte_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _isBooleanIntArray_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    ListOf_Byte_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool isBooleanConst() {
    final _isBooleanConst_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_MethodOverloads_isBoolean');
    final _handle = this.handle;
    final __result_handle = _isBooleanConst_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool isFloatString(String input) {
    final _isFloatString_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isFloat__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _isFloatString_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  bool isFloatList(List<int> input) {
    final _isFloatList_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_MethodOverloads_isFloat__ListOf_1Byte');
    final _input_handle = ListOf_Byte_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _isFloatList_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    ListOf_Byte_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_MethodOverloads_toFfi(MethodOverloads value) =>
  _smoke_MethodOverloads_copy_handle((value as MethodOverloads$Impl).handle);
MethodOverloads smoke_MethodOverloads_fromFfi(Pointer<Void> handle) =>
  MethodOverloads$Impl(_smoke_MethodOverloads_copy_handle(handle));
void smoke_MethodOverloads_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_MethodOverloads_release_handle(handle);
Pointer<Void> smoke_MethodOverloads_toFfi_nullable(MethodOverloads value) =>
  value != null ? smoke_MethodOverloads_toFfi(value) : Pointer<Void>.fromAddress(0);
MethodOverloads smoke_MethodOverloads_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_MethodOverloads_fromFfi(handle) : null;
void smoke_MethodOverloads_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_MethodOverloads_release_handle(handle);
// End of MethodOverloads "private" section.
