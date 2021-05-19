import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@Deprecated("")
class DeprecatedWithNoMessage {
  String field;
  DeprecatedWithNoMessage(this.field);
}
// DeprecatedWithNoMessage "private" section, not exported.
final _smokeDeprecatedwithnomessageCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_create_handle'));
final _smokeDeprecatedwithnomessageReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_release_handle'));
final _smokeDeprecatedwithnomessageGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_get_field_field'));
Pointer<Void> smokeDeprecatedwithnomessageToFfi(DeprecatedWithNoMessage value) {
  final _fieldHandle = stringToFfi(value.field);
  final _result = _smokeDeprecatedwithnomessageCreateHandle(_fieldHandle);
  stringReleaseFfiHandle(_fieldHandle);
  return _result;
}
DeprecatedWithNoMessage smokeDeprecatedwithnomessageFromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeDeprecatedwithnomessageGetFieldfield(handle);
  try {
    return DeprecatedWithNoMessage(
      stringFromFfi(_fieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_fieldHandle);
  }
}
void smokeDeprecatedwithnomessageReleaseFfiHandle(Pointer<Void> handle) => _smokeDeprecatedwithnomessageReleaseHandle(handle);
// Nullable DeprecatedWithNoMessage
final _smokeDeprecatedwithnomessageCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_create_handle_nullable'));
final _smokeDeprecatedwithnomessageReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_release_handle_nullable'));
final _smokeDeprecatedwithnomessageGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_get_value_nullable'));
Pointer<Void> smokeDeprecatedwithnomessageToFfiNullable(DeprecatedWithNoMessage? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDeprecatedwithnomessageToFfi(value);
  final result = _smokeDeprecatedwithnomessageCreateHandleNullable(_handle);
  smokeDeprecatedwithnomessageReleaseFfiHandle(_handle);
  return result;
}
DeprecatedWithNoMessage? smokeDeprecatedwithnomessageFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDeprecatedwithnomessageGetValueNullable(handle);
  final result = smokeDeprecatedwithnomessageFromFfi(_handle);
  smokeDeprecatedwithnomessageReleaseFfiHandle(_handle);
  return result;
}
void smokeDeprecatedwithnomessageReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDeprecatedwithnomessageReleaseHandleNullable(handle);
// End of DeprecatedWithNoMessage "private" section.
