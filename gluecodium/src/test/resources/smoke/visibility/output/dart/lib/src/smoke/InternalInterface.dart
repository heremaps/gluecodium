import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class InternalInterface {
  void release();
}
// InternalInterface "private" section, not exported.
final _smoke_InternalInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_InternalInterface_release_handle');
class InternalInterface__Impl implements InternalInterface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  InternalInterface__Impl(this.handle);
  @override
  void release() => _smoke_InternalInterface_release_handle(handle);
}
Pointer<Void> smoke_InternalInterface_toFfi(InternalInterface__Impl value) =>
  value != null ? value.handle : Pointer<Void>.fromAddress(0);
InternalInterface smoke_InternalInterface_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? InternalInterface__Impl(handle) : null;
void smoke_InternalInterface_releaseFfiHandle(Pointer<Void> handle) {}
Pointer<Void> smoke_InternalInterface_toFfi_nullable(InternalInterface__Impl value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
InternalInterface smoke_InternalInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? InternalInterface__Impl(handle) : null;
void smoke_InternalInterface_releaseFfiHandle_nullable(Pointer<Void> handle) {}
// End of InternalInterface "private" section.
