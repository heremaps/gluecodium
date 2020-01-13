import 'package:library/src/String__conversion.dart';
import 'package:library/src/_library_init.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_SimpleClass_release_handle');
class SimpleClass {
  final Pointer<Void> _handle;
  SimpleClass._(this._handle);
  void release() => __release_handle(_handle);
  String getStringValue() {
    final _getStringValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_SimpleClass_getStringValue');
    final __result_handle = _getStringValue_ffi(_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  SimpleClass useSimpleClass(SimpleClass input) {
    final _useSimpleClass_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_SimpleClass_useSimpleClass__SimpleClass');
    final _input_handle = smoke_SimpleClass_toFfi(input);
    final __result_handle = _useSimpleClass_ffi(_handle, _input_handle);
    final _result = smoke_SimpleClass_fromFfi(__result_handle);
    smoke_SimpleClass_releaseFfiHandle(__result_handle);
    smoke_SimpleClass_releaseFfiHandle(_input_handle);
    return _result;
  }
}
Pointer<Void> smoke_SimpleClass_toFfi(SimpleClass value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
SimpleClass smoke_SimpleClass_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? SimpleClass._(handle) : null;
void smoke_SimpleClass_releaseFfiHandle(Pointer<Void> handle) {}
