import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_ConstantsInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ConstantsInterface_release_handle');
class ConstantsInterface {
  final Pointer<Void> _handle;
  ConstantsInterface._(this._handle);
  void release() => _smoke_ConstantsInterface_release_handle(_handle);
  static final bool boolConstant = true;
  static final int intConstant = -11;
  static final int uintConstant = 4294967295;
  static final double floatConstant = 2.71;
  static final double doubleConstant = -3.14;
  static final String stringConstant = "Foo bar";
  static final ConstantsInterface_StateEnum enumConstant = ConstantsInterface_StateEnum.on;
}
Pointer<Void> smoke_ConstantsInterface_toFfi(ConstantsInterface value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
ConstantsInterface smoke_ConstantsInterface_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? ConstantsInterface._(handle) : null;
void smoke_ConstantsInterface_releaseFfiHandle(Pointer<Void> handle) {}
enum ConstantsInterface_StateEnum {
    off,
    on
}
// ConstantsInterface_StateEnum "private" section, not exported.
int smoke_ConstantsInterface_StateEnum_toFfi(ConstantsInterface_StateEnum value) {
  switch (value) {
  case ConstantsInterface_StateEnum.off:
    return 0;
  break;
  case ConstantsInterface_StateEnum.on:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for ConstantsInterface_StateEnum enum.");
  }
}
ConstantsInterface_StateEnum smoke_ConstantsInterface_StateEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return ConstantsInterface_StateEnum.off;
  break;
  case 1:
    return ConstantsInterface_StateEnum.on;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ConstantsInterface_StateEnum enum.");
  }
}
void smoke_ConstantsInterface_StateEnum_releaseFfiHandle(int handle) {}
// End of ConstantsInterface_StateEnum "private" section.
