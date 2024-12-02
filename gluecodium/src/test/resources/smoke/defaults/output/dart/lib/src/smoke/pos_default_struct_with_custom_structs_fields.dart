

import 'dart:ffi';
import 'dart:typed_data';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/immutable_struct_with_defaults.dart';
import 'package:library/src/smoke/pos_default_struct_with_field_using_immutable_struct.dart';
import 'package:library/src/smoke/some_mutable_custom_struct_with_defaults.dart';
import 'package:library/src/smoke/struct_with_all_defaults.dart';
import 'package:library/src/smoke/struct_with_nullable_collection_defaults.dart';


class PosDefaultStructWithCustomStructsFields {
  ImmutableStructWithDefaults constCtorField0;

  ImmutableStructWithDefaults? constCtorField1;

  List<String> constCtorField2;

  Map<String, String>? constCtorField3;

  int constCtorField4;

  double constCtorField5;

  ImmutableStructWithDefaults? constCtorField6;

  ImmutableStructWithDefaults? constCtorField7;

  StructWithAllDefaults nonConstCtorField0;

  PosDefaultStructWithFieldUsingImmutableStruct nonConstCtorField1;

  SomeMutableCustomStructWithDefaults nonConstCtorField2;

  StructWithNullableCollectionDefaults nonConstCtorField3;

  StructWithAllDefaults? nonConstCtorField4;

  Uint8List nonConstCtorField5;

  Uint8List nonConstCtorField6;

  Uint8List? nonConstCtorField7;

  PosDefaultStructWithCustomStructsFields([ImmutableStructWithDefaults constCtorField0 = const ImmutableStructWithDefaults.withDefaults(), ImmutableStructWithDefaults? constCtorField1 = const ImmutableStructWithDefaults.withDefaults(), List<String> constCtorField2 = const ["abc", "def", "ghi"], Map<String, String>? constCtorField3 = null, int constCtorField4 = 77, double constCtorField5 = 77.77, ImmutableStructWithDefaults? constCtorField6 = const ImmutableStructWithDefaults.withDefaults(), ImmutableStructWithDefaults? constCtorField7 = null, StructWithAllDefaults? nonConstCtorField0 = null, PosDefaultStructWithFieldUsingImmutableStruct? nonConstCtorField1 = null, SomeMutableCustomStructWithDefaults? nonConstCtorField2 = null, StructWithNullableCollectionDefaults? nonConstCtorField3 = null, StructWithAllDefaults? nonConstCtorField4 = null, Uint8List? nonConstCtorField5 = null, Uint8List? nonConstCtorField6 = null, Uint8List? nonConstCtorField7 = null])
    : constCtorField0 = constCtorField0, constCtorField1 = constCtorField1, constCtorField2 = constCtorField2, constCtorField3 = constCtorField3, constCtorField4 = constCtorField4, constCtorField5 = constCtorField5, constCtorField6 = constCtorField6, constCtorField7 = constCtorField7, nonConstCtorField0 = nonConstCtorField0 ?? StructWithAllDefaults(), nonConstCtorField1 = nonConstCtorField1 ?? PosDefaultStructWithFieldUsingImmutableStruct(), nonConstCtorField2 = nonConstCtorField2 ?? SomeMutableCustomStructWithDefaults(), nonConstCtorField3 = nonConstCtorField3 ?? StructWithNullableCollectionDefaults(), nonConstCtorField4 = nonConstCtorField4 ?? null, nonConstCtorField5 = nonConstCtorField5 ?? Uint8List.fromList([]), nonConstCtorField6 = nonConstCtorField6 ?? Uint8List.fromList([222, 173, 190, 239]), nonConstCtorField7 = nonConstCtorField7 ?? null;
}


// PosDefaultStructWithCustomStructsFields "private" section, not exported.

final _smokePosdefaultstructwithcustomstructsfieldsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int32, Double, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, double, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_create_handle'));
final _smokePosdefaultstructwithcustomstructsfieldsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_release_handle'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField0 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_constCtorField0'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_constCtorField1'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField2 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_constCtorField2'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField3 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_constCtorField3'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField4 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_constCtorField4'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField5 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_constCtorField5'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField6 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_constCtorField6'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField7 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_constCtorField7'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField0 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_nonConstCtorField0'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_nonConstCtorField1'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField2 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_nonConstCtorField2'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField3 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_nonConstCtorField3'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField4 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_nonConstCtorField4'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField5 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_nonConstCtorField5'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField6 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_nonConstCtorField6'));
final _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField7 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_field_nonConstCtorField7'));



Pointer<Void> smokePosdefaultstructwithcustomstructsfieldsToFfi(PosDefaultStructWithCustomStructsFields value) {
  final _constCtorField0Handle = smokeImmutablestructwithdefaultsToFfi(value.constCtorField0);
  final _constCtorField1Handle = smokeImmutablestructwithdefaultsToFfiNullable(value.constCtorField1);
  final _constCtorField2Handle = foobarListofStringToFfi(value.constCtorField2);
  final _constCtorField3Handle = foobarMapofStringToStringToFfiNullable(value.constCtorField3);
  final _constCtorField4Handle = (value.constCtorField4);
  final _constCtorField5Handle = (value.constCtorField5);
  final _constCtorField6Handle = smokeImmutablestructwithdefaultsToFfiNullable(value.constCtorField6);
  final _constCtorField7Handle = smokeImmutablestructwithdefaultsToFfiNullable(value.constCtorField7);
  final _nonConstCtorField0Handle = smokeStructwithalldefaultsToFfi(value.nonConstCtorField0);
  final _nonConstCtorField1Handle = smokePosdefaultstructwithfieldusingimmutablestructToFfi(value.nonConstCtorField1);
  final _nonConstCtorField2Handle = smokeSomemutablecustomstructwithdefaultsToFfi(value.nonConstCtorField2);
  final _nonConstCtorField3Handle = smokeStructwithnullablecollectiondefaultsToFfi(value.nonConstCtorField3);
  final _nonConstCtorField4Handle = smokeStructwithalldefaultsToFfiNullable(value.nonConstCtorField4);
  final _nonConstCtorField5Handle = blobToFfi(value.nonConstCtorField5);
  final _nonConstCtorField6Handle = blobToFfi(value.nonConstCtorField6);
  final _nonConstCtorField7Handle = blobToFfiNullable(value.nonConstCtorField7);
  final _result = _smokePosdefaultstructwithcustomstructsfieldsCreateHandle(_constCtorField0Handle, _constCtorField1Handle, _constCtorField2Handle, _constCtorField3Handle, _constCtorField4Handle, _constCtorField5Handle, _constCtorField6Handle, _constCtorField7Handle, _nonConstCtorField0Handle, _nonConstCtorField1Handle, _nonConstCtorField2Handle, _nonConstCtorField3Handle, _nonConstCtorField4Handle, _nonConstCtorField5Handle, _nonConstCtorField6Handle, _nonConstCtorField7Handle);
  smokeImmutablestructwithdefaultsReleaseFfiHandle(_constCtorField0Handle);
  smokeImmutablestructwithdefaultsReleaseFfiHandleNullable(_constCtorField1Handle);
  foobarListofStringReleaseFfiHandle(_constCtorField2Handle);
  foobarMapofStringToStringReleaseFfiHandleNullable(_constCtorField3Handle);
  
  
  smokeImmutablestructwithdefaultsReleaseFfiHandleNullable(_constCtorField6Handle);
  smokeImmutablestructwithdefaultsReleaseFfiHandleNullable(_constCtorField7Handle);
  smokeStructwithalldefaultsReleaseFfiHandle(_nonConstCtorField0Handle);
  smokePosdefaultstructwithfieldusingimmutablestructReleaseFfiHandle(_nonConstCtorField1Handle);
  smokeSomemutablecustomstructwithdefaultsReleaseFfiHandle(_nonConstCtorField2Handle);
  smokeStructwithnullablecollectiondefaultsReleaseFfiHandle(_nonConstCtorField3Handle);
  smokeStructwithalldefaultsReleaseFfiHandleNullable(_nonConstCtorField4Handle);
  blobReleaseFfiHandle(_nonConstCtorField5Handle);
  blobReleaseFfiHandle(_nonConstCtorField6Handle);
  blobReleaseFfiHandleNullable(_nonConstCtorField7Handle);
  return _result;
}

PosDefaultStructWithCustomStructsFields smokePosdefaultstructwithcustomstructsfieldsFromFfi(Pointer<Void> handle) {
  final _constCtorField0Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField0(handle);
  final _constCtorField1Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField1(handle);
  final _constCtorField2Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField2(handle);
  final _constCtorField3Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField3(handle);
  final _constCtorField4Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField4(handle);
  final _constCtorField5Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField5(handle);
  final _constCtorField6Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField6(handle);
  final _constCtorField7Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldconstCtorField7(handle);
  final _nonConstCtorField0Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField0(handle);
  final _nonConstCtorField1Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField1(handle);
  final _nonConstCtorField2Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField2(handle);
  final _nonConstCtorField3Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField3(handle);
  final _nonConstCtorField4Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField4(handle);
  final _nonConstCtorField5Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField5(handle);
  final _nonConstCtorField6Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField6(handle);
  final _nonConstCtorField7Handle = _smokePosdefaultstructwithcustomstructsfieldsGetFieldnonConstCtorField7(handle);
  try {
    return PosDefaultStructWithCustomStructsFields(
      smokeImmutablestructwithdefaultsFromFfi(_constCtorField0Handle), 
      smokeImmutablestructwithdefaultsFromFfiNullable(_constCtorField1Handle), 
      foobarListofStringFromFfi(_constCtorField2Handle), 
      foobarMapofStringToStringFromFfiNullable(_constCtorField3Handle), 
      (_constCtorField4Handle), 
      (_constCtorField5Handle), 
      smokeImmutablestructwithdefaultsFromFfiNullable(_constCtorField6Handle), 
      smokeImmutablestructwithdefaultsFromFfiNullable(_constCtorField7Handle), 
      smokeStructwithalldefaultsFromFfi(_nonConstCtorField0Handle), 
      smokePosdefaultstructwithfieldusingimmutablestructFromFfi(_nonConstCtorField1Handle), 
      smokeSomemutablecustomstructwithdefaultsFromFfi(_nonConstCtorField2Handle), 
      smokeStructwithnullablecollectiondefaultsFromFfi(_nonConstCtorField3Handle), 
      smokeStructwithalldefaultsFromFfiNullable(_nonConstCtorField4Handle), 
      blobFromFfi(_nonConstCtorField5Handle), 
      blobFromFfi(_nonConstCtorField6Handle), 
      blobFromFfiNullable(_nonConstCtorField7Handle)
    );
  } finally {
    smokeImmutablestructwithdefaultsReleaseFfiHandle(_constCtorField0Handle);
    smokeImmutablestructwithdefaultsReleaseFfiHandleNullable(_constCtorField1Handle);
    foobarListofStringReleaseFfiHandle(_constCtorField2Handle);
    foobarMapofStringToStringReleaseFfiHandleNullable(_constCtorField3Handle);
    
    
    smokeImmutablestructwithdefaultsReleaseFfiHandleNullable(_constCtorField6Handle);
    smokeImmutablestructwithdefaultsReleaseFfiHandleNullable(_constCtorField7Handle);
    smokeStructwithalldefaultsReleaseFfiHandle(_nonConstCtorField0Handle);
    smokePosdefaultstructwithfieldusingimmutablestructReleaseFfiHandle(_nonConstCtorField1Handle);
    smokeSomemutablecustomstructwithdefaultsReleaseFfiHandle(_nonConstCtorField2Handle);
    smokeStructwithnullablecollectiondefaultsReleaseFfiHandle(_nonConstCtorField3Handle);
    smokeStructwithalldefaultsReleaseFfiHandleNullable(_nonConstCtorField4Handle);
    blobReleaseFfiHandle(_nonConstCtorField5Handle);
    blobReleaseFfiHandle(_nonConstCtorField6Handle);
    blobReleaseFfiHandleNullable(_nonConstCtorField7Handle);
  }
}

void smokePosdefaultstructwithcustomstructsfieldsReleaseFfiHandle(Pointer<Void> handle) => _smokePosdefaultstructwithcustomstructsfieldsReleaseHandle(handle);

// Nullable PosDefaultStructWithCustomStructsFields

final _smokePosdefaultstructwithcustomstructsfieldsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_create_handle_nullable'));
final _smokePosdefaultstructwithcustomstructsfieldsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_release_handle_nullable'));
final _smokePosdefaultstructwithcustomstructsfieldsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithCustomStructsFields_get_value_nullable'));

Pointer<Void> smokePosdefaultstructwithcustomstructsfieldsToFfiNullable(PosDefaultStructWithCustomStructsFields? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePosdefaultstructwithcustomstructsfieldsToFfi(value);
  final result = _smokePosdefaultstructwithcustomstructsfieldsCreateHandleNullable(_handle);
  smokePosdefaultstructwithcustomstructsfieldsReleaseFfiHandle(_handle);
  return result;
}

PosDefaultStructWithCustomStructsFields? smokePosdefaultstructwithcustomstructsfieldsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePosdefaultstructwithcustomstructsfieldsGetValueNullable(handle);
  final result = smokePosdefaultstructwithcustomstructsfieldsFromFfi(_handle);
  smokePosdefaultstructwithcustomstructsfieldsReleaseFfiHandle(_handle);
  return result;
}

void smokePosdefaultstructwithcustomstructsfieldsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePosdefaultstructwithcustomstructsfieldsReleaseHandleNullable(handle);

// End of PosDefaultStructWithCustomStructsFields "private" section.


