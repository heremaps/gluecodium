import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:meta/meta.dart';
abstract class DefaultValues {
  static DefaultValues_StructWithDefaults processStructWithDefaults(DefaultValues_StructWithDefaults input) => $prototype.processStructWithDefaults(input);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = DefaultValues$Impl(Pointer<Void>.fromAddress(0));
}
class DefaultValues_StructWithDefaults {
  int intField;
  int uintField;
  double floatField;
  double doubleField;
  bool boolField;
  String stringField;
  DefaultValues_StructWithDefaults._(this.intField, this.uintField, this.floatField, this.doubleField, this.boolField, this.stringField);
  DefaultValues_StructWithDefaults()
    : intField = 42, uintField = 4294967295, floatField = 3.14, doubleField = -1.4142, boolField = true, stringField = "\\Jonny \"Magic\" Smith\n";
}
// DefaultValues_StructWithDefaults "private" section, not exported.
final _smokeDefaultvaluesStructwithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Double, Uint8, Pointer<Void>),
    Pointer<Void> Function(int, int, double, double, int, Pointer<Void>)
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
Pointer<Void> smokeDefaultvaluesStructwithdefaultsToFfi(DefaultValues_StructWithDefaults value) {
  final _intFieldHandle = (value.intField);
  final _uintFieldHandle = (value.uintField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeDefaultvaluesStructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _doubleFieldHandle, _boolFieldHandle, _stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
DefaultValues_StructWithDefaults smokeDefaultvaluesStructwithdefaultsFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFieldintField(handle);
  final _uintFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFielduintField(handle);
  final _floatFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFieldfloatField(handle);
  final _doubleFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFielddoubleField(handle);
  final _boolFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeDefaultvaluesStructwithdefaultsGetFieldstringField(handle);
  try {
    return DefaultValues_StructWithDefaults._(
      (_intFieldHandle),
      (_uintFieldHandle),
      (_floatFieldHandle),
      (_doubleFieldHandle),
      booleanFromFfi(_boolFieldHandle),
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_boolFieldHandle);
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeDefaultvaluesStructwithdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeDefaultvaluesStructwithdefaultsReleaseHandle(handle);
// Nullable DefaultValues_StructWithDefaults
final _smokeDefaultvaluesStructwithdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_create_handle_nullable'));
final _smokeDefaultvaluesStructwithdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_release_handle_nullable'));
final _smokeDefaultvaluesStructwithdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithDefaults_get_value_nullable'));
Pointer<Void> smokeDefaultvaluesStructwithdefaultsToFfiNullable(DefaultValues_StructWithDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDefaultvaluesStructwithdefaultsToFfi(value);
  final result = _smokeDefaultvaluesStructwithdefaultsCreateHandleNullable(_handle);
  smokeDefaultvaluesStructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
DefaultValues_StructWithDefaults? smokeDefaultvaluesStructwithdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDefaultvaluesStructwithdefaultsGetValueNullable(handle);
  final result = smokeDefaultvaluesStructwithdefaultsFromFfi(_handle);
  smokeDefaultvaluesStructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeDefaultvaluesStructwithdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDefaultvaluesStructwithdefaultsReleaseHandleNullable(handle);
// End of DefaultValues_StructWithDefaults "private" section.
class DefaultValues_NullableStructWithDefaults {
  int? intField;
  int? uintField;
  double? floatField;
  bool? boolField;
  String? stringField;
  DefaultValues_NullableStructWithDefaults._(this.intField, this.uintField, this.floatField, this.boolField, this.stringField);
  DefaultValues_NullableStructWithDefaults()
    : intField = null, uintField = null, floatField = null, boolField = null, stringField = null;
}
// DefaultValues_NullableStructWithDefaults "private" section, not exported.
final _smokeDefaultvaluesNullablestructwithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
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
Pointer<Void> smokeDefaultvaluesNullablestructwithdefaultsToFfi(DefaultValues_NullableStructWithDefaults value) {
  final _intFieldHandle = intToFfiNullable(value.intField);
  final _uintFieldHandle = uIntToFfiNullable(value.uintField);
  final _floatFieldHandle = floatToFfiNullable(value.floatField);
  final _boolFieldHandle = booleanToFfiNullable(value.boolField);
  final _stringFieldHandle = stringToFfiNullable(value.stringField);
  final _result = _smokeDefaultvaluesNullablestructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _boolFieldHandle, _stringFieldHandle);
  intReleaseFfiHandleNullable(_intFieldHandle);
  uIntReleaseFfiHandleNullable(_uintFieldHandle);
  floatReleaseFfiHandleNullable(_floatFieldHandle);
  booleanReleaseFfiHandleNullable(_boolFieldHandle);
  stringReleaseFfiHandleNullable(_stringFieldHandle);
  return _result;
}
DefaultValues_NullableStructWithDefaults smokeDefaultvaluesNullablestructwithdefaultsFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeDefaultvaluesNullablestructwithdefaultsGetFieldintField(handle);
  final _uintFieldHandle = _smokeDefaultvaluesNullablestructwithdefaultsGetFielduintField(handle);
  final _floatFieldHandle = _smokeDefaultvaluesNullablestructwithdefaultsGetFieldfloatField(handle);
  final _boolFieldHandle = _smokeDefaultvaluesNullablestructwithdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeDefaultvaluesNullablestructwithdefaultsGetFieldstringField(handle);
  try {
    return DefaultValues_NullableStructWithDefaults._(
      intFromFfiNullable(_intFieldHandle),
      uIntFromFfiNullable(_uintFieldHandle),
      floatFromFfiNullable(_floatFieldHandle),
      booleanFromFfiNullable(_boolFieldHandle),
      stringFromFfiNullable(_stringFieldHandle)
    );
  } finally {
    intReleaseFfiHandleNullable(_intFieldHandle);
    uIntReleaseFfiHandleNullable(_uintFieldHandle);
    floatReleaseFfiHandleNullable(_floatFieldHandle);
    booleanReleaseFfiHandleNullable(_boolFieldHandle);
    stringReleaseFfiHandleNullable(_stringFieldHandle);
  }
}
void smokeDefaultvaluesNullablestructwithdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeDefaultvaluesNullablestructwithdefaultsReleaseHandle(handle);
// Nullable DefaultValues_NullableStructWithDefaults
final _smokeDefaultvaluesNullablestructwithdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_create_handle_nullable'));
final _smokeDefaultvaluesNullablestructwithdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_release_handle_nullable'));
final _smokeDefaultvaluesNullablestructwithdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_NullableStructWithDefaults_get_value_nullable'));
Pointer<Void> smokeDefaultvaluesNullablestructwithdefaultsToFfiNullable(DefaultValues_NullableStructWithDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDefaultvaluesNullablestructwithdefaultsToFfi(value);
  final result = _smokeDefaultvaluesNullablestructwithdefaultsCreateHandleNullable(_handle);
  smokeDefaultvaluesNullablestructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
DefaultValues_NullableStructWithDefaults? smokeDefaultvaluesNullablestructwithdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDefaultvaluesNullablestructwithdefaultsGetValueNullable(handle);
  final result = smokeDefaultvaluesNullablestructwithdefaultsFromFfi(_handle);
  smokeDefaultvaluesNullablestructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeDefaultvaluesNullablestructwithdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDefaultvaluesNullablestructwithdefaultsReleaseHandleNullable(handle);
// End of DefaultValues_NullableStructWithDefaults "private" section.
class DefaultValues_StructWithSpecialDefaults {
  double floatNanField;
  double floatInfinityField;
  double floatNegativeInfinityField;
  double doubleNanField;
  double doubleInfinityField;
  double doubleNegativeInfinityField;
  DefaultValues_StructWithSpecialDefaults._(this.floatNanField, this.floatInfinityField, this.floatNegativeInfinityField, this.doubleNanField, this.doubleInfinityField, this.doubleNegativeInfinityField);
  DefaultValues_StructWithSpecialDefaults()
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
Pointer<Void> smokeDefaultvaluesStructwithspecialdefaultsToFfi(DefaultValues_StructWithSpecialDefaults value) {
  final _floatNanFieldHandle = (value.floatNanField);
  final _floatInfinityFieldHandle = (value.floatInfinityField);
  final _floatNegativeInfinityFieldHandle = (value.floatNegativeInfinityField);
  final _doubleNanFieldHandle = (value.doubleNanField);
  final _doubleInfinityFieldHandle = (value.doubleInfinityField);
  final _doubleNegativeInfinityFieldHandle = (value.doubleNegativeInfinityField);
  final _result = _smokeDefaultvaluesStructwithspecialdefaultsCreateHandle(_floatNanFieldHandle, _floatInfinityFieldHandle, _floatNegativeInfinityFieldHandle, _doubleNanFieldHandle, _doubleInfinityFieldHandle, _doubleNegativeInfinityFieldHandle);
  return _result;
}
DefaultValues_StructWithSpecialDefaults smokeDefaultvaluesStructwithspecialdefaultsFromFfi(Pointer<Void> handle) {
  final _floatNanFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFieldfloatNanField(handle);
  final _floatInfinityFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFieldfloatInfinityField(handle);
  final _floatNegativeInfinityFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFieldfloatNegativeInfinityField(handle);
  final _doubleNanFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFielddoubleNanField(handle);
  final _doubleInfinityFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFielddoubleInfinityField(handle);
  final _doubleNegativeInfinityFieldHandle = _smokeDefaultvaluesStructwithspecialdefaultsGetFielddoubleNegativeInfinityField(handle);
  try {
    return DefaultValues_StructWithSpecialDefaults._(
      (_floatNanFieldHandle),
      (_floatInfinityFieldHandle),
      (_floatNegativeInfinityFieldHandle),
      (_doubleNanFieldHandle),
      (_doubleInfinityFieldHandle),
      (_doubleNegativeInfinityFieldHandle)
    );
  } finally {
  }
}
void smokeDefaultvaluesStructwithspecialdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeDefaultvaluesStructwithspecialdefaultsReleaseHandle(handle);
// Nullable DefaultValues_StructWithSpecialDefaults
final _smokeDefaultvaluesStructwithspecialdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_create_handle_nullable'));
final _smokeDefaultvaluesStructwithspecialdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_release_handle_nullable'));
final _smokeDefaultvaluesStructwithspecialdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithSpecialDefaults_get_value_nullable'));
Pointer<Void> smokeDefaultvaluesStructwithspecialdefaultsToFfiNullable(DefaultValues_StructWithSpecialDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDefaultvaluesStructwithspecialdefaultsToFfi(value);
  final result = _smokeDefaultvaluesStructwithspecialdefaultsCreateHandleNullable(_handle);
  smokeDefaultvaluesStructwithspecialdefaultsReleaseFfiHandle(_handle);
  return result;
}
DefaultValues_StructWithSpecialDefaults? smokeDefaultvaluesStructwithspecialdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDefaultvaluesStructwithspecialdefaultsGetValueNullable(handle);
  final result = smokeDefaultvaluesStructwithspecialdefaultsFromFfi(_handle);
  smokeDefaultvaluesStructwithspecialdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeDefaultvaluesStructwithspecialdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDefaultvaluesStructwithspecialdefaultsReleaseHandleNullable(handle);
// End of DefaultValues_StructWithSpecialDefaults "private" section.
class DefaultValues_StructWithEmptyDefaults {
  List<int> intsField;
  List<double> floatsField;
  Map<int, String> mapField;
  DefaultValues_StructWithDefaults structField;
  Set<String> setTypeField;
  DefaultValues_StructWithEmptyDefaults._(this.intsField, this.floatsField, this.mapField, this.structField, this.setTypeField);
  DefaultValues_StructWithEmptyDefaults()
    : intsField = [], floatsField = [], mapField = {}, structField = DefaultValues_StructWithDefaults(), setTypeField = {};
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
Pointer<Void> smokeDefaultvaluesStructwithemptydefaultsToFfi(DefaultValues_StructWithEmptyDefaults value) {
  final _intsFieldHandle = foobarListofIntToFfi(value.intsField);
  final _floatsFieldHandle = foobarListofFloatToFfi(value.floatsField);
  final _mapFieldHandle = foobarMapofUintToStringToFfi(value.mapField);
  final _structFieldHandle = smokeDefaultvaluesStructwithdefaultsToFfi(value.structField);
  final _setTypeFieldHandle = foobarSetofStringToFfi(value.setTypeField);
  final _result = _smokeDefaultvaluesStructwithemptydefaultsCreateHandle(_intsFieldHandle, _floatsFieldHandle, _mapFieldHandle, _structFieldHandle, _setTypeFieldHandle);
  foobarListofIntReleaseFfiHandle(_intsFieldHandle);
  foobarListofFloatReleaseFfiHandle(_floatsFieldHandle);
  foobarMapofUintToStringReleaseFfiHandle(_mapFieldHandle);
  smokeDefaultvaluesStructwithdefaultsReleaseFfiHandle(_structFieldHandle);
  foobarSetofStringReleaseFfiHandle(_setTypeFieldHandle);
  return _result;
}
DefaultValues_StructWithEmptyDefaults smokeDefaultvaluesStructwithemptydefaultsFromFfi(Pointer<Void> handle) {
  final _intsFieldHandle = _smokeDefaultvaluesStructwithemptydefaultsGetFieldintsField(handle);
  final _floatsFieldHandle = _smokeDefaultvaluesStructwithemptydefaultsGetFieldfloatsField(handle);
  final _mapFieldHandle = _smokeDefaultvaluesStructwithemptydefaultsGetFieldmapField(handle);
  final _structFieldHandle = _smokeDefaultvaluesStructwithemptydefaultsGetFieldstructField(handle);
  final _setTypeFieldHandle = _smokeDefaultvaluesStructwithemptydefaultsGetFieldsetTypeField(handle);
  try {
    return DefaultValues_StructWithEmptyDefaults._(
      foobarListofIntFromFfi(_intsFieldHandle),
      foobarListofFloatFromFfi(_floatsFieldHandle),
      foobarMapofUintToStringFromFfi(_mapFieldHandle),
      smokeDefaultvaluesStructwithdefaultsFromFfi(_structFieldHandle),
      foobarSetofStringFromFfi(_setTypeFieldHandle)
    );
  } finally {
    foobarListofIntReleaseFfiHandle(_intsFieldHandle);
    foobarListofFloatReleaseFfiHandle(_floatsFieldHandle);
    foobarMapofUintToStringReleaseFfiHandle(_mapFieldHandle);
    smokeDefaultvaluesStructwithdefaultsReleaseFfiHandle(_structFieldHandle);
    foobarSetofStringReleaseFfiHandle(_setTypeFieldHandle);
  }
}
void smokeDefaultvaluesStructwithemptydefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeDefaultvaluesStructwithemptydefaultsReleaseHandle(handle);
// Nullable DefaultValues_StructWithEmptyDefaults
final _smokeDefaultvaluesStructwithemptydefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_create_handle_nullable'));
final _smokeDefaultvaluesStructwithemptydefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_release_handle_nullable'));
final _smokeDefaultvaluesStructwithemptydefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithEmptyDefaults_get_value_nullable'));
Pointer<Void> smokeDefaultvaluesStructwithemptydefaultsToFfiNullable(DefaultValues_StructWithEmptyDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDefaultvaluesStructwithemptydefaultsToFfi(value);
  final result = _smokeDefaultvaluesStructwithemptydefaultsCreateHandleNullable(_handle);
  smokeDefaultvaluesStructwithemptydefaultsReleaseFfiHandle(_handle);
  return result;
}
DefaultValues_StructWithEmptyDefaults? smokeDefaultvaluesStructwithemptydefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDefaultvaluesStructwithemptydefaultsGetValueNullable(handle);
  final result = smokeDefaultvaluesStructwithemptydefaultsFromFfi(_handle);
  smokeDefaultvaluesStructwithemptydefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeDefaultvaluesStructwithemptydefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDefaultvaluesStructwithemptydefaultsReleaseHandleNullable(handle);
// End of DefaultValues_StructWithEmptyDefaults "private" section.
class DefaultValues_StructWithTypedefDefaults {
  int longField;
  bool boolField;
  String stringField;
  DefaultValues_StructWithTypedefDefaults._(this.longField, this.boolField, this.stringField);
  DefaultValues_StructWithTypedefDefaults()
    : longField = 42, boolField = true, stringField = "\\Jonny \"Magic\" Smith\n";
}
// DefaultValues_StructWithTypedefDefaults "private" section, not exported.
final _smokeDefaultvaluesStructwithtypedefdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int64, Uint8, Pointer<Void>),
    Pointer<Void> Function(int, int, Pointer<Void>)
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
Pointer<Void> smokeDefaultvaluesStructwithtypedefdefaultsToFfi(DefaultValues_StructWithTypedefDefaults value) {
  final _longFieldHandle = (value.longField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeDefaultvaluesStructwithtypedefdefaultsCreateHandle(_longFieldHandle, _boolFieldHandle, _stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
DefaultValues_StructWithTypedefDefaults smokeDefaultvaluesStructwithtypedefdefaultsFromFfi(Pointer<Void> handle) {
  final _longFieldHandle = _smokeDefaultvaluesStructwithtypedefdefaultsGetFieldlongField(handle);
  final _boolFieldHandle = _smokeDefaultvaluesStructwithtypedefdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeDefaultvaluesStructwithtypedefdefaultsGetFieldstringField(handle);
  try {
    return DefaultValues_StructWithTypedefDefaults._(
      (_longFieldHandle),
      booleanFromFfi(_boolFieldHandle),
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_boolFieldHandle);
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}
void smokeDefaultvaluesStructwithtypedefdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeDefaultvaluesStructwithtypedefdefaultsReleaseHandle(handle);
// Nullable DefaultValues_StructWithTypedefDefaults
final _smokeDefaultvaluesStructwithtypedefdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_create_handle_nullable'));
final _smokeDefaultvaluesStructwithtypedefdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_release_handle_nullable'));
final _smokeDefaultvaluesStructwithtypedefdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_StructWithTypedefDefaults_get_value_nullable'));
Pointer<Void> smokeDefaultvaluesStructwithtypedefdefaultsToFfiNullable(DefaultValues_StructWithTypedefDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDefaultvaluesStructwithtypedefdefaultsToFfi(value);
  final result = _smokeDefaultvaluesStructwithtypedefdefaultsCreateHandleNullable(_handle);
  smokeDefaultvaluesStructwithtypedefdefaultsReleaseFfiHandle(_handle);
  return result;
}
DefaultValues_StructWithTypedefDefaults? smokeDefaultvaluesStructwithtypedefdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDefaultvaluesStructwithtypedefdefaultsGetValueNullable(handle);
  final result = smokeDefaultvaluesStructwithtypedefdefaultsFromFfi(_handle);
  smokeDefaultvaluesStructwithtypedefdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeDefaultvaluesStructwithtypedefdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDefaultvaluesStructwithtypedefdefaultsReleaseHandleNullable(handle);
// End of DefaultValues_StructWithTypedefDefaults "private" section.
// DefaultValues "private" section, not exported.
final _smokeDefaultvaluesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_DefaultValues_register_finalizer'));
final _smokeDefaultvaluesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DefaultValues_copy_handle'));
final _smokeDefaultvaluesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DefaultValues_release_handle'));
/// @nodoc
@visibleForTesting
class DefaultValues$Impl extends __lib.NativeBase implements DefaultValues {
  DefaultValues$Impl(Pointer<Void> handle) : super(handle);
  DefaultValues_StructWithDefaults processStructWithDefaults(DefaultValues_StructWithDefaults input) {
    final _processStructWithDefaultsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_DefaultValues_processStructWithDefaults__StructWithDefaults'));
    final _inputHandle = smokeDefaultvaluesStructwithdefaultsToFfi(input);
    final __resultHandle = _processStructWithDefaultsFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeDefaultvaluesStructwithdefaultsReleaseFfiHandle(_inputHandle);
    try {
      return smokeDefaultvaluesStructwithdefaultsFromFfi(__resultHandle);
    } finally {
      smokeDefaultvaluesStructwithdefaultsReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeDefaultvaluesToFfi(DefaultValues value) =>
  _smokeDefaultvaluesCopyHandle((value as __lib.NativeBase).handle);
DefaultValues smokeDefaultvaluesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DefaultValues) return instance;
  final _copiedHandle = _smokeDefaultvaluesCopyHandle(handle);
  final result = DefaultValues$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeDefaultvaluesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokeDefaultvaluesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeDefaultvaluesReleaseHandle(handle);
Pointer<Void> smokeDefaultvaluesToFfiNullable(DefaultValues? value) =>
  value != null ? smokeDefaultvaluesToFfi(value) : Pointer<Void>.fromAddress(0);
DefaultValues? smokeDefaultvaluesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeDefaultvaluesFromFfi(handle) : null;
void smokeDefaultvaluesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDefaultvaluesReleaseHandle(handle);
// End of DefaultValues "private" section.
