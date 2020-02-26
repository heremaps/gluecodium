import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class Interface {
  void release();
}
// Interface "private" section, not exported.
final _package_Interface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('package_Interface_copy_handle');
final _package_Interface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('package_Interface_release_handle');
final _package_Interface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('package_Interface_create_proxy');
final _package_Interface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('package_Interface_get_raw_pointer');
final _package_Interface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('package_Interface_get_type_id');
int _Interface_instance_counter = 1024;
final Map<int, Interface> _Interface_instance_cache = {};
final Map<Pointer<Void>, Interface> _Interface_reverse_cache = {};
class Interface__Impl implements Interface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Interface__Impl(this.handle);
  @override
  void release() => _package_Interface_release_handle(handle);
}
Pointer<Void> package_Interface_toFfi(Interface value) {
  if (value is Interface__Impl) return _package_Interface_copy_handle(value.handle);
  const UNKNOWN_ERROR = -1;
  final token = _Interface_instance_counter++;
  _Interface_instance_cache[token] = value;
  final result = _package_Interface_create_proxy(token);
  _Interface_reverse_cache[_package_Interface_get_raw_pointer(result)] = value;
  return result;
}
Interface package_Interface_fromFfi(Pointer<Void> handle) {
  final instance = _Interface_reverse_cache[_package_Interface_get_raw_pointer(handle)];
  if (instance != null) return instance;
  final _copied_handle = _package_Interface_copy_handle(handle);
  final _type_id_handle = _package_Interface_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? Interface__Impl(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void package_Interface_releaseFfiHandle(Pointer<Void> handle) =>
  _package_Interface_release_handle(handle);
Pointer<Void> package_Interface_toFfi_nullable(Interface value) =>
  value != null ? package_Interface_toFfi(value) : Pointer<Void>.fromAddress(0);
Interface package_Interface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? package_Interface_fromFfi(handle) : null;
void package_Interface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _package_Interface_release_handle(handle);
// End of Interface "private" section.
