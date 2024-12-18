

import 'dart:ffi';
import 'package:collection/collection.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';


class Equatable {
}

enum Equatable_SomeEnum {
    foo,
    bar
}

// Equatable_SomeEnum "private" section, not exported.

int smokeEquatableSomeenumToFfi(Equatable_SomeEnum value) {
  switch (value) {
  case Equatable_SomeEnum.foo:
    return 0;
  case Equatable_SomeEnum.bar:
    return 1;
  }
}

Equatable_SomeEnum smokeEquatableSomeenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Equatable_SomeEnum.foo;
  case 1:
    return Equatable_SomeEnum.bar;
  default:
    throw StateError("Invalid numeric value $handle for Equatable_SomeEnum enum.");
  }
}

void smokeEquatableSomeenumReleaseFfiHandle(int handle) {}

final _smokeEquatableSomeenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Equatable_SomeEnum_create_handle_nullable'));
final _smokeEquatableSomeenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_SomeEnum_release_handle_nullable'));
final _smokeEquatableSomeenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_SomeEnum_get_value_nullable'));

Pointer<Void> smokeEquatableSomeenumToFfiNullable(Equatable_SomeEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEquatableSomeenumToFfi(value);
  final result = _smokeEquatableSomeenumCreateHandleNullable(_handle);
  smokeEquatableSomeenumReleaseFfiHandle(_handle);
  return result;
}

Equatable_SomeEnum? smokeEquatableSomeenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEquatableSomeenumGetValueNullable(handle);
  final result = smokeEquatableSomeenumFromFfi(_handle);
  smokeEquatableSomeenumReleaseFfiHandle(_handle);
  return result;
}

void smokeEquatableSomeenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEquatableSomeenumReleaseHandleNullable(handle);

// End of Equatable_SomeEnum "private" section.

class Equatable_EquatableStruct {
  bool boolField;

  int intField;

  int longField;

  double floatField;

  double doubleField;

  String stringField;

  Equatable_NestedEquatableStruct structField;

  Equatable_SomeEnum enumField;

  List<String> arrayField;

  Map<int, String> mapField;

  Equatable_EquatableStruct(this.boolField, this.intField, this.longField, this.floatField, this.doubleField, this.stringField, this.structField, this.enumField, this.arrayField, this.mapField);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Equatable_EquatableStruct) return false;
    Equatable_EquatableStruct _other = other;
    return boolField == _other.boolField &&
        intField == _other.intField &&
        longField == _other.longField &&
        floatField == _other.floatField &&
        doubleField == _other.doubleField &&
        stringField == _other.stringField &&
        structField == _other.structField &&
        enumField == _other.enumField &&
        DeepCollectionEquality().equals(arrayField, _other.arrayField) &&
        DeepCollectionEquality().equals(mapField, _other.mapField);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + boolField.hashCode;
    result = 31 * result + intField.hashCode;
    result = 31 * result + longField.hashCode;
    result = 31 * result + floatField.hashCode;
    result = 31 * result + doubleField.hashCode;
    result = 31 * result + stringField.hashCode;
    result = 31 * result + structField.hashCode;
    result = 31 * result + enumField.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(arrayField);
    result = 31 * result + DeepCollectionEquality().hash(mapField);
    return result;
  }
}


// Equatable_EquatableStruct "private" section, not exported.

final _smokeEquatableEquatablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Int32, Int64, Float, Double, Pointer<Void>, Pointer<Void>, Uint32, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, int, int, double, double, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_create_handle'));
final _smokeEquatableEquatablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_release_handle'));
final _smokeEquatableEquatablestructGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_boolField'));
final _smokeEquatableEquatablestructGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_intField'));
final _smokeEquatableEquatablestructGetFieldlongField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_longField'));
final _smokeEquatableEquatablestructGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_floatField'));
final _smokeEquatableEquatablestructGetFielddoubleField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_doubleField'));
final _smokeEquatableEquatablestructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_stringField'));
final _smokeEquatableEquatablestructGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_structField'));
final _smokeEquatableEquatablestructGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_enumField'));
final _smokeEquatableEquatablestructGetFieldarrayField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_arrayField'));
final _smokeEquatableEquatablestructGetFieldmapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_field_mapField'));



Pointer<Void> smokeEquatableEquatablestructToFfi(Equatable_EquatableStruct value) {
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _intFieldHandle = (value.intField);
  final _longFieldHandle = (value.longField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _structFieldHandle = smokeEquatableNestedequatablestructToFfi(value.structField);
  final _enumFieldHandle = smokeEquatableSomeenumToFfi(value.enumField);
  final _arrayFieldHandle = foobarListofStringToFfi(value.arrayField);
  final _mapFieldHandle = foobarMapofIntToStringToFfi(value.mapField);
  final _result = _smokeEquatableEquatablestructCreateHandle(_boolFieldHandle, _intFieldHandle, _longFieldHandle, _floatFieldHandle, _doubleFieldHandle, _stringFieldHandle, _structFieldHandle, _enumFieldHandle, _arrayFieldHandle, _mapFieldHandle);
  booleanReleaseFfiHandle(_boolFieldHandle);
  
  
  
  
  stringReleaseFfiHandle(_stringFieldHandle);
  smokeEquatableNestedequatablestructReleaseFfiHandle(_structFieldHandle);
  smokeEquatableSomeenumReleaseFfiHandle(_enumFieldHandle);
  foobarListofStringReleaseFfiHandle(_arrayFieldHandle);
  foobarMapofIntToStringReleaseFfiHandle(_mapFieldHandle);
  return _result;
}

Equatable_EquatableStruct smokeEquatableEquatablestructFromFfi(Pointer<Void> handle) {
  final _boolFieldHandle = _smokeEquatableEquatablestructGetFieldboolField(handle);
  final _intFieldHandle = _smokeEquatableEquatablestructGetFieldintField(handle);
  final _longFieldHandle = _smokeEquatableEquatablestructGetFieldlongField(handle);
  final _floatFieldHandle = _smokeEquatableEquatablestructGetFieldfloatField(handle);
  final _doubleFieldHandle = _smokeEquatableEquatablestructGetFielddoubleField(handle);
  final _stringFieldHandle = _smokeEquatableEquatablestructGetFieldstringField(handle);
  final _structFieldHandle = _smokeEquatableEquatablestructGetFieldstructField(handle);
  final _enumFieldHandle = _smokeEquatableEquatablestructGetFieldenumField(handle);
  final _arrayFieldHandle = _smokeEquatableEquatablestructGetFieldarrayField(handle);
  final _mapFieldHandle = _smokeEquatableEquatablestructGetFieldmapField(handle);
  try {
    return Equatable_EquatableStruct(
      booleanFromFfi(_boolFieldHandle), 
      (_intFieldHandle), 
      (_longFieldHandle), 
      (_floatFieldHandle), 
      (_doubleFieldHandle), 
      stringFromFfi(_stringFieldHandle), 
      smokeEquatableNestedequatablestructFromFfi(_structFieldHandle), 
      smokeEquatableSomeenumFromFfi(_enumFieldHandle), 
      foobarListofStringFromFfi(_arrayFieldHandle), 
      foobarMapofIntToStringFromFfi(_mapFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_boolFieldHandle);
    
    
    
    
    stringReleaseFfiHandle(_stringFieldHandle);
    smokeEquatableNestedequatablestructReleaseFfiHandle(_structFieldHandle);
    smokeEquatableSomeenumReleaseFfiHandle(_enumFieldHandle);
    foobarListofStringReleaseFfiHandle(_arrayFieldHandle);
    foobarMapofIntToStringReleaseFfiHandle(_mapFieldHandle);
  }
}

void smokeEquatableEquatablestructReleaseFfiHandle(Pointer<Void> handle) => _smokeEquatableEquatablestructReleaseHandle(handle);

// Nullable Equatable_EquatableStruct

final _smokeEquatableEquatablestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_create_handle_nullable'));
final _smokeEquatableEquatablestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_release_handle_nullable'));
final _smokeEquatableEquatablestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableStruct_get_value_nullable'));

Pointer<Void> smokeEquatableEquatablestructToFfiNullable(Equatable_EquatableStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEquatableEquatablestructToFfi(value);
  final result = _smokeEquatableEquatablestructCreateHandleNullable(_handle);
  smokeEquatableEquatablestructReleaseFfiHandle(_handle);
  return result;
}

Equatable_EquatableStruct? smokeEquatableEquatablestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEquatableEquatablestructGetValueNullable(handle);
  final result = smokeEquatableEquatablestructFromFfi(_handle);
  smokeEquatableEquatablestructReleaseFfiHandle(_handle);
  return result;
}

void smokeEquatableEquatablestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEquatableEquatablestructReleaseHandleNullable(handle);

// End of Equatable_EquatableStruct "private" section.

class Equatable_EquatableNullableStruct {
  bool? boolField;

  int? intField;

  int? uintField;

  double? floatField;

  String? stringField;

  Equatable_NestedEquatableStruct? structField;

  Equatable_SomeEnum? enumField;

  List<String>? arrayField;

  Map<int, String>? mapField;

  Equatable_EquatableNullableStruct._(this.boolField, this.intField, this.uintField, this.floatField, this.stringField, this.structField, this.enumField, this.arrayField, this.mapField);
  Equatable_EquatableNullableStruct()
    : boolField = null, intField = null, uintField = null, floatField = null, stringField = null, structField = null, enumField = null, arrayField = null, mapField = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Equatable_EquatableNullableStruct) return false;
    Equatable_EquatableNullableStruct _other = other;
    return boolField == _other.boolField &&
        intField == _other.intField &&
        uintField == _other.uintField &&
        floatField == _other.floatField &&
        stringField == _other.stringField &&
        structField == _other.structField &&
        enumField == _other.enumField &&
        DeepCollectionEquality().equals(arrayField, _other.arrayField) &&
        DeepCollectionEquality().equals(mapField, _other.mapField);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + boolField.hashCode;
    result = 31 * result + intField.hashCode;
    result = 31 * result + uintField.hashCode;
    result = 31 * result + floatField.hashCode;
    result = 31 * result + stringField.hashCode;
    result = 31 * result + structField.hashCode;
    result = 31 * result + enumField.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(arrayField);
    result = 31 * result + DeepCollectionEquality().hash(mapField);
    return result;
  }
}


// Equatable_EquatableNullableStruct "private" section, not exported.

final _smokeEquatableEquatablenullablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_create_handle'));
final _smokeEquatableEquatablenullablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_release_handle'));
final _smokeEquatableEquatablenullablestructGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_boolField'));
final _smokeEquatableEquatablenullablestructGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_intField'));
final _smokeEquatableEquatablenullablestructGetFielduintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_uintField'));
final _smokeEquatableEquatablenullablestructGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_floatField'));
final _smokeEquatableEquatablenullablestructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_stringField'));
final _smokeEquatableEquatablenullablestructGetFieldstructField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_structField'));
final _smokeEquatableEquatablenullablestructGetFieldenumField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_enumField'));
final _smokeEquatableEquatablenullablestructGetFieldarrayField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_arrayField'));
final _smokeEquatableEquatablenullablestructGetFieldmapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_field_mapField'));



Pointer<Void> smokeEquatableEquatablenullablestructToFfi(Equatable_EquatableNullableStruct value) {
  final _boolFieldHandle = booleanToFfiNullable(value.boolField);
  final _intFieldHandle = intToFfiNullable(value.intField);
  final _uintFieldHandle = uShortToFfiNullable(value.uintField);
  final _floatFieldHandle = floatToFfiNullable(value.floatField);
  final _stringFieldHandle = stringToFfiNullable(value.stringField);
  final _structFieldHandle = smokeEquatableNestedequatablestructToFfiNullable(value.structField);
  final _enumFieldHandle = smokeEquatableSomeenumToFfiNullable(value.enumField);
  final _arrayFieldHandle = foobarListofStringToFfiNullable(value.arrayField);
  final _mapFieldHandle = foobarMapofIntToStringToFfiNullable(value.mapField);
  final _result = _smokeEquatableEquatablenullablestructCreateHandle(_boolFieldHandle, _intFieldHandle, _uintFieldHandle, _floatFieldHandle, _stringFieldHandle, _structFieldHandle, _enumFieldHandle, _arrayFieldHandle, _mapFieldHandle);
  booleanReleaseFfiHandleNullable(_boolFieldHandle);
  intReleaseFfiHandleNullable(_intFieldHandle);
  uShortReleaseFfiHandleNullable(_uintFieldHandle);
  floatReleaseFfiHandleNullable(_floatFieldHandle);
  stringReleaseFfiHandleNullable(_stringFieldHandle);
  smokeEquatableNestedequatablestructReleaseFfiHandleNullable(_structFieldHandle);
  smokeEquatableSomeenumReleaseFfiHandleNullable(_enumFieldHandle);
  foobarListofStringReleaseFfiHandleNullable(_arrayFieldHandle);
  foobarMapofIntToStringReleaseFfiHandleNullable(_mapFieldHandle);
  return _result;
}

Equatable_EquatableNullableStruct smokeEquatableEquatablenullablestructFromFfi(Pointer<Void> handle) {
  final _boolFieldHandle = _smokeEquatableEquatablenullablestructGetFieldboolField(handle);
  final _intFieldHandle = _smokeEquatableEquatablenullablestructGetFieldintField(handle);
  final _uintFieldHandle = _smokeEquatableEquatablenullablestructGetFielduintField(handle);
  final _floatFieldHandle = _smokeEquatableEquatablenullablestructGetFieldfloatField(handle);
  final _stringFieldHandle = _smokeEquatableEquatablenullablestructGetFieldstringField(handle);
  final _structFieldHandle = _smokeEquatableEquatablenullablestructGetFieldstructField(handle);
  final _enumFieldHandle = _smokeEquatableEquatablenullablestructGetFieldenumField(handle);
  final _arrayFieldHandle = _smokeEquatableEquatablenullablestructGetFieldarrayField(handle);
  final _mapFieldHandle = _smokeEquatableEquatablenullablestructGetFieldmapField(handle);
  try {
    return Equatable_EquatableNullableStruct._(
      booleanFromFfiNullable(_boolFieldHandle), 
      intFromFfiNullable(_intFieldHandle), 
      uShortFromFfiNullable(_uintFieldHandle), 
      floatFromFfiNullable(_floatFieldHandle), 
      stringFromFfiNullable(_stringFieldHandle), 
      smokeEquatableNestedequatablestructFromFfiNullable(_structFieldHandle), 
      smokeEquatableSomeenumFromFfiNullable(_enumFieldHandle), 
      foobarListofStringFromFfiNullable(_arrayFieldHandle), 
      foobarMapofIntToStringFromFfiNullable(_mapFieldHandle)
    );
  } finally {
    booleanReleaseFfiHandleNullable(_boolFieldHandle);
    intReleaseFfiHandleNullable(_intFieldHandle);
    uShortReleaseFfiHandleNullable(_uintFieldHandle);
    floatReleaseFfiHandleNullable(_floatFieldHandle);
    stringReleaseFfiHandleNullable(_stringFieldHandle);
    smokeEquatableNestedequatablestructReleaseFfiHandleNullable(_structFieldHandle);
    smokeEquatableSomeenumReleaseFfiHandleNullable(_enumFieldHandle);
    foobarListofStringReleaseFfiHandleNullable(_arrayFieldHandle);
    foobarMapofIntToStringReleaseFfiHandleNullable(_mapFieldHandle);
  }
}

void smokeEquatableEquatablenullablestructReleaseFfiHandle(Pointer<Void> handle) => _smokeEquatableEquatablenullablestructReleaseHandle(handle);

// Nullable Equatable_EquatableNullableStruct

final _smokeEquatableEquatablenullablestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_create_handle_nullable'));
final _smokeEquatableEquatablenullablestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_release_handle_nullable'));
final _smokeEquatableEquatablenullablestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_EquatableNullableStruct_get_value_nullable'));

Pointer<Void> smokeEquatableEquatablenullablestructToFfiNullable(Equatable_EquatableNullableStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEquatableEquatablenullablestructToFfi(value);
  final result = _smokeEquatableEquatablenullablestructCreateHandleNullable(_handle);
  smokeEquatableEquatablenullablestructReleaseFfiHandle(_handle);
  return result;
}

Equatable_EquatableNullableStruct? smokeEquatableEquatablenullablestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEquatableEquatablenullablestructGetValueNullable(handle);
  final result = smokeEquatableEquatablenullablestructFromFfi(_handle);
  smokeEquatableEquatablenullablestructReleaseFfiHandle(_handle);
  return result;
}

void smokeEquatableEquatablenullablestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEquatableEquatablenullablestructReleaseHandleNullable(handle);

// End of Equatable_EquatableNullableStruct "private" section.

class Equatable_NestedEquatableStruct {
  String fooField;

  Equatable_NestedEquatableStruct(this.fooField);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Equatable_NestedEquatableStruct) return false;
    Equatable_NestedEquatableStruct _other = other;
    return fooField == _other.fooField;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + fooField.hashCode;
    return result;
  }
}


// Equatable_NestedEquatableStruct "private" section, not exported.

final _smokeEquatableNestedequatablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_create_handle'));
final _smokeEquatableNestedequatablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_release_handle'));
final _smokeEquatableNestedequatablestructGetFieldfooField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_get_field_fooField'));



Pointer<Void> smokeEquatableNestedequatablestructToFfi(Equatable_NestedEquatableStruct value) {
  final _fooFieldHandle = stringToFfi(value.fooField);
  final _result = _smokeEquatableNestedequatablestructCreateHandle(_fooFieldHandle);
  stringReleaseFfiHandle(_fooFieldHandle);
  return _result;
}

Equatable_NestedEquatableStruct smokeEquatableNestedequatablestructFromFfi(Pointer<Void> handle) {
  final _fooFieldHandle = _smokeEquatableNestedequatablestructGetFieldfooField(handle);
  try {
    return Equatable_NestedEquatableStruct(
      stringFromFfi(_fooFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_fooFieldHandle);
  }
}

void smokeEquatableNestedequatablestructReleaseFfiHandle(Pointer<Void> handle) => _smokeEquatableNestedequatablestructReleaseHandle(handle);

// Nullable Equatable_NestedEquatableStruct

final _smokeEquatableNestedequatablestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_create_handle_nullable'));
final _smokeEquatableNestedequatablestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_release_handle_nullable'));
final _smokeEquatableNestedequatablestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_NestedEquatableStruct_get_value_nullable'));

Pointer<Void> smokeEquatableNestedequatablestructToFfiNullable(Equatable_NestedEquatableStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEquatableNestedequatablestructToFfi(value);
  final result = _smokeEquatableNestedequatablestructCreateHandleNullable(_handle);
  smokeEquatableNestedequatablestructReleaseFfiHandle(_handle);
  return result;
}

Equatable_NestedEquatableStruct? smokeEquatableNestedequatablestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEquatableNestedequatablestructGetValueNullable(handle);
  final result = smokeEquatableNestedequatablestructFromFfi(_handle);
  smokeEquatableNestedequatablestructReleaseFfiHandle(_handle);
  return result;
}

void smokeEquatableNestedequatablestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEquatableNestedequatablestructReleaseHandleNullable(handle);

// End of Equatable_NestedEquatableStruct "private" section.

// Equatable "private" section, not exported.

final _smokeEquatableCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_smoke_Equatable_create_handle'));
final _smokeEquatableReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_release_handle'));



Pointer<Void> smokeEquatableToFfi(Equatable value) {
  final _result = _smokeEquatableCreateHandle();
  return _result;
}

Equatable smokeEquatableFromFfi(Pointer<Void> handle) {
  try {
    return Equatable(
    );
  } finally {
  }
}

void smokeEquatableReleaseFfiHandle(Pointer<Void> handle) => _smokeEquatableReleaseHandle(handle);

// Nullable Equatable

final _smokeEquatableCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_create_handle_nullable'));
final _smokeEquatableReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Equatable_release_handle_nullable'));
final _smokeEquatableGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Equatable_get_value_nullable'));

Pointer<Void> smokeEquatableToFfiNullable(Equatable? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEquatableToFfi(value);
  final result = _smokeEquatableCreateHandleNullable(_handle);
  smokeEquatableReleaseFfiHandle(_handle);
  return result;
}

Equatable? smokeEquatableFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEquatableGetValueNullable(handle);
  final result = smokeEquatableFromFfi(_handle);
  smokeEquatableReleaseFfiHandle(_handle);
  return result;
}

void smokeEquatableReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEquatableReleaseHandleNullable(handle);

// End of Equatable "private" section.


