

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';

/// SomeStruct

class FieldConstructorWithParentComment {
  String stringField;

  /// There are constructors
  /// - [stringField] 
  FieldConstructorWithParentComment(this.stringField);
}


// FieldConstructorWithParentComment "private" section, not exported.

final _smokeFieldconstructorwithparentcommentCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithParentComment_create_handle'));
final _smokeFieldconstructorwithparentcommentReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithParentComment_release_handle'));
final _smokeFieldconstructorwithparentcommentGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithParentComment_get_field_stringField'));



Pointer<Void> smokeFieldconstructorwithparentcommentToFfi(FieldConstructorWithParentComment value) {
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeFieldconstructorwithparentcommentCreateHandle(_stringFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}

FieldConstructorWithParentComment smokeFieldconstructorwithparentcommentFromFfi(Pointer<Void> handle) {
  final _stringFieldHandle = _smokeFieldconstructorwithparentcommentGetFieldstringField(handle);
  try {
    return FieldConstructorWithParentComment(
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}

void smokeFieldconstructorwithparentcommentReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorwithparentcommentReleaseHandle(handle);

// Nullable FieldConstructorWithParentComment

final _smokeFieldconstructorwithparentcommentCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithParentComment_create_handle_nullable'));
final _smokeFieldconstructorwithparentcommentReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithParentComment_release_handle_nullable'));
final _smokeFieldconstructorwithparentcommentGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorWithParentComment_get_value_nullable'));

Pointer<Void> smokeFieldconstructorwithparentcommentToFfiNullable(FieldConstructorWithParentComment? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorwithparentcommentToFfi(value);
  final result = _smokeFieldconstructorwithparentcommentCreateHandleNullable(_handle);
  smokeFieldconstructorwithparentcommentReleaseFfiHandle(_handle);
  return result;
}

FieldConstructorWithParentComment? smokeFieldconstructorwithparentcommentFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorwithparentcommentGetValueNullable(handle);
  final result = smokeFieldconstructorwithparentcommentFromFfi(_handle);
  smokeFieldconstructorwithparentcommentReleaseFfiHandle(_handle);
  return result;
}

void smokeFieldconstructorwithparentcommentReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorwithparentcommentReleaseHandleNullable(handle);

// End of FieldConstructorWithParentComment "private" section.


