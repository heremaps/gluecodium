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
Pointer<Void> smoke_SimpleInterface_toFfi(SimpleInterface__Impl value) =>
  _smoke_SimpleInterface_copy_handle(value._handle);
SimpleInterface smoke_SimpleInterface_fromFfi(Pointer<Void> handle) =>
  SimpleInterface__Impl(_smoke_SimpleInterface_copy_handle(handle));
void smoke_SimpleInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SimpleInterface_release_handle(handle);
Pointer<Void> smoke_SimpleInterface_toFfi_nullable(SimpleInterface__Impl value) =>
  value != null ? smoke_SimpleInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
SimpleInterface smoke_SimpleInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SimpleInterface_fromFfi(handle) : null;
void smoke_SimpleInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SimpleInterface_release_handle(handle);
// End of SimpleInterface "private" section.
