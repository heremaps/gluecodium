import 'package:library/src/String__conversion.dart';
import 'package:library/src/_library_init.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class SimpleInterface {
  void release();
  String getStringValue();
  SimpleInterface useSimpleInterface(SimpleInterface input);
}
// "Private" section, not exported.
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_SimpleInterface_release_handle');
class SimpleInterface__Impl implements SimpleInterface{
  final Pointer<Void> _handle;
  SimpleInterface__Impl._(this._handle);
  void release() => __release_handle(_handle);
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
    final _result = smoke_SimpleInterface_fromFfi(__result_handle);
    smoke_SimpleInterface_releaseFfiHandle(__result_handle);
    smoke_SimpleInterface_releaseFfiHandle(_input_handle);
    return _result;
  }
}
Pointer<Void> smoke_SimpleInterface_toFfi(SimpleInterface__Impl value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
SimpleInterface smoke_SimpleInterface_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? SimpleInterface__Impl._(handle) : null;
void smoke_SimpleInterface_releaseFfiHandle(Pointer<Void> handle) {}
