

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;


class FieldConstructorsNullableTypes {
  FieldConstructorsNullableTypes_StructWithParameters? nullableField;

  FieldConstructorsNullableTypes._(this.nullableField);
  FieldConstructorsNullableTypes()
    : nullableField = FieldConstructorsNullableTypes_StructWithParameters(FieldConstructorsNullableTypes_FoodType.fruits);
}

enum FieldConstructorsNullableTypes_FoodType {
    vegetables,
    fruits
}

// FieldConstructorsNullableTypes_FoodType "private" section, not exported.

int smokeFieldconstructorsnullabletypesFoodtypeToFfi(FieldConstructorsNullableTypes_FoodType value) {
  switch (value) {
  case FieldConstructorsNullableTypes_FoodType.vegetables:
    return 0;
  case FieldConstructorsNullableTypes_FoodType.fruits:
    return 1;
  }
}

FieldConstructorsNullableTypes_FoodType smokeFieldconstructorsnullabletypesFoodtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return FieldConstructorsNullableTypes_FoodType.vegetables;
  case 1:
    return FieldConstructorsNullableTypes_FoodType.fruits;
  default:
    throw StateError("Invalid numeric value $handle for FieldConstructorsNullableTypes_FoodType enum.");
  }
}

void smokeFieldconstructorsnullabletypesFoodtypeReleaseFfiHandle(int handle) {}

final _smokeFieldconstructorsnullabletypesFoodtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_FieldConstructorsNullableTypes_FoodType_create_handle_nullable'));
final _smokeFieldconstructorsnullabletypesFoodtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_FoodType_release_handle_nullable'));
final _smokeFieldconstructorsnullabletypesFoodtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_FoodType_get_value_nullable'));

Pointer<Void> smokeFieldconstructorsnullabletypesFoodtypeToFfiNullable(FieldConstructorsNullableTypes_FoodType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorsnullabletypesFoodtypeToFfi(value);
  final result = _smokeFieldconstructorsnullabletypesFoodtypeCreateHandleNullable(_handle);
  smokeFieldconstructorsnullabletypesFoodtypeReleaseFfiHandle(_handle);
  return result;
}

FieldConstructorsNullableTypes_FoodType? smokeFieldconstructorsnullabletypesFoodtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorsnullabletypesFoodtypeGetValueNullable(handle);
  final result = smokeFieldconstructorsnullabletypesFoodtypeFromFfi(_handle);
  smokeFieldconstructorsnullabletypesFoodtypeReleaseFfiHandle(_handle);
  return result;
}

void smokeFieldconstructorsnullabletypesFoodtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorsnullabletypesFoodtypeReleaseHandleNullable(handle);

// End of FieldConstructorsNullableTypes_FoodType "private" section.

class FieldConstructorsNullableTypes_StructWithParameters {
  FieldConstructorsNullableTypes_FoodType foodType;

  FieldConstructorsNullableTypes_StructWithParameters(this.foodType);
}


// FieldConstructorsNullableTypes_StructWithParameters "private" section, not exported.

final _smokeFieldconstructorsnullabletypesStructwithparametersCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_FieldConstructorsNullableTypes_StructWithParameters_create_handle'));
final _smokeFieldconstructorsnullabletypesStructwithparametersReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_StructWithParameters_release_handle'));
final _smokeFieldconstructorsnullabletypesStructwithparametersGetFieldfoodType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_StructWithParameters_get_field_foodType'));



Pointer<Void> smokeFieldconstructorsnullabletypesStructwithparametersToFfi(FieldConstructorsNullableTypes_StructWithParameters value) {
  final _foodTypeHandle = smokeFieldconstructorsnullabletypesFoodtypeToFfi(value.foodType);
  final _result = _smokeFieldconstructorsnullabletypesStructwithparametersCreateHandle(_foodTypeHandle);
  smokeFieldconstructorsnullabletypesFoodtypeReleaseFfiHandle(_foodTypeHandle);
  return _result;
}

FieldConstructorsNullableTypes_StructWithParameters smokeFieldconstructorsnullabletypesStructwithparametersFromFfi(Pointer<Void> handle) {
  final _foodTypeHandle = _smokeFieldconstructorsnullabletypesStructwithparametersGetFieldfoodType(handle);
  try {
    return FieldConstructorsNullableTypes_StructWithParameters(
      smokeFieldconstructorsnullabletypesFoodtypeFromFfi(_foodTypeHandle)
    );
  } finally {
    smokeFieldconstructorsnullabletypesFoodtypeReleaseFfiHandle(_foodTypeHandle);
  }
}

void smokeFieldconstructorsnullabletypesStructwithparametersReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorsnullabletypesStructwithparametersReleaseHandle(handle);

// Nullable FieldConstructorsNullableTypes_StructWithParameters

final _smokeFieldconstructorsnullabletypesStructwithparametersCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_StructWithParameters_create_handle_nullable'));
final _smokeFieldconstructorsnullabletypesStructwithparametersReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_StructWithParameters_release_handle_nullable'));
final _smokeFieldconstructorsnullabletypesStructwithparametersGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_StructWithParameters_get_value_nullable'));

Pointer<Void> smokeFieldconstructorsnullabletypesStructwithparametersToFfiNullable(FieldConstructorsNullableTypes_StructWithParameters? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorsnullabletypesStructwithparametersToFfi(value);
  final result = _smokeFieldconstructorsnullabletypesStructwithparametersCreateHandleNullable(_handle);
  smokeFieldconstructorsnullabletypesStructwithparametersReleaseFfiHandle(_handle);
  return result;
}

FieldConstructorsNullableTypes_StructWithParameters? smokeFieldconstructorsnullabletypesStructwithparametersFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorsnullabletypesStructwithparametersGetValueNullable(handle);
  final result = smokeFieldconstructorsnullabletypesStructwithparametersFromFfi(_handle);
  smokeFieldconstructorsnullabletypesStructwithparametersReleaseFfiHandle(_handle);
  return result;
}

void smokeFieldconstructorsnullabletypesStructwithparametersReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorsnullabletypesStructwithparametersReleaseHandleNullable(handle);

// End of FieldConstructorsNullableTypes_StructWithParameters "private" section.

// FieldConstructorsNullableTypes "private" section, not exported.

final _smokeFieldconstructorsnullabletypesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_create_handle'));
final _smokeFieldconstructorsnullabletypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_release_handle'));
final _smokeFieldconstructorsnullabletypesGetFieldnullableField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_get_field_nullableField'));



Pointer<Void> smokeFieldconstructorsnullabletypesToFfi(FieldConstructorsNullableTypes value) {
  final _nullableFieldHandle = smokeFieldconstructorsnullabletypesStructwithparametersToFfiNullable(value.nullableField);
  final _result = _smokeFieldconstructorsnullabletypesCreateHandle(_nullableFieldHandle);
  smokeFieldconstructorsnullabletypesStructwithparametersReleaseFfiHandleNullable(_nullableFieldHandle);
  return _result;
}

FieldConstructorsNullableTypes smokeFieldconstructorsnullabletypesFromFfi(Pointer<Void> handle) {
  final _nullableFieldHandle = _smokeFieldconstructorsnullabletypesGetFieldnullableField(handle);
  try {
    return FieldConstructorsNullableTypes._(
      smokeFieldconstructorsnullabletypesStructwithparametersFromFfiNullable(_nullableFieldHandle)
    );
  } finally {
    smokeFieldconstructorsnullabletypesStructwithparametersReleaseFfiHandleNullable(_nullableFieldHandle);
  }
}

void smokeFieldconstructorsnullabletypesReleaseFfiHandle(Pointer<Void> handle) => _smokeFieldconstructorsnullabletypesReleaseHandle(handle);

// Nullable FieldConstructorsNullableTypes

final _smokeFieldconstructorsnullabletypesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_create_handle_nullable'));
final _smokeFieldconstructorsnullabletypesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_release_handle_nullable'));
final _smokeFieldconstructorsnullabletypesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FieldConstructorsNullableTypes_get_value_nullable'));

Pointer<Void> smokeFieldconstructorsnullabletypesToFfiNullable(FieldConstructorsNullableTypes? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeFieldconstructorsnullabletypesToFfi(value);
  final result = _smokeFieldconstructorsnullabletypesCreateHandleNullable(_handle);
  smokeFieldconstructorsnullabletypesReleaseFfiHandle(_handle);
  return result;
}

FieldConstructorsNullableTypes? smokeFieldconstructorsnullabletypesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeFieldconstructorsnullabletypesGetValueNullable(handle);
  final result = smokeFieldconstructorsnullabletypesFromFfi(_handle);
  smokeFieldconstructorsnullabletypesReleaseFfiHandle(_handle);
  return result;
}

void smokeFieldconstructorsnullabletypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeFieldconstructorsnullabletypesReleaseHandleNullable(handle);

// End of FieldConstructorsNullableTypes "private" section.


