

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

/// Test case 4
///
/// Input:
/// - The structure uses `PositionalDefaults` and should get such constructor.
///
/// - This structure does not define other constructors / field constructors.
///
/// - It has one public field with default value.
///
/// - One of fields is internal.
///
/// Expected outcome:
/// - Generated positional defaults constructor is not public (because it would expose internal field).

class PosDefaultsWithOneInternalField {
  /// @nodoc
  String _internalField;

  bool publicField;

  int initializedField;

  PosDefaultsWithOneInternalField(String internalField, bool publicField, [int initializedField = 77])
    : _internalField = internalField, publicField = publicField, initializedField = initializedField;
}


// PosDefaultsWithOneInternalField "private" section, not exported.

final _smokePosdefaultswithoneinternalfieldCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint8, Int32),
    Pointer<Void> Function(Pointer<Void>, int, int)
  >('library_smoke_PosDefaultsWithOneInternalField_create_handle'));
final _smokePosdefaultswithoneinternalfieldReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithOneInternalField_release_handle'));
final _smokePosdefaultswithoneinternalfieldGetFieldinternalField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithOneInternalField_get_field_internalField'));
final _smokePosdefaultswithoneinternalfieldGetFieldpublicField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithOneInternalField_get_field_publicField'));
final _smokePosdefaultswithoneinternalfieldGetFieldinitializedField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithOneInternalField_get_field_initializedField'));



Pointer<Void> smokePosdefaultswithoneinternalfieldToFfi(PosDefaultsWithOneInternalField value) {
  final _internalFieldHandle = stringToFfi(value._internalField);
  final _publicFieldHandle = booleanToFfi(value.publicField);
  final _initializedFieldHandle = (value.initializedField);
  final _result = _smokePosdefaultswithoneinternalfieldCreateHandle(_internalFieldHandle, _publicFieldHandle, _initializedFieldHandle);
  stringReleaseFfiHandle(_internalFieldHandle);
  booleanReleaseFfiHandle(_publicFieldHandle);
  
  return _result;
}

PosDefaultsWithOneInternalField smokePosdefaultswithoneinternalfieldFromFfi(Pointer<Void> handle) {
  final _internalFieldHandle = _smokePosdefaultswithoneinternalfieldGetFieldinternalField(handle);
  final _publicFieldHandle = _smokePosdefaultswithoneinternalfieldGetFieldpublicField(handle);
  final _initializedFieldHandle = _smokePosdefaultswithoneinternalfieldGetFieldinitializedField(handle);
  try {
    return PosDefaultsWithOneInternalField(
      stringFromFfi(_internalFieldHandle), 
      booleanFromFfi(_publicFieldHandle), 
      (_initializedFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_internalFieldHandle);
    booleanReleaseFfiHandle(_publicFieldHandle);
    
  }
}

void smokePosdefaultswithoneinternalfieldReleaseFfiHandle(Pointer<Void> handle) => _smokePosdefaultswithoneinternalfieldReleaseHandle(handle);

// Nullable PosDefaultsWithOneInternalField

final _smokePosdefaultswithoneinternalfieldCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithOneInternalField_create_handle_nullable'));
final _smokePosdefaultswithoneinternalfieldReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithOneInternalField_release_handle_nullable'));
final _smokePosdefaultswithoneinternalfieldGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultsWithOneInternalField_get_value_nullable'));

Pointer<Void> smokePosdefaultswithoneinternalfieldToFfiNullable(PosDefaultsWithOneInternalField? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePosdefaultswithoneinternalfieldToFfi(value);
  final result = _smokePosdefaultswithoneinternalfieldCreateHandleNullable(_handle);
  smokePosdefaultswithoneinternalfieldReleaseFfiHandle(_handle);
  return result;
}

PosDefaultsWithOneInternalField? smokePosdefaultswithoneinternalfieldFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePosdefaultswithoneinternalfieldGetValueNullable(handle);
  final result = smokePosdefaultswithoneinternalfieldFromFfi(_handle);
  smokePosdefaultswithoneinternalfieldReleaseFfiHandle(_handle);
  return result;
}

void smokePosdefaultswithoneinternalfieldReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePosdefaultswithoneinternalfieldReleaseHandleNullable(handle);

// End of PosDefaultsWithOneInternalField "private" section.


