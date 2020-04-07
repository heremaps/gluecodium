import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;

abstract class InternalClass {
  void release();
}
// InternalClass "private" section, not exported.
final _smoke_InternalClass_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClass_copy_handle');
final _smoke_InternalClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClass_release_handle');
class InternalClass$Impl implements InternalClass {
  final Pointer<Void> handle;
  InternalClass$Impl(this.handle);
  @override
  void release() => _smoke_InternalClass_release_handle(handle);
}
Pointer<Void> smoke_InternalClass_toFfi(InternalClass value) =>
  _smoke_InternalClass_copy_handle((value as InternalClass$Impl).handle);
InternalClass smoke_InternalClass_fromFfi(Pointer<Void> handle) =>
  InternalClass$Impl(_smoke_InternalClass_copy_handle(handle));
void smoke_InternalClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_InternalClass_release_handle(handle);
Pointer<Void> smoke_InternalClass_toFfi_nullable(InternalClass value) =>
  value != null ? smoke_InternalClass_toFfi(value) : Pointer<Void>.fromAddress(0);
InternalClass smoke_InternalClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InternalClass_fromFfi(handle) : null;
void smoke_InternalClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_InternalClass_release_handle(handle);
// End of InternalClass "private" section.
