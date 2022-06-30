import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class TypesWithDefaults {
}
class TypesWithDefaults_StructWithDefaults {
  int intField;
  int uintField;
  double floatField;
  double doubleField;
  bool boolField;
  String stringField;
  TypesWithDefaults_StructWithDefaults._(this.intField, this.uintField, this.floatField, this.doubleField, this.boolField, this.stringField);
  TypesWithDefaults_StructWithDefaults()
    : intField = 42, uintField = 4294967295, floatField = 3.14, doubleField = -1.4142, boolField = true, stringField = "\\Jonny \"Magic\" Smith\n";
}
// TypesWithDefaults_StructWithDefaults "private" section, not exported.
final _smokeTypeswithdefaultsStructwithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Double, Uint8, Pointer<Void>),
    Pointer<Void> Function(int, int, double, double, int, Pointer<Void>)
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
Pointer<Void> smokeTypeswithdefaultsStructwithdefaultsToFfi(TypesWithDefaults_StructWithDefaults value) {
  final _intFieldHandle = (value.intField);
  final _uintFieldHandle = (value.uintField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeTypeswithdefaultsStructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _doubleFieldHandle, _boolFieldHandle, _stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
TypesWithDefaults_StructWithDefaults smokeTypeswithdefaultsStructwithdefaultsFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldintField(handle);
  final _uintFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFielduintField(handle);
  final _floatFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldfloatField(handle);
  final _doubleFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFielddoubleField(handle);
  final _boolFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldstringField(handle);
  try {
    return TypesWithDefaults_StructWithDefaults._(
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
void smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsStructwithdefaultsReleaseHandle(handle);
// Nullable TypesWithDefaults_StructWithDefaults
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
Pointer<Void> smokeTypeswithdefaultsStructwithdefaultsToFfiNullable(TypesWithDefaults_StructWithDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsStructwithdefaultsToFfi(value);
  final result = _smokeTypeswithdefaultsStructwithdefaultsCreateHandleNullable(_handle);
  smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
TypesWithDefaults_StructWithDefaults? smokeTypeswithdefaultsStructwithdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsStructwithdefaultsGetValueNullable(handle);
  final result = smokeTypeswithdefaultsStructwithdefaultsFromFfi(_handle);
  smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsStructwithdefaultsReleaseHandleNullable(handle);
// End of TypesWithDefaults_StructWithDefaults "private" section.
@immutable
class TypesWithDefaults_ImmutableStructWithDefaults {
  final int intField;
  final int uintField;
  final double floatField;
  final double doubleField;
  final bool boolField;
  final String stringField;
  const TypesWithDefaults_ImmutableStructWithDefaults(this.intField, this.uintField, this.floatField, this.doubleField, this.boolField, this.stringField);
  const TypesWithDefaults_ImmutableStructWithDefaults.withDefaults(int uintField, bool boolField)
    : intField = 42, uintField = uintField, floatField = 3.14, doubleField = -1.4142, boolField = boolField, stringField = "\\Jonny \"Magic\" Smith\n";
}
// TypesWithDefaults_ImmutableStructWithDefaults "private" section, not exported.
final _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Double, Uint8, Pointer<Void>),
    Pointer<Void> Function(int, int, double, double, int, Pointer<Void>)
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
Pointer<Void> smokeTypeswithdefaultsImmutablestructwithdefaultsToFfi(TypesWithDefaults_ImmutableStructWithDefaults value) {
  final _intFieldHandle = (value.intField);
  final _uintFieldHandle = (value.uintField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _doubleFieldHandle, _boolFieldHandle, _stringFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}
TypesWithDefaults_ImmutableStructWithDefaults smokeTypeswithdefaultsImmutablestructwithdefaultsFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldintField(handle);
  final _uintFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFielduintField(handle);
  final _floatFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldfloatField(handle);
  final _doubleFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFielddoubleField(handle);
  final _boolFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldstringField(handle);
  try {
    return TypesWithDefaults_ImmutableStructWithDefaults(
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
void smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseHandle(handle);
// Nullable TypesWithDefaults_ImmutableStructWithDefaults
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
Pointer<Void> smokeTypeswithdefaultsImmutablestructwithdefaultsToFfiNullable(TypesWithDefaults_ImmutableStructWithDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsImmutablestructwithdefaultsToFfi(value);
  final result = _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandleNullable(_handle);
  smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
TypesWithDefaults_ImmutableStructWithDefaults? smokeTypeswithdefaultsImmutablestructwithdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetValueNullable(handle);
  final result = smokeTypeswithdefaultsImmutablestructwithdefaultsFromFfi(_handle);
  smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseHandleNullable(handle);
// End of TypesWithDefaults_ImmutableStructWithDefaults "private" section.
// TypesWithDefaults "private" section, not exported.
final _smokeTypeswithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_smoke_TypesWithDefaults_create_handle'));
final _smokeTypeswithdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_release_handle'));
Pointer<Void> smokeTypeswithdefaultsToFfi(TypesWithDefaults value) {
  final _result = _smokeTypeswithdefaultsCreateHandle();
  return _result;
}
TypesWithDefaults smokeTypeswithdefaultsFromFfi(Pointer<Void> handle) {
  try {
    return TypesWithDefaults(
    );
  } finally {
  }
}
void smokeTypeswithdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsReleaseHandle(handle);
// Nullable TypesWithDefaults
final _smokeTypeswithdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_create_handle_nullable'));
final _smokeTypeswithdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_release_handle_nullable'));
final _smokeTypeswithdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_get_value_nullable'));
Pointer<Void> smokeTypeswithdefaultsToFfiNullable(TypesWithDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsToFfi(value);
  final result = _smokeTypeswithdefaultsCreateHandleNullable(_handle);
  smokeTypeswithdefaultsReleaseFfiHandle(_handle);
  return result;
}
TypesWithDefaults? smokeTypeswithdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsGetValueNullable(handle);
  final result = smokeTypeswithdefaultsFromFfi(_handle);
  smokeTypeswithdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeTypeswithdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsReleaseHandleNullable(handle);
// End of TypesWithDefaults "private" section.
