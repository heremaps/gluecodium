

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';


class FieldConstructorsPartialDefaults {
  String stringField;

  int intField;

  bool boolField;

  /// This is some field constructor with two parameters.
  /// It is very important.
  /// [intField] 
  /// [stringField] 
  FieldConstructorsPartialDefaults.withTrue(this.intField, this.stringField)
      : boolField = true;
  FieldConstructorsPartialDefaults(this.boolField, this.intField, this.stringField);
}


// FieldConstructorsPartialDefaults "private" section, not exported.

final _smokeFieldconstructorspartialdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32, Uint8),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_FieldConstructorsPartialDefaults_create_handle'));
final _smokeFieldconstructorspartialdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsPartialDefaults_release_handle'));
final _smokeFieldconstructorspartialdefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsPartialDefaults_get_field_stringField'));
final _smokeFieldconstructorspartialdefaultsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsPartialDefaults_get_field_intField'));
final _smokeFieldconstructorspartialdefaultsGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsPartialDefaults_get_field_boolField'));



Pointer<Void> smokeFieldconstructorspartialdefaultsToFfi(FieldConstructorsPartialDefaults value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _intFieldHandle = (value.intField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _result = _smokeFieldconstructorspartialdefaultsCreateHandle(_stringFieldHandle, _intFieldHandle, _boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  
  booleanReleaseFfiHandle(_boolFieldHandle);
  return _result;
}

FieldConstructorsPartialDefaults smokeFieldconstructorspartialdefaultsFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeFieldconstructorspartialdefaultsGetFieldstringField(handle);
  final _intFieldHandle = _smokeFieldconstructorspartialdefaultsGetFieldintField(handle);
  final _boolFieldHandle = _smokeFieldconstructorspartialdefaultsGetFieldboolField(handle);
  try {
    return FieldConstructorsPartialDefaults(
      booleanFromFfi(_boolFieldHandle), 
      (_intFieldHandle), 
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
    
    booleanReleaseFfiHandle(_boolFieldHandle);
  }
}

void smokeFieldconstructorspartialdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorspartialdefaultsReleaseHandle(handle);

// Nullable FieldConstructorsPartialDefaults

final _smokeFieldconstructorspartialdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsPartialDefaults_create_handle_nullable'));
final _smokeFieldconstructorspartialdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsPartialDefaults_release_handle_nullable'));
final _smokeFieldconstructorspartialdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsPartialDefaults_get_value_nullable'));

Pointer<Void> smokeFieldconstructorspartialdefaultsToFfiNullable(FieldConstructorsPartialDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorspartialdefaultsToFfi(value);
  final result = _smokeFieldconstructorspartialdefaultsCreateHandleNullable(_handle);
  smokeFieldconstructorspartialdefaultsReleaseFfiHandle(_handle);
  return result;
}

FieldConstructorsPartialDefaults? smokeFieldconstructorspartialdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorspartialdefaultsGetValueNullable(handle);
  final result = smokeFieldconstructorspartialdefaultsFromFfi(_handle);
  smokeFieldconstructorspartialdefaultsReleaseFfiHandle(_handle);
  return result;
}

void smokeFieldconstructorspartialdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorspartialdefaultsReleaseHandleNullable(handle);

// End of FieldConstructorsPartialDefaults "private" section.


