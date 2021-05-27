import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/an_enum.dart';
import 'package:library/src/smoke/default_values.dart';
import 'package:meta/meta.dart';
enum SomeEnum {
    fooValue,
    barValue
}
// SomeEnum "private" section, not exported.
int smokeTypeswithdefaultsSomeenumToFfi(SomeEnum value) {
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
SomeEnum smokeTypeswithdefaultsSomeenumFromFfi(int handle) {
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
void smokeTypeswithdefaultsSomeenumReleaseFfiHandle(int handle) {}
final _smokeTypeswithdefaultsSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_TypesWithDefaults_SomeEnum_create_handle_nullable'));
final _smokeTypeswithdefaultsSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_SomeEnum_release_handle_nullable'));
final _smokeTypeswithdefaultsSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_SomeEnum_get_value_nullable'));
Pointer<Void> smokeTypeswithdefaultsSomeenumToFfiNullable(SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsSomeenumToFfi(value);
  final result = _smokeTypeswithdefaultsSomeenumCreateHandleNullable(_handle);
  smokeTypeswithdefaultsSomeenumReleaseFfiHandle(_handle);
  return result;
}
SomeEnum smokeTypeswithdefaultsSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsSomeenumGetValueNullable(handle);
  final result = smokeTypeswithdefaultsSomeenumFromFfi(_handle);
  smokeTypeswithdefaultsSomeenumReleaseFfiHandle(_handle);
  return result;
}
void smokeTypeswithdefaultsSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsSomeenumReleaseHandleNullable(handle);
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
Pointer<Void> smokeTypeswithdefaultsStructwithdefaultsToFfi(StructWithDefaults value) {
  final _intFieldHandle = (value.intField);
  final _uintFieldHandle = (value.uintField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _enumFieldHandle = smokeTypeswithdefaultsSomeenumToFfi(value.enumField);
  final _result = _smokeTypeswithdefaultsStructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _doubleFieldHandle, _boolFieldHandle, _stringFieldHandle, _enumFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  smokeTypeswithdefaultsSomeenumReleaseFfiHandle(_enumFieldHandle);
  return _result;
}
StructWithDefaults smokeTypeswithdefaultsStructwithdefaultsFromFfi(Pointer<Void> handle) {
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
      booleanFromFfi(_boolFieldHandle),
      stringFromFfi(_stringFieldHandle),
      smokeTypeswithdefaultsSomeenumFromFfi(_enumFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_boolFieldHandle);
    stringReleaseFfiHandle(_stringFieldHandle);
    smokeTypeswithdefaultsSomeenumReleaseFfiHandle(_enumFieldHandle);
  }
}
void smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsStructwithdefaultsReleaseHandle(handle);
// Nullable StructWithDefaults
final _smokeTypeswithdefaultsStructwithdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_create_handle_nullable'));
final _smokeTypeswithdefaultsStructwithdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_release_handle_nullable'));
final _smokeTypeswithdefaultsStructwithdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_value_nullable'));
Pointer<Void> smokeTypeswithdefaultsStructwithdefaultsToFfiNullable(StructWithDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsStructwithdefaultsToFfi(value);
  final result = _smokeTypeswithdefaultsStructwithdefaultsCreateHandleNullable(_handle);
  smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
StructWithDefaults smokeTypeswithdefaultsStructwithdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsStructwithdefaultsGetValueNullable(handle);
  final result = smokeTypeswithdefaultsStructwithdefaultsFromFfi(_handle);
  smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsStructwithdefaultsReleaseHandleNullable(handle);
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
Pointer<Void> smokeTypeswithdefaultsImmutablestructwithdefaultsToFfi(ImmutableStructWithDefaults value) {
  final _intFieldHandle = (value.intField);
  final _uintFieldHandle = (value.uintField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _enumFieldHandle = smokeTypeswithdefaultsSomeenumToFfi(value.enumField);
  final _externalEnumFieldHandle = smokeDefaultvaluesExternalenumToFfi(value.externalEnumField);
  final _result = _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _doubleFieldHandle, _boolFieldHandle, _stringFieldHandle, _enumFieldHandle, _externalEnumFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  smokeTypeswithdefaultsSomeenumReleaseFfiHandle(_enumFieldHandle);
  smokeDefaultvaluesExternalenumReleaseFfiHandle(_externalEnumFieldHandle);
  return _result;
}
ImmutableStructWithDefaults smokeTypeswithdefaultsImmutablestructwithdefaultsFromFfi(Pointer<Void> handle) {
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
      booleanFromFfi(_boolFieldHandle),
      stringFromFfi(_stringFieldHandle),
      smokeTypeswithdefaultsSomeenumFromFfi(_enumFieldHandle),
      smokeDefaultvaluesExternalenumFromFfi(_externalEnumFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_boolFieldHandle);
    stringReleaseFfiHandle(_stringFieldHandle);
    smokeTypeswithdefaultsSomeenumReleaseFfiHandle(_enumFieldHandle);
    smokeDefaultvaluesExternalenumReleaseFfiHandle(_externalEnumFieldHandle);
  }
}
void smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseHandle(handle);
// Nullable ImmutableStructWithDefaults
final _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_handle_nullable'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle_nullable'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_value_nullable'));
Pointer<Void> smokeTypeswithdefaultsImmutablestructwithdefaultsToFfiNullable(ImmutableStructWithDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsImmutablestructwithdefaultsToFfi(value);
  final result = _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandleNullable(_handle);
  smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
ImmutableStructWithDefaults smokeTypeswithdefaultsImmutablestructwithdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetValueNullable(handle);
  final result = smokeTypeswithdefaultsImmutablestructwithdefaultsFromFfi(_handle);
  smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseHandleNullable(handle);
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
Pointer<Void> smokeTypeswithdefaultsStructwithanenumToFfi(StructWithAnEnum value) {
  final _configHandle = smokeAnenumAnenumToFfi(value.config);
  final _result = _smokeTypeswithdefaultsStructwithanenumCreateHandle(_configHandle);
  smokeAnenumAnenumReleaseFfiHandle(_configHandle);
  return _result;
}
StructWithAnEnum smokeTypeswithdefaultsStructwithanenumFromFfi(Pointer<Void> handle) {
  final _configHandle = _smokeTypeswithdefaultsStructwithanenumGetFieldconfig(handle);
  try {
    return StructWithAnEnum(
      smokeAnenumAnenumFromFfi(_configHandle)
    );
  } finally {
    smokeAnenumAnenumReleaseFfiHandle(_configHandle);
  }
}
void smokeTypeswithdefaultsStructwithanenumReleaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsStructwithanenumReleaseHandle(handle);
// Nullable StructWithAnEnum
final _smokeTypeswithdefaultsStructwithanenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithAnEnum_create_handle_nullable'));
final _smokeTypeswithdefaultsStructwithanenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithAnEnum_release_handle_nullable'));
final _smokeTypeswithdefaultsStructwithanenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithAnEnum_get_value_nullable'));
Pointer<Void> smokeTypeswithdefaultsStructwithanenumToFfiNullable(StructWithAnEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsStructwithanenumToFfi(value);
  final result = _smokeTypeswithdefaultsStructwithanenumCreateHandleNullable(_handle);
  smokeTypeswithdefaultsStructwithanenumReleaseFfiHandle(_handle);
  return result;
}
StructWithAnEnum smokeTypeswithdefaultsStructwithanenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsStructwithanenumGetValueNullable(handle);
  final result = smokeTypeswithdefaultsStructwithanenumFromFfi(_handle);
  smokeTypeswithdefaultsStructwithanenumReleaseFfiHandle(_handle);
  return result;
}
void smokeTypeswithdefaultsStructwithanenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsStructwithanenumReleaseHandleNullable(handle);
// End of StructWithAnEnum "private" section.
