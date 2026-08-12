

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

/// Test case 2
///
/// Input:
/// - This structure does not define explicit constructors / field constructors.
///
/// - It has one public field with default value.
///
/// - One of fields is internal.
///
/// Expected outcome:
/// - Generated initialized args constructor is not public (because it would expose internal field).

class NoCtorsInitializedPublicFieldOneInternalField {
  /// @nodoc
  String _internalField;

  bool publicField;

  int initializedField;

  NoCtorsInitializedPublicFieldOneInternalField._(this._internalField, this.publicField, this.initializedField);
  NoCtorsInitializedPublicFieldOneInternalField(String internalField, bool publicField)
    : _internalField = internalField, publicField = publicField, initializedField = 77;
}


// NoCtorsInitializedPublicFieldOneInternalField "private" section, not exported.

final _smokeNoctorsinitializedpublicfieldoneinternalfieldCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint8, Int32),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_NoCtorsInitializedPublicFieldOneInternalField_create_handle'));
final _smokeNoctorsinitializedpublicfieldoneinternalfieldReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_NoCtorsInitializedPublicFieldOneInternalField_release_handle'));
final _smokeNoctorsinitializedpublicfieldoneinternalfieldGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_NoCtorsInitializedPublicFieldOneInternalField_get_field_internalField'));
final _smokeNoctorsinitializedpublicfieldoneinternalfieldGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_NoCtorsInitializedPublicFieldOneInternalField_get_field_publicField'));
final _smokeNoctorsinitializedpublicfieldoneinternalfieldGetFieldinitializedField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_NoCtorsInitializedPublicFieldOneInternalField_get_field_initializedField'));



Pointer<Void> smokeNoctorsinitializedpublicfieldoneinternalfieldToFfi(NoCtorsInitializedPublicFieldOneInternalField value) {
  final _internalFieldHandle = stringToFfi(value._internalField);
  final _publicFieldHandle = booleanToFfi(value.publicField);
  final _initializedFieldHandle = (value.initializedField);
  final _result = _smokeNoctorsinitializedpublicfieldoneinternalfieldCreateHandle(_internalFieldHandle, _publicFieldHandle, _initializedFieldHandle);
  stringReleaseFfiHandle(_internalFieldHandle);
  booleanReleaseFfiHandle(_publicFieldHandle);
  
  return _result;
}

NoCtorsInitializedPublicFieldOneInternalField smokeNoctorsinitializedpublicfieldoneinternalfieldFromFfi(Pointer<Void> handle) {
  final _internalFieldHandle = _smokeNoctorsinitializedpublicfieldoneinternalfieldGetFieldinternalField(handle);
  final _publicFieldHandle = _smokeNoctorsinitializedpublicfieldoneinternalfieldGetFieldpublicField(handle);
  final _initializedFieldHandle = _smokeNoctorsinitializedpublicfieldoneinternalfieldGetFieldinitializedField(handle);
  try {
    return NoCtorsInitializedPublicFieldOneInternalField._(
      stringFromFfi(_internalFieldHandle), 
      booleanFromFfi(_publicFieldHandle), 
      (_initializedFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_internalFieldHandle);
    booleanReleaseFfiHandle(_publicFieldHandle);
    
  }
}

void smokeNoctorsinitializedpublicfieldoneinternalfieldReleaseFfiHandle(Pointer<Void> handle) => _smokeNoctorsinitializedpublicfieldoneinternalfieldReleaseHandle(handle);

// Nullable NoCtorsInitializedPublicFieldOneInternalField

final _smokeNoctorsinitializedpublicfieldoneinternalfieldCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_NoCtorsInitializedPublicFieldOneInternalField_create_handle_nullable'));
final _smokeNoctorsinitializedpublicfieldoneinternalfieldReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_NoCtorsInitializedPublicFieldOneInternalField_release_handle_nullable'));
final _smokeNoctorsinitializedpublicfieldoneinternalfieldGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_NoCtorsInitializedPublicFieldOneInternalField_get_value_nullable'));

Pointer<Void> smokeNoctorsinitializedpublicfieldoneinternalfieldToFfiNullable(NoCtorsInitializedPublicFieldOneInternalField? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeNoctorsinitializedpublicfieldoneinternalfieldToFfi(value);
  final result = _smokeNoctorsinitializedpublicfieldoneinternalfieldCreateHandleNullable(_handle);
  smokeNoctorsinitializedpublicfieldoneinternalfieldReleaseFfiHandle(_handle);
  return result;
}

NoCtorsInitializedPublicFieldOneInternalField? smokeNoctorsinitializedpublicfieldoneinternalfieldFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeNoctorsinitializedpublicfieldoneinternalfieldGetValueNullable(handle);
  final result = smokeNoctorsinitializedpublicfieldoneinternalfieldFromFfi(_handle);
  smokeNoctorsinitializedpublicfieldoneinternalfieldReleaseFfiHandle(_handle);
  return result;
}

void smokeNoctorsinitializedpublicfieldoneinternalfieldReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeNoctorsinitializedpublicfieldoneinternalfieldReleaseHandleNullable(handle);

// End of NoCtorsInitializedPublicFieldOneInternalField "private" section.


