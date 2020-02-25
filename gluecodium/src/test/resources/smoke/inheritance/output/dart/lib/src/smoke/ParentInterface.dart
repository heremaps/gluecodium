import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class ParentInterface {
  void release();
  rootMethod();
  String get rootProperty;
  set rootProperty(String value);
}
// ParentInterface "private" section, not exported.
final _smoke_ParentInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ParentInterface_copy_handle');
final _smoke_ParentInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ParentInterface_release_handle');
final _smoke_ParentInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer, Pointer)
  >('smoke_ParentInterface_create_proxy');
final _smoke_ParentInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('smoke_ParentInterface_get_raw_pointer');
int _ParentInterface_instance_counter = 1024;
final Map<int, ParentInterface> _ParentInterface_instance_cache = {};
final Map<Pointer<Void>, ParentInterface> _ParentInterface_reverse_cache = {};
class ParentInterface__Impl implements ParentInterface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  ParentInterface__Impl(this.handle);
  @override
  void release() => _smoke_ParentInterface_release_handle(handle);
  @override
  rootMethod() {
    final _rootMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('smoke_ParentInterface_rootMethod');
    final __result_handle = _rootMethod_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  String get rootProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_ParentInterface_rootProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  set rootProperty(String value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_ParentInterface_rootProperty_set__String');
    final _value_handle = String_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    String_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _ParentInterface_rootMethod_static(int _token) {
  _ParentInterface_instance_cache[_token].rootMethod();
  return 0;
}
int _ParentInterface_rootProperty_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi(_ParentInterface_instance_cache[_token].rootProperty);
  return 0;
}
int _ParentInterface_rootProperty_set_static(int _token, Pointer<Void> _value) {
  _ParentInterface_instance_cache[_token].rootProperty = String_fromFfi(_value);
  String_releaseFfiHandle(_value);
  return 0;
}
Pointer<Void> smoke_ParentInterface_toFfi(ParentInterface value) {
  if (value is ParentInterface__Impl) return _smoke_ParentInterface_copy_handle(value.handle);
  const UNKNOWN_ERROR = -1;
  final token = _ParentInterface_instance_counter++;
  _ParentInterface_instance_cache[token] = value;
  final result = _smoke_ParentInterface_create_proxy(token, Pointer.fromFunction<Int64 Function(Uint64)>(_ParentInterface_rootMethod_static, UNKNOWN_ERROR), Pointer.fromFunction<Int64 Function(Uint64, Pointer<Pointer<Void>>)>(_ParentInterface_rootProperty_get_static, UNKNOWN_ERROR), Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_ParentInterface_rootProperty_set_static, UNKNOWN_ERROR));
  _ParentInterface_reverse_cache[_smoke_ParentInterface_get_raw_pointer(result)] = value;
  return result;
}
ParentInterface smoke_ParentInterface_fromFfi(Pointer<Void> handle) {
  final instance = _ParentInterface_reverse_cache[_smoke_ParentInterface_get_raw_pointer(handle)];
  return instance != null ? instance : ParentInterface__Impl(_smoke_ParentInterface_copy_handle(handle));
}
void smoke_ParentInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ParentInterface_release_handle(handle);
Pointer<Void> smoke_ParentInterface_toFfi_nullable(ParentInterface value) =>
  value != null ? smoke_ParentInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ParentInterface smoke_ParentInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ParentInterface_fromFfi(handle) : null;
void smoke_ParentInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ParentInterface_release_handle(handle);
// End of ParentInterface "private" section.
