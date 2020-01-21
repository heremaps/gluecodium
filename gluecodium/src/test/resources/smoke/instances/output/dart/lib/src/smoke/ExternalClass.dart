import 'package:library/src/String__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ExternalClass_release_handle');
class ExternalClass {
  final Pointer<Void> _handle;
  ExternalClass._(this._handle);
  void release() => __release_handle(_handle);
  someMethod(int someParameter) {
    final _someMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int8), void Function(Pointer<Void>, int)>('smoke_ExternalClass_someMethod__Byte');
    final _someParameter_handle = (someParameter);
    final __result_handle = _someMethod_ffi(_handle, _someParameter_handle);
    (_someParameter_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  String get someProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_ExternalClass_someProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_ExternalClass_toFfi(ExternalClass value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
ExternalClass smoke_ExternalClass_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? ExternalClass._(handle) : null;
void smoke_ExternalClass_releaseFfiHandle(Pointer<Void> handle) {}
enum ExternalClass_SomeEnum {
    someValue
}
class ExternalClass_SomeStruct {
  String someField;
  ExternalClass_SomeStruct(this.someField);
}
// ExternalClass_SomeStruct "private" section, not exported.
final _smoke_ExternalClass_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalClass_SomeStruct_create_handle');
final _smoke_ExternalClass_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_ExternalClass_SomeStruct_release_handle');
final _smoke_ExternalClass_SomeStruct_get_field_someField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_ExternalClass_SomeStruct_get_field_someField');
Pointer<Void> smoke_ExternalClass_SomeStruct_toFfi(ExternalClass_SomeStruct value) {
  final _someField_handle = String_toFfi(value.someField);
  final _result = _smoke_ExternalClass_SomeStruct_create_handle(_someField_handle);
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
ExternalClass_SomeStruct smoke_ExternalClass_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_ExternalClass_SomeStruct_get_field_someField(handle);
  final _result = ExternalClass_SomeStruct(
    String_fromFfi(_someField_handle)
  );
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
void smoke_ExternalClass_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_ExternalClass_SomeStruct_release_handle(handle);
// End of ExternalClass_SomeStruct "private" section.
