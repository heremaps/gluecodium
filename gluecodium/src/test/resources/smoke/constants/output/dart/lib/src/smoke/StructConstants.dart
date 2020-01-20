import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_StructConstants_release_handle');
class StructConstants {
  final Pointer<Void> _handle;
  StructConstants._(this._handle);
  void release() => __release_handle(_handle);
  static final StructConstants_SomeStruct structConstant = StructConstants_SomeStruct("bar Buzz", 1.41);
  static final StructConstants_NestingStruct nestingStructConstant = StructConstants_NestingStruct(StructConstants_SomeStruct("nonsense", -2.82));
}
Pointer<Void> smoke_StructConstants_toFfi(StructConstants value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
StructConstants smoke_StructConstants_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? StructConstants._(handle) : null;
void smoke_StructConstants_releaseFfiHandle(Pointer<Void> handle) {}
class StructConstants_SomeStruct {
  String stringField;
  double floatField;
  StructConstants_SomeStruct(this.stringField, this.floatField);
}
class StructConstants_NestingStruct {
  StructConstants_SomeStruct structField;
  StructConstants_NestingStruct(this.structField);
}
