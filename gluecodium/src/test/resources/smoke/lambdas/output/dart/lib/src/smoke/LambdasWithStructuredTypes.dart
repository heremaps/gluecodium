import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/smoke/LambdasDeclarationOrder.dart';
import 'package:library/src/smoke/LambdasInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_LambdasWithStructuredTypes_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_copy_handle');
final _smoke_LambdasWithStructuredTypes_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_release_handle');
class LambdasWithStructuredTypes {
  final Pointer<Void> _handle;
  LambdasWithStructuredTypes._(this._handle);
  void release() => _smoke_LambdasWithStructuredTypes_release_handle(_handle);
  doClassStuff(LambdasWithStructuredTypes_ClassCallback callback) {
    final _doClassStuff_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_doClassStuff__ClassCallback');
    final _callback_handle = smoke_LambdasWithStructuredTypes_ClassCallback_toFfi(callback);
    final __result_handle = _doClassStuff_ffi(_handle, _callback_handle);
    smoke_LambdasWithStructuredTypes_ClassCallback_releaseFfiHandle(_callback_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  doStructStuff(LambdasWithStructuredTypes_StructCallback callback) {
    final _doStructStuff_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_doStructStuff__StructCallback');
    final _callback_handle = smoke_LambdasWithStructuredTypes_StructCallback_toFfi(callback);
    final __result_handle = _doStructStuff_ffi(_handle, _callback_handle);
    smoke_LambdasWithStructuredTypes_StructCallback_releaseFfiHandle(_callback_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_LambdasWithStructuredTypes_toFfi(LambdasWithStructuredTypes value) =>
  _smoke_LambdasWithStructuredTypes_copy_handle(value._handle);
LambdasWithStructuredTypes smoke_LambdasWithStructuredTypes_fromFfi(Pointer<Void> handle) =>
  LambdasWithStructuredTypes._(_smoke_LambdasWithStructuredTypes_copy_handle(handle));
void smoke_LambdasWithStructuredTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_LambdasWithStructuredTypes_release_handle(handle);
Pointer<Void> smoke_LambdasWithStructuredTypes_toFfi_nullable(LambdasWithStructuredTypes value) =>
  value != null ? smoke_LambdasWithStructuredTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
LambdasWithStructuredTypes smoke_LambdasWithStructuredTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_LambdasWithStructuredTypes_fromFfi(handle) : null;
void smoke_LambdasWithStructuredTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_LambdasWithStructuredTypes_release_handle(handle);
typedef LambdasWithStructuredTypes_ClassCallback = void Function(LambdasInterface);
// LambdasWithStructuredTypes_ClassCallback "private" section, not exported.
final _smoke_LambdasWithStructuredTypes_ClassCallback_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_copy_handle');
final _smoke_LambdasWithStructuredTypes_ClassCallback_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_release_handle');
final _smoke_LambdasWithStructuredTypes_ClassCallback_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_create_proxy');
final _smoke_LambdasWithStructuredTypes_ClassCallback_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_LambdasWithStructuredTypes_ClassCallback_get_raw_pointer');
class LambdasWithStructuredTypes_ClassCallback__Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  LambdasWithStructuredTypes_ClassCallback__Impl(this.handle);
  void release() => _smoke_LambdasWithStructuredTypes_ClassCallback_release_handle(handle);
  call(LambdasInterface p0) {
    final _call_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_ClassCallback_call__LambdasInterface');
    final _p0_handle = smoke_LambdasInterface_toFfi(p0);
    final __result_handle = _call_ffi(_handle, _p0_handle);
    smoke_LambdasInterface_releaseFfiHandle(_p0_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _LambdasWithStructuredTypes_ClassCallback_call_static(int _token, Pointer<Void> p0) {
  (__lib.instanceCache[_token] as LambdasWithStructuredTypes_ClassCallback)(smoke_LambdasInterface_fromFfi(p0));
  smoke_LambdasInterface_releaseFfiHandle(p0);
  return 0;
}
Pointer<Void> smoke_LambdasWithStructuredTypes_ClassCallback_toFfi(LambdasWithStructuredTypes_ClassCallback value) {
  final result = _smoke_LambdasWithStructuredTypes_ClassCallback_create_proxy(
    __lib.cacheObject(value),
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_LambdasWithStructuredTypes_ClassCallback_call_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_LambdasWithStructuredTypes_ClassCallback_get_raw_pointer(result)] = value;
  return result;
}
LambdasWithStructuredTypes_ClassCallback smoke_LambdasWithStructuredTypes_ClassCallback_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_LambdasWithStructuredTypes_ClassCallback_get_raw_pointer(handle)] as LambdasWithStructuredTypes_ClassCallback;
  if (instance != null) return instance;
  final _impl = LambdasWithStructuredTypes_ClassCallback__Impl(_smoke_LambdasWithStructuredTypes_ClassCallback_copy_handle(handle));
  return (LambdasInterface p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smoke_LambdasWithStructuredTypes_ClassCallback_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_LambdasWithStructuredTypes_ClassCallback_release_handle(handle);
// Nullable LambdasWithStructuredTypes_ClassCallback
final _smoke_LambdasWithStructuredTypes_ClassCallback_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_create_handle_nullable');
final _smoke_LambdasWithStructuredTypes_ClassCallback_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_release_handle_nullable');
final _smoke_LambdasWithStructuredTypes_ClassCallback_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_get_value_nullable');
Pointer<Void> smoke_LambdasWithStructuredTypes_ClassCallback_toFfi_nullable(LambdasWithStructuredTypes_ClassCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_LambdasWithStructuredTypes_ClassCallback_toFfi(value);
  final result = _smoke_LambdasWithStructuredTypes_ClassCallback_create_handle_nullable(_handle);
  smoke_LambdasWithStructuredTypes_ClassCallback_releaseFfiHandle(_handle);
  return result;
}
LambdasWithStructuredTypes_ClassCallback smoke_LambdasWithStructuredTypes_ClassCallback_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_LambdasWithStructuredTypes_ClassCallback_get_value_nullable(handle);
  final result = smoke_LambdasWithStructuredTypes_ClassCallback_fromFfi(_handle);
  smoke_LambdasWithStructuredTypes_ClassCallback_releaseFfiHandle(_handle);
  return result;
}
void smoke_LambdasWithStructuredTypes_ClassCallback_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_LambdasWithStructuredTypes_ClassCallback_release_handle_nullable(handle);
// End of LambdasWithStructuredTypes_ClassCallback "private" section.
typedef LambdasWithStructuredTypes_StructCallback = void Function(LambdasDeclarationOrder_SomeStruct);
// LambdasWithStructuredTypes_StructCallback "private" section, not exported.
final _smoke_LambdasWithStructuredTypes_StructCallback_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_copy_handle');
final _smoke_LambdasWithStructuredTypes_StructCallback_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_release_handle');
final _smoke_LambdasWithStructuredTypes_StructCallback_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_create_proxy');
final _smoke_LambdasWithStructuredTypes_StructCallback_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_LambdasWithStructuredTypes_StructCallback_get_raw_pointer');
class LambdasWithStructuredTypes_StructCallback__Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  LambdasWithStructuredTypes_StructCallback__Impl(this.handle);
  void release() => _smoke_LambdasWithStructuredTypes_StructCallback_release_handle(handle);
  call(LambdasDeclarationOrder_SomeStruct p0) {
    final _call_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_StructCallback_call__SomeStruct');
    final _p0_handle = smoke_LambdasDeclarationOrder_SomeStruct_toFfi(p0);
    final __result_handle = _call_ffi(_handle, _p0_handle);
    smoke_LambdasDeclarationOrder_SomeStruct_releaseFfiHandle(_p0_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _LambdasWithStructuredTypes_StructCallback_call_static(int _token, Pointer<Void> p0) {
  (__lib.instanceCache[_token] as LambdasWithStructuredTypes_StructCallback)(smoke_LambdasDeclarationOrder_SomeStruct_fromFfi(p0));
  smoke_LambdasDeclarationOrder_SomeStruct_releaseFfiHandle(p0);
  return 0;
}
Pointer<Void> smoke_LambdasWithStructuredTypes_StructCallback_toFfi(LambdasWithStructuredTypes_StructCallback value) {
  final result = _smoke_LambdasWithStructuredTypes_StructCallback_create_proxy(
    __lib.cacheObject(value),
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_LambdasWithStructuredTypes_StructCallback_call_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_LambdasWithStructuredTypes_StructCallback_get_raw_pointer(result)] = value;
  return result;
}
LambdasWithStructuredTypes_StructCallback smoke_LambdasWithStructuredTypes_StructCallback_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_LambdasWithStructuredTypes_StructCallback_get_raw_pointer(handle)] as LambdasWithStructuredTypes_StructCallback;
  if (instance != null) return instance;
  final _impl = LambdasWithStructuredTypes_StructCallback__Impl(_smoke_LambdasWithStructuredTypes_StructCallback_copy_handle(handle));
  return (LambdasDeclarationOrder_SomeStruct p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smoke_LambdasWithStructuredTypes_StructCallback_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_LambdasWithStructuredTypes_StructCallback_release_handle(handle);
// Nullable LambdasWithStructuredTypes_StructCallback
final _smoke_LambdasWithStructuredTypes_StructCallback_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_create_handle_nullable');
final _smoke_LambdasWithStructuredTypes_StructCallback_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_release_handle_nullable');
final _smoke_LambdasWithStructuredTypes_StructCallback_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_get_value_nullable');
Pointer<Void> smoke_LambdasWithStructuredTypes_StructCallback_toFfi_nullable(LambdasWithStructuredTypes_StructCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_LambdasWithStructuredTypes_StructCallback_toFfi(value);
  final result = _smoke_LambdasWithStructuredTypes_StructCallback_create_handle_nullable(_handle);
  smoke_LambdasWithStructuredTypes_StructCallback_releaseFfiHandle(_handle);
  return result;
}
LambdasWithStructuredTypes_StructCallback smoke_LambdasWithStructuredTypes_StructCallback_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_LambdasWithStructuredTypes_StructCallback_get_value_nullable(handle);
  final result = smoke_LambdasWithStructuredTypes_StructCallback_fromFfi(_handle);
  smoke_LambdasWithStructuredTypes_StructCallback_releaseFfiHandle(_handle);
  return result;
}
void smoke_LambdasWithStructuredTypes_StructCallback_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_LambdasWithStructuredTypes_StructCallback_release_handle_nullable(handle);
// End of LambdasWithStructuredTypes_StructCallback "private" section.
