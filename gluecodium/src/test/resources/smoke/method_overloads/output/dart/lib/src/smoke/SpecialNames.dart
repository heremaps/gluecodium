import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_SpecialNames_release_handle');
class SpecialNames {
  final Pointer<Void> _handle;
  SpecialNames._(this._handle);
  void release() => __release_handle(_handle);
  create() {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('smoke_SpecialNames_create');
    final __result_handle = _create_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  reallyRelease() {
    final _reallyRelease_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('smoke_SpecialNames_release');
    final __result_handle = _reallyRelease_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  createProxy() {
    final _createProxy_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('smoke_SpecialNames_createProxy');
    final __result_handle = _createProxy_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  Uppercase() {
    final _Uppercase_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('smoke_SpecialNames_Uppercase');
    final __result_handle = _Uppercase_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_SpecialNames_toFfi(SpecialNames value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
SpecialNames smoke_SpecialNames_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? SpecialNames._(handle) : null;
void smoke_SpecialNames_releaseFfiHandle(Pointer<Void> handle) {}
