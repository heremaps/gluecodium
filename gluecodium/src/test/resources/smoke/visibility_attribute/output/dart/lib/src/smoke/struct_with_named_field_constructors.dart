

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

/// A helper structure for test case 3.
///
/// It defines a few named field constructors.
/// All fields are public.
/// Two of them are initialized.

class StructWithNamedFieldConstructors {
  String field1;

  String field2;

  int initializedField1;

  int initializedField2;

  StructWithNamedFieldConstructors.explicitAllArgsCtor(this.field1, this.field2, this.initializedField1, this.initializedField2);
  StructWithNamedFieldConstructors.withoutTwoInitializedFields(this.field1, this.field2)
      : initializedField1 = 77, initializedField2 = 101;
  StructWithNamedFieldConstructors.withoutOneInitializedField(this.field1, this.field2, this.initializedField1)
      : initializedField2 = 101;
}


// StructWithNamedFieldConstructors "private" section, not exported.

final _smokeStructwithnamedfieldconstructorsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Int32, Int32),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int, int)
  >('library_smoke_StructWithNamedFieldConstructors_create_handle'));
final _smokeStructwithnamedfieldconstructorsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithNamedFieldConstructors_release_handle'));
final _smokeStructwithnamedfieldconstructorsGetFieldfield1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithNamedFieldConstructors_get_field_field1'));
final _smokeStructwithnamedfieldconstructorsGetFieldfield2 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithNamedFieldConstructors_get_field_field2'));
final _smokeStructwithnamedfieldconstructorsGetFieldinitializedField1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithNamedFieldConstructors_get_field_initializedField1'));
final _smokeStructwithnamedfieldconstructorsGetFieldinitializedField2 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_StructWithNamedFieldConstructors_get_field_initializedField2'));



Pointer<Void> smokeStructwithnamedfieldconstructorsToFfi(StructWithNamedFieldConstructors value) {
  final _field1Handle = stringToFfi(value.field1);
  final _field2Handle = stringToFfi(value.field2);
  final _initializedField1Handle = (value.initializedField1);
  final _initializedField2Handle = (value.initializedField2);
  final _result = _smokeStructwithnamedfieldconstructorsCreateHandle(_field1Handle, _field2Handle, _initializedField1Handle, _initializedField2Handle);
  stringReleaseFfiHandle(_field1Handle);
  stringReleaseFfiHandle(_field2Handle);
  
  
  return _result;
}

StructWithNamedFieldConstructors smokeStructwithnamedfieldconstructorsFromFfi(Pointer<Void> handle) {
  final _field1Handle = _smokeStructwithnamedfieldconstructorsGetFieldfield1(handle);
  final _field2Handle = _smokeStructwithnamedfieldconstructorsGetFieldfield2(handle);
  final _initializedField1Handle = _smokeStructwithnamedfieldconstructorsGetFieldinitializedField1(handle);
  final _initializedField2Handle = _smokeStructwithnamedfieldconstructorsGetFieldinitializedField2(handle);
  try {
    return StructWithNamedFieldConstructors.explicitAllArgsCtor(
      stringFromFfi(_field1Handle), 
      stringFromFfi(_field2Handle), 
      (_initializedField1Handle), 
      (_initializedField2Handle)
    );
  } finally {
    stringReleaseFfiHandle(_field1Handle);
    stringReleaseFfiHandle(_field2Handle);
    
    
  }
}

void smokeStructwithnamedfieldconstructorsReleaseFfiHandle(Pointer<Void> handle) => _smokeStructwithnamedfieldconstructorsReleaseHandle(handle);

// Nullable StructWithNamedFieldConstructors

final _smokeStructwithnamedfieldconstructorsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithNamedFieldConstructors_create_handle_nullable'));
final _smokeStructwithnamedfieldconstructorsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithNamedFieldConstructors_release_handle_nullable'));
final _smokeStructwithnamedfieldconstructorsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithNamedFieldConstructors_get_value_nullable'));

Pointer<Void> smokeStructwithnamedfieldconstructorsToFfiNullable(StructWithNamedFieldConstructors? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructwithnamedfieldconstructorsToFfi(value);
  final result = _smokeStructwithnamedfieldconstructorsCreateHandleNullable(_handle);
  smokeStructwithnamedfieldconstructorsReleaseFfiHandle(_handle);
  return result;
}

StructWithNamedFieldConstructors? smokeStructwithnamedfieldconstructorsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructwithnamedfieldconstructorsGetValueNullable(handle);
  final result = smokeStructwithnamedfieldconstructorsFromFfi(_handle);
  smokeStructwithnamedfieldconstructorsReleaseFfiHandle(_handle);
  return result;
}

void smokeStructwithnamedfieldconstructorsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructwithnamedfieldconstructorsReleaseHandleNullable(handle);

// End of StructWithNamedFieldConstructors "private" section.


