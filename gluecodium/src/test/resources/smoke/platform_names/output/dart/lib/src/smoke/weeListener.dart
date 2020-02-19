import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class weeListener {
  void release();
  WeeMethod(String WeeParameter);
}
// weeListener "private" section, not exported.
final _smoke_PlatformNamesListener_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_PlatformNamesListener_copy_handle');
final _smoke_PlatformNamesListener_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_PlatformNamesListener_release_handle');
final _smoke_PlatformNamesListener_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer),
    Pointer<Void> Function(int, Pointer)
  >('smoke_PlatformNamesListener_create_proxy');
final _smoke_PlatformNamesListener_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('smoke_PlatformNamesListener_get_raw_pointer');
int _weeListener_instance_counter = 1024;
final Map<int, weeListener> _weeListener_instance_cache = {};
final Map<Pointer<Void>, weeListener> _weeListener_reverse_cache = {};
class weeListener__Impl implements weeListener {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  weeListener__Impl(this.handle);
  @override
  void release() => _smoke_PlatformNamesListener_release_handle(handle);
  @override
  WeeMethod(String WeeParameter) {
    final _WeeMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('smoke_PlatformNamesListener_basicMethod__String');
    final _WeeParameter_handle = String_toFfi(WeeParameter);
    final __result_handle = _WeeMethod_ffi(_handle, _WeeParameter_handle);
    String_releaseFfiHandle(_WeeParameter_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _weeListener_WeeMethod_static(int _token, Pointer<Void> WeeParameter) {
  _weeListener_instance_cache[_token].WeeMethod(String_fromFfi(WeeParameter));
  String_releaseFfiHandle(WeeParameter);
  return 0;
}
Pointer<Void> smoke_PlatformNamesListener_toFfi(weeListener value) {
  if (value is weeListener__Impl) return _smoke_PlatformNamesListener_copy_handle(value.handle);
  const UNKNOWN_ERROR = -1;
  final token = _weeListener_instance_counter++;
  _weeListener_instance_cache[token] = value;
  final result = _smoke_PlatformNamesListener_create_proxy(token, Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_weeListener_WeeMethod_static, UNKNOWN_ERROR));
  _weeListener_reverse_cache[_smoke_PlatformNamesListener_get_raw_pointer(result)] = value;
  return result;
}
weeListener smoke_PlatformNamesListener_fromFfi(Pointer<Void> handle) {
  final instance = _weeListener_reverse_cache[_smoke_PlatformNamesListener_get_raw_pointer(handle)];
  return instance != null ? instance : weeListener__Impl(_smoke_PlatformNamesListener_copy_handle(handle));
}
void smoke_PlatformNamesListener_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_PlatformNamesListener_release_handle(handle);
Pointer<Void> smoke_PlatformNamesListener_toFfi_nullable(weeListener value) =>
  value != null ? smoke_PlatformNamesListener_toFfi(value) : Pointer<Void>.fromAddress(0);
weeListener smoke_PlatformNamesListener_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_PlatformNamesListener_fromFfi(handle) : null;
void smoke_PlatformNamesListener_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PlatformNamesListener_release_handle(handle);
// End of weeListener "private" section.
