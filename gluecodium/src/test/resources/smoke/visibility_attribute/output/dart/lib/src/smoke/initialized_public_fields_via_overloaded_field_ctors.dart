

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/smoke/struct_with_named_field_constructors.dart';

/// Test case 3
///
/// Input:
/// - This structure does not define explicit constructors / field constructors.
///
/// - It has three public fields with default values.
///
/// - All fields use struct type and we check if the name of constructor is properly resolved.
///
/// Expected outcome:
/// - Generated initialized values ctor properly resolves names.

class InitializedPublicFieldsViaOverloadedFieldCtors {
  StructWithNamedFieldConstructors initializedField1;

  StructWithNamedFieldConstructors initializedField2;

  StructWithNamedFieldConstructors initializedField3;

  InitializedPublicFieldsViaOverloadedFieldCtors._(this.initializedField1, this.initializedField2, this.initializedField3);
  InitializedPublicFieldsViaOverloadedFieldCtors()
    : initializedField1 = StructWithNamedFieldConstructors("abc", "def", 9, 11), initializedField2 = StructWithNamedFieldConstructors("abc", "def", 123), initializedField3 = StructWithNamedFieldConstructors("abc", "def");
}


// InitializedPublicFieldsViaOverloadedFieldCtors "private" section, not exported.

final _smokeInitializedpublicfieldsviaoverloadedfieldctorsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_InitializedPublicFieldsViaOverloadedFieldCtors_create_handle'));
final _smokeInitializedpublicfieldsviaoverloadedfieldctorsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InitializedPublicFieldsViaOverloadedFieldCtors_release_handle'));
final _smokeInitializedpublicfieldsviaoverloadedfieldctorsGetFieldinitializedField1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InitializedPublicFieldsViaOverloadedFieldCtors_get_field_initializedField1'));
final _smokeInitializedpublicfieldsviaoverloadedfieldctorsGetFieldinitializedField2 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InitializedPublicFieldsViaOverloadedFieldCtors_get_field_initializedField2'));
final _smokeInitializedpublicfieldsviaoverloadedfieldctorsGetFieldinitializedField3 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InitializedPublicFieldsViaOverloadedFieldCtors_get_field_initializedField3'));



Pointer<Void> smokeInitializedpublicfieldsviaoverloadedfieldctorsToFfi(InitializedPublicFieldsViaOverloadedFieldCtors value) {
  final _initializedField1Handle = smokeStructwithnamedfieldconstructorsToFfi(value.initializedField1);
  final _initializedField2Handle = smokeStructwithnamedfieldconstructorsToFfi(value.initializedField2);
  final _initializedField3Handle = smokeStructwithnamedfieldconstructorsToFfi(value.initializedField3);
  final _result = _smokeInitializedpublicfieldsviaoverloadedfieldctorsCreateHandle(_initializedField1Handle, _initializedField2Handle, _initializedField3Handle);
  smokeStructwithnamedfieldconstructorsReleaseFfiHandle(_initializedField1Handle);
  smokeStructwithnamedfieldconstructorsReleaseFfiHandle(_initializedField2Handle);
  smokeStructwithnamedfieldconstructorsReleaseFfiHandle(_initializedField3Handle);
  return _result;
}

InitializedPublicFieldsViaOverloadedFieldCtors smokeInitializedpublicfieldsviaoverloadedfieldctorsFromFfi(Pointer<Void> handle) {
  final _initializedField1Handle = _smokeInitializedpublicfieldsviaoverloadedfieldctorsGetFieldinitializedField1(handle);
  final _initializedField2Handle = _smokeInitializedpublicfieldsviaoverloadedfieldctorsGetFieldinitializedField2(handle);
  final _initializedField3Handle = _smokeInitializedpublicfieldsviaoverloadedfieldctorsGetFieldinitializedField3(handle);
  try {
    return InitializedPublicFieldsViaOverloadedFieldCtors._(
      smokeStructwithnamedfieldconstructorsFromFfi(_initializedField1Handle), 
      smokeStructwithnamedfieldconstructorsFromFfi(_initializedField2Handle), 
      smokeStructwithnamedfieldconstructorsFromFfi(_initializedField3Handle)
    );
  } finally {
    smokeStructwithnamedfieldconstructorsReleaseFfiHandle(_initializedField1Handle);
    smokeStructwithnamedfieldconstructorsReleaseFfiHandle(_initializedField2Handle);
    smokeStructwithnamedfieldconstructorsReleaseFfiHandle(_initializedField3Handle);
  }
}

void smokeInitializedpublicfieldsviaoverloadedfieldctorsReleaseFfiHandle(Pointer<Void> handle) => _smokeInitializedpublicfieldsviaoverloadedfieldctorsReleaseHandle(handle);

// Nullable InitializedPublicFieldsViaOverloadedFieldCtors

final _smokeInitializedpublicfieldsviaoverloadedfieldctorsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InitializedPublicFieldsViaOverloadedFieldCtors_create_handle_nullable'));
final _smokeInitializedpublicfieldsviaoverloadedfieldctorsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InitializedPublicFieldsViaOverloadedFieldCtors_release_handle_nullable'));
final _smokeInitializedpublicfieldsviaoverloadedfieldctorsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InitializedPublicFieldsViaOverloadedFieldCtors_get_value_nullable'));

Pointer<Void> smokeInitializedpublicfieldsviaoverloadedfieldctorsToFfiNullable(InitializedPublicFieldsViaOverloadedFieldCtors? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeInitializedpublicfieldsviaoverloadedfieldctorsToFfi(value);
  final result = _smokeInitializedpublicfieldsviaoverloadedfieldctorsCreateHandleNullable(_handle);
  smokeInitializedpublicfieldsviaoverloadedfieldctorsReleaseFfiHandle(_handle);
  return result;
}

InitializedPublicFieldsViaOverloadedFieldCtors? smokeInitializedpublicfieldsviaoverloadedfieldctorsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeInitializedpublicfieldsviaoverloadedfieldctorsGetValueNullable(handle);
  final result = smokeInitializedpublicfieldsviaoverloadedfieldctorsFromFfi(_handle);
  smokeInitializedpublicfieldsviaoverloadedfieldctorsReleaseFfiHandle(_handle);
  return result;
}

void smokeInitializedpublicfieldsviaoverloadedfieldctorsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInitializedpublicfieldsviaoverloadedfieldctorsReleaseHandleNullable(handle);

// End of InitializedPublicFieldsViaOverloadedFieldCtors "private" section.


