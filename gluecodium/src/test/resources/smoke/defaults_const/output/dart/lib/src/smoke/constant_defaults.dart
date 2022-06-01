import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/fire/some_struct.dart';
import 'package:library/src/fire/struct_constants.dart';
class ConstantDefaults {
  SomeStruct field1;
  SomeStruct field2;
  ConstantDefaults._(this.field1, this.field2);
  ConstantDefaults()
    : field1 = StructConstants.dummy, field2 = StructConstants.dummy4;
}
// ConstantDefaults "private" section, not exported.
final _smokeConstantdefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('library_smoke_ConstantDefaults_create_handle'));
final _smokeConstantdefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ConstantDefaults_release_handle'));
final _smokeConstantdefaultsGetFieldfield1 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ConstantDefaults_get_field_field1'));
final _smokeConstantdefaultsGetFieldfield2 = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ConstantDefaults_get_field_field2'));
Pointer<Void> smokeConstantdefaultsToFfi(ConstantDefaults value) {
  final _field1Handle = fireSomestructToFfi(value.field1);
  final _field2Handle = fireSomestructToFfi(value.field2);
  final _result = _smokeConstantdefaultsCreateHandle(_field1Handle, _field2Handle);
  fireSomestructReleaseFfiHandle(_field1Handle);
  fireSomestructReleaseFfiHandle(_field2Handle);
  return _result;
}
ConstantDefaults smokeConstantdefaultsFromFfi(Pointer<Void> handle) {
  final _field1Handle = _smokeConstantdefaultsGetFieldfield1(handle);
  final _field2Handle = _smokeConstantdefaultsGetFieldfield2(handle);
  try {
    return ConstantDefaults._(
      fireSomestructFromFfi(_field1Handle),
      fireSomestructFromFfi(_field2Handle)
    );
  } finally {
    fireSomestructReleaseFfiHandle(_field1Handle);
    fireSomestructReleaseFfiHandle(_field2Handle);
  }
}
void smokeConstantdefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeConstantdefaultsReleaseHandle(handle);
// Nullable ConstantDefaults
final _smokeConstantdefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ConstantDefaults_create_handle_nullable'));
final _smokeConstantdefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ConstantDefaults_release_handle_nullable'));
final _smokeConstantdefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ConstantDefaults_get_value_nullable'));
Pointer<Void> smokeConstantdefaultsToFfiNullable(ConstantDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeConstantdefaultsToFfi(value);
  final result = _smokeConstantdefaultsCreateHandleNullable(_handle);
  smokeConstantdefaultsReleaseFfiHandle(_handle);
  return result;
}
ConstantDefaults? smokeConstantdefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeConstantdefaultsGetValueNullable(handle);
  final result = smokeConstantdefaultsFromFfi(_handle);
  smokeConstantdefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeConstantdefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeConstantdefaultsReleaseHandleNullable(handle);
// End of ConstantDefaults "private" section.
