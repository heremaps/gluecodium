import 'dart:ffi';
import 'package:collection/collection.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/smoke/some_skipped_enum.dart';
class SomeSkippedStruct {
  List<SomeSkippedEnum> field;
  SomeSkippedStruct(this.field);
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! SomeSkippedStruct) return false;
    SomeSkippedStruct _other = other;
    return DeepCollectionEquality().equals(field, _other.field);
  }
  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(field);
    return result;
  }
}
// SomeSkippedStruct "private" section, not exported.
final _smokeSomeskippedstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SomeSkippedStruct_create_handle'));
final _smokeSomeskippedstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SomeSkippedStruct_release_handle'));
final _smokeSomeskippedstructGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SomeSkippedStruct_get_field_field'));
Pointer<Void> smokeSomeskippedstructToFfi(SomeSkippedStruct value) {
  final _fieldHandle = listofSmokeSomeskippedenumToFfi(value.field);
  final _result = _smokeSomeskippedstructCreateHandle(_fieldHandle);
  listofSmokeSomeskippedenumReleaseFfiHandle(_fieldHandle);
  return _result;
}
SomeSkippedStruct smokeSomeskippedstructFromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeSomeskippedstructGetFieldfield(handle);
  try {
    return SomeSkippedStruct(
      listofSmokeSomeskippedenumFromFfi(_fieldHandle)
    );
  } finally {
    listofSmokeSomeskippedenumReleaseFfiHandle(_fieldHandle);
  }
}
void smokeSomeskippedstructReleaseFfiHandle(Pointer<Void> handle) => _smokeSomeskippedstructReleaseHandle(handle);
// Nullable SomeSkippedStruct
final _smokeSomeskippedstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SomeSkippedStruct_create_handle_nullable'));
final _smokeSomeskippedstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SomeSkippedStruct_release_handle_nullable'));
final _smokeSomeskippedstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SomeSkippedStruct_get_value_nullable'));
Pointer<Void> smokeSomeskippedstructToFfiNullable(SomeSkippedStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeSomeskippedstructToFfi(value);
  final result = _smokeSomeskippedstructCreateHandleNullable(_handle);
  smokeSomeskippedstructReleaseFfiHandle(_handle);
  return result;
}
SomeSkippedStruct? smokeSomeskippedstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeSomeskippedstructGetValueNullable(handle);
  final result = smokeSomeskippedstructFromFfi(_handle);
  smokeSomeskippedstructReleaseFfiHandle(_handle);
  return result;
}
void smokeSomeskippedstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSomeskippedstructReleaseHandleNullable(handle);
// End of SomeSkippedStruct "private" section.
