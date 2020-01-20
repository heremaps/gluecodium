import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ConstantsInterface_release_handle');
class ConstantsInterface {
  final Pointer<Void> _handle;
  ConstantsInterface._(this._handle);
  void release() => __release_handle(_handle);
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
