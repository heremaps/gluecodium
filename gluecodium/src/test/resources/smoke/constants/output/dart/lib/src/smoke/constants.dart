import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
enum StateEnum {
    off,
    on
}
// StateEnum "private" section, not exported.
int smokeConstantsStateenumToFfi(StateEnum value) {
  switch (value) {
  case StateEnum.off:
    return 0;
  break;
  case StateEnum.on:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for StateEnum enum.");
  }
}
StateEnum smokeConstantsStateenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return StateEnum.off;
  break;
  case 1:
    return StateEnum.on;
  break;
  default:
    throw StateError("Invalid numeric value $handle for StateEnum enum.");
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
Pointer<Void> smokeConstantsStateenumToFfiNullable(StateEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeConstantsStateenumToFfi(value);
  final result = _smokeConstantsStateenumCreateHandleNullable(_handle);
  smokeConstantsStateenumReleaseFfiHandle(_handle);
  return result;
}
StateEnum? smokeConstantsStateenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeConstantsStateenumGetValueNullable(handle);
  final result = smokeConstantsStateenumFromFfi(_handle);
  smokeConstantsStateenumReleaseFfiHandle(_handle);
  return result;
}
void smokeConstantsStateenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeConstantsStateenumReleaseHandleNullable(handle);
// End of StateEnum "private" section.
final bool boolConstant = true;
final int intConstant = -11;
final int uintConstant = 4294967295;
final double floatConstant = 2.71;
final double doubleConstant = -3.14;
final String stringConstant = "Foo bar";
final StateEnum enumConstant = StateEnum.on;
