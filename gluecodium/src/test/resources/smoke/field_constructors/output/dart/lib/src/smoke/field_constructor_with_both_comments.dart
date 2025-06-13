

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

/// SomeStruct

class FieldConstructorWithBothComments {
  String stringField;

  /// This comment takes precedence
  /// - [stringField] 
  FieldConstructorWithBothComments(this.stringField);
}


// FieldConstructorWithBothComments "private" section, not exported.

final _smokeFieldconstructorwithbothcommentsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithBothComments_create_handle'));
final _smokeFieldconstructorwithbothcommentsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithBothComments_release_handle'));
final _smokeFieldconstructorwithbothcommentsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithBothComments_get_field_stringField'));



Pointer<Void> smokeFieldconstructorwithbothcommentsToFfi(FieldConstructorWithBothComments value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeFieldconstructorwithbothcommentsCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}

FieldConstructorWithBothComments smokeFieldconstructorwithbothcommentsFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeFieldconstructorwithbothcommentsGetFieldstringField(handle);
  try {
    return FieldConstructorWithBothComments(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}

void smokeFieldconstructorwithbothcommentsReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorwithbothcommentsReleaseHandle(handle);

// Nullable FieldConstructorWithBothComments

final _smokeFieldconstructorwithbothcommentsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithBothComments_create_handle_nullable'));
final _smokeFieldconstructorwithbothcommentsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithBothComments_release_handle_nullable'));
final _smokeFieldconstructorwithbothcommentsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithBothComments_get_value_nullable'));

Pointer<Void> smokeFieldconstructorwithbothcommentsToFfiNullable(FieldConstructorWithBothComments? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorwithbothcommentsToFfi(value);
  final result = _smokeFieldconstructorwithbothcommentsCreateHandleNullable(_handle);
  smokeFieldconstructorwithbothcommentsReleaseFfiHandle(_handle);
  return result;
}

FieldConstructorWithBothComments? smokeFieldconstructorwithbothcommentsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorwithbothcommentsGetValueNullable(handle);
  final result = smokeFieldconstructorwithbothcommentsFromFfi(_handle);
  smokeFieldconstructorwithbothcommentsReleaseFfiHandle(_handle);
  return result;
}

void smokeFieldconstructorwithbothcommentsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorwithbothcommentsReleaseHandleNullable(handle);

// End of FieldConstructorWithBothComments "private" section.


