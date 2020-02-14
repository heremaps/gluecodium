import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_InternalClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_InternalClass_release_handle');
class InternalClass {
  final Pointer<Void> _handle;
  InternalClass._(this._handle);
  void release() => _smoke_InternalClass_release_handle(_handle);
}
Pointer<Void> smoke_InternalClass_toFfi(InternalClass value) => value._handle;
InternalClass smoke_InternalClass_fromFfi(Pointer<Void> handle) => InternalClass._(handle);
void smoke_InternalClass_releaseFfiHandle(Pointer<Void> handle) {}
Pointer<Void> smoke_InternalClass_toFfi_nullable(InternalClass value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
InternalClass smoke_InternalClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? InternalClass._(handle) : null;
void smoke_InternalClass_releaseFfiHandle_nullable(Pointer<Void> handle) {}
