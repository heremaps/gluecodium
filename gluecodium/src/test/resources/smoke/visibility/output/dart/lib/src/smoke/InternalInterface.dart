import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class InternalInterface {
  void release();
}
// InternalInterface "private" section, not exported.
final _smoke_InternalInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_InternalInterface_copy_handle');
final _smoke_InternalInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_InternalInterface_release_handle');
final _smoke_InternalInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('smoke_InternalInterface_create_proxy');
final _smoke_InternalInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('smoke_InternalInterface_get_raw_pointer');
int _InternalInterface_instance_counter = 1024;
final Map<int, InternalInterface> _InternalInterface_instance_cache = {};
final Map<Pointer<Void>, InternalInterface> _InternalInterface_reverse_cache = {};
class InternalInterface__Impl implements InternalInterface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  InternalInterface__Impl(this.handle);
  @override
  void release() => _smoke_InternalInterface_release_handle(handle);
}
Pointer<Void> smoke_InternalInterface_toFfi(InternalInterface value) {
  if (value is InternalInterface__Impl) return _smoke_InternalInterface_copy_handle(value.handle);
  const UNKNOWN_ERROR = -1;
  final token = _InternalInterface_instance_counter++;
  _InternalInterface_instance_cache[token] = value;
  final result = _smoke_InternalInterface_create_proxy(token);
  _InternalInterface_reverse_cache[_smoke_InternalInterface_get_raw_pointer(result)] = value;
  return result;
}
InternalInterface smoke_InternalInterface_fromFfi(Pointer<Void> handle) {
  final instance = _InternalInterface_reverse_cache[_smoke_InternalInterface_get_raw_pointer(handle)];
  return instance != null ? instance : InternalInterface__Impl(_smoke_InternalInterface_copy_handle(handle));
}
void smoke_InternalInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_InternalInterface_release_handle(handle);
Pointer<Void> smoke_InternalInterface_toFfi_nullable(InternalInterface value) =>
  value != null ? smoke_InternalInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
InternalInterface smoke_InternalInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InternalInterface_fromFfi(handle) : null;
void smoke_InternalInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_InternalInterface_release_handle(handle);
// End of InternalInterface "private" section.
