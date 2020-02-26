import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/smoke/ParentInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class ChildInterface implements ParentInterface {
  void release();
  childMethod();
}
// ChildInterface "private" section, not exported.
final _smoke_ChildInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ChildInterface_copy_handle');
final _smoke_ChildInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ChildInterface_release_handle');
final _smoke_ChildInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer, Pointer, Pointer)
  >('smoke_ChildInterface_create_proxy');
final _smoke_ChildInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('smoke_ChildInterface_get_raw_pointer');
final _smoke_ChildInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ChildInterface_get_type_id');
int _ChildInterface_instance_counter = 1024;
final Map<int, ChildInterface> _ChildInterface_instance_cache = {};
final Map<Pointer<Void>, ChildInterface> _ChildInterface_reverse_cache = {};
class ChildInterface__Impl extends ParentInterface__Impl implements ChildInterface {
  Pointer<Void> get _handle => handle;
  ChildInterface__Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() => _smoke_ChildInterface_release_handle(handle);
  @override
  childMethod() {
    final _childMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('smoke_ChildInterface_childMethod');
    final __result_handle = _childMethod_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _ChildInterface_rootMethod_static(int _token) {
  _ChildInterface_instance_cache[_token].rootMethod();
  return 0;
}
int _ChildInterface_childMethod_static(int _token) {
  _ChildInterface_instance_cache[_token].childMethod();
  return 0;
}
int _ChildInterface_rootProperty_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi(_ChildInterface_instance_cache[_token].rootProperty);
  return 0;
}
int _ChildInterface_rootProperty_set_static(int _token, Pointer<Void> _value) {
  _ChildInterface_instance_cache[_token].rootProperty = String_fromFfi(_value);
  String_releaseFfiHandle(_value);
  return 0;
}
Pointer<Void> smoke_ChildInterface_toFfi(ChildInterface value) {
  if (value is ChildInterface__Impl) return _smoke_ChildInterface_copy_handle(value.handle);
  const UNKNOWN_ERROR = -1;
  final token = _ChildInterface_instance_counter++;
  _ChildInterface_instance_cache[token] = value;
  final result = _smoke_ChildInterface_create_proxy(token, Pointer.fromFunction<Int64 Function(Uint64)>(_ChildInterface_rootMethod_static, UNKNOWN_ERROR), Pointer.fromFunction<Int64 Function(Uint64)>(_ChildInterface_childMethod_static, UNKNOWN_ERROR), Pointer.fromFunction<Int64 Function(Uint64, Pointer<Pointer<Void>>)>(_ChildInterface_rootProperty_get_static, UNKNOWN_ERROR), Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_ChildInterface_rootProperty_set_static, UNKNOWN_ERROR));
  _ChildInterface_reverse_cache[_smoke_ChildInterface_get_raw_pointer(result)] = value;
  return result;
}
ChildInterface smoke_ChildInterface_fromFfi(Pointer<Void> handle) {
  final instance = _ChildInterface_reverse_cache[_smoke_ChildInterface_get_raw_pointer(handle)];
  if (instance != null) return instance;
  final _copied_handle = _smoke_ChildInterface_copy_handle(handle);
  final _type_id_handle = _smoke_ChildInterface_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? ChildInterface__Impl(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_ChildInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ChildInterface_release_handle(handle);
Pointer<Void> smoke_ChildInterface_toFfi_nullable(ChildInterface value) =>
  value != null ? smoke_ChildInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ChildInterface smoke_ChildInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ChildInterface_fromFfi(handle) : null;
void smoke_ChildInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ChildInterface_release_handle(handle);
// End of ChildInterface "private" section.
