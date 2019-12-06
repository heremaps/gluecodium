import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/List__conversion.dart';
import 'package:library/src/String__conversion.dart';
import 'package:library/src/smoke/Structs.dart';
import 'package:library/src/smoke/Structs_AllTypesStruct__conversion.dart';
import 'package:library/src/smoke/Structs_Point__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float, Double, Pointer<Void>, Uint8, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, int, int, int, int, int, int, int, double, double, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_create_handle');
final _release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_release_handle');
final _get_field_int8Field = __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_int8Field');
final _get_field_uint8Field = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_uint8Field');
final _get_field_int16Field = __lib.nativeLibrary.lookupFunction<
    Int16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_int16Field');
final _get_field_uint16Field = __lib.nativeLibrary.lookupFunction<
    Uint16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_uint16Field');
final _get_field_int32Field = __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_int32Field');
final _get_field_uint32Field = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_uint32Field');
final _get_field_int64Field = __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_int64Field');
final _get_field_uint64Field = __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_uint64Field');
final _get_field_floatField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_floatField');
final _get_field_doubleField = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_doubleField');
final _get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_stringField');
final _get_field_booleanField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_booleanField');
final _get_field_bytesField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Structs_AllTypesStruct_get_field_bytesField');
final _get_field_pointField = __lib.nativeLibrary.lookupFunction<
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
  final _bytesField_handle = (value.bytesField);
  final _pointField_handle = smoke_Structs_Point_toFfi(value.pointField);
  final _result = _create_handle(_int8Field_handle, _uint8Field_handle, _int16Field_handle, _uint16Field_handle, _int32Field_handle, _uint32Field_handle, _int64Field_handle, _uint64Field_handle, _floatField_handle, _doubleField_handle, _stringField_handle, _booleanField_handle, _bytesField_handle, _pointField_handle);
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
  (_bytesField_handle);
  smoke_Structs_Point_releaseFfiHandle(_pointField_handle);
  return _result;
}
Structs_AllTypesStruct smoke_Structs_AllTypesStruct_fromFfi(Pointer<Void> handle) {
  final _int8Field_handle = _get_field_int8Field(handle);
  final _uint8Field_handle = _get_field_uint8Field(handle);
  final _int16Field_handle = _get_field_int16Field(handle);
  final _uint16Field_handle = _get_field_uint16Field(handle);
  final _int32Field_handle = _get_field_int32Field(handle);
  final _uint32Field_handle = _get_field_uint32Field(handle);
  final _int64Field_handle = _get_field_int64Field(handle);
  final _uint64Field_handle = _get_field_uint64Field(handle);
  final _floatField_handle = _get_field_floatField(handle);
  final _doubleField_handle = _get_field_doubleField(handle);
  final _stringField_handle = _get_field_stringField(handle);
  final _booleanField_handle = _get_field_booleanField(handle);
  final _bytesField_handle = _get_field_bytesField(handle);
  final _pointField_handle = _get_field_pointField(handle);
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
    (_bytesField_handle),
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
  (_bytesField_handle);
  smoke_Structs_Point_releaseFfiHandle(_pointField_handle);
  return _result;
}
void smoke_Structs_AllTypesStruct_releaseFfiHandle(Pointer<Void> handle) => _release_handle(handle);
