import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/String__conversion.dart';
import 'package:library/src/smoke/AnEnum.dart';
import 'package:library/src/smoke/AnEnum__conversion.dart';
import 'package:library/src/smoke/DefaultValues.dart';
import 'package:library/src/smoke/DefaultValues_ExternalEnum__conversion.dart';
import 'package:library/src/smoke/SomeEnum__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
enum SomeEnum {
    fooValue,
    barValue
}
class StructWithDefaults {
  int intField;
  int uintField;
  double floatField;
  double doubleField;
  bool boolField;
  String stringField;
  SomeEnum enumField;
  StructWithDefaults(this.intField, this.uintField, this.floatField, this.doubleField, this.boolField, this.stringField, this.enumField);
  StructWithDefaults.withDefaults()
    : intField = 42, uintField = 4294967295, floatField = 3.14, doubleField = -1.4142, boolField = true, stringField = "\\Jonny \"Magic\" Smith\n", enumField = SomeEnum.barValue;
}
// StructWithDefaults "private" section, not exported.
final _smoke_TypesWithDefaults_StructWithDefaults_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Double, Uint8, Pointer<Void>, Uint32),
    Pointer<Void> Function(int, int, double, double, int, Pointer<Void>, int)
  >('smoke_TypesWithDefaults_StructWithDefaults_create_handle');
final _smoke_TypesWithDefaults_StructWithDefaults_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_StructWithDefaults_release_handle');
final _smoke_TypesWithDefaults_StructWithDefaults_get_field_intField = __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_StructWithDefaults_get_field_intField');
final _smoke_TypesWithDefaults_StructWithDefaults_get_field_uintField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_StructWithDefaults_get_field_uintField');
final _smoke_TypesWithDefaults_StructWithDefaults_get_field_floatField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_StructWithDefaults_get_field_floatField');
final _smoke_TypesWithDefaults_StructWithDefaults_get_field_doubleField = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_StructWithDefaults_get_field_doubleField');
final _smoke_TypesWithDefaults_StructWithDefaults_get_field_boolField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_StructWithDefaults_get_field_boolField');
final _smoke_TypesWithDefaults_StructWithDefaults_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_StructWithDefaults_get_field_stringField');
final _smoke_TypesWithDefaults_StructWithDefaults_get_field_enumField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_StructWithDefaults_get_field_enumField');
Pointer<Void> smoke_TypesWithDefaults_StructWithDefaults_toFfi(StructWithDefaults value) {
  final _intField_handle = (value.intField);
  final _uintField_handle = (value.uintField);
  final _floatField_handle = (value.floatField);
  final _doubleField_handle = (value.doubleField);
  final _boolField_handle = Boolean_toFfi(value.boolField);
  final _stringField_handle = String_toFfi(value.stringField);
  final _enumField_handle = smoke_TypesWithDefaults_SomeEnum_toFfi(value.enumField);
  final _result = _smoke_TypesWithDefaults_StructWithDefaults_create_handle(_intField_handle, _uintField_handle, _floatField_handle, _doubleField_handle, _boolField_handle, _stringField_handle, _enumField_handle);
  (_intField_handle);
  (_uintField_handle);
  (_floatField_handle);
  (_doubleField_handle);
  Boolean_releaseFfiHandle(_boolField_handle);
  String_releaseFfiHandle(_stringField_handle);
  smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle(_enumField_handle);
  return _result;
}
StructWithDefaults smoke_TypesWithDefaults_StructWithDefaults_fromFfi(Pointer<Void> handle) {
  final _intField_handle = _smoke_TypesWithDefaults_StructWithDefaults_get_field_intField(handle);
  final _uintField_handle = _smoke_TypesWithDefaults_StructWithDefaults_get_field_uintField(handle);
  final _floatField_handle = _smoke_TypesWithDefaults_StructWithDefaults_get_field_floatField(handle);
  final _doubleField_handle = _smoke_TypesWithDefaults_StructWithDefaults_get_field_doubleField(handle);
  final _boolField_handle = _smoke_TypesWithDefaults_StructWithDefaults_get_field_boolField(handle);
  final _stringField_handle = _smoke_TypesWithDefaults_StructWithDefaults_get_field_stringField(handle);
  final _enumField_handle = _smoke_TypesWithDefaults_StructWithDefaults_get_field_enumField(handle);
  final _result = StructWithDefaults(
    (_intField_handle),
    (_uintField_handle),
    (_floatField_handle),
    (_doubleField_handle),
    Boolean_fromFfi(_boolField_handle),
    String_fromFfi(_stringField_handle),
    smoke_TypesWithDefaults_SomeEnum_fromFfi(_enumField_handle)
  );
  (_intField_handle);
  (_uintField_handle);
  (_floatField_handle);
  (_doubleField_handle);
  Boolean_releaseFfiHandle(_boolField_handle);
  String_releaseFfiHandle(_stringField_handle);
  smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle(_enumField_handle);
  return _result;
}
void smoke_TypesWithDefaults_StructWithDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_TypesWithDefaults_StructWithDefaults_release_handle(handle);
// End of StructWithDefaults "private" section.
class ImmutableStructWithDefaults {
  final int intField;
  final int uintField;
  final double floatField;
  final double doubleField;
  final bool boolField;
  final String stringField;
  final SomeEnum enumField;
  final DefaultValues_ExternalEnum externalEnumField;
  ImmutableStructWithDefaults(this.intField, this.uintField, this.floatField, this.doubleField, this.boolField, this.stringField, this.enumField, this.externalEnumField);
  ImmutableStructWithDefaults.withDefaults(int uintField, bool boolField)
    : intField = 42, uintField = uintField, floatField = 3.14, doubleField = -1.4142, boolField = boolField, stringField = "\\Jonny \"Magic\" Smith\n", enumField = SomeEnum.barValue, externalEnumField = DefaultValues_ExternalEnum.anotherValue;
}
// ImmutableStructWithDefaults "private" section, not exported.
final _smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Double, Uint8, Pointer<Void>, Uint32, Uint32),
    Pointer<Void> Function(int, int, double, double, int, Pointer<Void>, int, int)
  >('smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_handle');
final _smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle');
final _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_intField = __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_intField');
final _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_uintField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_uintField');
final _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_floatField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_floatField');
final _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_doubleField = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_doubleField');
final _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_boolField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_boolField');
final _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_stringField');
final _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_enumField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_enumField');
final _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_externalEnumField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_externalEnumField');
Pointer<Void> smoke_TypesWithDefaults_ImmutableStructWithDefaults_toFfi(ImmutableStructWithDefaults value) {
  final _intField_handle = (value.intField);
  final _uintField_handle = (value.uintField);
  final _floatField_handle = (value.floatField);
  final _doubleField_handle = (value.doubleField);
  final _boolField_handle = Boolean_toFfi(value.boolField);
  final _stringField_handle = String_toFfi(value.stringField);
  final _enumField_handle = smoke_TypesWithDefaults_SomeEnum_toFfi(value.enumField);
  final _externalEnumField_handle = smoke_DefaultValues_ExternalEnum_toFfi(value.externalEnumField);
  final _result = _smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_handle(_intField_handle, _uintField_handle, _floatField_handle, _doubleField_handle, _boolField_handle, _stringField_handle, _enumField_handle, _externalEnumField_handle);
  (_intField_handle);
  (_uintField_handle);
  (_floatField_handle);
  (_doubleField_handle);
  Boolean_releaseFfiHandle(_boolField_handle);
  String_releaseFfiHandle(_stringField_handle);
  smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle(_enumField_handle);
  smoke_DefaultValues_ExternalEnum_releaseFfiHandle(_externalEnumField_handle);
  return _result;
}
ImmutableStructWithDefaults smoke_TypesWithDefaults_ImmutableStructWithDefaults_fromFfi(Pointer<Void> handle) {
  final _intField_handle = _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_intField(handle);
  final _uintField_handle = _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_uintField(handle);
  final _floatField_handle = _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_floatField(handle);
  final _doubleField_handle = _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_doubleField(handle);
  final _boolField_handle = _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_boolField(handle);
  final _stringField_handle = _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_stringField(handle);
  final _enumField_handle = _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_enumField(handle);
  final _externalEnumField_handle = _smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_externalEnumField(handle);
  final _result = ImmutableStructWithDefaults(
    (_intField_handle),
    (_uintField_handle),
    (_floatField_handle),
    (_doubleField_handle),
    Boolean_fromFfi(_boolField_handle),
    String_fromFfi(_stringField_handle),
    smoke_TypesWithDefaults_SomeEnum_fromFfi(_enumField_handle),
    smoke_DefaultValues_ExternalEnum_fromFfi(_externalEnumField_handle)
  );
  (_intField_handle);
  (_uintField_handle);
  (_floatField_handle);
  (_doubleField_handle);
  Boolean_releaseFfiHandle(_boolField_handle);
  String_releaseFfiHandle(_stringField_handle);
  smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle(_enumField_handle);
  smoke_DefaultValues_ExternalEnum_releaseFfiHandle(_externalEnumField_handle);
  return _result;
}
void smoke_TypesWithDefaults_ImmutableStructWithDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle(handle);
// End of ImmutableStructWithDefaults "private" section.
class StructWithAnEnum {
  AnEnum config;
  StructWithAnEnum(this.config);
  StructWithAnEnum.withDefaults()
    : config = AnEnum.enabled;
}
// StructWithAnEnum "private" section, not exported.
final _smoke_TypesWithDefaults_StructWithAnEnum_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('smoke_TypesWithDefaults_StructWithAnEnum_create_handle');
final _smoke_TypesWithDefaults_StructWithAnEnum_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_StructWithAnEnum_release_handle');
final _smoke_TypesWithDefaults_StructWithAnEnum_get_field_config = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_TypesWithDefaults_StructWithAnEnum_get_field_config');
Pointer<Void> smoke_TypesWithDefaults_StructWithAnEnum_toFfi(StructWithAnEnum value) {
  final _config_handle = smoke_AnEnum_AnEnum_toFfi(value.config);
  final _result = _smoke_TypesWithDefaults_StructWithAnEnum_create_handle(_config_handle);
  smoke_AnEnum_AnEnum_releaseFfiHandle(_config_handle);
  return _result;
}
StructWithAnEnum smoke_TypesWithDefaults_StructWithAnEnum_fromFfi(Pointer<Void> handle) {
  final _config_handle = _smoke_TypesWithDefaults_StructWithAnEnum_get_field_config(handle);
  final _result = StructWithAnEnum(
    smoke_AnEnum_AnEnum_fromFfi(_config_handle)
  );
  smoke_AnEnum_AnEnum_releaseFfiHandle(_config_handle);
  return _result;
}
void smoke_TypesWithDefaults_StructWithAnEnum_releaseFfiHandle(Pointer<Void> handle) => _smoke_TypesWithDefaults_StructWithAnEnum_release_handle(handle);
// End of StructWithAnEnum "private" section.
