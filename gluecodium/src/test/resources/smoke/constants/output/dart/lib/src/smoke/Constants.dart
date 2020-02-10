import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
enum StateEnum {
    off,
    on
}
// StateEnum "private" section, not exported.
int smoke_Constants_StateEnum_toFfi(StateEnum value) {
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
StateEnum smoke_Constants_StateEnum_fromFfi(int handle) {
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
void smoke_Constants_StateEnum_releaseFfiHandle(int handle) {}
// End of StateEnum "private" section.
final bool boolConstant = true;
final int intConstant = -11;
final int uintConstant = 4294967295;
final double floatConstant = 2.71;
final double doubleConstant = -3.14;
final String stringConstant = "Foo bar";
final StateEnum enumConstant = StateEnum.on;
