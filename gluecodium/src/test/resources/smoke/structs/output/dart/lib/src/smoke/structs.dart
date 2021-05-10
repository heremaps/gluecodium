import 'dart:typed_data';
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/type_collection.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Structs {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static Structs_Point swapPointCoordinates(Structs_Point input) => Structs$Impl.swapPointCoordinates(input);
  static Structs_AllTypesStruct returnAllTypesStruct(Structs_AllTypesStruct input) => Structs$Impl.returnAllTypesStruct(input);
  static Point createPoint(double x, double y) => Structs$Impl.createPoint(x, y);
  static AllTypesStruct modifyAllTypesStruct(AllTypesStruct input) => Structs$Impl.modifyAllTypesStruct(input);
}
enum Structs_FooBar {
    foo,
    bar
}
// Structs_FooBar "private" section, not exported.
int smoke_Structs_FooBar_toFfi(Structs_FooBar value) {
  switch (value) {
  case Structs_FooBar.foo:
    return 0;
  break;
  case Structs_FooBar.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Structs_FooBar enum.");
  }
}
Structs_FooBar smoke_Structs_FooBar_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Structs_FooBar.foo;
  break;
  case 1:
    return Structs_FooBar.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Structs_FooBar enum.");
  }
}
void smoke_Structs_FooBar_releaseFfiHandle(int handle) {}
final _smoke_Structs_FooBarCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Structs_FooBar_create_handle_nullable'));
final _smoke_Structs_FooBarReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_FooBar_release_handle_nullable'));
final _smoke_Structs_FooBarGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_FooBar_get_value_nullable'));
Pointer<Void> smoke_Structs_FooBar_toFfi_nullable(Structs_FooBar value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_FooBar_toFfi(value);
  final result = _smoke_Structs_FooBarCreateHandleNullable(_handle);
  smoke_Structs_FooBar_releaseFfiHandle(_handle);
  return result;
}
Structs_FooBar smoke_Structs_FooBar_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_FooBarGetValueNullable(handle);
  final result = smoke_Structs_FooBar_fromFfi(_handle);
  smoke_Structs_FooBar_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_FooBar_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_FooBarReleaseHandleNullable(handle);
// End of Structs_FooBar "private" section.
class Structs_Point {
  double x;
  double y;
  Structs_Point(this.x, this.y);
}
// Structs_Point "private" section, not exported.
final _smokeStructsPointCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('library_smoke_Structs_Point_create_handle'));
final _smokeStructsPointReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_Point_release_handle'));
final _smokeStructsPointGetFieldx = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Structs_Point_get_field_x'));
final _smokeStructsPointGetFieldy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Structs_Point_get_field_y'));
Pointer<Void> smoke_Structs_Point_toFfi(Structs_Point value) {
  final _xHandle = (value.x);
  final _yHandle = (value.y);
  final _result = _smokeStructsPointCreateHandle(_xHandle, _yHandle);
  (_xHandle);
  (_yHandle);
  return _result;
}
Structs_Point smoke_Structs_Point_fromFfi(Pointer<Void> handle) {
  final _xHandle = _smokeStructsPointGetFieldx(handle);
  final _yHandle = _smokeStructsPointGetFieldy(handle);
  try {
    return Structs_Point(
      (_xHandle),
      (_yHandle)
    );
  } finally {
    (_xHandle);
    (_yHandle);
  }
}
void smoke_Structs_Point_releaseFfiHandle(Pointer<Void> handle) => _smokeStructsPointReleaseHandle(handle);
// Nullable Structs_Point
final _smoke_Structs_PointCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Point_create_handle_nullable'));
final _smoke_Structs_PointReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_Point_release_handle_nullable'));
final _smoke_Structs_PointGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Point_get_value_nullable'));
Pointer<Void> smoke_Structs_Point_toFfi_nullable(Structs_Point value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_Point_toFfi(value);
  final result = _smoke_Structs_PointCreateHandleNullable(_handle);
  smoke_Structs_Point_releaseFfiHandle(_handle);
  return result;
}
Structs_Point smoke_Structs_Point_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_PointGetValueNullable(handle);
  final result = smoke_Structs_Point_fromFfi(_handle);
  smoke_Structs_Point_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_Point_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_PointReleaseHandleNullable(handle);
// End of Structs_Point "private" section.
class Structs_Line {
  Structs_Point a;
  Structs_Point b;
  Structs_Line(this.a, this.b);
}
// Structs_Line "private" section, not exported.
final _smokeStructsLineCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_Structs_Line_create_handle'));
final _smokeStructsLineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_Line_release_handle'));
final _smokeStructsLineGetFielda = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Line_get_field_a'));
final _smokeStructsLineGetFieldb = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Line_get_field_b'));
Pointer<Void> smoke_Structs_Line_toFfi(Structs_Line value) {
  final _aHandle = smoke_Structs_Point_toFfi(value.a);
  final _bHandle = smoke_Structs_Point_toFfi(value.b);
  final _result = _smokeStructsLineCreateHandle(_aHandle, _bHandle);
  smoke_Structs_Point_releaseFfiHandle(_aHandle);
  smoke_Structs_Point_releaseFfiHandle(_bHandle);
  return _result;
}
Structs_Line smoke_Structs_Line_fromFfi(Pointer<Void> handle) {
  final _aHandle = _smokeStructsLineGetFielda(handle);
  final _bHandle = _smokeStructsLineGetFieldb(handle);
  try {
    return Structs_Line(
      smoke_Structs_Point_fromFfi(_aHandle),
      smoke_Structs_Point_fromFfi(_bHandle)
    );
  } finally {
    smoke_Structs_Point_releaseFfiHandle(_aHandle);
    smoke_Structs_Point_releaseFfiHandle(_bHandle);
  }
}
void smoke_Structs_Line_releaseFfiHandle(Pointer<Void> handle) => _smokeStructsLineReleaseHandle(handle);
// Nullable Structs_Line
final _smoke_Structs_LineCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Line_create_handle_nullable'));
final _smoke_Structs_LineReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_Line_release_handle_nullable'));
final _smoke_Structs_LineGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Line_get_value_nullable'));
Pointer<Void> smoke_Structs_Line_toFfi_nullable(Structs_Line value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_Line_toFfi(value);
  final result = _smoke_Structs_LineCreateHandleNullable(_handle);
  smoke_Structs_Line_releaseFfiHandle(_handle);
  return result;
}
Structs_Line smoke_Structs_Line_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_LineGetValueNullable(handle);
  final result = smoke_Structs_Line_fromFfi(_handle);
  smoke_Structs_Line_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_Line_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_LineReleaseHandleNullable(handle);
// End of Structs_Line "private" section.
@immutable
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
  const Structs_AllTypesStruct(this.int8Field, this.uint8Field, this.int16Field, this.uint16Field, this.int32Field, this.uint32Field, this.int64Field, this.uint64Field, this.floatField, this.doubleField, this.stringField, this.booleanField, this.bytesField, this.pointField);
}
// Structs_AllTypesStruct "private" section, not exported.
final _smokeStructsAlltypesstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float, Double, Pointer<Void>, Uint8, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, int, int, int, int, int, int, int, double, double, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_create_handle'));
final _smokeStructsAlltypesstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_release_handle'));
final _smokeStructsAlltypesstructGetFieldint8Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_int8Field'));
final _smokeStructsAlltypesstructGetFielduint8Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_uint8Field'));
final _smokeStructsAlltypesstructGetFieldint16Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_int16Field'));
final _smokeStructsAlltypesstructGetFielduint16Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_uint16Field'));
final _smokeStructsAlltypesstructGetFieldint32Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_int32Field'));
final _smokeStructsAlltypesstructGetFielduint32Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_uint32Field'));
final _smokeStructsAlltypesstructGetFieldint64Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_int64Field'));
final _smokeStructsAlltypesstructGetFielduint64Field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_uint64Field'));
final _smokeStructsAlltypesstructGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_floatField'));
final _smokeStructsAlltypesstructGetFielddoubleField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_doubleField'));
final _smokeStructsAlltypesstructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_stringField'));
final _smokeStructsAlltypesstructGetFieldbooleanField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_booleanField'));
final _smokeStructsAlltypesstructGetFieldbytesField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_bytesField'));
final _smokeStructsAlltypesstructGetFieldpointField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_pointField'));
Pointer<Void> smoke_Structs_AllTypesStruct_toFfi(Structs_AllTypesStruct value) {
  final _int8FieldHandle = (value.int8Field);
  final _uint8FieldHandle = (value.uint8Field);
  final _int16FieldHandle = (value.int16Field);
  final _uint16FieldHandle = (value.uint16Field);
  final _int32FieldHandle = (value.int32Field);
  final _uint32FieldHandle = (value.uint32Field);
  final _int64FieldHandle = (value.int64Field);
  final _uint64FieldHandle = (value.uint64Field);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _booleanFieldHandle = Boolean_toFfi(value.booleanField);
  final _bytesFieldHandle = Blob_toFfi(value.bytesField);
  final _pointFieldHandle = smoke_Structs_Point_toFfi(value.pointField);
  final _result = _smokeStructsAlltypesstructCreateHandle(_int8FieldHandle, _uint8FieldHandle, _int16FieldHandle, _uint16FieldHandle, _int32FieldHandle, _uint32FieldHandle, _int64FieldHandle, _uint64FieldHandle, _floatFieldHandle, _doubleFieldHandle, _stringFieldHandle, _booleanFieldHandle, _bytesFieldHandle, _pointFieldHandle);
  (_int8FieldHandle);
  (_uint8FieldHandle);
  (_int16FieldHandle);
  (_uint16FieldHandle);
  (_int32FieldHandle);
  (_uint32FieldHandle);
  (_int64FieldHandle);
  (_uint64FieldHandle);
  (_floatFieldHandle);
  (_doubleFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  Boolean_releaseFfiHandle(_booleanFieldHandle);
  Blob_releaseFfiHandle(_bytesFieldHandle);
  smoke_Structs_Point_releaseFfiHandle(_pointFieldHandle);
  return _result;
}
Structs_AllTypesStruct smoke_Structs_AllTypesStruct_fromFfi(Pointer<Void> handle) {
  final _int8FieldHandle = _smokeStructsAlltypesstructGetFieldint8Field(handle);
  final _uint8FieldHandle = _smokeStructsAlltypesstructGetFielduint8Field(handle);
  final _int16FieldHandle = _smokeStructsAlltypesstructGetFieldint16Field(handle);
  final _uint16FieldHandle = _smokeStructsAlltypesstructGetFielduint16Field(handle);
  final _int32FieldHandle = _smokeStructsAlltypesstructGetFieldint32Field(handle);
  final _uint32FieldHandle = _smokeStructsAlltypesstructGetFielduint32Field(handle);
  final _int64FieldHandle = _smokeStructsAlltypesstructGetFieldint64Field(handle);
  final _uint64FieldHandle = _smokeStructsAlltypesstructGetFielduint64Field(handle);
  final _floatFieldHandle = _smokeStructsAlltypesstructGetFieldfloatField(handle);
  final _doubleFieldHandle = _smokeStructsAlltypesstructGetFielddoubleField(handle);
  final _stringFieldHandle = _smokeStructsAlltypesstructGetFieldstringField(handle);
  final _booleanFieldHandle = _smokeStructsAlltypesstructGetFieldbooleanField(handle);
  final _bytesFieldHandle = _smokeStructsAlltypesstructGetFieldbytesField(handle);
  final _pointFieldHandle = _smokeStructsAlltypesstructGetFieldpointField(handle);
  try {
    return Structs_AllTypesStruct(
      (_int8FieldHandle),
      (_uint8FieldHandle),
      (_int16FieldHandle),
      (_uint16FieldHandle),
      (_int32FieldHandle),
      (_uint32FieldHandle),
      (_int64FieldHandle),
      (_uint64FieldHandle),
      (_floatFieldHandle),
      (_doubleFieldHandle),
      String_fromFfi(_stringFieldHandle),
      Boolean_fromFfi(_booleanFieldHandle),
      Blob_fromFfi(_bytesFieldHandle),
      smoke_Structs_Point_fromFfi(_pointFieldHandle)
    );
  } finally {
    (_int8FieldHandle);
    (_uint8FieldHandle);
    (_int16FieldHandle);
    (_uint16FieldHandle);
    (_int32FieldHandle);
    (_uint32FieldHandle);
    (_int64FieldHandle);
    (_uint64FieldHandle);
    (_floatFieldHandle);
    (_doubleFieldHandle);
    String_releaseFfiHandle(_stringFieldHandle);
    Boolean_releaseFfiHandle(_booleanFieldHandle);
    Blob_releaseFfiHandle(_bytesFieldHandle);
    smoke_Structs_Point_releaseFfiHandle(_pointFieldHandle);
  }
}
void smoke_Structs_AllTypesStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeStructsAlltypesstructReleaseHandle(handle);
// Nullable Structs_AllTypesStruct
final _smoke_Structs_AllTypesStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_create_handle_nullable'));
final _smoke_Structs_AllTypesStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_release_handle_nullable'));
final _smoke_Structs_AllTypesStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_value_nullable'));
Pointer<Void> smoke_Structs_AllTypesStruct_toFfi_nullable(Structs_AllTypesStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_AllTypesStruct_toFfi(value);
  final result = _smoke_Structs_AllTypesStructCreateHandleNullable(_handle);
  smoke_Structs_AllTypesStruct_releaseFfiHandle(_handle);
  return result;
}
Structs_AllTypesStruct smoke_Structs_AllTypesStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_AllTypesStructGetValueNullable(handle);
  final result = smoke_Structs_AllTypesStruct_fromFfi(_handle);
  smoke_Structs_AllTypesStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_AllTypesStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_AllTypesStructReleaseHandleNullable(handle);
// End of Structs_AllTypesStruct "private" section.
class Structs_NestingImmutableStruct {
  Structs_AllTypesStruct structField;
  Structs_NestingImmutableStruct(this.structField);
}
// Structs_NestingImmutableStruct "private" section, not exported.
final _smokeStructsNestingimmutablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_create_handle'));
final _smokeStructsNestingimmutablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_release_handle'));
final _smokeStructsNestingimmutablestructGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_get_field_structField'));
Pointer<Void> smoke_Structs_NestingImmutableStruct_toFfi(Structs_NestingImmutableStruct value) {
  final _structFieldHandle = smoke_Structs_AllTypesStruct_toFfi(value.structField);
  final _result = _smokeStructsNestingimmutablestructCreateHandle(_structFieldHandle);
  smoke_Structs_AllTypesStruct_releaseFfiHandle(_structFieldHandle);
  return _result;
}
Structs_NestingImmutableStruct smoke_Structs_NestingImmutableStruct_fromFfi(Pointer<Void> handle) {
  final _structFieldHandle = _smokeStructsNestingimmutablestructGetFieldstructField(handle);
  try {
    return Structs_NestingImmutableStruct(
      smoke_Structs_AllTypesStruct_fromFfi(_structFieldHandle)
    );
  } finally {
    smoke_Structs_AllTypesStruct_releaseFfiHandle(_structFieldHandle);
  }
}
void smoke_Structs_NestingImmutableStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeStructsNestingimmutablestructReleaseHandle(handle);
// Nullable Structs_NestingImmutableStruct
final _smoke_Structs_NestingImmutableStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_create_handle_nullable'));
final _smoke_Structs_NestingImmutableStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_release_handle_nullable'));
final _smoke_Structs_NestingImmutableStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_get_value_nullable'));
Pointer<Void> smoke_Structs_NestingImmutableStruct_toFfi_nullable(Structs_NestingImmutableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_NestingImmutableStruct_toFfi(value);
  final result = _smoke_Structs_NestingImmutableStructCreateHandleNullable(_handle);
  smoke_Structs_NestingImmutableStruct_releaseFfiHandle(_handle);
  return result;
}
Structs_NestingImmutableStruct smoke_Structs_NestingImmutableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_NestingImmutableStructGetValueNullable(handle);
  final result = smoke_Structs_NestingImmutableStruct_fromFfi(_handle);
  smoke_Structs_NestingImmutableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_NestingImmutableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_NestingImmutableStructReleaseHandleNullable(handle);
// End of Structs_NestingImmutableStruct "private" section.
class Structs_DoubleNestingImmutableStruct {
  Structs_NestingImmutableStruct nestingStructField;
  Structs_DoubleNestingImmutableStruct(this.nestingStructField);
}
// Structs_DoubleNestingImmutableStruct "private" section, not exported.
final _smokeStructsDoublenestingimmutablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_create_handle'));
final _smokeStructsDoublenestingimmutablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_release_handle'));
final _smokeStructsDoublenestingimmutablestructGetFieldnestingStructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_get_field_nestingStructField'));
Pointer<Void> smoke_Structs_DoubleNestingImmutableStruct_toFfi(Structs_DoubleNestingImmutableStruct value) {
  final _nestingStructFieldHandle = smoke_Structs_NestingImmutableStruct_toFfi(value.nestingStructField);
  final _result = _smokeStructsDoublenestingimmutablestructCreateHandle(_nestingStructFieldHandle);
  smoke_Structs_NestingImmutableStruct_releaseFfiHandle(_nestingStructFieldHandle);
  return _result;
}
Structs_DoubleNestingImmutableStruct smoke_Structs_DoubleNestingImmutableStruct_fromFfi(Pointer<Void> handle) {
  final _nestingStructFieldHandle = _smokeStructsDoublenestingimmutablestructGetFieldnestingStructField(handle);
  try {
    return Structs_DoubleNestingImmutableStruct(
      smoke_Structs_NestingImmutableStruct_fromFfi(_nestingStructFieldHandle)
    );
  } finally {
    smoke_Structs_NestingImmutableStruct_releaseFfiHandle(_nestingStructFieldHandle);
  }
}
void smoke_Structs_DoubleNestingImmutableStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeStructsDoublenestingimmutablestructReleaseHandle(handle);
// Nullable Structs_DoubleNestingImmutableStruct
final _smoke_Structs_DoubleNestingImmutableStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_create_handle_nullable'));
final _smoke_Structs_DoubleNestingImmutableStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_release_handle_nullable'));
final _smoke_Structs_DoubleNestingImmutableStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_get_value_nullable'));
Pointer<Void> smoke_Structs_DoubleNestingImmutableStruct_toFfi_nullable(Structs_DoubleNestingImmutableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_DoubleNestingImmutableStruct_toFfi(value);
  final result = _smoke_Structs_DoubleNestingImmutableStructCreateHandleNullable(_handle);
  smoke_Structs_DoubleNestingImmutableStruct_releaseFfiHandle(_handle);
  return result;
}
Structs_DoubleNestingImmutableStruct smoke_Structs_DoubleNestingImmutableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_DoubleNestingImmutableStructGetValueNullable(handle);
  final result = smoke_Structs_DoubleNestingImmutableStruct_fromFfi(_handle);
  smoke_Structs_DoubleNestingImmutableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_DoubleNestingImmutableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_DoubleNestingImmutableStructReleaseHandleNullable(handle);
// End of Structs_DoubleNestingImmutableStruct "private" section.
class Structs_StructWithArrayOfImmutable {
  List<Structs_AllTypesStruct> arrayField;
  Structs_StructWithArrayOfImmutable(this.arrayField);
}
// Structs_StructWithArrayOfImmutable "private" section, not exported.
final _smokeStructsStructwitharrayofimmutableCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_create_handle'));
final _smokeStructsStructwitharrayofimmutableReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_release_handle'));
final _smokeStructsStructwitharrayofimmutableGetFieldarrayField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_get_field_arrayField'));
Pointer<Void> smoke_Structs_StructWithArrayOfImmutable_toFfi(Structs_StructWithArrayOfImmutable value) {
  final _arrayFieldHandle = foobar_ListOf_smoke_Structs_AllTypesStruct_toFfi(value.arrayField);
  final _result = _smokeStructsStructwitharrayofimmutableCreateHandle(_arrayFieldHandle);
  foobar_ListOf_smoke_Structs_AllTypesStruct_releaseFfiHandle(_arrayFieldHandle);
  return _result;
}
Structs_StructWithArrayOfImmutable smoke_Structs_StructWithArrayOfImmutable_fromFfi(Pointer<Void> handle) {
  final _arrayFieldHandle = _smokeStructsStructwitharrayofimmutableGetFieldarrayField(handle);
  try {
    return Structs_StructWithArrayOfImmutable(
      foobar_ListOf_smoke_Structs_AllTypesStruct_fromFfi(_arrayFieldHandle)
    );
  } finally {
    foobar_ListOf_smoke_Structs_AllTypesStruct_releaseFfiHandle(_arrayFieldHandle);
  }
}
void smoke_Structs_StructWithArrayOfImmutable_releaseFfiHandle(Pointer<Void> handle) => _smokeStructsStructwitharrayofimmutableReleaseHandle(handle);
// Nullable Structs_StructWithArrayOfImmutable
final _smoke_Structs_StructWithArrayOfImmutableCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_create_handle_nullable'));
final _smoke_Structs_StructWithArrayOfImmutableReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_release_handle_nullable'));
final _smoke_Structs_StructWithArrayOfImmutableGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_get_value_nullable'));
Pointer<Void> smoke_Structs_StructWithArrayOfImmutable_toFfi_nullable(Structs_StructWithArrayOfImmutable value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_StructWithArrayOfImmutable_toFfi(value);
  final result = _smoke_Structs_StructWithArrayOfImmutableCreateHandleNullable(_handle);
  smoke_Structs_StructWithArrayOfImmutable_releaseFfiHandle(_handle);
  return result;
}
Structs_StructWithArrayOfImmutable smoke_Structs_StructWithArrayOfImmutable_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_StructWithArrayOfImmutableGetValueNullable(handle);
  final result = smoke_Structs_StructWithArrayOfImmutable_fromFfi(_handle);
  smoke_Structs_StructWithArrayOfImmutable_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_StructWithArrayOfImmutable_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_StructWithArrayOfImmutableReleaseHandleNullable(handle);
// End of Structs_StructWithArrayOfImmutable "private" section.
@immutable
class Structs_ImmutableStructWithCppAccessors {
  final String stringField;
  const Structs_ImmutableStructWithCppAccessors(this.stringField);
}
// Structs_ImmutableStructWithCppAccessors "private" section, not exported.
final _smokeStructsImmutablestructwithcppaccessorsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_create_handle'));
final _smokeStructsImmutablestructwithcppaccessorsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_release_handle'));
final _smokeStructsImmutablestructwithcppaccessorsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_get_field_stringField'));
Pointer<Void> smoke_Structs_ImmutableStructWithCppAccessors_toFfi(Structs_ImmutableStructWithCppAccessors value) {
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _result = _smokeStructsImmutablestructwithcppaccessorsCreateHandle(_stringFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  return _result;
}
Structs_ImmutableStructWithCppAccessors smoke_Structs_ImmutableStructWithCppAccessors_fromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeStructsImmutablestructwithcppaccessorsGetFieldstringField(handle);
  try {
    return Structs_ImmutableStructWithCppAccessors(
      String_fromFfi(_stringFieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_stringFieldHandle);
  }
}
void smoke_Structs_ImmutableStructWithCppAccessors_releaseFfiHandle(Pointer<Void> handle) => _smokeStructsImmutablestructwithcppaccessorsReleaseHandle(handle);
// Nullable Structs_ImmutableStructWithCppAccessors
final _smoke_Structs_ImmutableStructWithCppAccessorsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_create_handle_nullable'));
final _smoke_Structs_ImmutableStructWithCppAccessorsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_release_handle_nullable'));
final _smoke_Structs_ImmutableStructWithCppAccessorsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_get_value_nullable'));
Pointer<Void> smoke_Structs_ImmutableStructWithCppAccessors_toFfi_nullable(Structs_ImmutableStructWithCppAccessors value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_ImmutableStructWithCppAccessors_toFfi(value);
  final result = _smoke_Structs_ImmutableStructWithCppAccessorsCreateHandleNullable(_handle);
  smoke_Structs_ImmutableStructWithCppAccessors_releaseFfiHandle(_handle);
  return result;
}
Structs_ImmutableStructWithCppAccessors smoke_Structs_ImmutableStructWithCppAccessors_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_ImmutableStructWithCppAccessorsGetValueNullable(handle);
  final result = smoke_Structs_ImmutableStructWithCppAccessors_fromFfi(_handle);
  smoke_Structs_ImmutableStructWithCppAccessors_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_ImmutableStructWithCppAccessors_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_ImmutableStructWithCppAccessorsReleaseHandleNullable(handle);
// End of Structs_ImmutableStructWithCppAccessors "private" section.
class Structs_MutableStructWithCppAccessors {
  String stringField;
  Structs_MutableStructWithCppAccessors(this.stringField);
}
// Structs_MutableStructWithCppAccessors "private" section, not exported.
final _smokeStructsMutablestructwithcppaccessorsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_create_handle'));
final _smokeStructsMutablestructwithcppaccessorsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_release_handle'));
final _smokeStructsMutablestructwithcppaccessorsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_get_field_stringField'));
Pointer<Void> smoke_Structs_MutableStructWithCppAccessors_toFfi(Structs_MutableStructWithCppAccessors value) {
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _result = _smokeStructsMutablestructwithcppaccessorsCreateHandle(_stringFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  return _result;
}
Structs_MutableStructWithCppAccessors smoke_Structs_MutableStructWithCppAccessors_fromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeStructsMutablestructwithcppaccessorsGetFieldstringField(handle);
  try {
    return Structs_MutableStructWithCppAccessors(
      String_fromFfi(_stringFieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_stringFieldHandle);
  }
}
void smoke_Structs_MutableStructWithCppAccessors_releaseFfiHandle(Pointer<Void> handle) => _smokeStructsMutablestructwithcppaccessorsReleaseHandle(handle);
// Nullable Structs_MutableStructWithCppAccessors
final _smoke_Structs_MutableStructWithCppAccessorsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_create_handle_nullable'));
final _smoke_Structs_MutableStructWithCppAccessorsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_release_handle_nullable'));
final _smoke_Structs_MutableStructWithCppAccessorsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_get_value_nullable'));
Pointer<Void> smoke_Structs_MutableStructWithCppAccessors_toFfi_nullable(Structs_MutableStructWithCppAccessors value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_MutableStructWithCppAccessors_toFfi(value);
  final result = _smoke_Structs_MutableStructWithCppAccessorsCreateHandleNullable(_handle);
  smoke_Structs_MutableStructWithCppAccessors_releaseFfiHandle(_handle);
  return result;
}
Structs_MutableStructWithCppAccessors smoke_Structs_MutableStructWithCppAccessors_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_MutableStructWithCppAccessorsGetValueNullable(handle);
  final result = smoke_Structs_MutableStructWithCppAccessors_fromFfi(_handle);
  smoke_Structs_MutableStructWithCppAccessors_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_MutableStructWithCppAccessors_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_MutableStructWithCppAccessorsReleaseHandleNullable(handle);
// End of Structs_MutableStructWithCppAccessors "private" section.
// Structs "private" section, not exported.
final _smokeStructsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_copy_handle'));
final _smokeStructsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_release_handle'));
class Structs$Impl extends __lib.NativeBase implements Structs {
  Structs$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeStructsReleaseHandle(handle);
    handle = null;
  }
  static Structs_Point swapPointCoordinates(Structs_Point input) {
    final _swapPointCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Structs_swapPointCoordinates__Point'));
    final _inputHandle = smoke_Structs_Point_toFfi(input);
    final __resultHandle = _swapPointCoordinatesFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_Structs_Point_releaseFfiHandle(_inputHandle);
    try {
      return smoke_Structs_Point_fromFfi(__resultHandle);
    } finally {
      smoke_Structs_Point_releaseFfiHandle(__resultHandle);
    }
  }
  static Structs_AllTypesStruct returnAllTypesStruct(Structs_AllTypesStruct input) {
    final _returnAllTypesStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Structs_returnAllTypesStruct__AllTypesStruct'));
    final _inputHandle = smoke_Structs_AllTypesStruct_toFfi(input);
    final __resultHandle = _returnAllTypesStructFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_Structs_AllTypesStruct_releaseFfiHandle(_inputHandle);
    try {
      return smoke_Structs_AllTypesStruct_fromFfi(__resultHandle);
    } finally {
      smoke_Structs_AllTypesStruct_releaseFfiHandle(__resultHandle);
    }
  }
  static Point createPoint(double x, double y) {
    final _createPointFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('library_smoke_Structs_createPoint__Double_Double'));
    final _xHandle = (x);
    final _yHandle = (y);
    final __resultHandle = _createPointFfi(__lib.LibraryContext.isolateId, _xHandle, _yHandle);
    (_xHandle);
    (_yHandle);
    try {
      return smoke_TypeCollection_Point_fromFfi(__resultHandle);
    } finally {
      smoke_TypeCollection_Point_releaseFfiHandle(__resultHandle);
    }
  }
  static AllTypesStruct modifyAllTypesStruct(AllTypesStruct input) {
    final _modifyAllTypesStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Structs_modifyAllTypesStruct__AllTypesStruct'));
    final _inputHandle = smoke_TypeCollection_AllTypesStruct_toFfi(input);
    final __resultHandle = _modifyAllTypesStructFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_TypeCollection_AllTypesStruct_releaseFfiHandle(_inputHandle);
    try {
      return smoke_TypeCollection_AllTypesStruct_fromFfi(__resultHandle);
    } finally {
      smoke_TypeCollection_AllTypesStruct_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_Structs_toFfi(Structs value) =>
  _smokeStructsCopyHandle((value as __lib.NativeBase).handle);
Structs smoke_Structs_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as Structs;
  if (instance != null) return instance;
  final _copiedHandle = _smokeStructsCopyHandle(handle);
  final result = Structs$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_Structs_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeStructsReleaseHandle(handle);
Pointer<Void> smoke_Structs_toFfi_nullable(Structs value) =>
  value != null ? smoke_Structs_toFfi(value) : Pointer<Void>.fromAddress(0);
Structs smoke_Structs_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Structs_fromFfi(handle) : null;
void smoke_Structs_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeStructsReleaseHandle(handle);
// End of Structs "private" section.
