import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class SimpleInterface {
  void release();
  String getStringValue();
  SimpleInterface useSimpleInterface(SimpleInterface input);
}
// SimpleInterface "private" section, not exported.
final _smoke_SimpleInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_SimpleInterface_copy_handle');
final _smoke_SimpleInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_SimpleInterface_release_handle');
final _smoke_SimpleInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer)
  >('smoke_SimpleInterface_create_proxy');
final _smoke_SimpleInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('smoke_SimpleInterface_get_raw_pointer');
int _SimpleInterface_instance_counter = 1024;
final Map<int, SimpleInterface> _SimpleInterface_instance_cache = {};
final Map<Pointer<Void>, SimpleInterface> _SimpleInterface_reverse_cache = {};
class SimpleInterface__Impl implements SimpleInterface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  SimpleInterface__Impl(this.handle);
  @override
  void release() => _smoke_SimpleInterface_release_handle(handle);
  @override
  String getStringValue() {
    final _getStringValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_SimpleInterface_getStringValue');
    final __result_handle = _getStringValue_ffi(_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  SimpleInterface useSimpleInterface(SimpleInterface input) {
    final _useSimpleInterface_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_SimpleInterface_useSimpleInterface__SimpleInterface');
    final _input_handle = smoke_SimpleInterface_toFfi(input);
    final __result_handle = _useSimpleInterface_ffi(_handle, _input_handle);
    smoke_SimpleInterface_releaseFfiHandle(_input_handle);
    final _result = smoke_SimpleInterface_fromFfi(__result_handle);
    smoke_SimpleInterface_releaseFfiHandle(__result_handle);
    return _result;
  }
}
int _SimpleInterface_getStringValue_static(int _token, Pointer<Pointer<Void>> _result) {
  final _result_object = _SimpleInterface_instance_cache[_token].getStringValue();
  _result.value = String_toFfi(_result_object);
  return 0;
}
int _SimpleInterface_useSimpleInterface_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  final _result_object = _SimpleInterface_instance_cache[_token].useSimpleInterface(smoke_SimpleInterface_fromFfi(input));
  _result.value = smoke_SimpleInterface_toFfi(_result_object);
  smoke_SimpleInterface_releaseFfiHandle(input);
  if (_result_object != null) _result_object.release();
  return 0;
}
Pointer<Void> smoke_SimpleInterface_toFfi(SimpleInterface value) {
  if (value is SimpleInterface__Impl) return _smoke_SimpleInterface_copy_handle(value.handle);
  const UNKNOWN_ERROR = -1;
  final token = _SimpleInterface_instance_counter++;
  _SimpleInterface_instance_cache[token] = value;
  final result = _smoke_SimpleInterface_create_proxy(token, Pointer.fromFunction<Int64 Function(Uint64, Pointer<Pointer<Void>>)>(_SimpleInterface_getStringValue_static, UNKNOWN_ERROR), Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_SimpleInterface_useSimpleInterface_static, UNKNOWN_ERROR));
  _SimpleInterface_reverse_cache[_smoke_SimpleInterface_get_raw_pointer(result)] = value;
  return result;
}
SimpleInterface smoke_SimpleInterface_fromFfi(Pointer<Void> handle) {
  final instance = _SimpleInterface_reverse_cache[_smoke_SimpleInterface_get_raw_pointer(handle)];
  return instance != null ? instance : SimpleInterface__Impl(_smoke_SimpleInterface_copy_handle(handle));
}
void smoke_SimpleInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SimpleInterface_release_handle(handle);
Pointer<Void> smoke_SimpleInterface_toFfi_nullable(SimpleInterface value) =>
  value != null ? smoke_SimpleInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
SimpleInterface smoke_SimpleInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SimpleInterface_fromFfi(handle) : null;
void smoke_SimpleInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SimpleInterface_release_handle(handle);
// End of SimpleInterface "private" section.
