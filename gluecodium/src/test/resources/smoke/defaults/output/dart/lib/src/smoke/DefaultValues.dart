import 'package:library/src/Boolean__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/String__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_DefaultValues_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_DefaultValues_release_handle');
class DefaultValues {
  final Pointer<Void> _handle;
  DefaultValues._(this._handle);
  void release() => _smoke_DefaultValues_release_handle(_handle);
  static DefaultValues_StructWithDefaults processStructWithDefaults(DefaultValues_StructWithDefaults input) {
    final _processStructWithDefaults_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_DefaultValues_processStructWithDefaults__StructWithDefaults');
    final _input_handle = smoke_DefaultValues_StructWithDefaults_toFfi(input);
    final __result_handle = _processStructWithDefaults_ffi(_input_handle);
    smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(_input_handle);
    final _result = smoke_DefaultValues_StructWithDefaults_fromFfi(__result_handle);
    smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_DefaultValues_toFfi(DefaultValues value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
DefaultValues smoke_DefaultValues_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? DefaultValues._(handle) : null;
void smoke_DefaultValues_releaseFfiHandle(Pointer<Void> handle) {}
enum DefaultValues_SomeEnum {
    fooValue,
    barValue
}
// DefaultValues_SomeEnum "private" section, not exported.
int smoke_DefaultValues_SomeEnum_toFfi(DefaultValues_SomeEnum value) {
  switch (value) {
  case DefaultValues_SomeEnum.fooValue:
    return 0;
  break;
  case DefaultValues_SomeEnum.barValue:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for DefaultValues_SomeEnum enum.");
  }
}
DefaultValues_SomeEnum smoke_DefaultValues_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return DefaultValues_SomeEnum.fooValue;
  break;
  case 1:
    return DefaultValues_SomeEnum.barValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for DefaultValues_SomeEnum enum.");
  }
}
void smoke_DefaultValues_SomeEnum_releaseFfiHandle(int handle) {}
// End of DefaultValues_SomeEnum "private" section.
enum DefaultValues_ExternalEnum {
    oneValue,
    anotherValue
}
// DefaultValues_ExternalEnum "private" section, not exported.
int smoke_DefaultValues_ExternalEnum_toFfi(DefaultValues_ExternalEnum value) {
  switch (value) {
  case DefaultValues_ExternalEnum.oneValue:
    return 0;
  break;
  case DefaultValues_ExternalEnum.anotherValue:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for DefaultValues_ExternalEnum enum.");
  }
}
DefaultValues_ExternalEnum smoke_DefaultValues_ExternalEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return DefaultValues_ExternalEnum.oneValue;
  break;
  case 1:
    return DefaultValues_ExternalEnum.anotherValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for DefaultValues_ExternalEnum enum.");
  }
}
void smoke_DefaultValues_ExternalEnum_releaseFfiHandle(int handle) {}
// End of DefaultValues_ExternalEnum "private" section.
class DefaultValues_StructWithDefaults {
  int intField;
  int uintField;
  double floatField;
  double doubleField;
  bool boolField;
  String stringField;
  DefaultValues_SomeEnum enumField;
  DefaultValues_ExternalEnum externalEnumField;
  DefaultValues_StructWithDefaults(this.intField, this.uintField, this.floatField, this.doubleField, this.boolField, this.stringField, this.enumField, this.externalEnumField);
  DefaultValues_StructWithDefaults.withDefaults()
    : intField = 42, uintField = 4294967295, floatField = 3.14, doubleField = -1.4142, boolField = true, stringField = "\\Jonny \"Magic\" Smith\n", enumField = DefaultValues_SomeEnum.barValue, externalEnumField = DefaultValues_ExternalEnum.anotherValue;
}
// DefaultValues_StructWithDefaults "private" section, not exported.
final _smoke_DefaultValues_StructWithDefaults_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Double, Uint8, Pointer<Void>, Uint32, Uint32),
    Pointer<Void> Function(int, int, double, double, int, Pointer<Void>, int, int)
  >('smoke_DefaultValues_StructWithDefaults_create_handle');
final _smoke_DefaultValues_StructWithDefaults_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithDefaults_release_handle');
final _smoke_DefaultValues_StructWithDefaults_get_field_intField = __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithDefaults_get_field_intField');
final _smoke_DefaultValues_StructWithDefaults_get_field_uintField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithDefaults_get_field_uintField');
final _smoke_DefaultValues_StructWithDefaults_get_field_floatField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithDefaults_get_field_floatField');
final _smoke_DefaultValues_StructWithDefaults_get_field_doubleField = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithDefaults_get_field_doubleField');
final _smoke_DefaultValues_StructWithDefaults_get_field_boolField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithDefaults_get_field_boolField');
final _smoke_DefaultValues_StructWithDefaults_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithDefaults_get_field_stringField');
final _smoke_DefaultValues_StructWithDefaults_get_field_enumField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithDefaults_get_field_enumField');
final _smoke_DefaultValues_StructWithDefaults_get_field_externalEnumField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithDefaults_get_field_externalEnumField');
Pointer<Void> smoke_DefaultValues_StructWithDefaults_toFfi(DefaultValues_StructWithDefaults value) {
  final _intField_handle = (value.intField);
  final _uintField_handle = (value.uintField);
  final _floatField_handle = (value.floatField);
  final _doubleField_handle = (value.doubleField);
  final _boolField_handle = Boolean_toFfi(value.boolField);
  final _stringField_handle = String_toFfi(value.stringField);
  final _enumField_handle = smoke_DefaultValues_SomeEnum_toFfi(value.enumField);
  final _externalEnumField_handle = smoke_DefaultValues_ExternalEnum_toFfi(value.externalEnumField);
  final _result = _smoke_DefaultValues_StructWithDefaults_create_handle(_intField_handle, _uintField_handle, _floatField_handle, _doubleField_handle, _boolField_handle, _stringField_handle, _enumField_handle, _externalEnumField_handle);
  (_intField_handle);
  (_uintField_handle);
  (_floatField_handle);
  (_doubleField_handle);
  Boolean_releaseFfiHandle(_boolField_handle);
  String_releaseFfiHandle(_stringField_handle);
  smoke_DefaultValues_SomeEnum_releaseFfiHandle(_enumField_handle);
  smoke_DefaultValues_ExternalEnum_releaseFfiHandle(_externalEnumField_handle);
  return _result;
}
DefaultValues_StructWithDefaults smoke_DefaultValues_StructWithDefaults_fromFfi(Pointer<Void> handle) {
  final _intField_handle = _smoke_DefaultValues_StructWithDefaults_get_field_intField(handle);
  final _uintField_handle = _smoke_DefaultValues_StructWithDefaults_get_field_uintField(handle);
  final _floatField_handle = _smoke_DefaultValues_StructWithDefaults_get_field_floatField(handle);
  final _doubleField_handle = _smoke_DefaultValues_StructWithDefaults_get_field_doubleField(handle);
  final _boolField_handle = _smoke_DefaultValues_StructWithDefaults_get_field_boolField(handle);
  final _stringField_handle = _smoke_DefaultValues_StructWithDefaults_get_field_stringField(handle);
  final _enumField_handle = _smoke_DefaultValues_StructWithDefaults_get_field_enumField(handle);
  final _externalEnumField_handle = _smoke_DefaultValues_StructWithDefaults_get_field_externalEnumField(handle);
  final _result = DefaultValues_StructWithDefaults(
    (_intField_handle),
    (_uintField_handle),
    (_floatField_handle),
    (_doubleField_handle),
    Boolean_fromFfi(_boolField_handle),
    String_fromFfi(_stringField_handle),
    smoke_DefaultValues_SomeEnum_fromFfi(_enumField_handle),
    smoke_DefaultValues_ExternalEnum_fromFfi(_externalEnumField_handle)
  );
  (_intField_handle);
  (_uintField_handle);
  (_floatField_handle);
  (_doubleField_handle);
  Boolean_releaseFfiHandle(_boolField_handle);
  String_releaseFfiHandle(_stringField_handle);
  smoke_DefaultValues_SomeEnum_releaseFfiHandle(_enumField_handle);
  smoke_DefaultValues_ExternalEnum_releaseFfiHandle(_externalEnumField_handle);
  return _result;
}
void smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_DefaultValues_StructWithDefaults_release_handle(handle);
// End of DefaultValues_StructWithDefaults "private" section.
class DefaultValues_NullableStructWithDefaults {
  int intField;
  int uintField;
  double floatField;
  bool boolField;
  String stringField;
  DefaultValues_SomeEnum enumField;
  DefaultValues_NullableStructWithDefaults(this.intField, this.uintField, this.floatField, this.boolField, this.stringField, this.enumField);
  DefaultValues_NullableStructWithDefaults.withDefaults()
    : intField = null, uintField = null, floatField = null, boolField = null, stringField = null, enumField = null;
}
// DefaultValues_NullableStructWithDefaults "private" section, not exported.
final _smoke_DefaultValues_NullableStructWithDefaults_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Uint8, Pointer<Void>, Uint32),
    Pointer<Void> Function(int, int, double, int, Pointer<Void>, int)
  >('smoke_DefaultValues_NullableStructWithDefaults_create_handle');
final _smoke_DefaultValues_NullableStructWithDefaults_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_DefaultValues_NullableStructWithDefaults_release_handle');
final _smoke_DefaultValues_NullableStructWithDefaults_get_field_intField = __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_NullableStructWithDefaults_get_field_intField');
final _smoke_DefaultValues_NullableStructWithDefaults_get_field_uintField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_NullableStructWithDefaults_get_field_uintField');
final _smoke_DefaultValues_NullableStructWithDefaults_get_field_floatField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_DefaultValues_NullableStructWithDefaults_get_field_floatField');
final _smoke_DefaultValues_NullableStructWithDefaults_get_field_boolField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_NullableStructWithDefaults_get_field_boolField');
final _smoke_DefaultValues_NullableStructWithDefaults_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_DefaultValues_NullableStructWithDefaults_get_field_stringField');
final _smoke_DefaultValues_NullableStructWithDefaults_get_field_enumField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_NullableStructWithDefaults_get_field_enumField');
Pointer<Void> smoke_DefaultValues_NullableStructWithDefaults_toFfi(DefaultValues_NullableStructWithDefaults value) {
  final _intField_handle = (value.intField);
  final _uintField_handle = (value.uintField);
  final _floatField_handle = (value.floatField);
  final _boolField_handle = Boolean_toFfi(value.boolField);
  final _stringField_handle = String_toFfi(value.stringField);
  final _enumField_handle = smoke_DefaultValues_SomeEnum_toFfi(value.enumField);
  final _result = _smoke_DefaultValues_NullableStructWithDefaults_create_handle(_intField_handle, _uintField_handle, _floatField_handle, _boolField_handle, _stringField_handle, _enumField_handle);
  (_intField_handle);
  (_uintField_handle);
  (_floatField_handle);
  Boolean_releaseFfiHandle(_boolField_handle);
  String_releaseFfiHandle(_stringField_handle);
  smoke_DefaultValues_SomeEnum_releaseFfiHandle(_enumField_handle);
  return _result;
}
DefaultValues_NullableStructWithDefaults smoke_DefaultValues_NullableStructWithDefaults_fromFfi(Pointer<Void> handle) {
  final _intField_handle = _smoke_DefaultValues_NullableStructWithDefaults_get_field_intField(handle);
  final _uintField_handle = _smoke_DefaultValues_NullableStructWithDefaults_get_field_uintField(handle);
  final _floatField_handle = _smoke_DefaultValues_NullableStructWithDefaults_get_field_floatField(handle);
  final _boolField_handle = _smoke_DefaultValues_NullableStructWithDefaults_get_field_boolField(handle);
  final _stringField_handle = _smoke_DefaultValues_NullableStructWithDefaults_get_field_stringField(handle);
  final _enumField_handle = _smoke_DefaultValues_NullableStructWithDefaults_get_field_enumField(handle);
  final _result = DefaultValues_NullableStructWithDefaults(
    (_intField_handle),
    (_uintField_handle),
    (_floatField_handle),
    Boolean_fromFfi(_boolField_handle),
    String_fromFfi(_stringField_handle),
    smoke_DefaultValues_SomeEnum_fromFfi(_enumField_handle)
  );
  (_intField_handle);
  (_uintField_handle);
  (_floatField_handle);
  Boolean_releaseFfiHandle(_boolField_handle);
  String_releaseFfiHandle(_stringField_handle);
  smoke_DefaultValues_SomeEnum_releaseFfiHandle(_enumField_handle);
  return _result;
}
void smoke_DefaultValues_NullableStructWithDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_DefaultValues_NullableStructWithDefaults_release_handle(handle);
// End of DefaultValues_NullableStructWithDefaults "private" section.
class DefaultValues_StructWithSpecialDefaults {
  double floatNanField;
  double floatInfinityField;
  double floatNegativeInfinityField;
  double doubleNanField;
  double doubleInfinityField;
  double doubleNegativeInfinityField;
  DefaultValues_StructWithSpecialDefaults(this.floatNanField, this.floatInfinityField, this.floatNegativeInfinityField, this.doubleNanField, this.doubleInfinityField, this.doubleNegativeInfinityField);
  DefaultValues_StructWithSpecialDefaults.withDefaults()
    : floatNanField = double.nan, floatInfinityField = double.infinity, floatNegativeInfinityField = double.negativeInfinity, doubleNanField = double.nan, doubleInfinityField = double.infinity, doubleNegativeInfinityField = double.negativeInfinity;
}
// DefaultValues_StructWithSpecialDefaults "private" section, not exported.
final _smoke_DefaultValues_StructWithSpecialDefaults_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Float, Float, Float, Double, Double, Double),
    Pointer<Void> Function(double, double, double, double, double, double)
  >('smoke_DefaultValues_StructWithSpecialDefaults_create_handle');
final _smoke_DefaultValues_StructWithSpecialDefaults_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithSpecialDefaults_release_handle');
final _smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatNanField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatNanField');
final _smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatInfinityField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatInfinityField');
final _smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatNegativeInfinityField = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatNegativeInfinityField');
final _smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleNanField = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleNanField');
final _smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleInfinityField = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleInfinityField');
final _smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleNegativeInfinityField = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleNegativeInfinityField');
Pointer<Void> smoke_DefaultValues_StructWithSpecialDefaults_toFfi(DefaultValues_StructWithSpecialDefaults value) {
  final _floatNanField_handle = (value.floatNanField);
  final _floatInfinityField_handle = (value.floatInfinityField);
  final _floatNegativeInfinityField_handle = (value.floatNegativeInfinityField);
  final _doubleNanField_handle = (value.doubleNanField);
  final _doubleInfinityField_handle = (value.doubleInfinityField);
  final _doubleNegativeInfinityField_handle = (value.doubleNegativeInfinityField);
  final _result = _smoke_DefaultValues_StructWithSpecialDefaults_create_handle(_floatNanField_handle, _floatInfinityField_handle, _floatNegativeInfinityField_handle, _doubleNanField_handle, _doubleInfinityField_handle, _doubleNegativeInfinityField_handle);
  (_floatNanField_handle);
  (_floatInfinityField_handle);
  (_floatNegativeInfinityField_handle);
  (_doubleNanField_handle);
  (_doubleInfinityField_handle);
  (_doubleNegativeInfinityField_handle);
  return _result;
}
DefaultValues_StructWithSpecialDefaults smoke_DefaultValues_StructWithSpecialDefaults_fromFfi(Pointer<Void> handle) {
  final _floatNanField_handle = _smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatNanField(handle);
  final _floatInfinityField_handle = _smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatInfinityField(handle);
  final _floatNegativeInfinityField_handle = _smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatNegativeInfinityField(handle);
  final _doubleNanField_handle = _smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleNanField(handle);
  final _doubleInfinityField_handle = _smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleInfinityField(handle);
  final _doubleNegativeInfinityField_handle = _smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleNegativeInfinityField(handle);
  final _result = DefaultValues_StructWithSpecialDefaults(
    (_floatNanField_handle),
    (_floatInfinityField_handle),
    (_floatNegativeInfinityField_handle),
    (_doubleNanField_handle),
    (_doubleInfinityField_handle),
    (_doubleNegativeInfinityField_handle)
  );
  (_floatNanField_handle);
  (_floatInfinityField_handle);
  (_floatNegativeInfinityField_handle);
  (_doubleNanField_handle);
  (_doubleInfinityField_handle);
  (_doubleNegativeInfinityField_handle);
  return _result;
}
void smoke_DefaultValues_StructWithSpecialDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_DefaultValues_StructWithSpecialDefaults_release_handle(handle);
// End of DefaultValues_StructWithSpecialDefaults "private" section.
class DefaultValues_StructWithEmptyDefaults {
  List<int> intsField;
  List<double> floatsField;
  Map<int, String> mapField;
  DefaultValues_StructWithDefaults structField;
  Set<String> setTypeField;
  DefaultValues_StructWithEmptyDefaults(this.intsField, this.floatsField, this.mapField, this.structField, this.setTypeField);
  DefaultValues_StructWithEmptyDefaults.withDefaults()
    : intsField = [], floatsField = [], mapField = {}, structField = DefaultValues_StructWithDefaults.withDefaults(), setTypeField = {};
}
// DefaultValues_StructWithEmptyDefaults "private" section, not exported.
final _smoke_DefaultValues_StructWithEmptyDefaults_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('smoke_DefaultValues_StructWithEmptyDefaults_create_handle');
final _smoke_DefaultValues_StructWithEmptyDefaults_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithEmptyDefaults_release_handle');
final _smoke_DefaultValues_StructWithEmptyDefaults_get_field_intsField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithEmptyDefaults_get_field_intsField');
final _smoke_DefaultValues_StructWithEmptyDefaults_get_field_floatsField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithEmptyDefaults_get_field_floatsField');
final _smoke_DefaultValues_StructWithEmptyDefaults_get_field_mapField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithEmptyDefaults_get_field_mapField');
final _smoke_DefaultValues_StructWithEmptyDefaults_get_field_structField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithEmptyDefaults_get_field_structField');
final _smoke_DefaultValues_StructWithEmptyDefaults_get_field_setTypeField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithEmptyDefaults_get_field_setTypeField');
Pointer<Void> smoke_DefaultValues_StructWithEmptyDefaults_toFfi(DefaultValues_StructWithEmptyDefaults value) {
  final _intsField_handle = ListOf_Int_toFfi(value.intsField);
  final _floatsField_handle = ListOf_Float_toFfi(value.floatsField);
  final _mapField_handle = MapOf_UInt_to_String_toFfi(value.mapField);
  final _structField_handle = smoke_DefaultValues_StructWithDefaults_toFfi(value.structField);
  final _setTypeField_handle = SetOf_String_toFfi(value.setTypeField);
  final _result = _smoke_DefaultValues_StructWithEmptyDefaults_create_handle(_intsField_handle, _floatsField_handle, _mapField_handle, _structField_handle, _setTypeField_handle);
  ListOf_Int_releaseFfiHandle(_intsField_handle);
  ListOf_Float_releaseFfiHandle(_floatsField_handle);
  MapOf_UInt_to_String_releaseFfiHandle(_mapField_handle);
  smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(_structField_handle);
  SetOf_String_releaseFfiHandle(_setTypeField_handle);
  return _result;
}
DefaultValues_StructWithEmptyDefaults smoke_DefaultValues_StructWithEmptyDefaults_fromFfi(Pointer<Void> handle) {
  final _intsField_handle = _smoke_DefaultValues_StructWithEmptyDefaults_get_field_intsField(handle);
  final _floatsField_handle = _smoke_DefaultValues_StructWithEmptyDefaults_get_field_floatsField(handle);
  final _mapField_handle = _smoke_DefaultValues_StructWithEmptyDefaults_get_field_mapField(handle);
  final _structField_handle = _smoke_DefaultValues_StructWithEmptyDefaults_get_field_structField(handle);
  final _setTypeField_handle = _smoke_DefaultValues_StructWithEmptyDefaults_get_field_setTypeField(handle);
  final _result = DefaultValues_StructWithEmptyDefaults(
    ListOf_Int_fromFfi(_intsField_handle),
    ListOf_Float_fromFfi(_floatsField_handle),
    MapOf_UInt_to_String_fromFfi(_mapField_handle),
    smoke_DefaultValues_StructWithDefaults_fromFfi(_structField_handle),
    SetOf_String_fromFfi(_setTypeField_handle)
  );
  ListOf_Int_releaseFfiHandle(_intsField_handle);
  ListOf_Float_releaseFfiHandle(_floatsField_handle);
  MapOf_UInt_to_String_releaseFfiHandle(_mapField_handle);
  smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(_structField_handle);
  SetOf_String_releaseFfiHandle(_setTypeField_handle);
  return _result;
}
void smoke_DefaultValues_StructWithEmptyDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_DefaultValues_StructWithEmptyDefaults_release_handle(handle);
// End of DefaultValues_StructWithEmptyDefaults "private" section.
class DefaultValues_StructWithTypedefDefaults {
  int longField;
  bool boolField;
  String stringField;
  DefaultValues_SomeEnum enumField;
  DefaultValues_StructWithTypedefDefaults(this.longField, this.boolField, this.stringField, this.enumField);
  DefaultValues_StructWithTypedefDefaults.withDefaults()
    : longField = 42, boolField = true, stringField = "\\Jonny \"Magic\" Smith\n", enumField = DefaultValues_SomeEnum.barValue;
}
// DefaultValues_StructWithTypedefDefaults "private" section, not exported.
final _smoke_DefaultValues_StructWithTypedefDefaults_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int64, Uint8, Pointer<Void>, Uint32),
    Pointer<Void> Function(int, int, Pointer<Void>, int)
  >('smoke_DefaultValues_StructWithTypedefDefaults_create_handle');
final _smoke_DefaultValues_StructWithTypedefDefaults_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithTypedefDefaults_release_handle');
final _smoke_DefaultValues_StructWithTypedefDefaults_get_field_longField = __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithTypedefDefaults_get_field_longField');
final _smoke_DefaultValues_StructWithTypedefDefaults_get_field_boolField = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithTypedefDefaults_get_field_boolField');
final _smoke_DefaultValues_StructWithTypedefDefaults_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithTypedefDefaults_get_field_stringField');
final _smoke_DefaultValues_StructWithTypedefDefaults_get_field_enumField = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_DefaultValues_StructWithTypedefDefaults_get_field_enumField');
Pointer<Void> smoke_DefaultValues_StructWithTypedefDefaults_toFfi(DefaultValues_StructWithTypedefDefaults value) {
  final _longField_handle = (value.longField);
  final _boolField_handle = Boolean_toFfi(value.boolField);
  final _stringField_handle = String_toFfi(value.stringField);
  final _enumField_handle = smoke_DefaultValues_SomeEnum_toFfi(value.enumField);
  final _result = _smoke_DefaultValues_StructWithTypedefDefaults_create_handle(_longField_handle, _boolField_handle, _stringField_handle, _enumField_handle);
  (_longField_handle);
  Boolean_releaseFfiHandle(_boolField_handle);
  String_releaseFfiHandle(_stringField_handle);
  smoke_DefaultValues_SomeEnum_releaseFfiHandle(_enumField_handle);
  return _result;
}
DefaultValues_StructWithTypedefDefaults smoke_DefaultValues_StructWithTypedefDefaults_fromFfi(Pointer<Void> handle) {
  final _longField_handle = _smoke_DefaultValues_StructWithTypedefDefaults_get_field_longField(handle);
  final _boolField_handle = _smoke_DefaultValues_StructWithTypedefDefaults_get_field_boolField(handle);
  final _stringField_handle = _smoke_DefaultValues_StructWithTypedefDefaults_get_field_stringField(handle);
  final _enumField_handle = _smoke_DefaultValues_StructWithTypedefDefaults_get_field_enumField(handle);
  final _result = DefaultValues_StructWithTypedefDefaults(
    (_longField_handle),
    Boolean_fromFfi(_boolField_handle),
    String_fromFfi(_stringField_handle),
    smoke_DefaultValues_SomeEnum_fromFfi(_enumField_handle)
  );
  (_longField_handle);
  Boolean_releaseFfiHandle(_boolField_handle);
  String_releaseFfiHandle(_stringField_handle);
  smoke_DefaultValues_SomeEnum_releaseFfiHandle(_enumField_handle);
  return _result;
}
void smoke_DefaultValues_StructWithTypedefDefaults_releaseFfiHandle(Pointer<Void> handle) => _smoke_DefaultValues_StructWithTypedefDefaults_release_handle(handle);
// End of DefaultValues_StructWithTypedefDefaults "private" section.
