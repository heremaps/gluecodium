import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/comments.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class UnicodeComments {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  /// Süßölgefäß
  /// [input] שלום
  /// Returns [bool]. товарищ
  /// Throws [Comments_SomethingWrongException]. ネコ
  bool someMethodWithAllComments(String input);
}
// UnicodeComments "private" section, not exported.
final _smoke_UnicodeComments_register_finalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_UnicodeComments_register_finalizer'));
final _smoke_UnicodeComments_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_copy_handle'));
final _smoke_UnicodeComments_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_release_handle'));
final _someMethodWithAllComments_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_release_handle'));
final _someMethodWithAllComments_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_get_result'));
final _someMethodWithAllComments_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_get_error'));
final _someMethodWithAllComments_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_UnicodeComments_someMethodWithAllComments__String_return_has_error'));
class UnicodeComments$Impl implements UnicodeComments {
  @protected
  Pointer<Void> handle;
  UnicodeComments$Impl(this.handle);
  @override
  void release() {}
  @override
  bool someMethodWithAllComments(String input) {
    final _someMethodWithAllComments_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_UnicodeComments_someMethodWithAllComments__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __call_result_handle = _someMethodWithAllComments_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    if (_someMethodWithAllComments_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _someMethodWithAllComments_return_get_error(__call_result_handle);
        _someMethodWithAllComments_return_release_handle(__call_result_handle);
        try {
          throw Comments_SomethingWrongException(smoke_Comments_SomeEnum_fromFfi(__error_handle));
        } finally {
          smoke_Comments_SomeEnum_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _someMethodWithAllComments_return_get_result(__call_result_handle);
    _someMethodWithAllComments_return_release_handle(__call_result_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_UnicodeComments_toFfi(UnicodeComments value) =>
  _smoke_UnicodeComments_copy_handle((value as UnicodeComments$Impl).handle);
UnicodeComments smoke_UnicodeComments_fromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is UnicodeComments) return instance as UnicodeComments;
  final _copied_handle = _smoke_UnicodeComments_copy_handle(handle);
  final result = UnicodeComments$Impl(_copied_handle);
  __lib.cacheInstance(_copied_handle, result, _smoke_UnicodeComments_register_finalizer);
  return result;
}
void smoke_UnicodeComments_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_UnicodeComments_release_handle(handle);
Pointer<Void> smoke_UnicodeComments_toFfi_nullable(UnicodeComments value) =>
  value != null ? smoke_UnicodeComments_toFfi(value) : Pointer<Void>.fromAddress(0);
UnicodeComments smoke_UnicodeComments_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_UnicodeComments_fromFfi(handle) : null;
void smoke_UnicodeComments_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_UnicodeComments_release_handle(handle);
// End of UnicodeComments "private" section.
