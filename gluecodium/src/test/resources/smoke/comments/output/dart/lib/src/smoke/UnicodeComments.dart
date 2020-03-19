import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/smoke/Comments.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class UnicodeComments {
  void release();
  /// Süßölgefäß
  /// @param[input] שלום
  /// @return товарищ
  /// @throws ネコ
  bool someMethodWithAllComments(String input);
}
// UnicodeComments "private" section, not exported.
final _smoke_UnicodeComments_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_copy_handle');
final _smoke_UnicodeComments_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_release_handle');
final _someMethodWithAllComments_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_release_handle');
final _someMethodWithAllComments_return_get_result = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_get_result');
final _someMethodWithAllComments_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_get_error');
final _someMethodWithAllComments_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_has_error');
class UnicodeComments$Impl implements UnicodeComments {
  final Pointer<Void> handle;
  UnicodeComments$Impl(this.handle);
  @override
  void release() => _smoke_UnicodeComments_release_handle(handle);
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllComments_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_UnicodeComments_someMethodWithAllComments__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __call_result_handle = _someMethodWithAllComments_ffi(_handle, _input_handle);
    String_releaseFfiHandle(_input_handle);
    if (_someMethodWithAllComments_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _someMethodWithAllComments_return_get_error(__call_result_handle);
        _someMethodWithAllComments_return_release_handle(__call_result_handle);
        final _error_value = smoke_Comments_SomeEnum_fromFfi(__error_handle);
        smoke_Comments_SomeEnum_releaseFfiHandle(__error_handle);
        throw Comments_SomethingWrongException(_error_value);
    }
    final __result_handle = _someMethodWithAllComments_return_get_result(__call_result_handle);
    _someMethodWithAllComments_return_release_handle(__call_result_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_UnicodeComments_toFfi(UnicodeComments value) =>
  _smoke_UnicodeComments_copy_handle((value as UnicodeComments$Impl).handle);
UnicodeComments smoke_UnicodeComments_fromFfi(Pointer<Void> handle) =>
  UnicodeComments$Impl(_smoke_UnicodeComments_copy_handle(handle));
void smoke_UnicodeComments_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_UnicodeComments_release_handle(handle);
Pointer<Void> smoke_UnicodeComments_toFfi_nullable(UnicodeComments value) =>
  value != null ? smoke_UnicodeComments_toFfi(value) : Pointer<Void>.fromAddress(0);
UnicodeComments smoke_UnicodeComments_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_UnicodeComments_fromFfi(handle) : null;
void smoke_UnicodeComments_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_UnicodeComments_release_handle(handle);
// End of UnicodeComments "private" section.
