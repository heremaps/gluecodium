import 'dart:typed_data';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/type_collection.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
final _smoke_Structs_FooBar_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Structs_FooBar_create_handle_nullable');
final _smoke_Structs_FooBar_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_FooBar_release_handle_nullable');
final _smoke_Structs_FooBar_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_FooBar_get_value_nullable');
Pointer<Void> smoke_Structs_FooBar_toFfi_nullable(Structs_FooBar value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_FooBar_toFfi(value);
  final result = _smoke_Structs_FooBar_create_handle_nullable(_handle);
  smoke_Structs_FooBar_releaseFfiHandle(_handle);
  return result;
}
Structs_FooBar smoke_Structs_FooBar_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_FooBar_get_value_nullable(handle);
  final result = smoke_Structs_FooBar_fromFfi(_handle);
  smoke_Structs_FooBar_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_FooBar_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_FooBar_release_handle_nullable(handle);
// End of Structs_FooBar "private" section.
class Structs_Point {
  double x;
  double y;
  Structs_Point(this.x, this.y);
}
// Structs_Point "private" section, not exported.
final _smoke_Structs_Point_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('library_smoke_Structs_Point_create_handle');
final _smoke_Structs_Point_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_Point_release_handle');
final _smoke_Structs_Point_get_field_x = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Structs_Point_get_field_x');
final _smoke_Structs_Point_get_field_y = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Structs_Point_get_field_y');
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
  try {
    return Structs_Point(
      (_x_handle),
      (_y_handle)
    );
  } finally {
    (_x_handle);
    (_y_handle);
  }
}
void smoke_Structs_Point_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_Point_release_handle(handle);
// Nullable Structs_Point
final _smoke_Structs_Point_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Point_create_handle_nullable');
final _smoke_Structs_Point_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_Point_release_handle_nullable');
final _smoke_Structs_Point_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Point_get_value_nullable');
Pointer<Void> smoke_Structs_Point_toFfi_nullable(Structs_Point value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_Point_toFfi(value);
  final result = _smoke_Structs_Point_create_handle_nullable(_handle);
  smoke_Structs_Point_releaseFfiHandle(_handle);
  return result;
}
Structs_Point smoke_Structs_Point_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_Point_get_value_nullable(handle);
  final result = smoke_Structs_Point_fromFfi(_handle);
  smoke_Structs_Point_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_Point_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_Point_release_handle_nullable(handle);
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
  >('library_smoke_Structs_Line_create_handle');
final _smoke_Structs_Line_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_Line_release_handle');
final _smoke_Structs_Line_get_field_a = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Line_get_field_a');
final _smoke_Structs_Line_get_field_b = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Line_get_field_b');
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
  try {
    return Structs_Line(
      smoke_Structs_Point_fromFfi(_a_handle),
      smoke_Structs_Point_fromFfi(_b_handle)
    );
  } finally {
    smoke_Structs_Point_releaseFfiHandle(_a_handle);
    smoke_Structs_Point_releaseFfiHandle(_b_handle);
  }
}
void smoke_Structs_Line_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_Line_release_handle(handle);
// Nullable Structs_Line
final _smoke_Structs_Line_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Line_create_handle_nullable');
final _smoke_Structs_Line_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_Line_release_handle_nullable');
final _smoke_Structs_Line_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_Line_get_value_nullable');
Pointer<Void> smoke_Structs_Line_toFfi_nullable(Structs_Line value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_Line_toFfi(value);
  final result = _smoke_Structs_Line_create_handle_nullable(_handle);
  smoke_Structs_Line_releaseFfiHandle(_handle);
  return result;
}
Structs_Line smoke_Structs_Line_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_Line_get_value_nullable(handle);
  final result = smoke_Structs_Line_fromFfi(_handle);
  smoke_Structs_Line_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_Line_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_Line_release_handle_nullable(handle);
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
final _smoke_Structs_AllTypesStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int8, Uint8, Int16, Uint16, Int32, Uint32, Int64, Uint64, Float, Double, Pointer<Void>, Uint8, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, int, int, int, int, int, int, int, double, double, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_create_handle');
final _smoke_Structs_AllTypesStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_release_handle');
final _smoke_Structs_AllTypesStruct_get_field_int8Field = __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_int8Field');
final _smoke_Structs_AllTypesStruct_get_field_uint8Field = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_uint8Field');
final _smoke_Structs_AllTypesStruct_get_field_int16Field = __lib.nativeLibrary.lookupFunction<
    Int16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_int16Field');
final _smoke_Structs_AllTypesStruct_get_field_uint16Field = __lib.nativeLibrary.lookupFunction<
    Uint16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_uint16Field');
final _smoke_Structs_AllTypesStruct_get_field_int32Field = __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_int32Field');
final _smoke_Structs_AllTypesStruct_get_field_uint32Field = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_uint32Field');
final _smoke_Structs_AllTypesStruct_get_field_int64Field = __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_int64Field');
final _smoke_Structs_AllTypesStruct_get_field_uint64Field = __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_uint64Field');
final _smoke_Structs_AllTypesStruct_get_field_floatField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_floatField');
final _smoke_Structs_AllTypesStruct_get_field_doubleField = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_doubleField');
final _smoke_Structs_AllTypesStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_stringField');
final _smoke_Structs_AllTypesStruct_get_field_booleanField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_booleanField');
final _smoke_Structs_AllTypesStruct_get_field_bytesField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_bytesField');
final _smoke_Structs_AllTypesStruct_get_field_pointField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_field_pointField');
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
  try {
    return Structs_AllTypesStruct(
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
  } finally {
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
  }
}
void smoke_Structs_AllTypesStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_AllTypesStruct_release_handle(handle);
// Nullable Structs_AllTypesStruct
final _smoke_Structs_AllTypesStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_create_handle_nullable');
final _smoke_Structs_AllTypesStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_release_handle_nullable');
final _smoke_Structs_AllTypesStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_AllTypesStruct_get_value_nullable');
Pointer<Void> smoke_Structs_AllTypesStruct_toFfi_nullable(Structs_AllTypesStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_AllTypesStruct_toFfi(value);
  final result = _smoke_Structs_AllTypesStruct_create_handle_nullable(_handle);
  smoke_Structs_AllTypesStruct_releaseFfiHandle(_handle);
  return result;
}
Structs_AllTypesStruct smoke_Structs_AllTypesStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_AllTypesStruct_get_value_nullable(handle);
  final result = smoke_Structs_AllTypesStruct_fromFfi(_handle);
  smoke_Structs_AllTypesStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_AllTypesStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_AllTypesStruct_release_handle_nullable(handle);
// End of Structs_AllTypesStruct "private" section.
class Structs_NestingImmutableStruct {
  Structs_AllTypesStruct structField;
  Structs_NestingImmutableStruct(this.structField);
}
// Structs_NestingImmutableStruct "private" section, not exported.
final _smoke_Structs_NestingImmutableStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_create_handle');
final _smoke_Structs_NestingImmutableStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_release_handle');
final _smoke_Structs_NestingImmutableStruct_get_field_structField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_get_field_structField');
Pointer<Void> smoke_Structs_NestingImmutableStruct_toFfi(Structs_NestingImmutableStruct value) {
  final _structField_handle = smoke_Structs_AllTypesStruct_toFfi(value.structField);
  final _result = _smoke_Structs_NestingImmutableStruct_create_handle(_structField_handle);
  smoke_Structs_AllTypesStruct_releaseFfiHandle(_structField_handle);
  return _result;
}
Structs_NestingImmutableStruct smoke_Structs_NestingImmutableStruct_fromFfi(Pointer<Void> handle) {
  final _structField_handle = _smoke_Structs_NestingImmutableStruct_get_field_structField(handle);
  try {
    return Structs_NestingImmutableStruct(
      smoke_Structs_AllTypesStruct_fromFfi(_structField_handle)
    );
  } finally {
    smoke_Structs_AllTypesStruct_releaseFfiHandle(_structField_handle);
  }
}
void smoke_Structs_NestingImmutableStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_NestingImmutableStruct_release_handle(handle);
// Nullable Structs_NestingImmutableStruct
final _smoke_Structs_NestingImmutableStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_create_handle_nullable');
final _smoke_Structs_NestingImmutableStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_release_handle_nullable');
final _smoke_Structs_NestingImmutableStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_NestingImmutableStruct_get_value_nullable');
Pointer<Void> smoke_Structs_NestingImmutableStruct_toFfi_nullable(Structs_NestingImmutableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_NestingImmutableStruct_toFfi(value);
  final result = _smoke_Structs_NestingImmutableStruct_create_handle_nullable(_handle);
  smoke_Structs_NestingImmutableStruct_releaseFfiHandle(_handle);
  return result;
}
Structs_NestingImmutableStruct smoke_Structs_NestingImmutableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_NestingImmutableStruct_get_value_nullable(handle);
  final result = smoke_Structs_NestingImmutableStruct_fromFfi(_handle);
  smoke_Structs_NestingImmutableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_NestingImmutableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_NestingImmutableStruct_release_handle_nullable(handle);
// End of Structs_NestingImmutableStruct "private" section.
class Structs_DoubleNestingImmutableStruct {
  Structs_NestingImmutableStruct nestingStructField;
  Structs_DoubleNestingImmutableStruct(this.nestingStructField);
}
// Structs_DoubleNestingImmutableStruct "private" section, not exported.
final _smoke_Structs_DoubleNestingImmutableStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_create_handle');
final _smoke_Structs_DoubleNestingImmutableStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_release_handle');
final _smoke_Structs_DoubleNestingImmutableStruct_get_field_nestingStructField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_get_field_nestingStructField');
Pointer<Void> smoke_Structs_DoubleNestingImmutableStruct_toFfi(Structs_DoubleNestingImmutableStruct value) {
  final _nestingStructField_handle = smoke_Structs_NestingImmutableStruct_toFfi(value.nestingStructField);
  final _result = _smoke_Structs_DoubleNestingImmutableStruct_create_handle(_nestingStructField_handle);
  smoke_Structs_NestingImmutableStruct_releaseFfiHandle(_nestingStructField_handle);
  return _result;
}
Structs_DoubleNestingImmutableStruct smoke_Structs_DoubleNestingImmutableStruct_fromFfi(Pointer<Void> handle) {
  final _nestingStructField_handle = _smoke_Structs_DoubleNestingImmutableStruct_get_field_nestingStructField(handle);
  try {
    return Structs_DoubleNestingImmutableStruct(
      smoke_Structs_NestingImmutableStruct_fromFfi(_nestingStructField_handle)
    );
  } finally {
    smoke_Structs_NestingImmutableStruct_releaseFfiHandle(_nestingStructField_handle);
  }
}
void smoke_Structs_DoubleNestingImmutableStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_DoubleNestingImmutableStruct_release_handle(handle);
// Nullable Structs_DoubleNestingImmutableStruct
final _smoke_Structs_DoubleNestingImmutableStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_create_handle_nullable');
final _smoke_Structs_DoubleNestingImmutableStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_release_handle_nullable');
final _smoke_Structs_DoubleNestingImmutableStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_DoubleNestingImmutableStruct_get_value_nullable');
Pointer<Void> smoke_Structs_DoubleNestingImmutableStruct_toFfi_nullable(Structs_DoubleNestingImmutableStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_DoubleNestingImmutableStruct_toFfi(value);
  final result = _smoke_Structs_DoubleNestingImmutableStruct_create_handle_nullable(_handle);
  smoke_Structs_DoubleNestingImmutableStruct_releaseFfiHandle(_handle);
  return result;
}
Structs_DoubleNestingImmutableStruct smoke_Structs_DoubleNestingImmutableStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_DoubleNestingImmutableStruct_get_value_nullable(handle);
  final result = smoke_Structs_DoubleNestingImmutableStruct_fromFfi(_handle);
  smoke_Structs_DoubleNestingImmutableStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_DoubleNestingImmutableStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_DoubleNestingImmutableStruct_release_handle_nullable(handle);
// End of Structs_DoubleNestingImmutableStruct "private" section.
class Structs_StructWithArrayOfImmutable {
  List<Structs_AllTypesStruct> arrayField;
  Structs_StructWithArrayOfImmutable(this.arrayField);
}
// Structs_StructWithArrayOfImmutable "private" section, not exported.
final _smoke_Structs_StructWithArrayOfImmutable_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_create_handle');
final _smoke_Structs_StructWithArrayOfImmutable_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_release_handle');
final _smoke_Structs_StructWithArrayOfImmutable_get_field_arrayField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_get_field_arrayField');
Pointer<Void> smoke_Structs_StructWithArrayOfImmutable_toFfi(Structs_StructWithArrayOfImmutable value) {
  final _arrayField_handle = ListOf_smoke_Structs_AllTypesStruct_toFfi(value.arrayField);
  final _result = _smoke_Structs_StructWithArrayOfImmutable_create_handle(_arrayField_handle);
  ListOf_smoke_Structs_AllTypesStruct_releaseFfiHandle(_arrayField_handle);
  return _result;
}
Structs_StructWithArrayOfImmutable smoke_Structs_StructWithArrayOfImmutable_fromFfi(Pointer<Void> handle) {
  final _arrayField_handle = _smoke_Structs_StructWithArrayOfImmutable_get_field_arrayField(handle);
  try {
    return Structs_StructWithArrayOfImmutable(
      ListOf_smoke_Structs_AllTypesStruct_fromFfi(_arrayField_handle)
    );
  } finally {
    ListOf_smoke_Structs_AllTypesStruct_releaseFfiHandle(_arrayField_handle);
  }
}
void smoke_Structs_StructWithArrayOfImmutable_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_StructWithArrayOfImmutable_release_handle(handle);
// Nullable Structs_StructWithArrayOfImmutable
final _smoke_Structs_StructWithArrayOfImmutable_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_create_handle_nullable');
final _smoke_Structs_StructWithArrayOfImmutable_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_release_handle_nullable');
final _smoke_Structs_StructWithArrayOfImmutable_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_StructWithArrayOfImmutable_get_value_nullable');
Pointer<Void> smoke_Structs_StructWithArrayOfImmutable_toFfi_nullable(Structs_StructWithArrayOfImmutable value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_StructWithArrayOfImmutable_toFfi(value);
  final result = _smoke_Structs_StructWithArrayOfImmutable_create_handle_nullable(_handle);
  smoke_Structs_StructWithArrayOfImmutable_releaseFfiHandle(_handle);
  return result;
}
Structs_StructWithArrayOfImmutable smoke_Structs_StructWithArrayOfImmutable_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_StructWithArrayOfImmutable_get_value_nullable(handle);
  final result = smoke_Structs_StructWithArrayOfImmutable_fromFfi(_handle);
  smoke_Structs_StructWithArrayOfImmutable_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_StructWithArrayOfImmutable_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_StructWithArrayOfImmutable_release_handle_nullable(handle);
// End of Structs_StructWithArrayOfImmutable "private" section.
@immutable
class Structs_ImmutableStructWithCppAccessors {
  final String stringField;
  const Structs_ImmutableStructWithCppAccessors(this.stringField);
}
// Structs_ImmutableStructWithCppAccessors "private" section, not exported.
final _smoke_Structs_ImmutableStructWithCppAccessors_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_create_handle');
final _smoke_Structs_ImmutableStructWithCppAccessors_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_release_handle');
final _smoke_Structs_ImmutableStructWithCppAccessors_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_get_field_stringField');
Pointer<Void> smoke_Structs_ImmutableStructWithCppAccessors_toFfi(Structs_ImmutableStructWithCppAccessors value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _result = _smoke_Structs_ImmutableStructWithCppAccessors_create_handle(_stringField_handle);
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
Structs_ImmutableStructWithCppAccessors smoke_Structs_ImmutableStructWithCppAccessors_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_Structs_ImmutableStructWithCppAccessors_get_field_stringField(handle);
  try {
    return Structs_ImmutableStructWithCppAccessors(
      String_fromFfi(_stringField_handle)
    );
  } finally {
    String_releaseFfiHandle(_stringField_handle);
  }
}
void smoke_Structs_ImmutableStructWithCppAccessors_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_ImmutableStructWithCppAccessors_release_handle(handle);
// Nullable Structs_ImmutableStructWithCppAccessors
final _smoke_Structs_ImmutableStructWithCppAccessors_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_create_handle_nullable');
final _smoke_Structs_ImmutableStructWithCppAccessors_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_release_handle_nullable');
final _smoke_Structs_ImmutableStructWithCppAccessors_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_ImmutableStructWithCppAccessors_get_value_nullable');
Pointer<Void> smoke_Structs_ImmutableStructWithCppAccessors_toFfi_nullable(Structs_ImmutableStructWithCppAccessors value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_ImmutableStructWithCppAccessors_toFfi(value);
  final result = _smoke_Structs_ImmutableStructWithCppAccessors_create_handle_nullable(_handle);
  smoke_Structs_ImmutableStructWithCppAccessors_releaseFfiHandle(_handle);
  return result;
}
Structs_ImmutableStructWithCppAccessors smoke_Structs_ImmutableStructWithCppAccessors_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_ImmutableStructWithCppAccessors_get_value_nullable(handle);
  final result = smoke_Structs_ImmutableStructWithCppAccessors_fromFfi(_handle);
  smoke_Structs_ImmutableStructWithCppAccessors_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_ImmutableStructWithCppAccessors_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_ImmutableStructWithCppAccessors_release_handle_nullable(handle);
// End of Structs_ImmutableStructWithCppAccessors "private" section.
class Structs_MutableStructWithCppAccessors {
  String stringField;
  Structs_MutableStructWithCppAccessors(this.stringField);
}
// Structs_MutableStructWithCppAccessors "private" section, not exported.
final _smoke_Structs_MutableStructWithCppAccessors_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_create_handle');
final _smoke_Structs_MutableStructWithCppAccessors_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_release_handle');
final _smoke_Structs_MutableStructWithCppAccessors_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_get_field_stringField');
Pointer<Void> smoke_Structs_MutableStructWithCppAccessors_toFfi(Structs_MutableStructWithCppAccessors value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _result = _smoke_Structs_MutableStructWithCppAccessors_create_handle(_stringField_handle);
  String_releaseFfiHandle(_stringField_handle);
  return _result;
}
Structs_MutableStructWithCppAccessors smoke_Structs_MutableStructWithCppAccessors_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_Structs_MutableStructWithCppAccessors_get_field_stringField(handle);
  try {
    return Structs_MutableStructWithCppAccessors(
      String_fromFfi(_stringField_handle)
    );
  } finally {
    String_releaseFfiHandle(_stringField_handle);
  }
}
void smoke_Structs_MutableStructWithCppAccessors_releaseFfiHandle(Pointer<Void> handle) => _smoke_Structs_MutableStructWithCppAccessors_release_handle(handle);
// Nullable Structs_MutableStructWithCppAccessors
final _smoke_Structs_MutableStructWithCppAccessors_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_create_handle_nullable');
final _smoke_Structs_MutableStructWithCppAccessors_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_release_handle_nullable');
final _smoke_Structs_MutableStructWithCppAccessors_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_MutableStructWithCppAccessors_get_value_nullable');
Pointer<Void> smoke_Structs_MutableStructWithCppAccessors_toFfi_nullable(Structs_MutableStructWithCppAccessors value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Structs_MutableStructWithCppAccessors_toFfi(value);
  final result = _smoke_Structs_MutableStructWithCppAccessors_create_handle_nullable(_handle);
  smoke_Structs_MutableStructWithCppAccessors_releaseFfiHandle(_handle);
  return result;
}
Structs_MutableStructWithCppAccessors smoke_Structs_MutableStructWithCppAccessors_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Structs_MutableStructWithCppAccessors_get_value_nullable(handle);
  final result = smoke_Structs_MutableStructWithCppAccessors_fromFfi(_handle);
  smoke_Structs_MutableStructWithCppAccessors_releaseFfiHandle(_handle);
  return result;
}
void smoke_Structs_MutableStructWithCppAccessors_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_MutableStructWithCppAccessors_release_handle_nullable(handle);
// End of Structs_MutableStructWithCppAccessors "private" section.
// Structs "private" section, not exported.
final _smoke_Structs_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Structs_copy_handle');
final _smoke_Structs_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Structs_release_handle');
final _smoke_Structs_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_Structs_get_raw_pointer');
class Structs$Impl implements Structs {
  @protected
  Pointer<Void> handle;
  Structs$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_Structs_get_raw_pointer(handle));
    _smoke_Structs_release_handle(handle);
    handle = null;
  }
  static Structs_Point swapPointCoordinates(Structs_Point input) {
    final _swapPointCoordinates_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Structs_swapPointCoordinates__Point');
    final _input_handle = smoke_Structs_Point_toFfi(input);
    final __result_handle = _swapPointCoordinates_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_Structs_Point_releaseFfiHandle(_input_handle);
    try {
      return smoke_Structs_Point_fromFfi(__result_handle);
    } finally {
      smoke_Structs_Point_releaseFfiHandle(__result_handle);
    }
  }
  static Structs_AllTypesStruct returnAllTypesStruct(Structs_AllTypesStruct input) {
    final _returnAllTypesStruct_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Structs_returnAllTypesStruct__AllTypesStruct');
    final _input_handle = smoke_Structs_AllTypesStruct_toFfi(input);
    final __result_handle = _returnAllTypesStruct_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_Structs_AllTypesStruct_releaseFfiHandle(_input_handle);
    try {
      return smoke_Structs_AllTypesStruct_fromFfi(__result_handle);
    } finally {
      smoke_Structs_AllTypesStruct_releaseFfiHandle(__result_handle);
    }
  }
  static Point createPoint(double x, double y) {
    final _createPoint_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('library_smoke_Structs_createPoint__Double_Double');
    final _x_handle = (x);
    final _y_handle = (y);
    final __result_handle = _createPoint_ffi(__lib.LibraryContext.isolateId, _x_handle, _y_handle);
    (_x_handle);
    (_y_handle);
    try {
      return smoke_TypeCollection_Point_fromFfi(__result_handle);
    } finally {
      smoke_TypeCollection_Point_releaseFfiHandle(__result_handle);
    }
  }
  static AllTypesStruct modifyAllTypesStruct(AllTypesStruct input) {
    final _modifyAllTypesStruct_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_Structs_modifyAllTypesStruct__AllTypesStruct');
    final _input_handle = smoke_TypeCollection_AllTypesStruct_toFfi(input);
    final __result_handle = _modifyAllTypesStruct_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_TypeCollection_AllTypesStruct_releaseFfiHandle(_input_handle);
    try {
      return smoke_TypeCollection_AllTypesStruct_fromFfi(__result_handle);
    } finally {
      smoke_TypeCollection_AllTypesStruct_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_Structs_toFfi(Structs value) =>
  _smoke_Structs_copy_handle((value as Structs$Impl).handle);
Structs smoke_Structs_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_Structs_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Structs;
  if (instance != null) return instance;
  final _copied_handle = _smoke_Structs_copy_handle(handle);
  final result = Structs$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_Structs_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Structs_release_handle(handle);
Pointer<Void> smoke_Structs_toFfi_nullable(Structs value) =>
  value != null ? smoke_Structs_toFfi(value) : Pointer<Void>.fromAddress(0);
Structs smoke_Structs_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Structs_fromFfi(handle) : null;
void smoke_Structs_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Structs_release_handle(handle);
// End of Structs "private" section.
