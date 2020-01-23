import 'package:library/src/String__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class ExternalInterface {
  void release();
  someMethod(int someParameter);
  String get someProperty;
}
enum ExternalInterface_SomeEnum {
    someValue
}
class ExternalInterface_SomeStruct {
  String someField;
  ExternalInterface_SomeStruct(this.someField);
}
// "Private" section, not exported.
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ExternalInterface_release_handle');
class ExternalInterface__Impl implements ExternalInterface{
  final Pointer<Void> _handle;
  ExternalInterface__Impl._(this._handle);
  void release() => __release_handle(_handle);
  @override
  someMethod(int someParameter) {
    final _someMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int8), void Function(Pointer<Void>, int)>('smoke_ExternalInterface_someMethod__Byte');
    final _someParameter_handle = (someParameter);
    final __result_handle = _someMethod_ffi(_handle, _someParameter_handle);
    (_someParameter_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  String get someProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_ExternalInterface_someProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_ExternalInterface_toFfi(ExternalInterface__Impl value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
ExternalInterface smoke_ExternalInterface_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? ExternalInterface__Impl._(handle) : null;
void smoke_ExternalInterface_releaseFfiHandle(Pointer<Void> handle) {}
