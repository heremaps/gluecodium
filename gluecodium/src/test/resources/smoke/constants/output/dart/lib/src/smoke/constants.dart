import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
class Constants {
  static final bool boolConstant = true;
  static final int intConstant = -11;
  static final int uintConstant = 4294967295;
  static final double floatConstant = 2.71;
  static final double doubleConstant = -3.14;
  static final String stringConstant = "Foo bar";
  static final Constants_StateEnum enumConstant = Constants_StateEnum.on;
}
enum Constants_StateEnum {
    off,
    on
}
// Constants_StateEnum "private" section, not exported.
int smokeConstantsStateenumToFfi(Constants_StateEnum value) {
  switch (value) {
  case Constants_StateEnum.off:
    return 0;
  case Constants_StateEnum.on:
    return 1;
  default:
    throw StateError("Invalid enum value $value for Constants_StateEnum enum.");
  }
}
Constants_StateEnum smokeConstantsStateenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Constants_StateEnum.off;
  case 1:
    return Constants_StateEnum.on;
  default:
    throw StateError("Invalid numeric value $handle for Constants_StateEnum enum.");
  }
}
void smokeConstantsStateenumReleaseFfiHandle(int handle) {}
final _smokeConstantsStateenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Constants_StateEnum_create_handle_nullable'));
final _smokeConstantsStateenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Constants_StateEnum_release_handle_nullable'));
final _smokeConstantsStateenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Constants_StateEnum_get_value_nullable'));
Pointer<Void> smokeConstantsStateenumToFfiNullable(Constants_StateEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeConstantsStateenumToFfi(value);
  final result = _smokeConstantsStateenumCreateHandleNullable(_handle);
  smokeConstantsStateenumReleaseFfiHandle(_handle);
  return result;
}
Constants_StateEnum? smokeConstantsStateenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeConstantsStateenumGetValueNullable(handle);
  final result = smokeConstantsStateenumFromFfi(_handle);
  smokeConstantsStateenumReleaseFfiHandle(_handle);
  return result;
}
void smokeConstantsStateenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeConstantsStateenumReleaseHandleNullable(handle);
// End of Constants_StateEnum "private" section.
// Constants "private" section, not exported.
final _smokeConstantsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_smoke_Constants_create_handle'));
final _smokeConstantsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Constants_release_handle'));
Pointer<Void> smokeConstantsToFfi(Constants value) {
  final _result = _smokeConstantsCreateHandle();
  return _result;
}
Constants smokeConstantsFromFfi(Pointer<Void> handle) {
  try {
    return Constants(
    );
  } finally {
  }
}
void smokeConstantsReleaseFfiHandle(Pointer<Void> handle) => _smokeConstantsReleaseHandle(handle);
// Nullable Constants
final _smokeConstantsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Constants_create_handle_nullable'));
final _smokeConstantsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Constants_release_handle_nullable'));
final _smokeConstantsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Constants_get_value_nullable'));
Pointer<Void> smokeConstantsToFfiNullable(Constants? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeConstantsToFfi(value);
  final result = _smokeConstantsCreateHandleNullable(_handle);
  smokeConstantsReleaseFfiHandle(_handle);
  return result;
}
Constants? smokeConstantsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeConstantsGetValueNullable(handle);
  final result = smokeConstantsFromFfi(_handle);
  smokeConstantsReleaseFfiHandle(_handle);
  return result;
}
void smokeConstantsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeConstantsReleaseHandleNullable(handle);
// End of Constants "private" section.
