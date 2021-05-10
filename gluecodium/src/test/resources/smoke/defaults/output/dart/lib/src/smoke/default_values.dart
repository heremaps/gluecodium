import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class DefaultValues {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static DefaultValues_StructWithDefaults processStructWithDefaults(DefaultValues_StructWithDefaults input) => DefaultValues$Impl.processStructWithDefaults(input);
}
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
final _smoke_DefaultValues_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_DefaultValues_SomeEnum_create_handle_nullable'));
final _smoke_DefaultValues_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_SomeEnum_release_handle_nullable'));
final _smoke_DefaultValues_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DefaultValues_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_DefaultValues_SomeEnum_toFfi_nullable(DefaultValues_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DefaultValues_SomeEnum_toFfi(value);
  final result = _smoke_DefaultValues_SomeEnumCreateHandleNullable(_handle);
  smoke_DefaultValues_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
DefaultValues_SomeEnum smoke_DefaultValues_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DefaultValues_SomeEnumGetValueNullable(handle);
  final result = smoke_DefaultValues_SomeEnum_fromFfi(_handle);
  smoke_DefaultValues_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_DefaultValues_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DefaultValues_SomeEnumReleaseHandleNullable(handle);
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
final _smoke_DefaultValues_ExternalEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_DefaultValues_ExternalEnum_create_handle_nullable'));
final _smoke_DefaultValues_ExternalEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_ExternalEnum_release_handle_nullable'));
final _smoke_DefaultValues_ExternalEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DefaultValues_ExternalEnum_get_value_nullable'));
Pointer<Void> smoke_DefaultValues_ExternalEnum_toFfi_nullable(DefaultValues_ExternalEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DefaultValues_ExternalEnum_toFfi(value);
  final result = _smoke_DefaultValues_ExternalEnumCreateHandleNullable(_handle);
  smoke_DefaultValues_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
DefaultValues_ExternalEnum smoke_DefaultValues_ExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DefaultValues_ExternalEnumGetValueNullable(handle);
  final result = smoke_DefaultValues_ExternalEnum_fromFfi(_handle);
  smoke_DefaultValues_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_DefaultValues_ExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DefaultValues_ExternalEnumReleaseHandleNullable(handle);
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
final _smokeDefaultvaluesStructwithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Double, Uint8, Pointer<Void>, Uint32, Uint32),
    Pointer<Void> Function(int, int, double, double, int, Pointer<Void>, int, int)
  >('library_smoke_DefaultValues_StructWithDefaults_create_handle'));
final _smokeDefaultvaluesStructwithdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_release_handle'));
final _smokeDefaultvaluesStructwithdefaultsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_get_field_intField'));
final _smokeDefaultvaluesStructwithdefaultsGetFielduintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_get_field_uintField'));
final _smokeDefaultvaluesStructwithdefaultsGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_get_field_floatField'));
final _smokeDefaultvaluesStructwithdefaultsGetFielddoubleField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_get_field_doubleField'));
final _smokeDefaultvaluesStructwithdefaultsGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_get_field_boolField'));
final _smokeDefaultvaluesStructwithdefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_get_field_stringField'));
final _smokeDefaultvaluesStructwithdefaultsGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_get_field_enumField'));
final _smokeDefaultvaluesStructwithdefaultsGetFieldexternalEnumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_get_field_externalEnumField'));
Pointer<Void> smoke_DefaultValues_StructWithDefaults_toFfi(DefaultValues_StructWithDefaults value) {
  final _intFieldHandle = (value.intField);
  final _uintFieldHandle = (value.uintField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _boolFieldHandle = Boolean_toFfi(value.boolField);
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _enumFieldHandle = smoke_DefaultValues_SomeEnum_toFfi(value.enumField);
  final _externalEnumFieldHandle = smoke_DefaultValues_ExternalEnum_toFfi(value.externalEnumField);
  final _result = _smokeDefaultvaluesStructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _doubleFieldHandle, _boolFieldHandle, _stringFieldHandle, _enumFieldHandle, _externalEnumFieldHandle);
  (_intFieldHandle);
  (_uintFieldHandle);
  (_floatFieldHandle);
  (_doubleFieldHandle);
  Boolean_releaseFfiHandle(_boolFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  smoke_DefaultValues_SomeEnum_releaseFfiHandle(_enumFieldHandle);
  smoke_DefaultValues_ExternalEnum_releaseFfiHandle(_externalEnumFieldHandle);
  return _result;
}
DefaultValues_StructWithDefaults smoke_DefaultValues_StructWithDefaults_fromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFieldintField(handle);
  final _uintFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFielduintField(handle);
  final _floatFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFieldfloatField(handle);
  final _doubleFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFielddoubleField(handle);
  final _boolFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFieldstringField(handle);
  final _enumFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFieldenumField(handle);
  final _externalEnumFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFieldexternalEnumField(handle);
  try {
    return DefaultValues_StructWithDefaults(
      (_intFieldHandle),
      (_uintFieldHandle),
      (_floatFieldHandle),
      (_doubleFieldHandle),
      Boolean_fromFfi(_boolFieldHandle),
      String_fromFfi(_stringFieldHandle),
      smoke_DefaultValues_SomeEnum_fromFfi(_enumFieldHandle),
      smoke_DefaultValues_ExternalEnum_fromFfi(_externalEnumFieldHandle)
    );
  } finally {
    (_intFieldHandle);
    (_uintFieldHandle);
    (_floatFieldHandle);
    (_doubleFieldHandle);
    Boolean_releaseFfiHandle(_boolFieldHandle);
    String_releaseFfiHandle(_stringFieldHandle);
    smoke_DefaultValues_SomeEnum_releaseFfiHandle(_enumFieldHandle);
    smoke_DefaultValues_ExternalEnum_releaseFfiHandle(_externalEnumFieldHandle);
  }
}
void smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(Pointer<Void> handle) => _smokeDefaultvaluesStructwithdefaultsReleaseHandle(handle);
// Nullable DefaultValues_StructWithDefaults
final _smoke_DefaultValues_StructWithDefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_create_handle_nullable'));
final _smoke_DefaultValues_StructWithDefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_release_handle_nullable'));
final _smoke_DefaultValues_StructWithDefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_get_value_nullable'));
Pointer<Void> smoke_DefaultValues_StructWithDefaults_toFfi_nullable(DefaultValues_StructWithDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DefaultValues_StructWithDefaults_toFfi(value);
  final result = _smoke_DefaultValues_StructWithDefaultsCreateHandleNullable(_handle);
  smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(_handle);
  return result;
}
DefaultValues_StructWithDefaults smoke_DefaultValues_StructWithDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DefaultValues_StructWithDefaultsGetValueNullable(handle);
  final result = smoke_DefaultValues_StructWithDefaults_fromFfi(_handle);
  smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_DefaultValues_StructWithDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DefaultValues_StructWithDefaultsReleaseHandleNullable(handle);
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
final _smokeDefaultvaluesNullablestructwithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_create_handle'));
final _smokeDefaultvaluesNullablestructwithdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_release_handle'));
final _smokeDefaultvaluesNullablestructwithdefaultsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_get_field_intField'));
final _smokeDefaultvaluesNullablestructwithdefaultsGetFielduintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_get_field_uintField'));
final _smokeDefaultvaluesNullablestructwithdefaultsGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_get_field_floatField'));
final _smokeDefaultvaluesNullablestructwithdefaultsGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_get_field_boolField'));
final _smokeDefaultvaluesNullablestructwithdefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_get_field_stringField'));
final _smokeDefaultvaluesNullablestructwithdefaultsGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_get_field_enumField'));
Pointer<Void> smoke_DefaultValues_NullableStructWithDefaults_toFfi(DefaultValues_NullableStructWithDefaults value) {
  final _intFieldHandle = Int_toFfi_nullable(value.intField);
  final _uintFieldHandle = UInt_toFfi_nullable(value.uintField);
  final _floatFieldHandle = Float_toFfi_nullable(value.floatField);
  final _boolFieldHandle = Boolean_toFfi_nullable(value.boolField);
  final _stringFieldHandle = String_toFfi_nullable(value.stringField);
  final _enumFieldHandle = smoke_DefaultValues_SomeEnum_toFfi_nullable(value.enumField);
  final _result = _smokeDefaultvaluesNullablestructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _boolFieldHandle, _stringFieldHandle, _enumFieldHandle);
  Int_releaseFfiHandle_nullable(_intFieldHandle);
  UInt_releaseFfiHandle_nullable(_uintFieldHandle);
  Float_releaseFfiHandle_nullable(_floatFieldHandle);
  Boolean_releaseFfiHandle_nullable(_boolFieldHandle);
  String_releaseFfiHandle_nullable(_stringFieldHandle);
  smoke_DefaultValues_SomeEnum_releaseFfiHandle_nullable(_enumFieldHandle);
  return _result;
}
DefaultValues_NullableStructWithDefaults smoke_DefaultValues_NullableStructWithDefaults_fromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeDefaultvaluesNullablestructwithdefaultsGetFieldintField(handle);
  final _uintFieldHandle = _smokeDefaultvaluesNullablestructwithdefaultsGetFielduintField(handle);
  final _floatFieldHandle = _smokeDefaultvaluesNullablestructwithdefaultsGetFieldfloatField(handle);
  final _boolFieldHandle = _smokeDefaultvaluesNullablestructwithdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeDefaultvaluesNullablestructwithdefaultsGetFieldstringField(handle);
  final _enumFieldHandle = _smokeDefaultvaluesNullablestructwithdefaultsGetFieldenumField(handle);
  try {
    return DefaultValues_NullableStructWithDefaults(
      Int_fromFfi_nullable(_intFieldHandle),
      UInt_fromFfi_nullable(_uintFieldHandle),
      Float_fromFfi_nullable(_floatFieldHandle),
      Boolean_fromFfi_nullable(_boolFieldHandle),
      String_fromFfi_nullable(_stringFieldHandle),
      smoke_DefaultValues_SomeEnum_fromFfi_nullable(_enumFieldHandle)
    );
  } finally {
    Int_releaseFfiHandle_nullable(_intFieldHandle);
    UInt_releaseFfiHandle_nullable(_uintFieldHandle);
    Float_releaseFfiHandle_nullable(_floatFieldHandle);
    Boolean_releaseFfiHandle_nullable(_boolFieldHandle);
    String_releaseFfiHandle_nullable(_stringFieldHandle);
    smoke_DefaultValues_SomeEnum_releaseFfiHandle_nullable(_enumFieldHandle);
  }
}
void smoke_DefaultValues_NullableStructWithDefaults_releaseFfiHandle(Pointer<Void> handle) => _smokeDefaultvaluesNullablestructwithdefaultsReleaseHandle(handle);
// Nullable DefaultValues_NullableStructWithDefaults
final _smoke_DefaultValues_NullableStructWithDefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_create_handle_nullable'));
final _smoke_DefaultValues_NullableStructWithDefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_release_handle_nullable'));
final _smoke_DefaultValues_NullableStructWithDefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_get_value_nullable'));
Pointer<Void> smoke_DefaultValues_NullableStructWithDefaults_toFfi_nullable(DefaultValues_NullableStructWithDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DefaultValues_NullableStructWithDefaults_toFfi(value);
  final result = _smoke_DefaultValues_NullableStructWithDefaultsCreateHandleNullable(_handle);
  smoke_DefaultValues_NullableStructWithDefaults_releaseFfiHandle(_handle);
  return result;
}
DefaultValues_NullableStructWithDefaults smoke_DefaultValues_NullableStructWithDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DefaultValues_NullableStructWithDefaultsGetValueNullable(handle);
  final result = smoke_DefaultValues_NullableStructWithDefaults_fromFfi(_handle);
  smoke_DefaultValues_NullableStructWithDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_DefaultValues_NullableStructWithDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DefaultValues_NullableStructWithDefaultsReleaseHandleNullable(handle);
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
final _smokeDefaultvaluesStructwithspecialdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Float, Float, Float, Double, Double, Double),
    Pointer<Void> Function(double, double, double, double, double, double)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_create_handle'));
final _smokeDefaultvaluesStructwithspecialdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_release_handle'));
final _smokeDefaultvaluesStructwithspecialdefaultsGetFieldfloatNanField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatNanField'));
final _smokeDefaultvaluesStructwithspecialdefaultsGetFieldfloatInfinityField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatInfinityField'));
final _smokeDefaultvaluesStructwithspecialdefaultsGetFieldfloatNegativeInfinityField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_get_field_floatNegativeInfinityField'));
final _smokeDefaultvaluesStructwithspecialdefaultsGetFielddoubleNanField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleNanField'));
final _smokeDefaultvaluesStructwithspecialdefaultsGetFielddoubleInfinityField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleInfinityField'));
final _smokeDefaultvaluesStructwithspecialdefaultsGetFielddoubleNegativeInfinityField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_get_field_doubleNegativeInfinityField'));
Pointer<Void> smoke_DefaultValues_StructWithSpecialDefaults_toFfi(DefaultValues_StructWithSpecialDefaults value) {
  final _floatNanFieldHandle = (value.floatNanField);
  final _floatInfinityFieldHandle = (value.floatInfinityField);
  final _floatNegativeInfinityFieldHandle = (value.floatNegativeInfinityField);
  final _doubleNanFieldHandle = (value.doubleNanField);
  final _doubleInfinityFieldHandle = (value.doubleInfinityField);
  final _doubleNegativeInfinityFieldHandle = (value.doubleNegativeInfinityField);
  final _result = _smokeDefaultvaluesStructwithspecialdefaultsCreateHandle(_floatNanFieldHandle, _floatInfinityFieldHandle, _floatNegativeInfinityFieldHandle, _doubleNanFieldHandle, _doubleInfinityFieldHandle, _doubleNegativeInfinityFieldHandle);
  (_floatNanFieldHandle);
  (_floatInfinityFieldHandle);
  (_floatNegativeInfinityFieldHandle);
  (_doubleNanFieldHandle);
  (_doubleInfinityFieldHandle);
  (_doubleNegativeInfinityFieldHandle);
  return _result;
}
DefaultValues_StructWithSpecialDefaults smoke_DefaultValues_StructWithSpecialDefaults_fromFfi(Pointer<Void> handle) {
  final _floatNanFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFieldfloatNanField(handle);
  final _floatInfinityFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFieldfloatInfinityField(handle);
  final _floatNegativeInfinityFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFieldfloatNegativeInfinityField(handle);
  final _doubleNanFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFielddoubleNanField(handle);
  final _doubleInfinityFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFielddoubleInfinityField(handle);
  final _doubleNegativeInfinityFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFielddoubleNegativeInfinityField(handle);
  try {
    return DefaultValues_StructWithSpecialDefaults(
      (_floatNanFieldHandle),
      (_floatInfinityFieldHandle),
      (_floatNegativeInfinityFieldHandle),
      (_doubleNanFieldHandle),
      (_doubleInfinityFieldHandle),
      (_doubleNegativeInfinityFieldHandle)
    );
  } finally {
    (_floatNanFieldHandle);
    (_floatInfinityFieldHandle);
    (_floatNegativeInfinityFieldHandle);
    (_doubleNanFieldHandle);
    (_doubleInfinityFieldHandle);
    (_doubleNegativeInfinityFieldHandle);
  }
}
void smoke_DefaultValues_StructWithSpecialDefaults_releaseFfiHandle(Pointer<Void> handle) => _smokeDefaultvaluesStructwithspecialdefaultsReleaseHandle(handle);
// Nullable DefaultValues_StructWithSpecialDefaults
final _smoke_DefaultValues_StructWithSpecialDefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_create_handle_nullable'));
final _smoke_DefaultValues_StructWithSpecialDefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_release_handle_nullable'));
final _smoke_DefaultValues_StructWithSpecialDefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_get_value_nullable'));
Pointer<Void> smoke_DefaultValues_StructWithSpecialDefaults_toFfi_nullable(DefaultValues_StructWithSpecialDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DefaultValues_StructWithSpecialDefaults_toFfi(value);
  final result = _smoke_DefaultValues_StructWithSpecialDefaultsCreateHandleNullable(_handle);
  smoke_DefaultValues_StructWithSpecialDefaults_releaseFfiHandle(_handle);
  return result;
}
DefaultValues_StructWithSpecialDefaults smoke_DefaultValues_StructWithSpecialDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DefaultValues_StructWithSpecialDefaultsGetValueNullable(handle);
  final result = smoke_DefaultValues_StructWithSpecialDefaults_fromFfi(_handle);
  smoke_DefaultValues_StructWithSpecialDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_DefaultValues_StructWithSpecialDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DefaultValues_StructWithSpecialDefaultsReleaseHandleNullable(handle);
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
final _smokeDefaultvaluesStructwithemptydefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_create_handle'));
final _smokeDefaultvaluesStructwithemptydefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_release_handle'));
final _smokeDefaultvaluesStructwithemptydefaultsGetFieldintsField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_get_field_intsField'));
final _smokeDefaultvaluesStructwithemptydefaultsGetFieldfloatsField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_get_field_floatsField'));
final _smokeDefaultvaluesStructwithemptydefaultsGetFieldmapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_get_field_mapField'));
final _smokeDefaultvaluesStructwithemptydefaultsGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_get_field_structField'));
final _smokeDefaultvaluesStructwithemptydefaultsGetFieldsetTypeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_get_field_setTypeField'));
Pointer<Void> smoke_DefaultValues_StructWithEmptyDefaults_toFfi(DefaultValues_StructWithEmptyDefaults value) {
  final _intsFieldHandle = ListOf_Int_toFfi(value.intsField);
  final _floatsFieldHandle = ListOf_Float_toFfi(value.floatsField);
  final _mapFieldHandle = MapOf_UInt_to_String_toFfi(value.mapField);
  final _structFieldHandle = smoke_DefaultValues_StructWithDefaults_toFfi(value.structField);
  final _setTypeFieldHandle = SetOf_String_toFfi(value.setTypeField);
  final _result = _smokeDefaultvaluesStructwithemptydefaultsCreateHandle(_intsFieldHandle, _floatsFieldHandle, _mapFieldHandle, _structFieldHandle, _setTypeFieldHandle);
  ListOf_Int_releaseFfiHandle(_intsFieldHandle);
  ListOf_Float_releaseFfiHandle(_floatsFieldHandle);
  MapOf_UInt_to_String_releaseFfiHandle(_mapFieldHandle);
  smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(_structFieldHandle);
  SetOf_String_releaseFfiHandle(_setTypeFieldHandle);
  return _result;
}
DefaultValues_StructWithEmptyDefaults smoke_DefaultValues_StructWithEmptyDefaults_fromFfi(Pointer<Void> handle) {
  final _intsFieldHandle = _smokeDefaultvaluesStructwithemptydefaultsGetFieldintsField(handle);
  final _floatsFieldHandle = _smokeDefaultvaluesStructwithemptydefaultsGetFieldfloatsField(handle);
  final _mapFieldHandle = _smokeDefaultvaluesStructwithemptydefaultsGetFieldmapField(handle);
  final _structFieldHandle = _smokeDefaultvaluesStructwithemptydefaultsGetFieldstructField(handle);
  final _setTypeFieldHandle = _smokeDefaultvaluesStructwithemptydefaultsGetFieldsetTypeField(handle);
  try {
    return DefaultValues_StructWithEmptyDefaults(
      ListOf_Int_fromFfi(_intsFieldHandle),
      ListOf_Float_fromFfi(_floatsFieldHandle),
      MapOf_UInt_to_String_fromFfi(_mapFieldHandle),
      smoke_DefaultValues_StructWithDefaults_fromFfi(_structFieldHandle),
      SetOf_String_fromFfi(_setTypeFieldHandle)
    );
  } finally {
    ListOf_Int_releaseFfiHandle(_intsFieldHandle);
    ListOf_Float_releaseFfiHandle(_floatsFieldHandle);
    MapOf_UInt_to_String_releaseFfiHandle(_mapFieldHandle);
    smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(_structFieldHandle);
    SetOf_String_releaseFfiHandle(_setTypeFieldHandle);
  }
}
void smoke_DefaultValues_StructWithEmptyDefaults_releaseFfiHandle(Pointer<Void> handle) => _smokeDefaultvaluesStructwithemptydefaultsReleaseHandle(handle);
// Nullable DefaultValues_StructWithEmptyDefaults
final _smoke_DefaultValues_StructWithEmptyDefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_create_handle_nullable'));
final _smoke_DefaultValues_StructWithEmptyDefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_release_handle_nullable'));
final _smoke_DefaultValues_StructWithEmptyDefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_get_value_nullable'));
Pointer<Void> smoke_DefaultValues_StructWithEmptyDefaults_toFfi_nullable(DefaultValues_StructWithEmptyDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DefaultValues_StructWithEmptyDefaults_toFfi(value);
  final result = _smoke_DefaultValues_StructWithEmptyDefaultsCreateHandleNullable(_handle);
  smoke_DefaultValues_StructWithEmptyDefaults_releaseFfiHandle(_handle);
  return result;
}
DefaultValues_StructWithEmptyDefaults smoke_DefaultValues_StructWithEmptyDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DefaultValues_StructWithEmptyDefaultsGetValueNullable(handle);
  final result = smoke_DefaultValues_StructWithEmptyDefaults_fromFfi(_handle);
  smoke_DefaultValues_StructWithEmptyDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_DefaultValues_StructWithEmptyDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DefaultValues_StructWithEmptyDefaultsReleaseHandleNullable(handle);
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
final _smokeDefaultvaluesStructwithtypedefdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int64, Uint8, Pointer<Void>, Uint32),
    Pointer<Void> Function(int, int, Pointer<Void>, int)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_create_handle'));
final _smokeDefaultvaluesStructwithtypedefdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_release_handle'));
final _smokeDefaultvaluesStructwithtypedefdefaultsGetFieldlongField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_get_field_longField'));
final _smokeDefaultvaluesStructwithtypedefdefaultsGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_get_field_boolField'));
final _smokeDefaultvaluesStructwithtypedefdefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_get_field_stringField'));
final _smokeDefaultvaluesStructwithtypedefdefaultsGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_get_field_enumField'));
Pointer<Void> smoke_DefaultValues_StructWithTypedefDefaults_toFfi(DefaultValues_StructWithTypedefDefaults value) {
  final _longFieldHandle = (value.longField);
  final _boolFieldHandle = Boolean_toFfi(value.boolField);
  final _stringFieldHandle = String_toFfi(value.stringField);
  final _enumFieldHandle = smoke_DefaultValues_SomeEnum_toFfi(value.enumField);
  final _result = _smokeDefaultvaluesStructwithtypedefdefaultsCreateHandle(_longFieldHandle, _boolFieldHandle, _stringFieldHandle, _enumFieldHandle);
  (_longFieldHandle);
  Boolean_releaseFfiHandle(_boolFieldHandle);
  String_releaseFfiHandle(_stringFieldHandle);
  smoke_DefaultValues_SomeEnum_releaseFfiHandle(_enumFieldHandle);
  return _result;
}
DefaultValues_StructWithTypedefDefaults smoke_DefaultValues_StructWithTypedefDefaults_fromFfi(Pointer<Void> handle) {
  final _longFieldHandle = _smokeDefaultvaluesStructwithtypedefdefaultsGetFieldlongField(handle);
  final _boolFieldHandle = _smokeDefaultvaluesStructwithtypedefdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeDefaultvaluesStructwithtypedefdefaultsGetFieldstringField(handle);
  final _enumFieldHandle = _smokeDefaultvaluesStructwithtypedefdefaultsGetFieldenumField(handle);
  try {
    return DefaultValues_StructWithTypedefDefaults(
      (_longFieldHandle),
      Boolean_fromFfi(_boolFieldHandle),
      String_fromFfi(_stringFieldHandle),
      smoke_DefaultValues_SomeEnum_fromFfi(_enumFieldHandle)
    );
  } finally {
    (_longFieldHandle);
    Boolean_releaseFfiHandle(_boolFieldHandle);
    String_releaseFfiHandle(_stringFieldHandle);
    smoke_DefaultValues_SomeEnum_releaseFfiHandle(_enumFieldHandle);
  }
}
void smoke_DefaultValues_StructWithTypedefDefaults_releaseFfiHandle(Pointer<Void> handle) => _smokeDefaultvaluesStructwithtypedefdefaultsReleaseHandle(handle);
// Nullable DefaultValues_StructWithTypedefDefaults
final _smoke_DefaultValues_StructWithTypedefDefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_create_handle_nullable'));
final _smoke_DefaultValues_StructWithTypedefDefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_release_handle_nullable'));
final _smoke_DefaultValues_StructWithTypedefDefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_get_value_nullable'));
Pointer<Void> smoke_DefaultValues_StructWithTypedefDefaults_toFfi_nullable(DefaultValues_StructWithTypedefDefaults value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DefaultValues_StructWithTypedefDefaults_toFfi(value);
  final result = _smoke_DefaultValues_StructWithTypedefDefaultsCreateHandleNullable(_handle);
  smoke_DefaultValues_StructWithTypedefDefaults_releaseFfiHandle(_handle);
  return result;
}
DefaultValues_StructWithTypedefDefaults smoke_DefaultValues_StructWithTypedefDefaults_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DefaultValues_StructWithTypedefDefaultsGetValueNullable(handle);
  final result = smoke_DefaultValues_StructWithTypedefDefaults_fromFfi(_handle);
  smoke_DefaultValues_StructWithTypedefDefaults_releaseFfiHandle(_handle);
  return result;
}
void smoke_DefaultValues_StructWithTypedefDefaults_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DefaultValues_StructWithTypedefDefaultsReleaseHandleNullable(handle);
// End of DefaultValues_StructWithTypedefDefaults "private" section.
// DefaultValues "private" section, not exported.
final _smokeDefaultvaluesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_copy_handle'));
final _smokeDefaultvaluesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_release_handle'));
class DefaultValues$Impl extends __lib.NativeBase implements DefaultValues {
  DefaultValues$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeDefaultvaluesReleaseHandle(handle);
    handle = null;
  }
  static DefaultValues_StructWithDefaults processStructWithDefaults(DefaultValues_StructWithDefaults input) {
    final _processStructWithDefaultsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_DefaultValues_processStructWithDefaults__StructWithDefaults'));
    final _inputHandle = smoke_DefaultValues_StructWithDefaults_toFfi(input);
    final __resultHandle = _processStructWithDefaultsFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(_inputHandle);
    try {
      return smoke_DefaultValues_StructWithDefaults_fromFfi(__resultHandle);
    } finally {
      smoke_DefaultValues_StructWithDefaults_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_DefaultValues_toFfi(DefaultValues value) =>
  _smokeDefaultvaluesCopyHandle((value as __lib.NativeBase).handle);
DefaultValues smoke_DefaultValues_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as DefaultValues;
  if (instance != null) return instance;
  final _copiedHandle = _smokeDefaultvaluesCopyHandle(handle);
  final result = DefaultValues$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_DefaultValues_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeDefaultvaluesReleaseHandle(handle);
Pointer<Void> smoke_DefaultValues_toFfi_nullable(DefaultValues value) =>
  value != null ? smoke_DefaultValues_toFfi(value) : Pointer<Void>.fromAddress(0);
DefaultValues smoke_DefaultValues_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_DefaultValues_fromFfi(handle) : null;
void smoke_DefaultValues_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeDefaultvaluesReleaseHandle(handle);
// End of DefaultValues "private" section.
