import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_Lambdas_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_copy_handle');
final _smoke_Lambdas_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_release_handle');
class Lambdas {
  final Pointer<Void> _handle;
  Lambdas._(this._handle);
  void release() => _smoke_Lambdas_release_handle(_handle);
  Lambdas_Producer deconfuse(String value, Lambdas_Confuser confuser) {
    final _deconfuse_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)>('library_smoke_Lambdas_deconfuse__String_Confuser');
    final _value_handle = String_toFfi(value);
    final _confuser_handle = smoke_Lambdas_Confuser_toFfi(confuser);
    final __result_handle = _deconfuse_ffi(_handle, _value_handle, _confuser_handle);
    String_releaseFfiHandle(_value_handle);
    smoke_Lambdas_Confuser_releaseFfiHandle(_confuser_handle);
    final _result = smoke_Lambdas_Producer_fromFfi(__result_handle);
    smoke_Lambdas_Producer_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Map<int, String> fuse(List<String> items, Lambdas_Indexer callback) {
    final _fuse_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Lambdas_fuse__ListOf_1String_Indexer');
    final _items_handle = ListOf_String_toFfi(items);
    final _callback_handle = smoke_Lambdas_Indexer_toFfi(callback);
    final __result_handle = _fuse_ffi(_items_handle, _callback_handle);
    ListOf_String_releaseFfiHandle(_items_handle);
    smoke_Lambdas_Indexer_releaseFfiHandle(_callback_handle);
    final _result = MapOf_Int_to_String_fromFfi(__result_handle);
    MapOf_Int_to_String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_Lambdas_toFfi(Lambdas value) =>
  _smoke_Lambdas_copy_handle(value._handle);
Lambdas smoke_Lambdas_fromFfi(Pointer<Void> handle) =>
  Lambdas._(_smoke_Lambdas_copy_handle(handle));
void smoke_Lambdas_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Lambdas_release_handle(handle);
Pointer<Void> smoke_Lambdas_toFfi_nullable(Lambdas value) =>
  value != null ? smoke_Lambdas_toFfi(value) : Pointer<Void>.fromAddress(0);
Lambdas smoke_Lambdas_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Lambdas_fromFfi(handle) : null;
void smoke_Lambdas_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Lambdas_release_handle(handle);
typedef Lambdas_Producer = String Function();
// Lambdas_Producer "private" section, not exported.
final _smoke_Lambdas_Producer_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_copy_handle');
final _smoke_Lambdas_Producer_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_release_handle');
final _smoke_Lambdas_Producer_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer)
  >('library_smoke_Lambdas_Producer_create_proxy');
final _smoke_Lambdas_Producer_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_Lambdas_Producer_get_raw_pointer');
class Lambdas_Producer__Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Lambdas_Producer__Impl(this.handle);
  void release() => _smoke_Lambdas_Producer_release_handle(handle);
  String call() {
    final _call_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Lambdas_Producer_call');
    final __result_handle = _call_ffi(_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
int _Lambdas_Producer_call_static(int _token, Pointer<Pointer<Void>> _result) {
  final _result_object = (__lib.instanceCache[_token] as Lambdas_Producer)();
  _result.value = String_toFfi(_result_object);
  return 0;
}
Pointer<Void> smoke_Lambdas_Producer_toFfi(Lambdas_Producer value) {
  final token = __lib.getNewToken();
  __lib.instanceCache[token] = value;
  final result = _smoke_Lambdas_Producer_create_proxy(token, __lib.uncacheObjectFfi, Pointer.fromFunction<Int64 Function(Uint64, Pointer<Pointer<Void>>)>(_Lambdas_Producer_call_static, __lib.unknownError));
  __lib.reverseCache[_smoke_Lambdas_Producer_get_raw_pointer(result)] = value;
  return result;
}
Lambdas_Producer smoke_Lambdas_Producer_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_Lambdas_Producer_get_raw_pointer(handle)] as Lambdas_Producer;
  if (instance != null) return instance;
  final _impl = Lambdas_Producer__Impl(_smoke_Lambdas_Producer_copy_handle(handle));
  return () {
    final _result =_impl.call();
    _impl.release();
    return _result;
  };
}
void smoke_Lambdas_Producer_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Lambdas_Producer_release_handle(handle);
// Nullable Lambdas_Producer
final _smoke_Lambdas_Producer_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_create_handle_nullable');
final _smoke_Lambdas_Producer_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_release_handle_nullable');
final _smoke_Lambdas_Producer_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Producer_get_value_nullable');
Pointer<Void> smoke_Lambdas_Producer_toFfi_nullable(Lambdas_Producer value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Lambdas_Producer_toFfi(value);
  final result = _smoke_Lambdas_Producer_create_handle_nullable(_handle);
  smoke_Lambdas_Producer_releaseFfiHandle(_handle);
  return result;
}
Lambdas_Producer smoke_Lambdas_Producer_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Lambdas_Producer_get_value_nullable(handle);
  final result = smoke_Lambdas_Producer_fromFfi(_handle);
  smoke_Lambdas_Producer_releaseFfiHandle(_handle);
  return result;
}
void smoke_Lambdas_Producer_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Lambdas_Producer_release_handle_nullable(handle);
// End of Lambdas_Producer "private" section.
/// Should confuse everyone thoroughly
typedef Lambdas_Confuser = Lambdas_Producer Function(String);
// Lambdas_Confuser "private" section, not exported.
final _smoke_Lambdas_Confuser_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_copy_handle');
final _smoke_Lambdas_Confuser_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_release_handle');
final _smoke_Lambdas_Confuser_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer)
  >('library_smoke_Lambdas_Confuser_create_proxy');
final _smoke_Lambdas_Confuser_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_Lambdas_Confuser_get_raw_pointer');
class Lambdas_Confuser__Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Lambdas_Confuser__Impl(this.handle);
  void release() => _smoke_Lambdas_Confuser_release_handle(handle);
  Lambdas_Producer call(String p0) {
    final _call_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Lambdas_Confuser_call__String');
    final _p0_handle = String_toFfi(p0);
    final __result_handle = _call_ffi(_handle, _p0_handle);
    String_releaseFfiHandle(_p0_handle);
    final _result = smoke_Lambdas_Producer_fromFfi(__result_handle);
    smoke_Lambdas_Producer_releaseFfiHandle(__result_handle);
    return _result;
  }
}
int _Lambdas_Confuser_call_static(int _token, Pointer<Void> p0, Pointer<Pointer<Void>> _result) {
  final _result_object = (__lib.instanceCache[_token] as Lambdas_Confuser)(String_fromFfi(p0));
  _result.value = smoke_Lambdas_Producer_toFfi(_result_object);
  String_releaseFfiHandle(p0);
  return 0;
}
Pointer<Void> smoke_Lambdas_Confuser_toFfi(Lambdas_Confuser value) {
  final token = __lib.getNewToken();
  __lib.instanceCache[token] = value;
  final result = _smoke_Lambdas_Confuser_create_proxy(token, __lib.uncacheObjectFfi, Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_Lambdas_Confuser_call_static, __lib.unknownError));
  __lib.reverseCache[_smoke_Lambdas_Confuser_get_raw_pointer(result)] = value;
  return result;
}
Lambdas_Confuser smoke_Lambdas_Confuser_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_Lambdas_Confuser_get_raw_pointer(handle)] as Lambdas_Confuser;
  if (instance != null) return instance;
  final _impl = Lambdas_Confuser__Impl(_smoke_Lambdas_Confuser_copy_handle(handle));
  return (String p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smoke_Lambdas_Confuser_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Lambdas_Confuser_release_handle(handle);
// Nullable Lambdas_Confuser
final _smoke_Lambdas_Confuser_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_create_handle_nullable');
final _smoke_Lambdas_Confuser_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_release_handle_nullable');
final _smoke_Lambdas_Confuser_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Confuser_get_value_nullable');
Pointer<Void> smoke_Lambdas_Confuser_toFfi_nullable(Lambdas_Confuser value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Lambdas_Confuser_toFfi(value);
  final result = _smoke_Lambdas_Confuser_create_handle_nullable(_handle);
  smoke_Lambdas_Confuser_releaseFfiHandle(_handle);
  return result;
}
Lambdas_Confuser smoke_Lambdas_Confuser_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Lambdas_Confuser_get_value_nullable(handle);
  final result = smoke_Lambdas_Confuser_fromFfi(_handle);
  smoke_Lambdas_Confuser_releaseFfiHandle(_handle);
  return result;
}
void smoke_Lambdas_Confuser_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Lambdas_Confuser_release_handle_nullable(handle);
// End of Lambdas_Confuser "private" section.
typedef Lambdas_Consumer = void Function(String);
// Lambdas_Consumer "private" section, not exported.
final _smoke_Lambdas_Consumer_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_copy_handle');
final _smoke_Lambdas_Consumer_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_release_handle');
final _smoke_Lambdas_Consumer_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer)
  >('library_smoke_Lambdas_Consumer_create_proxy');
final _smoke_Lambdas_Consumer_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_Lambdas_Consumer_get_raw_pointer');
class Lambdas_Consumer__Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Lambdas_Consumer__Impl(this.handle);
  void release() => _smoke_Lambdas_Consumer_release_handle(handle);
  call(String p0) {
    final _call_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Lambdas_Consumer_call__String');
    final _p0_handle = String_toFfi(p0);
    final __result_handle = _call_ffi(_handle, _p0_handle);
    String_releaseFfiHandle(_p0_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _Lambdas_Consumer_call_static(int _token, Pointer<Void> p0) {
  (__lib.instanceCache[_token] as Lambdas_Consumer)(String_fromFfi(p0));
  String_releaseFfiHandle(p0);
  return 0;
}
Pointer<Void> smoke_Lambdas_Consumer_toFfi(Lambdas_Consumer value) {
  final token = __lib.getNewToken();
  __lib.instanceCache[token] = value;
  final result = _smoke_Lambdas_Consumer_create_proxy(token, __lib.uncacheObjectFfi, Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_Lambdas_Consumer_call_static, __lib.unknownError));
  __lib.reverseCache[_smoke_Lambdas_Consumer_get_raw_pointer(result)] = value;
  return result;
}
Lambdas_Consumer smoke_Lambdas_Consumer_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_Lambdas_Consumer_get_raw_pointer(handle)] as Lambdas_Consumer;
  if (instance != null) return instance;
  final _impl = Lambdas_Consumer__Impl(_smoke_Lambdas_Consumer_copy_handle(handle));
  return (String p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smoke_Lambdas_Consumer_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Lambdas_Consumer_release_handle(handle);
// Nullable Lambdas_Consumer
final _smoke_Lambdas_Consumer_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_create_handle_nullable');
final _smoke_Lambdas_Consumer_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_release_handle_nullable');
final _smoke_Lambdas_Consumer_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Consumer_get_value_nullable');
Pointer<Void> smoke_Lambdas_Consumer_toFfi_nullable(Lambdas_Consumer value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Lambdas_Consumer_toFfi(value);
  final result = _smoke_Lambdas_Consumer_create_handle_nullable(_handle);
  smoke_Lambdas_Consumer_releaseFfiHandle(_handle);
  return result;
}
Lambdas_Consumer smoke_Lambdas_Consumer_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Lambdas_Consumer_get_value_nullable(handle);
  final result = smoke_Lambdas_Consumer_fromFfi(_handle);
  smoke_Lambdas_Consumer_releaseFfiHandle(_handle);
  return result;
}
void smoke_Lambdas_Consumer_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Lambdas_Consumer_release_handle_nullable(handle);
// End of Lambdas_Consumer "private" section.
typedef Lambdas_Indexer = int Function(String, double);
// Lambdas_Indexer "private" section, not exported.
final _smoke_Lambdas_Indexer_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_copy_handle');
final _smoke_Lambdas_Indexer_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_release_handle');
final _smoke_Lambdas_Indexer_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer)
  >('library_smoke_Lambdas_Indexer_create_proxy');
final _smoke_Lambdas_Indexer_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_Lambdas_Indexer_get_raw_pointer');
class Lambdas_Indexer__Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Lambdas_Indexer__Impl(this.handle);
  void release() => _smoke_Lambdas_Indexer_release_handle(handle);
  int call(String p0, double p1) {
    final _call_ffi = __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Pointer<Void>, Float), int Function(Pointer<Void>, Pointer<Void>, double)>('library_smoke_Lambdas_Indexer_call__String_Float');
    final _p0_handle = String_toFfi(p0);
    final _p1_handle = (p1);
    final __result_handle = _call_ffi(_handle, _p0_handle, _p1_handle);
    String_releaseFfiHandle(_p0_handle);
    (_p1_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _Lambdas_Indexer_call_static(int _token, Pointer<Void> p0, double p1, Pointer<Int32> _result) {
  final _result_object = (__lib.instanceCache[_token] as Lambdas_Indexer)(String_fromFfi(p0), (p1));
  _result.value = (_result_object);
  String_releaseFfiHandle(p0);
  (p1);
  return 0;
}
Pointer<Void> smoke_Lambdas_Indexer_toFfi(Lambdas_Indexer value) {
  final token = __lib.getNewToken();
  __lib.instanceCache[token] = value;
  final result = _smoke_Lambdas_Indexer_create_proxy(token, __lib.uncacheObjectFfi, Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Float, Pointer<Int32>)>(_Lambdas_Indexer_call_static, __lib.unknownError));
  __lib.reverseCache[_smoke_Lambdas_Indexer_get_raw_pointer(result)] = value;
  return result;
}
Lambdas_Indexer smoke_Lambdas_Indexer_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_Lambdas_Indexer_get_raw_pointer(handle)] as Lambdas_Indexer;
  if (instance != null) return instance;
  final _impl = Lambdas_Indexer__Impl(_smoke_Lambdas_Indexer_copy_handle(handle));
  return (String p0, double p1) {
    final _result =_impl.call(p0, p1);
    _impl.release();
    return _result;
  };
}
void smoke_Lambdas_Indexer_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Lambdas_Indexer_release_handle(handle);
// Nullable Lambdas_Indexer
final _smoke_Lambdas_Indexer_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_create_handle_nullable');
final _smoke_Lambdas_Indexer_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_release_handle_nullable');
final _smoke_Lambdas_Indexer_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_Indexer_get_value_nullable');
Pointer<Void> smoke_Lambdas_Indexer_toFfi_nullable(Lambdas_Indexer value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Lambdas_Indexer_toFfi(value);
  final result = _smoke_Lambdas_Indexer_create_handle_nullable(_handle);
  smoke_Lambdas_Indexer_releaseFfiHandle(_handle);
  return result;
}
Lambdas_Indexer smoke_Lambdas_Indexer_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Lambdas_Indexer_get_value_nullable(handle);
  final result = smoke_Lambdas_Indexer_fromFfi(_handle);
  smoke_Lambdas_Indexer_releaseFfiHandle(_handle);
  return result;
}
void smoke_Lambdas_Indexer_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Lambdas_Indexer_release_handle_nullable(handle);
// End of Lambdas_Indexer "private" section.
typedef Lambdas_NullableConfuser = Lambdas_Producer Function(String);
// Lambdas_NullableConfuser "private" section, not exported.
final _smoke_Lambdas_NullableConfuser_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_copy_handle');
final _smoke_Lambdas_NullableConfuser_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_release_handle');
final _smoke_Lambdas_NullableConfuser_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer)
  >('library_smoke_Lambdas_NullableConfuser_create_proxy');
final _smoke_Lambdas_NullableConfuser_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_Lambdas_NullableConfuser_get_raw_pointer');
class Lambdas_NullableConfuser__Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  Lambdas_NullableConfuser__Impl(this.handle);
  void release() => _smoke_Lambdas_NullableConfuser_release_handle(handle);
  Lambdas_Producer call(String p0) {
    final _call_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_Lambdas_NullableConfuser_call__String');
    final _p0_handle = String_toFfi_nullable(p0);
    final __result_handle = _call_ffi(_handle, _p0_handle);
    String_releaseFfiHandle_nullable(_p0_handle);
    final _result = smoke_Lambdas_Producer_fromFfi_nullable(__result_handle);
    smoke_Lambdas_Producer_releaseFfiHandle_nullable(__result_handle);
    return _result;
  }
}
int _Lambdas_NullableConfuser_call_static(int _token, Pointer<Void> p0, Pointer<Pointer<Void>> _result) {
  final _result_object = (__lib.instanceCache[_token] as Lambdas_NullableConfuser)(String_fromFfi_nullable(p0));
  _result.value = smoke_Lambdas_Producer_toFfi_nullable(_result_object);
  String_releaseFfiHandle_nullable(p0);
  return 0;
}
Pointer<Void> smoke_Lambdas_NullableConfuser_toFfi(Lambdas_NullableConfuser value) {
  final token = __lib.getNewToken();
  __lib.instanceCache[token] = value;
  final result = _smoke_Lambdas_NullableConfuser_create_proxy(token, __lib.uncacheObjectFfi, Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_Lambdas_NullableConfuser_call_static, __lib.unknownError));
  __lib.reverseCache[_smoke_Lambdas_NullableConfuser_get_raw_pointer(result)] = value;
  return result;
}
Lambdas_NullableConfuser smoke_Lambdas_NullableConfuser_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_Lambdas_NullableConfuser_get_raw_pointer(handle)] as Lambdas_NullableConfuser;
  if (instance != null) return instance;
  final _impl = Lambdas_NullableConfuser__Impl(_smoke_Lambdas_NullableConfuser_copy_handle(handle));
  return (String p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smoke_Lambdas_NullableConfuser_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Lambdas_NullableConfuser_release_handle(handle);
// Nullable Lambdas_NullableConfuser
final _smoke_Lambdas_NullableConfuser_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_create_handle_nullable');
final _smoke_Lambdas_NullableConfuser_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_release_handle_nullable');
final _smoke_Lambdas_NullableConfuser_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Lambdas_NullableConfuser_get_value_nullable');
Pointer<Void> smoke_Lambdas_NullableConfuser_toFfi_nullable(Lambdas_NullableConfuser value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Lambdas_NullableConfuser_toFfi(value);
  final result = _smoke_Lambdas_NullableConfuser_create_handle_nullable(_handle);
  smoke_Lambdas_NullableConfuser_releaseFfiHandle(_handle);
  return result;
}
Lambdas_NullableConfuser smoke_Lambdas_NullableConfuser_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Lambdas_NullableConfuser_get_value_nullable(handle);
  final result = smoke_Lambdas_NullableConfuser_fromFfi(_handle);
  smoke_Lambdas_NullableConfuser_releaseFfiHandle(_handle);
  return result;
}
void smoke_Lambdas_NullableConfuser_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Lambdas_NullableConfuser_release_handle_nullable(handle);
// End of Lambdas_NullableConfuser "private" section.
