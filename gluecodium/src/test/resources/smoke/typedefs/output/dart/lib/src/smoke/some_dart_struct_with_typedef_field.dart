

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/global_list_type_def.dart';


class SomeDartStructWithTypedefField {
  GlobalListTypeDef someField;

  SomeDartStructWithTypedefField(this.someField);
}


// SomeDartStructWithTypedefField "private" section, not exported.

final _smokeSomedartstructwithtypedeffieldCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SomeDartStructWithTypedefField_create_handle'));
final _smokeSomedartstructwithtypedeffieldReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SomeDartStructWithTypedefField_release_handle'));
final _smokeSomedartstructwithtypedeffieldGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SomeDartStructWithTypedefField_get_field_someField'));



Pointer<Void> smokeSomedartstructwithtypedeffieldToFfi(SomeDartStructWithTypedefField value) {
  final _someFieldHandle = foobarListofFloatToFfi(value.someField);
  final _result = _smokeSomedartstructwithtypedeffieldCreateHandle(_someFieldHandle);
  foobarListofFloatReleaseFfiHandle(_someFieldHandle);
  return _result;
}

SomeDartStructWithTypedefField smokeSomedartstructwithtypedeffieldFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeSomedartstructwithtypedeffieldGetFieldsomeField(handle);
  try {
    return SomeDartStructWithTypedefField(
      foobarListofFloatFromFfi(_someFieldHandle)
    );
  } finally {
    foobarListofFloatReleaseFfiHandle(_someFieldHandle);
  }
}

void smokeSomedartstructwithtypedeffieldReleaseFfiHandle(Pointer<Void> handle) => _smokeSomedartstructwithtypedeffieldReleaseHandle(handle);

// Nullable SomeDartStructWithTypedefField

final _smokeSomedartstructwithtypedeffieldCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SomeDartStructWithTypedefField_create_handle_nullable'));
final _smokeSomedartstructwithtypedeffieldReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SomeDartStructWithTypedefField_release_handle_nullable'));
final _smokeSomedartstructwithtypedeffieldGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SomeDartStructWithTypedefField_get_value_nullable'));

Pointer<Void> smokeSomedartstructwithtypedeffieldToFfiNullable(SomeDartStructWithTypedefField? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeSomedartstructwithtypedeffieldToFfi(value);
  final result = _smokeSomedartstructwithtypedeffieldCreateHandleNullable(_handle);
  smokeSomedartstructwithtypedeffieldReleaseFfiHandle(_handle);
  return result;
}

SomeDartStructWithTypedefField? smokeSomedartstructwithtypedeffieldFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeSomedartstructwithtypedeffieldGetValueNullable(handle);
  final result = smokeSomedartstructwithtypedeffieldFromFfi(_handle);
  smokeSomedartstructwithtypedeffieldReleaseFfiHandle(_handle);
  return result;
}

void smokeSomedartstructwithtypedeffieldReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSomedartstructwithtypedeffieldReleaseHandleNullable(handle);

// End of SomeDartStructWithTypedefField "private" section.


