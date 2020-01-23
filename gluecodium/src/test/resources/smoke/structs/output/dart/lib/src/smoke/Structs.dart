import 'package:library/src/smoke/AllTypesStruct__conversion.dart';
import 'package:library/src/smoke/Point__conversion.dart';
import 'package:library/src/smoke/Structs_AllTypesStruct__conversion.dart';
import 'package:library/src/smoke/Structs_AnotherExternalStruct__conversion.dart';
import 'package:library/src/smoke/Structs_ExternalStruct__conversion.dart';
import 'package:library/src/smoke/Structs_Point__conversion.dart';
import 'package:library/src/smoke/Structs_YetAnotherExternalStruct__conversion.dart';
import 'package:library/src/smoke/TypeCollection.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_release_handle');
class Structs {
  final Pointer<Void> _handle;
  Structs._(this._handle);
  void release() => __release_handle(_handle);
  static Structs_Point swapPointCoordinates(Structs_Point input) {
    final _swapPointCoordinates_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Structs_swapPointCoordinates__Point');
    final _input_handle = smoke_Structs_Point_toFfi(input);
    final __result_handle = _swapPointCoordinates_ffi(_input_handle);
    smoke_Structs_Point_releaseFfiHandle(_input_handle);
    final _result = smoke_Structs_Point_fromFfi(__result_handle);
    smoke_Structs_Point_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Structs_AllTypesStruct returnAllTypesStruct(Structs_AllTypesStruct input) {
    final _returnAllTypesStruct_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Structs_returnAllTypesStruct__AllTypesStruct');
    final _input_handle = smoke_Structs_AllTypesStruct_toFfi(input);
    final __result_handle = _returnAllTypesStruct_ffi(_input_handle);
    smoke_Structs_AllTypesStruct_releaseFfiHandle(_input_handle);
    final _result = smoke_Structs_AllTypesStruct_fromFfi(__result_handle);
    smoke_Structs_AllTypesStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Structs_ExternalStruct getExternalStruct() {
    final _getExternalStruct_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Structs_getExternalStruct');
    final __result_handle = _getExternalStruct_ffi();
    final _result = smoke_Structs_ExternalStruct_fromFfi(__result_handle);
    smoke_Structs_ExternalStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Structs_AnotherExternalStruct getAnotherExternalStruct() {
    final _getAnotherExternalStruct_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Structs_getAnotherExternalStruct');
    final __result_handle = _getAnotherExternalStruct_ffi();
    final _result = smoke_Structs_AnotherExternalStruct_fromFfi(__result_handle);
    smoke_Structs_AnotherExternalStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Structs_YetAnotherExternalStruct getYetAnotherExternalStruct() {
    final _getYetAnotherExternalStruct_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Structs_getYetAnotherExternalStruct');
    final __result_handle = _getYetAnotherExternalStruct_ffi();
    final _result = smoke_Structs_YetAnotherExternalStruct_fromFfi(__result_handle);
    smoke_Structs_YetAnotherExternalStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Point createPoint(double x, double y) {
    final _createPoint_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Double, Double), Pointer<Void> Function(double, double)>('smoke_Structs_createPoint__Double_Double');
    final _x_handle = (x);
    final _y_handle = (y);
    final __result_handle = _createPoint_ffi(_x_handle, _y_handle);
    (_x_handle);
    (_y_handle);
    final _result = smoke_TypeCollection_Point_fromFfi(__result_handle);
    smoke_TypeCollection_Point_releaseFfiHandle(__result_handle);
    return _result;
  }
  static AllTypesStruct modifyAllTypesStruct(AllTypesStruct input) {
    final _modifyAllTypesStruct_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Structs_modifyAllTypesStruct__AllTypesStruct');
    final _input_handle = smoke_TypeCollection_AllTypesStruct_toFfi(input);
    final __result_handle = _modifyAllTypesStruct_ffi(_input_handle);
    smoke_TypeCollection_AllTypesStruct_releaseFfiHandle(_input_handle);
    final _result = smoke_TypeCollection_AllTypesStruct_fromFfi(__result_handle);
    smoke_TypeCollection_AllTypesStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_Structs_toFfi(Structs value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
Structs smoke_Structs_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? Structs._(handle) : null;
void smoke_Structs_releaseFfiHandle(Pointer<Void> handle) {}
enum Structs_FooBar {
    foo,
    bar
}
class Structs_Point {
  double x;
  double y;
  Structs_Point(this.x, this.y);
}
class Structs_Line {
  Structs_Point a;
  Structs_Point b;
  Structs_Line(this.a, this.b);
}
class Structs_AllTypesStruct {
  final int int8Field;
  final int uint8Field;
  final int int16Field;
  final int uint16Field;
  final int int32Field;
  final int uint32Field;
  final int int64Field;
  final int uint64Field;
  final double floatField;
  final double doubleField;
  final String stringField;
  final bool booleanField;
  final List<int> bytesField;
  final Structs_Point pointField;
  Structs_AllTypesStruct(this.int8Field, this.uint8Field, this.int16Field, this.uint16Field, this.int32Field, this.uint32Field, this.int64Field, this.uint64Field, this.floatField, this.doubleField, this.stringField, this.booleanField, this.bytesField, this.pointField);
}
class Structs_ExternalStruct {
  String stringField;
  String externalStringField;
  List<int> externalArrayField;
  Structs_AnotherExternalStruct externalStructField;
  Structs_ExternalStruct(this.stringField, this.externalStringField, this.externalArrayField, this.externalStructField);
}
class Structs_AnotherExternalStruct {
  int intField;
  Structs_AnotherExternalStruct(this.intField);
}
class Structs_YetAnotherExternalStruct {
  String stringField;
  Structs_YetAnotherExternalStruct(this.stringField);
}
class Structs_NestingImmutableStruct {
  Structs_AllTypesStruct structField;
  Structs_NestingImmutableStruct(this.structField);
}
class Structs_DoubleNestingImmutableStruct {
  Structs_NestingImmutableStruct nestingStructField;
  Structs_DoubleNestingImmutableStruct(this.nestingStructField);
}
class Structs_StructWithArrayOfImmutable {
  List<Structs_AllTypesStruct> arrayField;
  Structs_StructWithArrayOfImmutable(this.arrayField);
}
class Structs_ImmutableStructWithCppAccessors {
  final String stringField;
  Structs_ImmutableStructWithCppAccessors(this.stringField);
}
class Structs_MutableStructWithCppAccessors {
  String stringField;
  Structs_MutableStructWithCppAccessors(this.stringField);
}
