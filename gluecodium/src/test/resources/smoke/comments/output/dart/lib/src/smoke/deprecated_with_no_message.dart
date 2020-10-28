import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@Deprecated("")
class DeprecatedWithNoMessage {
  String field;
  DeprecatedWithNoMessage(this.field);
}
// DeprecatedWithNoMessage "private" section, not exported.
final _smoke_DeprecatedWithNoMessage_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_create_handle'));
final _smoke_DeprecatedWithNoMessage_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_release_handle'));
final _smoke_DeprecatedWithNoMessage_get_field_field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_get_field_field'));
Pointer<Void> smoke_DeprecatedWithNoMessage_toFfi(DeprecatedWithNoMessage value) {
  final _field_handle = String_toFfi(value.field);
  final _result = _smoke_DeprecatedWithNoMessage_create_handle(_field_handle);
  String_releaseFfiHandle(_field_handle);
  return _result;
}
DeprecatedWithNoMessage smoke_DeprecatedWithNoMessage_fromFfi(Pointer<Void> handle) {
  final _field_handle = _smoke_DeprecatedWithNoMessage_get_field_field(handle);
  try {
    return DeprecatedWithNoMessage(
      String_fromFfi(_field_handle)
    );
  } finally {
    String_releaseFfiHandle(_field_handle);
  }
}
void smoke_DeprecatedWithNoMessage_releaseFfiHandle(Pointer<Void> handle) => _smoke_DeprecatedWithNoMessage_release_handle(handle);
// Nullable DeprecatedWithNoMessage
final _smoke_DeprecatedWithNoMessage_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_create_handle_nullable'));
final _smoke_DeprecatedWithNoMessage_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_release_handle_nullable'));
final _smoke_DeprecatedWithNoMessage_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DeprecatedWithNoMessage_get_value_nullable'));
Pointer<Void> smoke_DeprecatedWithNoMessage_toFfi_nullable(DeprecatedWithNoMessage value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DeprecatedWithNoMessage_toFfi(value);
  final result = _smoke_DeprecatedWithNoMessage_create_handle_nullable(_handle);
  smoke_DeprecatedWithNoMessage_releaseFfiHandle(_handle);
  return result;
}
DeprecatedWithNoMessage smoke_DeprecatedWithNoMessage_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DeprecatedWithNoMessage_get_value_nullable(handle);
  final result = smoke_DeprecatedWithNoMessage_fromFfi(_handle);
  smoke_DeprecatedWithNoMessage_releaseFfiHandle(_handle);
  return result;
}
void smoke_DeprecatedWithNoMessage_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DeprecatedWithNoMessage_release_handle_nullable(handle);
// End of DeprecatedWithNoMessage "private" section.
