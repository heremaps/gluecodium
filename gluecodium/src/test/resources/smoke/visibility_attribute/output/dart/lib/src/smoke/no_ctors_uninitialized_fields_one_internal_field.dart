

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

/// Test case 1
///
/// Input:
/// - This structure does not define explicit constructors / field constructors.
///
/// - It has fields without default values.
///
/// - One of fields is internal.
///
/// Expected outcome:
/// - Generated all args constructor is not public (because it would expose internal field).

class NoCtorsUninitializedFieldsOneInternalField {
  /// @nodoc
  String _internalField;

  bool publicField;

  NoCtorsUninitializedFieldsOneInternalField._(this._internalField, this.publicField);
}


// NoCtorsUninitializedFieldsOneInternalField "private" section, not exported.

final _smokeNoctorsuninitializedfieldsoneinternalfieldCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint8),
    Pointer<Void> Function(Pointer<Void>, int)
  >('library_smoke_NoCtorsUninitializedFieldsOneInternalField_create_handle'));
final _smokeNoctorsuninitializedfieldsoneinternalfieldReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_NoCtorsUninitializedFieldsOneInternalField_release_handle'));
final _smokeNoctorsuninitializedfieldsoneinternalfieldGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_NoCtorsUninitializedFieldsOneInternalField_get_field_internalField'));
final _smokeNoctorsuninitializedfieldsoneinternalfieldGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_NoCtorsUninitializedFieldsOneInternalField_get_field_publicField'));



Pointer<Void> smokeNoctorsuninitializedfieldsoneinternalfieldToFfi(NoCtorsUninitializedFieldsOneInternalField value) {
  final _internalFieldHandle = stringToFfi(value._internalField);
  final _publicFieldHandle = booleanToFfi(value.publicField);
  final _result = _smokeNoctorsuninitializedfieldsoneinternalfieldCreateHandle(_internalFieldHandle, _publicFieldHandle);
  stringReleaseFfiHandle(_internalFieldHandle);
  booleanReleaseFfiHandle(_publicFieldHandle);
  return _result;
}

NoCtorsUninitializedFieldsOneInternalField smokeNoctorsuninitializedfieldsoneinternalfieldFromFfi(Pointer<Void> handle) {
  final _internalFieldHandle = _smokeNoctorsuninitializedfieldsoneinternalfieldGetFieldinternalField(handle);
  final _publicFieldHandle = _smokeNoctorsuninitializedfieldsoneinternalfieldGetFieldpublicField(handle);
  try {
    return NoCtorsUninitializedFieldsOneInternalField._(
      stringFromFfi(_internalFieldHandle), 
      booleanFromFfi(_publicFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_internalFieldHandle);
    booleanReleaseFfiHandle(_publicFieldHandle);
  }
}

void smokeNoctorsuninitializedfieldsoneinternalfieldReleaseFfiHandle(Pointer<Void> handle) => _smokeNoctorsuninitializedfieldsoneinternalfieldReleaseHandle(handle);

// Nullable NoCtorsUninitializedFieldsOneInternalField

final _smokeNoctorsuninitializedfieldsoneinternalfieldCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_NoCtorsUninitializedFieldsOneInternalField_create_handle_nullable'));
final _smokeNoctorsuninitializedfieldsoneinternalfieldReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_NoCtorsUninitializedFieldsOneInternalField_release_handle_nullable'));
final _smokeNoctorsuninitializedfieldsoneinternalfieldGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_NoCtorsUninitializedFieldsOneInternalField_get_value_nullable'));

Pointer<Void> smokeNoctorsuninitializedfieldsoneinternalfieldToFfiNullable(NoCtorsUninitializedFieldsOneInternalField? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeNoctorsuninitializedfieldsoneinternalfieldToFfi(value);
  final result = _smokeNoctorsuninitializedfieldsoneinternalfieldCreateHandleNullable(_handle);
  smokeNoctorsuninitializedfieldsoneinternalfieldReleaseFfiHandle(_handle);
  return result;
}

NoCtorsUninitializedFieldsOneInternalField? smokeNoctorsuninitializedfieldsoneinternalfieldFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeNoctorsuninitializedfieldsoneinternalfieldGetValueNullable(handle);
  final result = smokeNoctorsuninitializedfieldsoneinternalfieldFromFfi(_handle);
  smokeNoctorsuninitializedfieldsoneinternalfieldReleaseFfiHandle(_handle);
  return result;
}

void smokeNoctorsuninitializedfieldsoneinternalfieldReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeNoctorsuninitializedfieldsoneinternalfieldReleaseHandleNullable(handle);

// End of NoCtorsUninitializedFieldsOneInternalField "private" section.


