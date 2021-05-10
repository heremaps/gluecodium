import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/an_enum.dart';
import 'package:library/src/smoke/default_values.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
enum SomeEnum {
    fooValue,
    barValue
}
// SomeEnum "private" section, not exported.
int smoke_TypesWithDefaults_SomeEnum_toFfi(SomeEnum value) {
  switch (value) {
  case SomeEnum.fooValue:
    return 0;
  break;
  case SomeEnum.barValue:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for SomeEnum enum.");
  }
}
SomeEnum smoke_TypesWithDefaults_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return SomeEnum.fooValue;
  break;
  case 1:
    return SomeEnum.barValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for SomeEnum enum.");
  }
}
void smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_TypesWithDefaults_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_TypesWithDefaults_SomeEnum_create_handle_nullable'));
final _smoke_TypesWithDefaults_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_SomeEnum_release_handle_nullable'));
final _smoke_TypesWithDefaults_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_TypesWithDefaults_SomeEnum_toFfi_nullable(SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_TypesWithDefaults_SomeEnum_toFfi(value);
  final result = _smoke_TypesWithDefaults_SomeEnumCreateHandleNullable(_handle);
  smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
SomeEnum smoke_TypesWithDefaults_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_TypesWithDefaults_SomeEnumGetValueNullable(handle);
  final result = smoke_TypesWithDefaults_SomeEnum_fromFfi(_handle);
  smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_TypesWithDefaults_SomeEnumReleaseHandleNullable(handle);
// End of SomeEnum "private" section.
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
final _smokeTypeswithdefaultsStructwithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Double, Uint8, Pointer<Void>, Uint32),
    Pointer<Void> Function(int, int, double, double, int, Pointer<Void>, int)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_create_handle'));
final _smokeTypeswithdefaultsStructwithdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_release_handle'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_intField'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFielduintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_uintField'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_floatField'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFielddoubleField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_doubleField'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_boolField'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_stringField'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_enumField'));
Pointer<Void> smoke_TypesWithDefaults_StructWithDefaults_toFfi(StructWithDefaults value) {
  final _intFieldHandle = (value.intField);
  final _uintFieldHandle = (value.uintField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _boolFieldHandle = Boolean_toFfi(value.boolField);
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _enumFieldHandle = smoke_TypesWithDefaults_SomeEnum_toFfi(value.enumField);
  final _result = _smokeTypeswithdefaultsStructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _doubleFieldHandle, _boolFieldHandle, _stringFieldHandle, _enumFieldHandle);
  (_intFieldHandle);
  (_uintFieldHandle);
  (_floatFieldHandle);
  (_doubleFieldHandle);
  Boolean_releaseFfiHandle(_boolFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle(_enumFieldHandle);
  return _result;
}
StructWithDefaults smoke_TypesWithDefaults_StructWithDefaults_fromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldintField(handle);
  final _uintFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFielduintField(handle);
  final _floatFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldfloatField(handle);
  final _doubleFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFielddoubleField(handle);
  final _boolFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldstringField(handle);
  final _enumFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldenumField(handle);
  try {
    return StructWithDefaults(
      (_intFieldHandle),
      (_uintFieldHandle),
      (_floatFieldHandle),
      (_doubleFieldHandle),
      Boolean_fromFfi(_boolFieldHandle),
      String_fromFfi(_stringFieldHandle),
      smoke_TypesWithDefaults_SomeEnum_fromFfi(_enumFieldHandle)
    );
  } finally {
    (_intFieldHandle);
    (_uintFieldHandle);
    (_floatFieldHandle);
    (_doubleFieldHandle);
    Boolean_releaseFfiHandle(_boolFieldHandle);
    String_releaseFfiHandle(_stringFieldHandle);
    smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle(_enumFieldHandle);
  }
}
void smoke_TypesWithDefaults_StructWithDefaults_releaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsStructwithdefaultsReleaseHandle(handle);
// Nullable StructWithDefaults
final _smoke_TypesWithDefaults_StructWithDefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_create_handle_nullable'));
final _smoke_TypesWithDefaults_StructWithDefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_release_handle_nullable'));
final _smoke_TypesWithDefaults_StructWithDefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_value_nullable'));
Pointer<Void> smoke_TypesWithDefaults_StructWithDefaults_toFfi_nullable(StructWithDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_TypesWithDefaults_StructWithDefaults_toFfi(value);
  final result = _smoke_TypesWithDefaults_StructWithDefaultsCreateHandleNullable(_handle);
  smoke_TypesWithDefaults_StructWithDefaults_releaseFfiHandle(_handle);
  return result;
}
StructWithDefaults smoke_TypesWithDefaults_StructWithDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_TypesWithDefaults_StructWithDefaultsGetValueNullable(handle);
  final result = smoke_TypesWithDefaults_StructWithDefaults_fromFfi(_handle);
  smoke_TypesWithDefaults_StructWithDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_TypesWithDefaults_StructWithDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_TypesWithDefaults_StructWithDefaultsReleaseHandleNullable(handle);
// End of StructWithDefaults "private" section.
@immutable
class ImmutableStructWithDefaults {
  final int intField;
  final int uintField;
  final double floatField;
  final double doubleField;
  final bool boolField;
  final String stringField;
  final SomeEnum enumField;
  final DefaultValues_ExternalEnum externalEnumField;
  const ImmutableStructWithDefaults(this.intField, this.uintField, this.floatField, this.doubleField, this.boolField, this.stringField, this.enumField, this.externalEnumField);
  const ImmutableStructWithDefaults.withDefaults(int uintField, bool boolField)
    : intField = 42, uintField = uintField, floatField = 3.14, doubleField = -1.4142, boolField = boolField, stringField = "\\Jonny \"Magic\" Smith\n", enumField = SomeEnum.barValue, externalEnumField = DefaultValues_ExternalEnum.anotherValue;
}
// ImmutableStructWithDefaults "private" section, not exported.
final _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Double, Uint8, Pointer<Void>, Uint32, Uint32),
    Pointer<Void> Function(int, int, double, double, int, Pointer<Void>, int, int)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_handle'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_intField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFielduintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_uintField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_floatField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFielddoubleField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_doubleField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_boolField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_stringField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_enumField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldexternalEnumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_externalEnumField'));
Pointer<Void> smoke_TypesWithDefaults_ImmutableStructWithDefaults_toFfi(ImmutableStructWithDefaults value) {
  final _intFieldHandle = (value.intField);
  final _uintFieldHandle = (value.uintField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _boolFieldHandle = Boolean_toFfi(value.boolField);
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _enumFieldHandle = smoke_TypesWithDefaults_SomeEnum_toFfi(value.enumField);
  final _externalEnumFieldHandle = smoke_DefaultValues_ExternalEnum_toFfi(value.externalEnumField);
  final _result = _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _doubleFieldHandle, _boolFieldHandle, _stringFieldHandle, _enumFieldHandle, _externalEnumFieldHandle);
  (_intFieldHandle);
  (_uintFieldHandle);
  (_floatFieldHandle);
  (_doubleFieldHandle);
  Boolean_releaseFfiHandle(_boolFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle(_enumFieldHandle);
  smoke_DefaultValues_ExternalEnum_releaseFfiHandle(_externalEnumFieldHandle);
  return _result;
}
ImmutableStructWithDefaults smoke_TypesWithDefaults_ImmutableStructWithDefaults_fromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldintField(handle);
  final _uintFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFielduintField(handle);
  final _floatFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldfloatField(handle);
  final _doubleFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFielddoubleField(handle);
  final _boolFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldstringField(handle);
  final _enumFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldenumField(handle);
  final _externalEnumFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldexternalEnumField(handle);
  try {
    return ImmutableStructWithDefaults(
      (_intFieldHandle),
      (_uintFieldHandle),
      (_floatFieldHandle),
      (_doubleFieldHandle),
      Boolean_fromFfi(_boolFieldHandle),
      String_fromFfi(_stringFieldHandle),
      smoke_TypesWithDefaults_SomeEnum_fromFfi(_enumFieldHandle),
      smoke_DefaultValues_ExternalEnum_fromFfi(_externalEnumFieldHandle)
    );
  } finally {
    (_intFieldHandle);
    (_uintFieldHandle);
    (_floatFieldHandle);
    (_doubleFieldHandle);
    Boolean_releaseFfiHandle(_boolFieldHandle);
    String_releaseFfiHandle(_stringFieldHandle);
    smoke_TypesWithDefaults_SomeEnum_releaseFfiHandle(_enumFieldHandle);
    smoke_DefaultValues_ExternalEnum_releaseFfiHandle(_externalEnumFieldHandle);
  }
}
void smoke_TypesWithDefaults_ImmutableStructWithDefaults_releaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseHandle(handle);
// Nullable ImmutableStructWithDefaults
final _smoke_TypesWithDefaults_ImmutableStructWithDefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_handle_nullable'));
final _smoke_TypesWithDefaults_ImmutableStructWithDefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle_nullable'));
final _smoke_TypesWithDefaults_ImmutableStructWithDefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_value_nullable'));
Pointer<Void> smoke_TypesWithDefaults_ImmutableStructWithDefaults_toFfi_nullable(ImmutableStructWithDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_TypesWithDefaults_ImmutableStructWithDefaults_toFfi(value);
  final result = _smoke_TypesWithDefaults_ImmutableStructWithDefaultsCreateHandleNullable(_handle);
  smoke_TypesWithDefaults_ImmutableStructWithDefaults_releaseFfiHandle(_handle);
  return result;
}
ImmutableStructWithDefaults smoke_TypesWithDefaults_ImmutableStructWithDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_TypesWithDefaults_ImmutableStructWithDefaultsGetValueNullable(handle);
  final result = smoke_TypesWithDefaults_ImmutableStructWithDefaults_fromFfi(_handle);
  smoke_TypesWithDefaults_ImmutableStructWithDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_TypesWithDefaults_ImmutableStructWithDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_TypesWithDefaults_ImmutableStructWithDefaultsReleaseHandleNullable(handle);
// End of ImmutableStructWithDefaults "private" section.
class StructWithAnEnum {
  AnEnum config;
  StructWithAnEnum(this.config);
  StructWithAnEnum.withDefaults()
    : config = AnEnum.enabled;
}
// StructWithAnEnum "private" section, not exported.
final _smokeTypeswithdefaultsStructwithanenumCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_TypesWithDefaults_StructWithAnEnum_create_handle'));
final _smokeTypeswithdefaultsStructwithanenumReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithAnEnum_release_handle'));
final _smokeTypeswithdefaultsStructwithanenumGetFieldconfig = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithAnEnum_get_field_config'));
Pointer<Void> smoke_TypesWithDefaults_StructWithAnEnum_toFfi(StructWithAnEnum value) {
  final _configHandle = smoke_AnEnum_AnEnum_toFfi(value.config);
  final _result = _smokeTypeswithdefaultsStructwithanenumCreateHandle(_configHandle);
  smoke_AnEnum_AnEnum_releaseFfiHandle(_configHandle);
  return _result;
}
StructWithAnEnum smoke_TypesWithDefaults_StructWithAnEnum_fromFfi(Pointer<Void> handle) {
  final _configHandle = _smokeTypeswithdefaultsStructwithanenumGetFieldconfig(handle);
  try {
    return StructWithAnEnum(
      smoke_AnEnum_AnEnum_fromFfi(_configHandle)
    );
  } finally {
    smoke_AnEnum_AnEnum_releaseFfiHandle(_configHandle);
  }
}
void smoke_TypesWithDefaults_StructWithAnEnum_releaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsStructwithanenumReleaseHandle(handle);
// Nullable StructWithAnEnum
final _smoke_TypesWithDefaults_StructWithAnEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithAnEnum_create_handle_nullable'));
final _smoke_TypesWithDefaults_StructWithAnEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithAnEnum_release_handle_nullable'));
final _smoke_TypesWithDefaults_StructWithAnEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithAnEnum_get_value_nullable'));
Pointer<Void> smoke_TypesWithDefaults_StructWithAnEnum_toFfi_nullable(StructWithAnEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_TypesWithDefaults_StructWithAnEnum_toFfi(value);
  final result = _smoke_TypesWithDefaults_StructWithAnEnumCreateHandleNullable(_handle);
  smoke_TypesWithDefaults_StructWithAnEnum_releaseFfiHandle(_handle);
  return result;
}
StructWithAnEnum smoke_TypesWithDefaults_StructWithAnEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_TypesWithDefaults_StructWithAnEnumGetValueNullable(handle);
  final result = smoke_TypesWithDefaults_StructWithAnEnum_fromFfi(_handle);
  smoke_TypesWithDefaults_StructWithAnEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_TypesWithDefaults_StructWithAnEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_TypesWithDefaults_StructWithAnEnumReleaseHandleNullable(handle);
// End of StructWithAnEnum "private" section.
