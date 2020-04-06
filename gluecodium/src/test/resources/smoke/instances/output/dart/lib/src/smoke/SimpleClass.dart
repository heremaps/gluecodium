import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;

abstract class SimpleClass {
  void release();
  String getStringValue();
  SimpleClass useSimpleClass(SimpleClass input);
}
// SimpleClass "private" section, not exported.
final _smoke_SimpleClass_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleClass_copy_handle');
final _smoke_SimpleClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleClass_release_handle');
class SimpleClass$Impl implements SimpleClass {
  final Pointer<Void> handle;
  SimpleClass$Impl(this.handle);
  @override
  void release() => _smoke_SimpleClass_release_handle(handle);
  @override
  String getStringValue() {
    final _getStringValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SimpleClass_getStringValue');
    final _handle = this.handle;
    final __result_handle = _getStringValue_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  SimpleClass useSimpleClass(SimpleClass input) {
    final _useSimpleClass_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SimpleClass_useSimpleClass__SimpleClass');
    final _input_handle = smoke_SimpleClass_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _useSimpleClass_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    smoke_SimpleClass_releaseFfiHandle(_input_handle);
    final _result = smoke_SimpleClass_fromFfi(__result_handle);
    smoke_SimpleClass_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_SimpleClass_toFfi(SimpleClass value) =>
  _smoke_SimpleClass_copy_handle((value as SimpleClass$Impl).handle);
SimpleClass smoke_SimpleClass_fromFfi(Pointer<Void> handle) =>
  SimpleClass$Impl(_smoke_SimpleClass_copy_handle(handle));
void smoke_SimpleClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SimpleClass_release_handle(handle);
Pointer<Void> smoke_SimpleClass_toFfi_nullable(SimpleClass value) =>
  value != null ? smoke_SimpleClass_toFfi(value) : Pointer<Void>.fromAddress(0);
SimpleClass smoke_SimpleClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SimpleClass_fromFfi(handle) : null;
void smoke_SimpleClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SimpleClass_release_handle(handle);
// End of SimpleClass "private" section.
