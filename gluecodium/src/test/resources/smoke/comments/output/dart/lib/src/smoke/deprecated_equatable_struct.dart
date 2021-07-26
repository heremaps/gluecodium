import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
@Deprecated("Unfortunately, this struct is deprecated. Use [Comments_SomeStruct] instead.")
class DeprecatedEquatableStruct {
  @Deprecated("Unfortunately, this field is deprecated.\nUse [Comments_SomeStruct.someField] instead.")
  String someField;
  DeprecatedEquatableStruct(this.someField);
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! DeprecatedEquatableStruct) return false;
    DeprecatedEquatableStruct _other = other;
    // ignore: deprecated_member_use_from_same_package
    return someField == _other.someField;
  }
  @override
  int get hashCode {
    int result = 7;
    // ignore: deprecated_member_use_from_same_package
    result = 31 * result + someField.hashCode;
    return result;
  }
}
// DeprecatedEquatableStruct "private" section, not exported.
final _smokeDeprecatedequatablestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedEquatableStruct_create_handle'));
final _smokeDeprecatedequatablestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecatedEquatableStruct_release_handle'));
final _smokeDeprecatedequatablestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedEquatableStruct_get_field_someField'));
// ignore: deprecated_member_use_from_same_package
Pointer<Void> smokeDeprecatedequatablestructToFfi(DeprecatedEquatableStruct value) {
  // ignore: deprecated_member_use_from_same_package
  final _someFieldHandle = stringToFfi(value.someField);
  final _result = _smokeDeprecatedequatablestructCreateHandle(_someFieldHandle);
  stringReleaseFfiHandle(_someFieldHandle);
  return _result;
}
// ignore: deprecated_member_use_from_same_package
DeprecatedEquatableStruct smokeDeprecatedequatablestructFromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeDeprecatedequatablestructGetFieldsomeField(handle);
  try {
    // ignore: deprecated_member_use_from_same_package
    return DeprecatedEquatableStruct(
      stringFromFfi(_someFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_someFieldHandle);
  }
}
void smokeDeprecatedequatablestructReleaseFfiHandle(Pointer<Void> handle) => _smokeDeprecatedequatablestructReleaseHandle(handle);
// Nullable DeprecatedEquatableStruct
final _smokeDeprecatedequatablestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedEquatableStruct_create_handle_nullable'));
final _smokeDeprecatedequatablestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecatedEquatableStruct_release_handle_nullable'));
final _smokeDeprecatedequatablestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedEquatableStruct_get_value_nullable'));
// ignore: deprecated_member_use_from_same_package
Pointer<Void> smokeDeprecatedequatablestructToFfiNullable(DeprecatedEquatableStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDeprecatedequatablestructToFfi(value);
  final result = _smokeDeprecatedequatablestructCreateHandleNullable(_handle);
  smokeDeprecatedequatablestructReleaseFfiHandle(_handle);
  return result;
}
// ignore: deprecated_member_use_from_same_package
DeprecatedEquatableStruct? smokeDeprecatedequatablestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDeprecatedequatablestructGetValueNullable(handle);
  final result = smokeDeprecatedequatablestructFromFfi(_handle);
  smokeDeprecatedequatablestructReleaseFfiHandle(_handle);
  return result;
}
void smokeDeprecatedequatablestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecatedequatablestructReleaseHandleNullable(handle);
// End of DeprecatedEquatableStruct "private" section.
