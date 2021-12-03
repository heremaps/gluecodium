import 'dart:ffi';
import 'dart:typed_data';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/type_collection.dart';
import 'package:meta/meta.dart';
abstract class Structs {

  static Structs_Point swapPointCoordinates(Structs_Point input) => $prototype.swapPointCoordinates(input);
  static Structs_AllTypesStruct returnAllTypesStruct(Structs_AllTypesStruct input) => $prototype.returnAllTypesStruct(input);
  static Point createPoint(double x, double y) => $prototype.createPoint(x, y);
  static AllTypesStruct modifyAllTypesStruct(AllTypesStruct input) => $prototype.modifyAllTypesStruct(input);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Structs$Impl(Pointer<Void>.fromAddress(0));
}
enum Structs_FooBar {
    foo,
    bar
}
// Structs_FooBar "private" section, not exported.
int smokeStructsFoobarToFfi(Structs_FooBar value) {
  switch (value) {
  case Structs_FooBar.foo:
    return 0;
  case Structs_FooBar.bar:
    return 1;
  default:
    throw StateError("Invalid enum value $value for Structs_FooBar enum.");
  }
}
Structs_FooBar smokeStructsFoobarFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Structs_FooBar.foo;
  case 1:
    return Structs_FooBar.bar;
  default:
    throw StateError("Invalid numeric value $handle for Structs_FooBar enum.");
  }
}
void smokeStructsFoobarReleaseFfiHandle(int handle) {}
final _smokeStructsFoobarCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Structs_FooBar_create_handle_nullable'));
final _smokeStructsFoobarReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_FooBar_release_handle_nullable'));
final _smokeStructsFoobarGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_FooBar_get_value_nullable'));
Pointer<Void> smokeStructsFoobarToFfiNullable(Structs_FooBar? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructsFoobarToFfi(value);
  final result = _smokeStructsFoobarCreateHandleNullable(_handle);
  smokeStructsFoobarReleaseFfiHandle(_handle);
  return result;
}
Structs_FooBar? smokeStructsFoobarFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructsFoobarGetValueNullable(handle);
  final result = smokeStructsFoobarFromFfi(_handle);
  smokeStructsFoobarReleaseFfiHandle(_handle);
  return result;
}
void smokeStructsFoobarReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsFoobarReleaseHandleNullable(handle);
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
Pointer<Void> smokeStructsPointToFfi(Structs_Point value) {
  final _xHandle = (value.x);
  final _yHandle = (value.y);
  final _result = _smokeStructsPointCreateHandle(_xHandle, _yHandle);
  return _result;
}
Structs_Point smokeStructsPointFromFfi(Pointer<Void> handle) {
  final _xHandle = _smokeStructsPointGetFieldx(handle);
  final _yHandle = _smokeStructsPointGetFieldy(handle);
  try {
    return Structs_Point(
      (_xHandle),
      (_yHandle)
    );
  } finally {
  }
}
void smokeStructsPointReleaseFfiHandle(Pointer<Void> handle) => _smokeStructsPointReleaseHandle(handle);
// Nullable Structs_Point
final _smokeStructsPointCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Point_create_handle_nullable'));
final _smokeStructsPointReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_Point_release_handle_nullable'));
final _smokeStructsPointGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Point_get_value_nullable'));
Pointer<Void> smokeStructsPointToFfiNullable(Structs_Point? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructsPointToFfi(value);
  final result = _smokeStructsPointCreateHandleNullable(_handle);
  smokeStructsPointReleaseFfiHandle(_handle);
  return result;
}
Structs_Point? smokeStructsPointFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructsPointGetValueNullable(handle);
  final result = smokeStructsPointFromFfi(_handle);
  smokeStructsPointReleaseFfiHandle(_handle);
  return result;
}
void smokeStructsPointReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsPointReleaseHandleNullable(handle);
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
Pointer<Void> smokeStructsLineToFfi(Structs_Line value) {
  final _aHandle = smokeStructsPointToFfi(value.a);
  final _bHandle = smokeStructsPointToFfi(value.b);
  final _result = _smokeStructsLineCreateHandle(_aHandle, _bHandle);
  smokeStructsPointReleaseFfiHandle(_aHandle);
  smokeStructsPointReleaseFfiHandle(_bHandle);
  return _result;
}
Structs_Line smokeStructsLineFromFfi(Pointer<Void> handle) {
  final _aHandle = _smokeStructsLineGetFielda(handle);
  final _bHandle = _smokeStructsLineGetFieldb(handle);
  try {
    return Structs_Line(
      smokeStructsPointFromFfi(_aHandle),
      smokeStructsPointFromFfi(_bHandle)
    );
  } finally {
    smokeStructsPointReleaseFfiHandle(_aHandle);
    smokeStructsPointReleaseFfiHandle(_bHandle);
  }
}
void smokeStructsLineReleaseFfiHandle(Pointer<Void> handle) => _smokeStructsLineReleaseHandle(handle);
// Nullable Structs_Line
final _smokeStructsLineCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Line_create_handle_nullable'));
final _smokeStructsLineReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_Line_release_handle_nullable'));
final _smokeStructsLineGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Line_get_value_nullable'));
Pointer<Void> smokeStructsLineToFfiNullable(Structs_Line? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructsLineToFfi(value);
  final result = _smokeStructsLineCreateHandleNullable(_handle);
  smokeStructsLineReleaseFfiHandle(_handle);
  return result;
}
Structs_Line? smokeStructsLineFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructsLineGetValueNullable(handle);
  final result = smokeStructsLineFromFfi(_handle);
  smokeStructsLineReleaseFfiHandle(_handle);
  return result;
}
void smokeStructsLineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsLineReleaseHandleNullable(handle);
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
Pointer<Void> smokeStructsAlltypesstructToFfi(Structs_AllTypesStruct value) {
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
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _booleanFieldHandle = booleanToFfi(value.booleanField);
  final _bytesFieldHandle = blobToFfi(value.bytesField);
  final _pointFieldHandle = smokeStructsPointToFfi(value.pointField);
  final _result = _smokeStructsAlltypesstructCreateHandle(_int8FieldHandle, _uint8FieldHandle, _int16FieldHandle, _uint16FieldHandle, _int32FieldHandle, _uint32FieldHandle, _int64FieldHandle, _uint64FieldHandle, _floatFieldHandle, _doubleFieldHandle, _stringFieldHandle, _booleanFieldHandle, _bytesFieldHandle, _pointFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  booleanReleaseFfiHandle(_booleanFieldHandle);
  blobReleaseFfiHandle(_bytesFieldHandle);
  smokeStructsPointReleaseFfiHandle(_pointFieldHandle);
  return _result;
}
Structs_AllTypesStruct smokeStructsAlltypesstructFromFfi(Pointer<Void> handle) {
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
      stringFromFfi(_stringFieldHandle),
      booleanFromFfi(_booleanFieldHandle),
      blobFromFfi(_bytesFieldHandle),
      smokeStructsPointFromFfi(_pointFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
    booleanReleaseFfiHandle(_booleanFieldHandle);
    blobReleaseFfiHandle(_bytesFieldHandle);
    smokeStructsPointReleaseFfiHandle(_pointFieldHandle);
  }
}
void smokeStructsAlltypesstructReleaseFfiHandle(Pointer<Void> handle) => _smokeStructsAlltypesstructReleaseHandle(handle);
// Nullable Structs_AllTypesStruct
final _smokeStructsAlltypesstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_create_handle_nullable'));
final _smokeStructsAlltypesstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_release_handle_nullable'));
final _smokeStructsAlltypesstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_value_nullable'));
Pointer<Void> smokeStructsAlltypesstructToFfiNullable(Structs_AllTypesStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructsAlltypesstructToFfi(value);
  final result = _smokeStructsAlltypesstructCreateHandleNullable(_handle);
  smokeStructsAlltypesstructReleaseFfiHandle(_handle);
  return result;
}
Structs_AllTypesStruct? smokeStructsAlltypesstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructsAlltypesstructGetValueNullable(handle);
  final result = smokeStructsAlltypesstructFromFfi(_handle);
  smokeStructsAlltypesstructReleaseFfiHandle(_handle);
  return result;
}
void smokeStructsAlltypesstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsAlltypesstructReleaseHandleNullable(handle);
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
Pointer<Void> smokeStructsNestingimmutablestructToFfi(Structs_NestingImmutableStruct value) {
  final _structFieldHandle = smokeStructsAlltypesstructToFfi(value.structField);
  final _result = _smokeStructsNestingimmutablestructCreateHandle(_structFieldHandle);
  smokeStructsAlltypesstructReleaseFfiHandle(_structFieldHandle);
  return _result;
}
Structs_NestingImmutableStruct smokeStructsNestingimmutablestructFromFfi(Pointer<Void> handle) {
  final _structFieldHandle = _smokeStructsNestingimmutablestructGetFieldstructField(handle);
  try {
    return Structs_NestingImmutableStruct(
      smokeStructsAlltypesstructFromFfi(_structFieldHandle)
    );
  } finally {
    smokeStructsAlltypesstructReleaseFfiHandle(_structFieldHandle);
  }
}
void smokeStructsNestingimmutablestructReleaseFfiHandle(Pointer<Void> handle) => _smokeStructsNestingimmutablestructReleaseHandle(handle);
// Nullable Structs_NestingImmutableStruct
final _smokeStructsNestingimmutablestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_create_handle_nullable'));
final _smokeStructsNestingimmutablestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_release_handle_nullable'));
final _smokeStructsNestingimmutablestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_get_value_nullable'));
Pointer<Void> smokeStructsNestingimmutablestructToFfiNullable(Structs_NestingImmutableStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructsNestingimmutablestructToFfi(value);
  final result = _smokeStructsNestingimmutablestructCreateHandleNullable(_handle);
  smokeStructsNestingimmutablestructReleaseFfiHandle(_handle);
  return result;
}
Structs_NestingImmutableStruct? smokeStructsNestingimmutablestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructsNestingimmutablestructGetValueNullable(handle);
  final result = smokeStructsNestingimmutablestructFromFfi(_handle);
  smokeStructsNestingimmutablestructReleaseFfiHandle(_handle);
  return result;
}
void smokeStructsNestingimmutablestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsNestingimmutablestructReleaseHandleNullable(handle);
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
Pointer<Void> smokeStructsDoublenestingimmutablestructToFfi(Structs_DoubleNestingImmutableStruct value) {
  final _nestingStructFieldHandle = smokeStructsNestingimmutablestructToFfi(value.nestingStructField);
  final _result = _smokeStructsDoublenestingimmutablestructCreateHandle(_nestingStructFieldHandle);
  smokeStructsNestingimmutablestructReleaseFfiHandle(_nestingStructFieldHandle);
  return _result;
}
Structs_DoubleNestingImmutableStruct smokeStructsDoublenestingimmutablestructFromFfi(Pointer<Void> handle) {
  final _nestingStructFieldHandle = _smokeStructsDoublenestingimmutablestructGetFieldnestingStructField(handle);
  try {
    return Structs_DoubleNestingImmutableStruct(
      smokeStructsNestingimmutablestructFromFfi(_nestingStructFieldHandle)
    );
  } finally {
    smokeStructsNestingimmutablestructReleaseFfiHandle(_nestingStructFieldHandle);
  }
}
void smokeStructsDoublenestingimmutablestructReleaseFfiHandle(Pointer<Void> handle) => _smokeStructsDoublenestingimmutablestructReleaseHandle(handle);
// Nullable Structs_DoubleNestingImmutableStruct
final _smokeStructsDoublenestingimmutablestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_create_handle_nullable'));
final _smokeStructsDoublenestingimmutablestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_release_handle_nullable'));
final _smokeStructsDoublenestingimmutablestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_get_value_nullable'));
Pointer<Void> smokeStructsDoublenestingimmutablestructToFfiNullable(Structs_DoubleNestingImmutableStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructsDoublenestingimmutablestructToFfi(value);
  final result = _smokeStructsDoublenestingimmutablestructCreateHandleNullable(_handle);
  smokeStructsDoublenestingimmutablestructReleaseFfiHandle(_handle);
  return result;
}
Structs_DoubleNestingImmutableStruct? smokeStructsDoublenestingimmutablestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructsDoublenestingimmutablestructGetValueNullable(handle);
  final result = smokeStructsDoublenestingimmutablestructFromFfi(_handle);
  smokeStructsDoublenestingimmutablestructReleaseFfiHandle(_handle);
  return result;
}
void smokeStructsDoublenestingimmutablestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsDoublenestingimmutablestructReleaseHandleNullable(handle);
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
Pointer<Void> smokeStructsStructwitharrayofimmutableToFfi(Structs_StructWithArrayOfImmutable value) {
  final _arrayFieldHandle = foobarListofSmokeStructsAlltypesstructToFfi(value.arrayField);
  final _result = _smokeStructsStructwitharrayofimmutableCreateHandle(_arrayFieldHandle);
  foobarListofSmokeStructsAlltypesstructReleaseFfiHandle(_arrayFieldHandle);
  return _result;
}
Structs_StructWithArrayOfImmutable smokeStructsStructwitharrayofimmutableFromFfi(Pointer<Void> handle) {
  final _arrayFieldHandle = _smokeStructsStructwitharrayofimmutableGetFieldarrayField(handle);
  try {
    return Structs_StructWithArrayOfImmutable(
      foobarListofSmokeStructsAlltypesstructFromFfi(_arrayFieldHandle)
    );
  } finally {
    foobarListofSmokeStructsAlltypesstructReleaseFfiHandle(_arrayFieldHandle);
  }
}
void smokeStructsStructwitharrayofimmutableReleaseFfiHandle(Pointer<Void> handle) => _smokeStructsStructwitharrayofimmutableReleaseHandle(handle);
// Nullable Structs_StructWithArrayOfImmutable
final _smokeStructsStructwitharrayofimmutableCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_create_handle_nullable'));
final _smokeStructsStructwitharrayofimmutableReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_release_handle_nullable'));
final _smokeStructsStructwitharrayofimmutableGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_get_value_nullable'));
Pointer<Void> smokeStructsStructwitharrayofimmutableToFfiNullable(Structs_StructWithArrayOfImmutable? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructsStructwitharrayofimmutableToFfi(value);
  final result = _smokeStructsStructwitharrayofimmutableCreateHandleNullable(_handle);
  smokeStructsStructwitharrayofimmutableReleaseFfiHandle(_handle);
  return result;
}
Structs_StructWithArrayOfImmutable? smokeStructsStructwitharrayofimmutableFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructsStructwitharrayofimmutableGetValueNullable(handle);
  final result = smokeStructsStructwitharrayofimmutableFromFfi(_handle);
  smokeStructsStructwitharrayofimmutableReleaseFfiHandle(_handle);
  return result;
}
void smokeStructsStructwitharrayofimmutableReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsStructwitharrayofimmutableReleaseHandleNullable(handle);
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
Pointer<Void> smokeStructsImmutablestructwithcppaccessorsToFfi(Structs_ImmutableStructWithCppAccessors value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeStructsImmutablestructwithcppaccessorsCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
Structs_ImmutableStructWithCppAccessors smokeStructsImmutablestructwithcppaccessorsFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeStructsImmutablestructwithcppaccessorsGetFieldstringField(handle);
  try {
    return Structs_ImmutableStructWithCppAccessors(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeStructsImmutablestructwithcppaccessorsReleaseFfiHandle(Pointer<Void> handle) => _smokeStructsImmutablestructwithcppaccessorsReleaseHandle(handle);
// Nullable Structs_ImmutableStructWithCppAccessors
final _smokeStructsImmutablestructwithcppaccessorsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_create_handle_nullable'));
final _smokeStructsImmutablestructwithcppaccessorsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_release_handle_nullable'));
final _smokeStructsImmutablestructwithcppaccessorsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_get_value_nullable'));
Pointer<Void> smokeStructsImmutablestructwithcppaccessorsToFfiNullable(Structs_ImmutableStructWithCppAccessors? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructsImmutablestructwithcppaccessorsToFfi(value);
  final result = _smokeStructsImmutablestructwithcppaccessorsCreateHandleNullable(_handle);
  smokeStructsImmutablestructwithcppaccessorsReleaseFfiHandle(_handle);
  return result;
}
Structs_ImmutableStructWithCppAccessors? smokeStructsImmutablestructwithcppaccessorsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructsImmutablestructwithcppaccessorsGetValueNullable(handle);
  final result = smokeStructsImmutablestructwithcppaccessorsFromFfi(_handle);
  smokeStructsImmutablestructwithcppaccessorsReleaseFfiHandle(_handle);
  return result;
}
void smokeStructsImmutablestructwithcppaccessorsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsImmutablestructwithcppaccessorsReleaseHandleNullable(handle);
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
Pointer<Void> smokeStructsMutablestructwithcppaccessorsToFfi(Structs_MutableStructWithCppAccessors value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeStructsMutablestructwithcppaccessorsCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
Structs_MutableStructWithCppAccessors smokeStructsMutablestructwithcppaccessorsFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeStructsMutablestructwithcppaccessorsGetFieldstringField(handle);
  try {
    return Structs_MutableStructWithCppAccessors(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeStructsMutablestructwithcppaccessorsReleaseFfiHandle(Pointer<Void> handle) => _smokeStructsMutablestructwithcppaccessorsReleaseHandle(handle);
// Nullable Structs_MutableStructWithCppAccessors
final _smokeStructsMutablestructwithcppaccessorsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_create_handle_nullable'));
final _smokeStructsMutablestructwithcppaccessorsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_release_handle_nullable'));
final _smokeStructsMutablestructwithcppaccessorsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_get_value_nullable'));
Pointer<Void> smokeStructsMutablestructwithcppaccessorsToFfiNullable(Structs_MutableStructWithCppAccessors? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructsMutablestructwithcppaccessorsToFfi(value);
  final result = _smokeStructsMutablestructwithcppaccessorsCreateHandleNullable(_handle);
  smokeStructsMutablestructwithcppaccessorsReleaseFfiHandle(_handle);
  return result;
}
Structs_MutableStructWithCppAccessors? smokeStructsMutablestructwithcppaccessorsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructsMutablestructwithcppaccessorsGetValueNullable(handle);
  final result = smokeStructsMutablestructwithcppaccessorsFromFfi(_handle);
  smokeStructsMutablestructwithcppaccessorsReleaseFfiHandle(_handle);
  return result;
}
void smokeStructsMutablestructwithcppaccessorsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsMutablestructwithcppaccessorsReleaseHandleNullable(handle);
// End of Structs_MutableStructWithCppAccessors "private" section.
// Structs "private" section, not exported.
final _smokeStructsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Structs_register_finalizer'));
final _smokeStructsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_copy_handle'));
final _smokeStructsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_release_handle'));
/// @nodoc
@visibleForTesting
class Structs$Impl extends __lib.NativeBase implements Structs {
  Structs$Impl(Pointer<Void> handle) : super(handle);

  Structs_Point swapPointCoordinates(Structs_Point input) {
    final _swapPointCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Structs_swapPointCoordinates__Point'));
    final _inputHandle = smokeStructsPointToFfi(input);
    final __resultHandle = _swapPointCoordinatesFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeStructsPointReleaseFfiHandle(_inputHandle);
    try {
      return smokeStructsPointFromFfi(__resultHandle);
    } finally {
      smokeStructsPointReleaseFfiHandle(__resultHandle);
    }
  }
  Structs_AllTypesStruct returnAllTypesStruct(Structs_AllTypesStruct input) {
    final _returnAllTypesStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Structs_returnAllTypesStruct__AllTypesStruct'));
    final _inputHandle = smokeStructsAlltypesstructToFfi(input);
    final __resultHandle = _returnAllTypesStructFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeStructsAlltypesstructReleaseFfiHandle(_inputHandle);
    try {
      return smokeStructsAlltypesstructFromFfi(__resultHandle);
    } finally {
      smokeStructsAlltypesstructReleaseFfiHandle(__resultHandle);
    }
  }
  Point createPoint(double x, double y) {
    final _createPointFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('library_smoke_Structs_createPoint__Double_Double'));
    final _xHandle = (x);
    final _yHandle = (y);
    final __resultHandle = _createPointFfi(__lib.LibraryContext.isolateId, _xHandle, _yHandle);
    try {
      return smokeTypecollectionPointFromFfi(__resultHandle);
    } finally {
      smokeTypecollectionPointReleaseFfiHandle(__resultHandle);
    }
  }
  AllTypesStruct modifyAllTypesStruct(AllTypesStruct input) {
    final _modifyAllTypesStructFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Structs_modifyAllTypesStruct__AllTypesStruct'));
    final _inputHandle = smokeTypecollectionAlltypesstructToFfi(input);
    final __resultHandle = _modifyAllTypesStructFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeTypecollectionAlltypesstructReleaseFfiHandle(_inputHandle);
    try {
      return smokeTypecollectionAlltypesstructFromFfi(__resultHandle);
    } finally {
      smokeTypecollectionAlltypesstructReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeStructsToFfi(Structs value) =>
  _smokeStructsCopyHandle((value as __lib.NativeBase).handle);
Structs smokeStructsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Structs) return instance;
  final _copiedHandle = _smokeStructsCopyHandle(handle);
  final result = Structs$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeStructsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeStructsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeStructsReleaseHandle(handle);
Pointer<Void> smokeStructsToFfiNullable(Structs? value) =>
  value != null ? smokeStructsToFfi(value) : Pointer<Void>.fromAddress(0);
Structs? smokeStructsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeStructsFromFfi(handle) : null;
void smokeStructsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructsReleaseHandle(handle);
// End of Structs "private" section.
