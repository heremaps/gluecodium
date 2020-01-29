import 'dart:typed_data';
import 'package:library/src/Blob__conversion.dart';
import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/String__conversion.dart';
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
// Structs_Point "private" section, not exported.
final _smoke_Structs_Point_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('smoke_Structs_Point_create_handle');
final _smoke_Structs_Point_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_Point_release_handle');
final _smoke_Structs_Point_get_field_x = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_Structs_Point_get_field_x');
final _smoke_Structs_Point_get_field_y = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_Structs_Point_get_field_y');
Pointer<Void> smoke_Structs_Point_toFfi(Structs_Point value) {
  final _x_handle = (value.x);
  final _y_handle = (value.y);
  final _result = _smoke_Structs_Point_create_handle(_x_handle, _y_handle);
  (_x_handle);
  (_y_handle);
  return _result;
}
Structs_Point smoke_Structs_Point_fromFfi(Pointer<Void> handle) {
  final _x_handle = _smoke_Structs_Point_get_field_x(handle);
  final _y_handle = _smoke_Structs_Point_get_field_y(handle);
  final _result = Structs_Point(
    (_x_handle),
    (_y_handle)
  );
  (_x_handle);
  (_y_handle);
  return _result;
}
void smoke_Structs_Point_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_Point_release_handle(handle);
// End of Structs_Point "private" section.
class Structs_Line {
  Structs_Point a;
  Structs_Point b;
  Structs_Line(this.a, this.b);
}
// Structs_Line "private" section, not exported.
final _smoke_Structs_Line_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('smoke_Structs_Line_create_handle');
final _smoke_Structs_Line_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_Line_release_handle');
final _smoke_Structs_Line_get_field_a = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_Line_get_field_a');
final _smoke_Structs_Line_get_field_b = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_Line_get_field_b');
Pointer<Void> smoke_Structs_Line_toFfi(Structs_Line value) {
  final _a_handle = smoke_Structs_Point_toFfi(value.a);
  final _b_handle = smoke_Structs_Point_toFfi(value.b);
  final _result = _smoke_Structs_Line_create_handle(_a_handle, _b_handle);
  smoke_Structs_Point_releaseFfiHandle(_a_handle);
  smoke_Structs_Point_releaseFfiHandle(_b_handle);
  return _result;
}
Structs_Line smoke_Structs_Line_fromFfi(Pointer<Void> handle) {
  final _a_handle = _smoke_Structs_Line_get_field_a(handle);
  final _b_handle = _smoke_Structs_Line_get_field_b(handle);
  final _result = Structs_Line(
    smoke_Structs_Point_fromFfi(_a_handle),
    smoke_Structs_Point_fromFfi(_b_handle)
  );
  smoke_Structs_Point_releaseFfiHandle(_a_handle);
  smoke_Structs_Point_releaseFfiHandle(_b_handle);
  return _result;
}
void smoke_Structs_Line_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_Line_release_handle(handle);
// End of Structs_Line "private" section.
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
  final Uint8List bytesField;
  final Structs_Point pointField;
  Structs_AllTypesStruct(this.int8Field, this.uint8Field, this.int16Field, this.uint16Field, this.int32Field, this.uint32Field, this.int64Field, this.uint64Field, this.floatField, this.doubleField, this.stringField, this.booleanField, this.bytesField, this.pointField);
}
// Structs_AllTypesStruct "private" section, not exported.
final _smoke_Structs_AllTypesStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float, Double, Pointer<Void>, Uint8, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, int, int, int, int, int, int, int, double, double, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_create_handle');
final _smoke_Structs_AllTypesStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_release_handle');
final _smoke_Structs_AllTypesStruct_get_field_int8Field = __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_int8Field');
final _smoke_Structs_AllTypesStruct_get_field_uint8Field = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_uint8Field');
final _smoke_Structs_AllTypesStruct_get_field_int16Field = __lib.nativeLibrary.lookupFunction<
    Int16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_int16Field');
final _smoke_Structs_AllTypesStruct_get_field_uint16Field = __lib.nativeLibrary.lookupFunction<
    Uint16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_uint16Field');
final _smoke_Structs_AllTypesStruct_get_field_int32Field = __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_int32Field');
final _smoke_Structs_AllTypesStruct_get_field_uint32Field = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_uint32Field');
final _smoke_Structs_AllTypesStruct_get_field_int64Field = __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_int64Field');
final _smoke_Structs_AllTypesStruct_get_field_uint64Field = __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_uint64Field');
final _smoke_Structs_AllTypesStruct_get_field_floatField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_floatField');
final _smoke_Structs_AllTypesStruct_get_field_doubleField = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_doubleField');
final _smoke_Structs_AllTypesStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_stringField');
final _smoke_Structs_AllTypesStruct_get_field_booleanField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_booleanField');
final _smoke_Structs_AllTypesStruct_get_field_bytesField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_bytesField');
final _smoke_Structs_AllTypesStruct_get_field_pointField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_pointField');
Pointer<Void> smoke_Structs_AllTypesStruct_toFfi(Structs_AllTypesStruct value) {
  final _int8Field_handle = (value.int8Field);
  final _uint8Field_handle = (value.uint8Field);
  final _int16Field_handle = (value.int16Field);
  final _uint16Field_handle = (value.uint16Field);
  final _int32Field_handle = (value.int32Field);
  final _uint32Field_handle = (value.uint32Field);
  final _int64Field_handle = (value.int64Field);
  final _uint64Field_handle = (value.uint64Field);
  final _floatField_handle = (value.floatField);
  final _doubleField_handle = (value.doubleField);
  final _stringField_handle = String_toFfi(value.stringField);
  final _booleanField_handle = Boolean_toFfi(value.booleanField);
  final _bytesField_handle = Blob_toFfi(value.bytesField);
  final _pointField_handle = smoke_Structs_Point_toFfi(value.pointField);
  final _result = _smoke_Structs_AllTypesStruct_create_handle(_int8Field_handle, _uint8Field_handle, _int16Field_handle, _uint16Field_handle, _int32Field_handle, _uint32Field_handle, _int64Field_handle, _uint64Field_handle, _floatField_handle, _doubleField_handle, _stringField_handle, _booleanField_handle, _bytesField_handle, _pointField_handle);
  (_int8Field_handle);
  (_uint8Field_handle);
  (_int16Field_handle);
  (_uint16Field_handle);
  (_int32Field_handle);
  (_uint32Field_handle);
  (_int64Field_handle);
  (_uint64Field_handle);
  (_floatField_handle);
  (_doubleField_handle);
  String_releaseFfiHandle(_stringField_handle);
  Boolean_releaseFfiHandle(_booleanField_handle);
  Blob_releaseFfiHandle(_bytesField_handle);
  smoke_Structs_Point_releaseFfiHandle(_pointField_handle);
  return _result;
}
Structs_AllTypesStruct smoke_Structs_AllTypesStruct_fromFfi(Pointer<Void> handle) {
  final _int8Field_handle = _smoke_Structs_AllTypesStruct_get_field_int8Field(handle);
  final _uint8Field_handle = _smoke_Structs_AllTypesStruct_get_field_uint8Field(handle);
  final _int16Field_handle = _smoke_Structs_AllTypesStruct_get_field_int16Field(handle);
  final _uint16Field_handle = _smoke_Structs_AllTypesStruct_get_field_uint16Field(handle);
  final _int32Field_handle = _smoke_Structs_AllTypesStruct_get_field_int32Field(handle);
  final _uint32Field_handle = _smoke_Structs_AllTypesStruct_get_field_uint32Field(handle);
  final _int64Field_handle = _smoke_Structs_AllTypesStruct_get_field_int64Field(handle);
  final _uint64Field_handle = _smoke_Structs_AllTypesStruct_get_field_uint64Field(handle);
  final _floatField_handle = _smoke_Structs_AllTypesStruct_get_field_floatField(handle);
  final _doubleField_handle = _smoke_Structs_AllTypesStruct_get_field_doubleField(handle);
  final _stringField_handle = _smoke_Structs_AllTypesStruct_get_field_stringField(handle);
  final _booleanField_handle = _smoke_Structs_AllTypesStruct_get_field_booleanField(handle);
  final _bytesField_handle = _smoke_Structs_AllTypesStruct_get_field_bytesField(handle);
  final _pointField_handle = _smoke_Structs_AllTypesStruct_get_field_pointField(handle);
  final _result = Structs_AllTypesStruct(
    (_int8Field_handle),
    (_uint8Field_handle),
    (_int16Field_handle),
    (_uint16Field_handle),
    (_int32Field_handle),
    (_uint32Field_handle),
    (_int64Field_handle),
    (_uint64Field_handle),
    (_floatField_handle),
    (_doubleField_handle),
    String_fromFfi(_stringField_handle),
    Boolean_fromFfi(_booleanField_handle),
    Blob_fromFfi(_bytesField_handle),
    smoke_Structs_Point_fromFfi(_pointField_handle)
  );
  (_int8Field_handle);
  (_uint8Field_handle);
  (_int16Field_handle);
  (_uint16Field_handle);
  (_int32Field_handle);
  (_uint32Field_handle);
  (_int64Field_handle);
  (_uint64Field_handle);
  (_floatField_handle);
  (_doubleField_handle);
  String_releaseFfiHandle(_stringField_handle);
  Boolean_releaseFfiHandle(_booleanField_handle);
  Blob_releaseFfiHandle(_bytesField_handle);
  smoke_Structs_Point_releaseFfiHandle(_pointField_handle);
  return _result;
}
void smoke_Structs_AllTypesStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_AllTypesStruct_release_handle(handle);
// End of Structs_AllTypesStruct "private" section.
class Structs_ExternalStruct {
  String stringField;
  String externalStringField;
  List<int> externalArrayField;
  Structs_AnotherExternalStruct externalStructField;
  Structs_ExternalStruct(this.stringField, this.externalStringField, this.externalArrayField, this.externalStructField);
}
// Structs_ExternalStruct "private" section, not exported.
final _smoke_Structs_ExternalStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('smoke_Structs_ExternalStruct_create_handle');
final _smoke_Structs_ExternalStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_ExternalStruct_release_handle');
final _smoke_Structs_ExternalStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_ExternalStruct_get_field_stringField');
final _smoke_Structs_ExternalStruct_get_field_externalStringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_ExternalStruct_get_field_externalStringField');
final _smoke_Structs_ExternalStruct_get_field_externalArrayField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_ExternalStruct_get_field_externalArrayField');
final _smoke_Structs_ExternalStruct_get_field_externalStructField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_ExternalStruct_get_field_externalStructField');
Pointer<Void> smoke_Structs_ExternalStruct_toFfi(Structs_ExternalStruct value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _externalStringField_handle = String_toFfi(value.externalStringField);
  final _externalArrayField_handle = ListOf_Byte_toFfi(value.externalArrayField);
  final _externalStructField_handle = smoke_Structs_AnotherExternalStruct_toFfi(value.externalStructField);
  final _result = _smoke_Structs_ExternalStruct_create_handle(_stringField_handle, _externalStringField_handle, _externalArrayField_handle, _externalStructField_handle);
  String_releaseFfiHandle(_stringField_handle);
  String_releaseFfiHandle(_externalStringField_handle);
  ListOf_Byte_releaseFfiHandle(_externalArrayField_handle);
  smoke_Structs_AnotherExternalStruct_releaseFfiHandle(_externalStructField_handle);
  return _result;
}
Structs_ExternalStruct smoke_Structs_ExternalStruct_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_Structs_ExternalStruct_get_field_stringField(handle);
  final _externalStringField_handle = _smoke_Structs_ExternalStruct_get_field_externalStringField(handle);
  final _externalArrayField_handle = _smoke_Structs_ExternalStruct_get_field_externalArrayField(handle);
  final _externalStructField_handle = _smoke_Structs_ExternalStruct_get_field_externalStructField(handle);
  final _result = Structs_ExternalStruct(
    String_fromFfi(_stringField_handle),
    String_fromFfi(_externalStringField_handle),
    ListOf_Byte_fromFfi(_externalArrayField_handle),
    smoke_Structs_AnotherExternalStruct_fromFfi(_externalStructField_handle)
  );
  String_releaseFfiHandle(_stringField_handle);
  String_releaseFfiHandle(_externalStringField_handle);
  ListOf_Byte_releaseFfiHandle(_externalArrayField_handle);
  smoke_Structs_AnotherExternalStruct_releaseFfiHandle(_externalStructField_handle);
  return _result;
}
void smoke_Structs_ExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_ExternalStruct_release_handle(handle);
// End of Structs_ExternalStruct "private" section.
class Structs_AnotherExternalStruct {
  int intField;
  Structs_AnotherExternalStruct(this.intField);
}
// Structs_AnotherExternalStruct "private" section, not exported.
final _smoke_Structs_AnotherExternalStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int8),
    Pointer<Void> Function(int)
  >('smoke_Structs_AnotherExternalStruct_create_handle');
final _smoke_Structs_AnotherExternalStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_AnotherExternalStruct_release_handle');
final _smoke_Structs_AnotherExternalStruct_get_field_intField = __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AnotherExternalStruct_get_field_intField');
Pointer<Void> smoke_Structs_AnotherExternalStruct_toFfi(Structs_AnotherExternalStruct value) {
  final _intField_handle = (value.intField);
  final _result = _smoke_Structs_AnotherExternalStruct_create_handle(_intField_handle);
  (_intField_handle);
  return _result;
}
Structs_AnotherExternalStruct smoke_Structs_AnotherExternalStruct_fromFfi(Pointer<Void> handle) {
  final _intField_handle = _smoke_Structs_AnotherExternalStruct_get_field_intField(handle);
  final _result = Structs_AnotherExternalStruct(
    (_intField_handle)
  );
  (_intField_handle);
  return _result;
}
void smoke_Structs_AnotherExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_AnotherExternalStruct_release_handle(handle);
// End of Structs_AnotherExternalStruct "private" section.
class Structs_YetAnotherExternalStruct {
  String stringField;
  Structs_YetAnotherExternalStruct(this.stringField);
}
// Structs_YetAnotherExternalStruct "private" section, not exported.
final _smoke_Structs_YetAnotherExternalStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_YetAnotherExternalStruct_create_handle');
final _smoke_Structs_YetAnotherExternalStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_YetAnotherExternalStruct_release_handle');
final _smoke_Structs_YetAnotherExternalStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_YetAnotherExternalStruct_get_field_stringField');
Pointer<Void> smoke_Structs_YetAnotherExternalStruct_toFfi(Structs_YetAnotherExternalStruct value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _result = _smoke_Structs_YetAnotherExternalStruct_create_handle(_stringField_handle);
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
Structs_YetAnotherExternalStruct smoke_Structs_YetAnotherExternalStruct_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_Structs_YetAnotherExternalStruct_get_field_stringField(handle);
  final _result = Structs_YetAnotherExternalStruct(
    String_fromFfi(_stringField_handle)
  );
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
void smoke_Structs_YetAnotherExternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_YetAnotherExternalStruct_release_handle(handle);
// End of Structs_YetAnotherExternalStruct "private" section.
class Structs_NestingImmutableStruct {
  Structs_AllTypesStruct structField;
  Structs_NestingImmutableStruct(this.structField);
}
// Structs_NestingImmutableStruct "private" section, not exported.
final _smoke_Structs_NestingImmutableStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_NestingImmutableStruct_create_handle');
final _smoke_Structs_NestingImmutableStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_NestingImmutableStruct_release_handle');
final _smoke_Structs_NestingImmutableStruct_get_field_structField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_NestingImmutableStruct_get_field_structField');
Pointer<Void> smoke_Structs_NestingImmutableStruct_toFfi(Structs_NestingImmutableStruct value) {
  final _structField_handle = smoke_Structs_AllTypesStruct_toFfi(value.structField);
  final _result = _smoke_Structs_NestingImmutableStruct_create_handle(_structField_handle);
  smoke_Structs_AllTypesStruct_releaseFfiHandle(_structField_handle);
  return _result;
}
Structs_NestingImmutableStruct smoke_Structs_NestingImmutableStruct_fromFfi(Pointer<Void> handle) {
  final _structField_handle = _smoke_Structs_NestingImmutableStruct_get_field_structField(handle);
  final _result = Structs_NestingImmutableStruct(
    smoke_Structs_AllTypesStruct_fromFfi(_structField_handle)
  );
  smoke_Structs_AllTypesStruct_releaseFfiHandle(_structField_handle);
  return _result;
}
void smoke_Structs_NestingImmutableStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_NestingImmutableStruct_release_handle(handle);
// End of Structs_NestingImmutableStruct "private" section.
class Structs_DoubleNestingImmutableStruct {
  Structs_NestingImmutableStruct nestingStructField;
  Structs_DoubleNestingImmutableStruct(this.nestingStructField);
}
// Structs_DoubleNestingImmutableStruct "private" section, not exported.
final _smoke_Structs_DoubleNestingImmutableStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_DoubleNestingImmutableStruct_create_handle');
final _smoke_Structs_DoubleNestingImmutableStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_DoubleNestingImmutableStruct_release_handle');
final _smoke_Structs_DoubleNestingImmutableStruct_get_field_nestingStructField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_DoubleNestingImmutableStruct_get_field_nestingStructField');
Pointer<Void> smoke_Structs_DoubleNestingImmutableStruct_toFfi(Structs_DoubleNestingImmutableStruct value) {
  final _nestingStructField_handle = smoke_Structs_NestingImmutableStruct_toFfi(value.nestingStructField);
  final _result = _smoke_Structs_DoubleNestingImmutableStruct_create_handle(_nestingStructField_handle);
  smoke_Structs_NestingImmutableStruct_releaseFfiHandle(_nestingStructField_handle);
  return _result;
}
Structs_DoubleNestingImmutableStruct smoke_Structs_DoubleNestingImmutableStruct_fromFfi(Pointer<Void> handle) {
  final _nestingStructField_handle = _smoke_Structs_DoubleNestingImmutableStruct_get_field_nestingStructField(handle);
  final _result = Structs_DoubleNestingImmutableStruct(
    smoke_Structs_NestingImmutableStruct_fromFfi(_nestingStructField_handle)
  );
  smoke_Structs_NestingImmutableStruct_releaseFfiHandle(_nestingStructField_handle);
  return _result;
}
void smoke_Structs_DoubleNestingImmutableStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_DoubleNestingImmutableStruct_release_handle(handle);
// End of Structs_DoubleNestingImmutableStruct "private" section.
class Structs_StructWithArrayOfImmutable {
  List<Structs_AllTypesStruct> arrayField;
  Structs_StructWithArrayOfImmutable(this.arrayField);
}
// Structs_StructWithArrayOfImmutable "private" section, not exported.
final _smoke_Structs_StructWithArrayOfImmutable_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_StructWithArrayOfImmutable_create_handle');
final _smoke_Structs_StructWithArrayOfImmutable_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_StructWithArrayOfImmutable_release_handle');
final _smoke_Structs_StructWithArrayOfImmutable_get_field_arrayField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_StructWithArrayOfImmutable_get_field_arrayField');
Pointer<Void> smoke_Structs_StructWithArrayOfImmutable_toFfi(Structs_StructWithArrayOfImmutable value) {
  final _arrayField_handle = ListOf_smoke_Structs_AllTypesStruct_toFfi(value.arrayField);
  final _result = _smoke_Structs_StructWithArrayOfImmutable_create_handle(_arrayField_handle);
  ListOf_smoke_Structs_AllTypesStruct_releaseFfiHandle(_arrayField_handle);
  return _result;
}
Structs_StructWithArrayOfImmutable smoke_Structs_StructWithArrayOfImmutable_fromFfi(Pointer<Void> handle) {
  final _arrayField_handle = _smoke_Structs_StructWithArrayOfImmutable_get_field_arrayField(handle);
  final _result = Structs_StructWithArrayOfImmutable(
    ListOf_smoke_Structs_AllTypesStruct_fromFfi(_arrayField_handle)
  );
  ListOf_smoke_Structs_AllTypesStruct_releaseFfiHandle(_arrayField_handle);
  return _result;
}
void smoke_Structs_StructWithArrayOfImmutable_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_StructWithArrayOfImmutable_release_handle(handle);
// End of Structs_StructWithArrayOfImmutable "private" section.
class Structs_ImmutableStructWithCppAccessors {
  final String stringField;
  Structs_ImmutableStructWithCppAccessors(this.stringField);
}
// Structs_ImmutableStructWithCppAccessors "private" section, not exported.
final _smoke_Structs_ImmutableStructWithCppAccessors_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_ImmutableStructWithCppAccessors_create_handle');
final _smoke_Structs_ImmutableStructWithCppAccessors_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_ImmutableStructWithCppAccessors_release_handle');
final _smoke_Structs_ImmutableStructWithCppAccessors_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_ImmutableStructWithCppAccessors_get_field_stringField');
Pointer<Void> smoke_Structs_ImmutableStructWithCppAccessors_toFfi(Structs_ImmutableStructWithCppAccessors value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _result = _smoke_Structs_ImmutableStructWithCppAccessors_create_handle(_stringField_handle);
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
Structs_ImmutableStructWithCppAccessors smoke_Structs_ImmutableStructWithCppAccessors_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_Structs_ImmutableStructWithCppAccessors_get_field_stringField(handle);
  final _result = Structs_ImmutableStructWithCppAccessors(
    String_fromFfi(_stringField_handle)
  );
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
void smoke_Structs_ImmutableStructWithCppAccessors_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_ImmutableStructWithCppAccessors_release_handle(handle);
// End of Structs_ImmutableStructWithCppAccessors "private" section.
class Structs_MutableStructWithCppAccessors {
  String stringField;
  Structs_MutableStructWithCppAccessors(this.stringField);
}
// Structs_MutableStructWithCppAccessors "private" section, not exported.
final _smoke_Structs_MutableStructWithCppAccessors_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_MutableStructWithCppAccessors_create_handle');
final _smoke_Structs_MutableStructWithCppAccessors_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_MutableStructWithCppAccessors_release_handle');
final _smoke_Structs_MutableStructWithCppAccessors_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_MutableStructWithCppAccessors_get_field_stringField');
Pointer<Void> smoke_Structs_MutableStructWithCppAccessors_toFfi(Structs_MutableStructWithCppAccessors value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _result = _smoke_Structs_MutableStructWithCppAccessors_create_handle(_stringField_handle);
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
Structs_MutableStructWithCppAccessors smoke_Structs_MutableStructWithCppAccessors_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_Structs_MutableStructWithCppAccessors_get_field_stringField(handle);
  final _result = Structs_MutableStructWithCppAccessors(
    String_fromFfi(_stringField_handle)
  );
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
void smoke_Structs_MutableStructWithCppAccessors_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_MutableStructWithCppAccessors_release_handle(handle);
// End of Structs_MutableStructWithCppAccessors "private" section.
