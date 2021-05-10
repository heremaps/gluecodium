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
Pointer<Void> smoke_DeprecatedWithNoMessage_toFfi(DeprecatedWithNoMessage value) {
  final _fieldHandle = String_toFfi(value.field);
  final _result = _smokeDeprecatedwithnomessageCreateHandle(_fieldHandle);
  String_releaseFfiHandle(_fieldHandle);
  return _result;
}
DeprecatedWithNoMessage smoke_DeprecatedWithNoMessage_fromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeDeprecatedwithnomessageGetFieldfield(handle);
  try {
    return DeprecatedWithNoMessage(
      String_fromFfi(_fieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_fieldHandle);
  }
}
void smoke_DeprecatedWithNoMessage_releaseFfiHandle(Pointer<Void> handle) => _smokeDeprecatedwithnomessageReleaseHandle(handle);
// Nullable DeprecatedWithNoMessage
final _smoke_DeprecatedWithNoMessageCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_create_handle_nullable'));
final _smoke_DeprecatedWithNoMessageReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_release_handle_nullable'));
final _smoke_DeprecatedWithNoMessageGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_get_value_nullable'));
Pointer<Void> smoke_DeprecatedWithNoMessage_toFfi_nullable(DeprecatedWithNoMessage value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DeprecatedWithNoMessage_toFfi(value);
  final result = _smoke_DeprecatedWithNoMessageCreateHandleNullable(_handle);
  smoke_DeprecatedWithNoMessage_releaseFfiHandle(_handle);
  return result;
}
DeprecatedWithNoMessage smoke_DeprecatedWithNoMessage_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DeprecatedWithNoMessageGetValueNullable(handle);
  final result = smoke_DeprecatedWithNoMessage_fromFfi(_handle);
  smoke_DeprecatedWithNoMessage_releaseFfiHandle(_handle);
  return result;
}
void smoke_DeprecatedWithNoMessage_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecatedWithNoMessageReleaseHandleNullable(handle);
// End of DeprecatedWithNoMessage "private" section.
