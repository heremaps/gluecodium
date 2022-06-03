import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/fire/ambiguous_constants.dart' as fire;
import 'package:library/src/fire/ambiguous_enum.dart' as fire;
import 'package:library/src/fire/some_struct.dart';
class AmbiguousDefaults {
  fire.AmbiguousEnum field1;
  SomeStruct field2;
  AmbiguousDefaults._(this.field1, this.field2);
  AmbiguousDefaults()
    : field1 = fire.AmbiguousEnum.disabled, field2 = fire.AmbiguousConstants.dummy;
}
// AmbiguousDefaults "private" section, not exported.
final _smokeAmbiguousdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('library_smoke_AmbiguousDefaults_create_handle'));
final _smokeAmbiguousdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AmbiguousDefaults_release_handle'));
final _smokeAmbiguousdefaultsGetFieldfield1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_AmbiguousDefaults_get_field_field1'));
final _smokeAmbiguousdefaultsGetFieldfield2 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AmbiguousDefaults_get_field_field2'));
Pointer<Void> smokeAmbiguousdefaultsToFfi(AmbiguousDefaults value) {
  final _field1Handle = fire.fireAmbiguousenumToFfi(value.field1);
  final _field2Handle = fireSomestructToFfi(value.field2);
  final _result = _smokeAmbiguousdefaultsCreateHandle(_field1Handle, _field2Handle);
  fire.fireAmbiguousenumReleaseFfiHandle(_field1Handle);
  fireSomestructReleaseFfiHandle(_field2Handle);
  return _result;
}
AmbiguousDefaults smokeAmbiguousdefaultsFromFfi(Pointer<Void> handle) {
  final _field1Handle = _smokeAmbiguousdefaultsGetFieldfield1(handle);
  final _field2Handle = _smokeAmbiguousdefaultsGetFieldfield2(handle);
  try {
    return AmbiguousDefaults._(
      fire.fireAmbiguousenumFromFfi(_field1Handle),
      fireSomestructFromFfi(_field2Handle)
    );
  } finally {
    fire.fireAmbiguousenumReleaseFfiHandle(_field1Handle);
    fireSomestructReleaseFfiHandle(_field2Handle);
  }
}
void smokeAmbiguousdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeAmbiguousdefaultsReleaseHandle(handle);
// Nullable AmbiguousDefaults
final _smokeAmbiguousdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AmbiguousDefaults_create_handle_nullable'));
final _smokeAmbiguousdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AmbiguousDefaults_release_handle_nullable'));
final _smokeAmbiguousdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AmbiguousDefaults_get_value_nullable'));
Pointer<Void> smokeAmbiguousdefaultsToFfiNullable(AmbiguousDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeAmbiguousdefaultsToFfi(value);
  final result = _smokeAmbiguousdefaultsCreateHandleNullable(_handle);
  smokeAmbiguousdefaultsReleaseFfiHandle(_handle);
  return result;
}
AmbiguousDefaults? smokeAmbiguousdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeAmbiguousdefaultsGetValueNullable(handle);
  final result = smokeAmbiguousdefaultsFromFfi(_handle);
  smokeAmbiguousdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeAmbiguousdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeAmbiguousdefaultsReleaseHandleNullable(handle);
// End of AmbiguousDefaults "private" section.
