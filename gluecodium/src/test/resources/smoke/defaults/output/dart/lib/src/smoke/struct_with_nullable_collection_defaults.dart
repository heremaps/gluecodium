

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';


class StructWithNullableCollectionDefaults {
  List<String>? nullableListField;

  Map<String, String>? nullableMapField;

  Set<String>? nullableSetField;

  StructWithNullableCollectionDefaults([List<String>? nullableListField = null, Map<String, String>? nullableMapField = null, Set<String>? nullableSetField = null])
    : nullableListField = nullableListField, nullableMapField = nullableMapField, nullableSetField = nullableSetField;
}


// StructWithNullableCollectionDefaults "private" section, not exported.

final _smokeStructwithnullablecollectiondefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_StructWithNullableCollectionDefaults_create_handle'));
final _smokeStructwithnullablecollectiondefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithNullableCollectionDefaults_release_handle'));
final _smokeStructwithnullablecollectiondefaultsGetFieldnullableListField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithNullableCollectionDefaults_get_field_nullableListField'));
final _smokeStructwithnullablecollectiondefaultsGetFieldnullableMapField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithNullableCollectionDefaults_get_field_nullableMapField'));
final _smokeStructwithnullablecollectiondefaultsGetFieldnullableSetField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithNullableCollectionDefaults_get_field_nullableSetField'));



Pointer<Void> smokeStructwithnullablecollectiondefaultsToFfi(StructWithNullableCollectionDefaults value) {
  final _nullableListFieldHandle = foobarListofStringToFfiNullable(value.nullableListField);
  final _nullableMapFieldHandle = foobarMapofStringToStringToFfiNullable(value.nullableMapField);
  final _nullableSetFieldHandle = foobarSetofStringToFfiNullable(value.nullableSetField);
  final _result = _smokeStructwithnullablecollectiondefaultsCreateHandle(_nullableListFieldHandle, _nullableMapFieldHandle, _nullableSetFieldHandle);
  foobarListofStringReleaseFfiHandleNullable(_nullableListFieldHandle);
  foobarMapofStringToStringReleaseFfiHandleNullable(_nullableMapFieldHandle);
  foobarSetofStringReleaseFfiHandleNullable(_nullableSetFieldHandle);
  return _result;
}

StructWithNullableCollectionDefaults smokeStructwithnullablecollectiondefaultsFromFfi(Pointer<Void> handle) {
  final _nullableListFieldHandle = _smokeStructwithnullablecollectiondefaultsGetFieldnullableListField(handle);
  final _nullableMapFieldHandle = _smokeStructwithnullablecollectiondefaultsGetFieldnullableMapField(handle);
  final _nullableSetFieldHandle = _smokeStructwithnullablecollectiondefaultsGetFieldnullableSetField(handle);
  try {
    return StructWithNullableCollectionDefaults(
      foobarListofStringFromFfiNullable(_nullableListFieldHandle), 
      foobarMapofStringToStringFromFfiNullable(_nullableMapFieldHandle), 
      foobarSetofStringFromFfiNullable(_nullableSetFieldHandle)
    );
  } finally {
    foobarListofStringReleaseFfiHandleNullable(_nullableListFieldHandle);
    foobarMapofStringToStringReleaseFfiHandleNullable(_nullableMapFieldHandle);
    foobarSetofStringReleaseFfiHandleNullable(_nullableSetFieldHandle);
  }
}

void smokeStructwithnullablecollectiondefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeStructwithnullablecollectiondefaultsReleaseHandle(handle);

// Nullable StructWithNullableCollectionDefaults

final _smokeStructwithnullablecollectiondefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithNullableCollectionDefaults_create_handle_nullable'));
final _smokeStructwithnullablecollectiondefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithNullableCollectionDefaults_release_handle_nullable'));
final _smokeStructwithnullablecollectiondefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithNullableCollectionDefaults_get_value_nullable'));

Pointer<Void> smokeStructwithnullablecollectiondefaultsToFfiNullable(StructWithNullableCollectionDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeStructwithnullablecollectiondefaultsToFfi(value);
  final result = _smokeStructwithnullablecollectiondefaultsCreateHandleNullable(_handle);
  smokeStructwithnullablecollectiondefaultsReleaseFfiHandle(_handle);
  return result;
}

StructWithNullableCollectionDefaults? smokeStructwithnullablecollectiondefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeStructwithnullablecollectiondefaultsGetValueNullable(handle);
  final result = smokeStructwithnullablecollectiondefaultsFromFfi(_handle);
  smokeStructwithnullablecollectiondefaultsReleaseFfiHandle(_handle);
  return result;
}

void smokeStructwithnullablecollectiondefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeStructwithnullablecollectiondefaultsReleaseHandleNullable(handle);

// End of StructWithNullableCollectionDefaults "private" section.


