import 'package:library/src/String__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_StructConstants_release_handle');
class StructConstants {
  final Pointer<Void> _handle;
  StructConstants._(this._handle);
  void release() => __release_handle(_handle);
  static final StructConstants_SomeStruct structConstant = StructConstants_SomeStruct("bar Buzz", 1.41);
  static final StructConstants_NestingStruct nestingStructConstant = StructConstants_NestingStruct(StructConstants_SomeStruct("nonsense", -2.82));
}
Pointer<Void> smoke_StructConstants_toFfi(StructConstants value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
StructConstants smoke_StructConstants_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? StructConstants._(handle) : null;
void smoke_StructConstants_releaseFfiHandle(Pointer<Void> handle) {}
class StructConstants_SomeStruct {
  String stringField;
  double floatField;
  StructConstants_SomeStruct(this.stringField, this.floatField);
}
// StructConstants_SomeStruct "private" section, not exported.
final _smoke_StructConstants_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Float),
    Pointer<Void> Function(Pointer<Void>, double)
  >('smoke_StructConstants_SomeStruct_create_handle');
final _smoke_StructConstants_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_StructConstants_SomeStruct_release_handle');
final _smoke_StructConstants_SomeStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructConstants_SomeStruct_get_field_stringField');
final _smoke_StructConstants_SomeStruct_get_field_floatField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_StructConstants_SomeStruct_get_field_floatField');
Pointer<Void> smoke_StructConstants_SomeStruct_toFfi(StructConstants_SomeStruct value) {
  final _stringField_handle = String_toFfi(value.stringField);
  final _floatField_handle = (value.floatField);
  final _result = _smoke_StructConstants_SomeStruct_create_handle(_stringField_handle, _floatField_handle);
  String_releaseFfiHandle(_stringField_handle);
  (_floatField_handle);
  return _result;
}
StructConstants_SomeStruct smoke_StructConstants_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _stringField_handle = _smoke_StructConstants_SomeStruct_get_field_stringField(handle);
  final _floatField_handle = _smoke_StructConstants_SomeStruct_get_field_floatField(handle);
  final _result = StructConstants_SomeStruct(
    String_fromFfi(_stringField_handle),
    (_floatField_handle)
  );
  String_releaseFfiHandle(_stringField_handle);
  (_floatField_handle);
  return _result;
}
void smoke_StructConstants_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructConstants_SomeStruct_release_handle(handle);
// End of StructConstants_SomeStruct "private" section.
class StructConstants_NestingStruct {
  StructConstants_SomeStruct structField;
  StructConstants_NestingStruct(this.structField);
}
// StructConstants_NestingStruct "private" section, not exported.
final _smoke_StructConstants_NestingStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructConstants_NestingStruct_create_handle');
final _smoke_StructConstants_NestingStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_StructConstants_NestingStruct_release_handle');
final _smoke_StructConstants_NestingStruct_get_field_structField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_StructConstants_NestingStruct_get_field_structField');
Pointer<Void> smoke_StructConstants_NestingStruct_toFfi(StructConstants_NestingStruct value) {
  final _structField_handle = smoke_StructConstants_SomeStruct_toFfi(value.structField);
  final _result = _smoke_StructConstants_NestingStruct_create_handle(_structField_handle);
  smoke_StructConstants_SomeStruct_releaseFfiHandle(_structField_handle);
  return _result;
}
StructConstants_NestingStruct smoke_StructConstants_NestingStruct_fromFfi(Pointer<Void> handle) {
  final _structField_handle = _smoke_StructConstants_NestingStruct_get_field_structField(handle);
  final _result = StructConstants_NestingStruct(
    smoke_StructConstants_SomeStruct_fromFfi(_structField_handle)
  );
  smoke_StructConstants_SomeStruct_releaseFfiHandle(_structField_handle);
  return _result;
}
void smoke_StructConstants_NestingStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructConstants_NestingStruct_release_handle(handle);
// End of StructConstants_NestingStruct "private" section.
