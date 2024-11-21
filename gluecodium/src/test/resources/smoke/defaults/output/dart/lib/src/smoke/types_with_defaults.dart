

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:meta/meta.dart';


class TypesWithDefaults {
}


class TypesWithDefaults_StructWithDefaults {
  int intField;

  int uintField;

  double floatField;

  double doubleField;

  bool boolField;

  String stringField;

  TypesWithDefaults_StructWithDefaults._(this.intField, this.uintField, this.floatField, this.doubleField, this.boolField, this.stringField);
  TypesWithDefaults_StructWithDefaults()
    : intField = 42, uintField = 4294967295, floatField = 3.14, doubleField = -1.4142, boolField = true, stringField = "\\Jonny \"Magic\" Smith\n";
}


// TypesWithDefaults_StructWithDefaults "private" section, not exported.

final _smokeTypeswithdefaultsStructwithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Double, Uint8, Pointer<Void>),
    Pointer<Void> Function(int, int, double, double, int, Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_create_handle'));
final _smokeTypeswithdefaultsStructwithdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_release_handle'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_intField'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFielduintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_uintField'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_floatField'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFielddoubleField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_doubleField'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_boolField'));
final _smokeTypeswithdefaultsStructwithdefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_field_stringField'));



Pointer<Void> smokeTypeswithdefaultsStructwithdefaultsToFfi(TypesWithDefaults_StructWithDefaults value) {
  final _intFieldHandle = (value.intField);
  final _uintFieldHandle = (value.uintField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeTypeswithdefaultsStructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _doubleFieldHandle, _boolFieldHandle, _stringFieldHandle);
  
  
  
  
  booleanReleaseFfiHandle(_boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}

TypesWithDefaults_StructWithDefaults smokeTypeswithdefaultsStructwithdefaultsFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldintField(handle);
  final _uintFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFielduintField(handle);
  final _floatFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldfloatField(handle);
  final _doubleFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFielddoubleField(handle);
  final _boolFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeTypeswithdefaultsStructwithdefaultsGetFieldstringField(handle);
  try {
    return TypesWithDefaults_StructWithDefaults._(
      (_intFieldHandle), 
      (_uintFieldHandle), 
      (_floatFieldHandle), 
      (_doubleFieldHandle), 
      booleanFromFfi(_boolFieldHandle), 
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    
    
    
    
    booleanReleaseFfiHandle(_boolFieldHandle);
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}

void smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsStructwithdefaultsReleaseHandle(handle);

// Nullable TypesWithDefaults_StructWithDefaults

final _smokeTypeswithdefaultsStructwithdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_create_handle_nullable'));
final _smokeTypeswithdefaultsStructwithdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_release_handle_nullable'));
final _smokeTypeswithdefaultsStructwithdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_StructWithDefaults_get_value_nullable'));

Pointer<Void> smokeTypeswithdefaultsStructwithdefaultsToFfiNullable(TypesWithDefaults_StructWithDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsStructwithdefaultsToFfi(value);
  final result = _smokeTypeswithdefaultsStructwithdefaultsCreateHandleNullable(_handle);
  smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}

TypesWithDefaults_StructWithDefaults? smokeTypeswithdefaultsStructwithdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsStructwithdefaultsGetValueNullable(handle);
  final result = smokeTypeswithdefaultsStructwithdefaultsFromFfi(_handle);
  smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}

void smokeTypeswithdefaultsStructwithdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsStructwithdefaultsReleaseHandleNullable(handle);

// End of TypesWithDefaults_StructWithDefaults "private" section.
@immutable
class TypesWithDefaults_ImmutableStructWithDefaults {
  final int intField;

  final int uintField;

  final double floatField;

  final double doubleField;

  final bool boolField;

  final String stringField;

  const TypesWithDefaults_ImmutableStructWithDefaults(this.intField, this.uintField, this.floatField, this.doubleField, this.boolField, this.stringField);
  const TypesWithDefaults_ImmutableStructWithDefaults.withDefaults(int uintField, bool boolField)
    : intField = 42, uintField = uintField, floatField = 3.14, doubleField = -1.4142, boolField = boolField, stringField = "\\Jonny \"Magic\" Smith\n";
}


// TypesWithDefaults_ImmutableStructWithDefaults "private" section, not exported.

final _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32, Float, Double, Uint8, Pointer<Void>),
    Pointer<Void> Function(int, int, double, double, int, Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_handle'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_intField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFielduintField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_uintField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldfloatField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_floatField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFielddoubleField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_doubleField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldboolField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_boolField'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_field_stringField'));



Pointer<Void> smokeTypeswithdefaultsImmutablestructwithdefaultsToFfi(TypesWithDefaults_ImmutableStructWithDefaults value) {
  final _intFieldHandle = (value.intField);
  final _uintFieldHandle = (value.uintField);
  final _floatFieldHandle = (value.floatField);
  final _doubleFieldHandle = (value.doubleField);
  final _boolFieldHandle = booleanToFfi(value.boolField);
  final _stringFieldHandle = stringToFfi(value.stringField);
  final _result = _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandle(_intFieldHandle, _uintFieldHandle, _floatFieldHandle, _doubleFieldHandle, _boolFieldHandle, _stringFieldHandle);
  
  
  
  
  booleanReleaseFfiHandle(_boolFieldHandle);
  stringReleaseFfiHandle(_stringFieldHandle);
  return _result;
}

TypesWithDefaults_ImmutableStructWithDefaults smokeTypeswithdefaultsImmutablestructwithdefaultsFromFfi(Pointer<Void> handle) {
  final _intFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldintField(handle);
  final _uintFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFielduintField(handle);
  final _floatFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldfloatField(handle);
  final _doubleFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFielddoubleField(handle);
  final _boolFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldboolField(handle);
  final _stringFieldHandle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetFieldstringField(handle);
  try {
    return TypesWithDefaults_ImmutableStructWithDefaults(
      (_intFieldHandle), 
      (_uintFieldHandle), 
      (_floatFieldHandle), 
      (_doubleFieldHandle), 
      booleanFromFfi(_boolFieldHandle), 
      stringFromFfi(_stringFieldHandle)
    );
  } finally {
    
    
    
    
    booleanReleaseFfiHandle(_boolFieldHandle);
    stringReleaseFfiHandle(_stringFieldHandle);
  }
}

void smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseHandle(handle);

// Nullable TypesWithDefaults_ImmutableStructWithDefaults

final _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_create_handle_nullable'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_release_handle_nullable'));
final _smokeTypeswithdefaultsImmutablestructwithdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithDefaults_get_value_nullable'));

Pointer<Void> smokeTypeswithdefaultsImmutablestructwithdefaultsToFfiNullable(TypesWithDefaults_ImmutableStructWithDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsImmutablestructwithdefaultsToFfi(value);
  final result = _smokeTypeswithdefaultsImmutablestructwithdefaultsCreateHandleNullable(_handle);
  smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}

TypesWithDefaults_ImmutableStructWithDefaults? smokeTypeswithdefaultsImmutablestructwithdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsImmutablestructwithdefaultsGetValueNullable(handle);
  final result = smokeTypeswithdefaultsImmutablestructwithdefaultsFromFfi(_handle);
  smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandle(_handle);
  return result;
}

void smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsImmutablestructwithdefaultsReleaseHandleNullable(handle);

// End of TypesWithDefaults_ImmutableStructWithDefaults "private" section.
@immutable
class TypesWithDefaults_ImmutableStructWithCollections {
  final List<int>? nullableListField;

  final List<int> emptyListField;

  final List<int> valuesListField;

  final Map<int, String>? nullableMapField;

  final Map<int, String> emptyMapField;

  final Map<int, String> valuesMapField;

  final Set<String>? nullableSetField;

  final Set<String> emptySetField;

  final Set<String> valuesSetField;

  const TypesWithDefaults_ImmutableStructWithCollections(this.nullableListField, this.emptyListField, this.valuesListField, this.nullableMapField, this.emptyMapField, this.valuesMapField, this.nullableSetField, this.emptySetField, this.valuesSetField);
  const TypesWithDefaults_ImmutableStructWithCollections.withDefaults()
    : nullableListField = null, emptyListField = const [], valuesListField = const [1, 2, 3], nullableMapField = null, emptyMapField = const {}, valuesMapField = const {9: "baz", 27: "bar"}, nullableSetField = null, emptySetField = const {}, valuesSetField = const {"bar", "baz"};
}


// TypesWithDefaults_ImmutableStructWithCollections "private" section, not exported.

final _smokeTypeswithdefaultsImmutablestructwithcollectionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_create_handle'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_release_handle'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldnullableListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_get_field_nullableListField'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldemptyListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_get_field_emptyListField'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldvaluesListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_get_field_valuesListField'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldnullableMapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_get_field_nullableMapField'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldemptyMapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_get_field_emptyMapField'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldvaluesMapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_get_field_valuesMapField'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldnullableSetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_get_field_nullableSetField'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldemptySetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_get_field_emptySetField'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldvaluesSetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_get_field_valuesSetField'));



Pointer<Void> smokeTypeswithdefaultsImmutablestructwithcollectionsToFfi(TypesWithDefaults_ImmutableStructWithCollections value) {
  final _nullableListFieldHandle = foobarListofIntToFfiNullable(value.nullableListField);
  final _emptyListFieldHandle = foobarListofIntToFfi(value.emptyListField);
  final _valuesListFieldHandle = foobarListofIntToFfi(value.valuesListField);
  final _nullableMapFieldHandle = foobarMapofIntToStringToFfiNullable(value.nullableMapField);
  final _emptyMapFieldHandle = foobarMapofIntToStringToFfi(value.emptyMapField);
  final _valuesMapFieldHandle = foobarMapofIntToStringToFfi(value.valuesMapField);
  final _nullableSetFieldHandle = foobarSetofStringToFfiNullable(value.nullableSetField);
  final _emptySetFieldHandle = foobarSetofStringToFfi(value.emptySetField);
  final _valuesSetFieldHandle = foobarSetofStringToFfi(value.valuesSetField);
  final _result = _smokeTypeswithdefaultsImmutablestructwithcollectionsCreateHandle(_nullableListFieldHandle, _emptyListFieldHandle, _valuesListFieldHandle, _nullableMapFieldHandle, _emptyMapFieldHandle, _valuesMapFieldHandle, _nullableSetFieldHandle, _emptySetFieldHandle, _valuesSetFieldHandle);
  foobarListofIntReleaseFfiHandleNullable(_nullableListFieldHandle);
  foobarListofIntReleaseFfiHandle(_emptyListFieldHandle);
  foobarListofIntReleaseFfiHandle(_valuesListFieldHandle);
  foobarMapofIntToStringReleaseFfiHandleNullable(_nullableMapFieldHandle);
  foobarMapofIntToStringReleaseFfiHandle(_emptyMapFieldHandle);
  foobarMapofIntToStringReleaseFfiHandle(_valuesMapFieldHandle);
  foobarSetofStringReleaseFfiHandleNullable(_nullableSetFieldHandle);
  foobarSetofStringReleaseFfiHandle(_emptySetFieldHandle);
  foobarSetofStringReleaseFfiHandle(_valuesSetFieldHandle);
  return _result;
}

TypesWithDefaults_ImmutableStructWithCollections smokeTypeswithdefaultsImmutablestructwithcollectionsFromFfi(Pointer<Void> handle) {
  final _nullableListFieldHandle = _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldnullableListField(handle);
  final _emptyListFieldHandle = _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldemptyListField(handle);
  final _valuesListFieldHandle = _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldvaluesListField(handle);
  final _nullableMapFieldHandle = _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldnullableMapField(handle);
  final _emptyMapFieldHandle = _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldemptyMapField(handle);
  final _valuesMapFieldHandle = _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldvaluesMapField(handle);
  final _nullableSetFieldHandle = _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldnullableSetField(handle);
  final _emptySetFieldHandle = _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldemptySetField(handle);
  final _valuesSetFieldHandle = _smokeTypeswithdefaultsImmutablestructwithcollectionsGetFieldvaluesSetField(handle);
  try {
    return TypesWithDefaults_ImmutableStructWithCollections(
      foobarListofIntFromFfiNullable(_nullableListFieldHandle), 
      foobarListofIntFromFfi(_emptyListFieldHandle), 
      foobarListofIntFromFfi(_valuesListFieldHandle), 
      foobarMapofIntToStringFromFfiNullable(_nullableMapFieldHandle), 
      foobarMapofIntToStringFromFfi(_emptyMapFieldHandle), 
      foobarMapofIntToStringFromFfi(_valuesMapFieldHandle), 
      foobarSetofStringFromFfiNullable(_nullableSetFieldHandle), 
      foobarSetofStringFromFfi(_emptySetFieldHandle), 
      foobarSetofStringFromFfi(_valuesSetFieldHandle)
    );
  } finally {
    foobarListofIntReleaseFfiHandleNullable(_nullableListFieldHandle);
    foobarListofIntReleaseFfiHandle(_emptyListFieldHandle);
    foobarListofIntReleaseFfiHandle(_valuesListFieldHandle);
    foobarMapofIntToStringReleaseFfiHandleNullable(_nullableMapFieldHandle);
    foobarMapofIntToStringReleaseFfiHandle(_emptyMapFieldHandle);
    foobarMapofIntToStringReleaseFfiHandle(_valuesMapFieldHandle);
    foobarSetofStringReleaseFfiHandleNullable(_nullableSetFieldHandle);
    foobarSetofStringReleaseFfiHandle(_emptySetFieldHandle);
    foobarSetofStringReleaseFfiHandle(_valuesSetFieldHandle);
  }
}

void smokeTypeswithdefaultsImmutablestructwithcollectionsReleaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsImmutablestructwithcollectionsReleaseHandle(handle);

// Nullable TypesWithDefaults_ImmutableStructWithCollections

final _smokeTypeswithdefaultsImmutablestructwithcollectionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_create_handle_nullable'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_release_handle_nullable'));
final _smokeTypeswithdefaultsImmutablestructwithcollectionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithCollections_get_value_nullable'));

Pointer<Void> smokeTypeswithdefaultsImmutablestructwithcollectionsToFfiNullable(TypesWithDefaults_ImmutableStructWithCollections? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsImmutablestructwithcollectionsToFfi(value);
  final result = _smokeTypeswithdefaultsImmutablestructwithcollectionsCreateHandleNullable(_handle);
  smokeTypeswithdefaultsImmutablestructwithcollectionsReleaseFfiHandle(_handle);
  return result;
}

TypesWithDefaults_ImmutableStructWithCollections? smokeTypeswithdefaultsImmutablestructwithcollectionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsImmutablestructwithcollectionsGetValueNullable(handle);
  final result = smokeTypeswithdefaultsImmutablestructwithcollectionsFromFfi(_handle);
  smokeTypeswithdefaultsImmutablestructwithcollectionsReleaseFfiHandle(_handle);
  return result;
}

void smokeTypeswithdefaultsImmutablestructwithcollectionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsImmutablestructwithcollectionsReleaseHandleNullable(handle);

// End of TypesWithDefaults_ImmutableStructWithCollections "private" section.
@immutable
class TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections {
  final List<int>? nullableListField;

  final List<int> emptyListField;

  final List<int> valuesListField;

  final Map<int, String>? nullableMapField;

  final Map<int, String> emptyMapField;

  final Map<int, String> valuesMapField;

  final Set<String>? nullableSetField;

  final Set<String> emptySetField;

  final Set<String> valuesSetField;

  final int someField;

  final int anotherField;

  const TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections(this.nullableListField, this.emptyListField, this.valuesListField, this.nullableMapField, this.emptyMapField, this.valuesMapField, this.nullableSetField, this.emptySetField, this.valuesSetField, this.someField, this.anotherField);
  const TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections.withIntegers(this.someField, this.anotherField)
      : nullableListField = null, emptyListField = const [], valuesListField = const [1, 2, 3], nullableMapField = null, emptyMapField = const {}, valuesMapField = const {9: "baz", 27: "bar"}, nullableSetField = null, emptySetField = const {}, valuesSetField = const {"bar", "baz"};
}


// TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections "private" section, not exported.

final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int32, Int32),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, int)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_create_handle'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_release_handle'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldnullableListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_field_nullableListField'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldemptyListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_field_emptyListField'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldvaluesListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_field_valuesListField'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldnullableMapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_field_nullableMapField'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldemptyMapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_field_emptyMapField'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldvaluesMapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_field_valuesMapField'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldnullableSetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_field_nullableSetField'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldemptySetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_field_emptySetField'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldvaluesSetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_field_valuesSetField'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_field_someField'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldanotherField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_field_anotherField'));



Pointer<Void> smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsToFfi(TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections value) {
  final _nullableListFieldHandle = foobarListofIntToFfiNullable(value.nullableListField);
  final _emptyListFieldHandle = foobarListofIntToFfi(value.emptyListField);
  final _valuesListFieldHandle = foobarListofIntToFfi(value.valuesListField);
  final _nullableMapFieldHandle = foobarMapofIntToStringToFfiNullable(value.nullableMapField);
  final _emptyMapFieldHandle = foobarMapofIntToStringToFfi(value.emptyMapField);
  final _valuesMapFieldHandle = foobarMapofIntToStringToFfi(value.valuesMapField);
  final _nullableSetFieldHandle = foobarSetofStringToFfiNullable(value.nullableSetField);
  final _emptySetFieldHandle = foobarSetofStringToFfi(value.emptySetField);
  final _valuesSetFieldHandle = foobarSetofStringToFfi(value.valuesSetField);
  final _someFieldHandle = (value.someField);
  final _anotherFieldHandle = (value.anotherField);
  final _result = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsCreateHandle(_nullableListFieldHandle, _emptyListFieldHandle, _valuesListFieldHandle, _nullableMapFieldHandle, _emptyMapFieldHandle, _valuesMapFieldHandle, _nullableSetFieldHandle, _emptySetFieldHandle, _valuesSetFieldHandle, _someFieldHandle, _anotherFieldHandle);
  foobarListofIntReleaseFfiHandleNullable(_nullableListFieldHandle);
  foobarListofIntReleaseFfiHandle(_emptyListFieldHandle);
  foobarListofIntReleaseFfiHandle(_valuesListFieldHandle);
  foobarMapofIntToStringReleaseFfiHandleNullable(_nullableMapFieldHandle);
  foobarMapofIntToStringReleaseFfiHandle(_emptyMapFieldHandle);
  foobarMapofIntToStringReleaseFfiHandle(_valuesMapFieldHandle);
  foobarSetofStringReleaseFfiHandleNullable(_nullableSetFieldHandle);
  foobarSetofStringReleaseFfiHandle(_emptySetFieldHandle);
  foobarSetofStringReleaseFfiHandle(_valuesSetFieldHandle);
  
  
  return _result;
}

TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsFromFfi(Pointer<Void> handle) {
  final _nullableListFieldHandle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldnullableListField(handle);
  final _emptyListFieldHandle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldemptyListField(handle);
  final _valuesListFieldHandle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldvaluesListField(handle);
  final _nullableMapFieldHandle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldnullableMapField(handle);
  final _emptyMapFieldHandle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldemptyMapField(handle);
  final _valuesMapFieldHandle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldvaluesMapField(handle);
  final _nullableSetFieldHandle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldnullableSetField(handle);
  final _emptySetFieldHandle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldemptySetField(handle);
  final _valuesSetFieldHandle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldvaluesSetField(handle);
  final _someFieldHandle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldsomeField(handle);
  final _anotherFieldHandle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetFieldanotherField(handle);
  try {
    return TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections(
      foobarListofIntFromFfiNullable(_nullableListFieldHandle), 
      foobarListofIntFromFfi(_emptyListFieldHandle), 
      foobarListofIntFromFfi(_valuesListFieldHandle), 
      foobarMapofIntToStringFromFfiNullable(_nullableMapFieldHandle), 
      foobarMapofIntToStringFromFfi(_emptyMapFieldHandle), 
      foobarMapofIntToStringFromFfi(_valuesMapFieldHandle), 
      foobarSetofStringFromFfiNullable(_nullableSetFieldHandle), 
      foobarSetofStringFromFfi(_emptySetFieldHandle), 
      foobarSetofStringFromFfi(_valuesSetFieldHandle), 
      (_someFieldHandle), 
      (_anotherFieldHandle)
    );
  } finally {
    foobarListofIntReleaseFfiHandleNullable(_nullableListFieldHandle);
    foobarListofIntReleaseFfiHandle(_emptyListFieldHandle);
    foobarListofIntReleaseFfiHandle(_valuesListFieldHandle);
    foobarMapofIntToStringReleaseFfiHandleNullable(_nullableMapFieldHandle);
    foobarMapofIntToStringReleaseFfiHandle(_emptyMapFieldHandle);
    foobarMapofIntToStringReleaseFfiHandle(_valuesMapFieldHandle);
    foobarSetofStringReleaseFfiHandleNullable(_nullableSetFieldHandle);
    foobarSetofStringReleaseFfiHandle(_emptySetFieldHandle);
    foobarSetofStringReleaseFfiHandle(_valuesSetFieldHandle);
    
    
  }
}

void smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsReleaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsReleaseHandle(handle);

// Nullable TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections

final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_create_handle_nullable'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_release_handle_nullable'));
final _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections_get_value_nullable'));

Pointer<Void> smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsToFfiNullable(TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsToFfi(value);
  final result = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsCreateHandleNullable(_handle);
  smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsReleaseFfiHandle(_handle);
  return result;
}

TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections? smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsGetValueNullable(handle);
  final result = smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsFromFfi(_handle);
  smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsReleaseFfiHandle(_handle);
  return result;
}

void smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsImmutablestructwithfieldconstructorandcollectionsReleaseHandleNullable(handle);

// End of TypesWithDefaults_ImmutableStructWithFieldConstructorAndCollections "private" section.

// TypesWithDefaults "private" section, not exported.

final _smokeTypeswithdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_smoke_TypesWithDefaults_create_handle'));
final _smokeTypeswithdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_release_handle'));



Pointer<Void> smokeTypeswithdefaultsToFfi(TypesWithDefaults value) {
  final _result = _smokeTypeswithdefaultsCreateHandle();
  return _result;
}

TypesWithDefaults smokeTypeswithdefaultsFromFfi(Pointer<Void> handle) {
  try {
    return TypesWithDefaults(
    );
  } finally {
  }
}

void smokeTypeswithdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeTypeswithdefaultsReleaseHandle(handle);

// Nullable TypesWithDefaults

final _smokeTypeswithdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_create_handle_nullable'));
final _smokeTypeswithdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_release_handle_nullable'));
final _smokeTypeswithdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_TypesWithDefaults_get_value_nullable'));

Pointer<Void> smokeTypeswithdefaultsToFfiNullable(TypesWithDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeTypeswithdefaultsToFfi(value);
  final result = _smokeTypeswithdefaultsCreateHandleNullable(_handle);
  smokeTypeswithdefaultsReleaseFfiHandle(_handle);
  return result;
}

TypesWithDefaults? smokeTypeswithdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeTypeswithdefaultsGetValueNullable(handle);
  final result = smokeTypeswithdefaultsFromFfi(_handle);
  smokeTypeswithdefaultsReleaseFfiHandle(_handle);
  return result;
}

void smokeTypeswithdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeTypeswithdefaultsReleaseHandleNullable(handle);

// End of TypesWithDefaults "private" section.


