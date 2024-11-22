

import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/smoke/immutable_struct_with_defaults.dart';


class PosDefaultStructWithFieldUsingImmutableStruct {
  ImmutableStructWithDefaults someField1;

  PosDefaultStructWithFieldUsingImmutableStruct([ImmutableStructWithDefaults someField1 = ImmutableStructWithDefaults.withDefaults()])
    : someField1 = someField1;
}


// PosDefaultStructWithFieldUsingImmutableStruct "private" section, not exported.

final _smokePosdefaultstructwithfieldusingimmutablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithFieldUsingImmutableStruct_create_handle'));
final _smokePosdefaultstructwithfieldusingimmutablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithFieldUsingImmutableStruct_release_handle'));
final _smokePosdefaultstructwithfieldusingimmutablestructGetFieldsomeField1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithFieldUsingImmutableStruct_get_field_someField1'));



Pointer<Void> smokePosdefaultstructwithfieldusingimmutablestructToFfi(PosDefaultStructWithFieldUsingImmutableStruct value) {
  final _someField1Handle = smokeImmutablestructwithdefaultsToFfi(value.someField1);
  final _result = _smokePosdefaultstructwithfieldusingimmutablestructCreateHandle(_someField1Handle);
  smokeImmutablestructwithdefaultsReleaseFfiHandle(_someField1Handle);
  return _result;
}

PosDefaultStructWithFieldUsingImmutableStruct smokePosdefaultstructwithfieldusingimmutablestructFromFfi(Pointer<Void> handle) {
  final _someField1Handle = _smokePosdefaultstructwithfieldusingimmutablestructGetFieldsomeField1(handle);
  try {
    return PosDefaultStructWithFieldUsingImmutableStruct(
      smokeImmutablestructwithdefaultsFromFfi(_someField1Handle)
    );
  } finally {
    smokeImmutablestructwithdefaultsReleaseFfiHandle(_someField1Handle);
  }
}

void smokePosdefaultstructwithfieldusingimmutablestructReleaseFfiHandle(Pointer<Void> handle) => _smokePosdefaultstructwithfieldusingimmutablestructReleaseHandle(handle);

// Nullable PosDefaultStructWithFieldUsingImmutableStruct

final _smokePosdefaultstructwithfieldusingimmutablestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithFieldUsingImmutableStruct_create_handle_nullable'));
final _smokePosdefaultstructwithfieldusingimmutablestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithFieldUsingImmutableStruct_release_handle_nullable'));
final _smokePosdefaultstructwithfieldusingimmutablestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PosDefaultStructWithFieldUsingImmutableStruct_get_value_nullable'));

Pointer<Void> smokePosdefaultstructwithfieldusingimmutablestructToFfiNullable(PosDefaultStructWithFieldUsingImmutableStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePosdefaultstructwithfieldusingimmutablestructToFfi(value);
  final result = _smokePosdefaultstructwithfieldusingimmutablestructCreateHandleNullable(_handle);
  smokePosdefaultstructwithfieldusingimmutablestructReleaseFfiHandle(_handle);
  return result;
}

PosDefaultStructWithFieldUsingImmutableStruct? smokePosdefaultstructwithfieldusingimmutablestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePosdefaultstructwithfieldusingimmutablestructGetValueNullable(handle);
  final result = smokePosdefaultstructwithfieldusingimmutablestructFromFfi(_handle);
  smokePosdefaultstructwithfieldusingimmutablestructReleaseFfiHandle(_handle);
  return result;
}

void smokePosdefaultstructwithfieldusingimmutablestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePosdefaultstructwithfieldusingimmutablestructReleaseHandleNullable(handle);

// End of PosDefaultStructWithFieldUsingImmutableStruct "private" section.


