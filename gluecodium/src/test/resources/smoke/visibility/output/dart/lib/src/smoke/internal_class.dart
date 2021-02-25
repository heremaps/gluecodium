import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
abstract class InternalClass {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  /// @nodoc
  internal_fooBar();
}
// InternalClass "private" section, not exported.
final _smoke_InternalClass_register_finalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_InternalClass_register_finalizer'));
final _smoke_InternalClass_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClass_copy_handle'));
final _smoke_InternalClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClass_release_handle'));
class InternalClass$Impl implements InternalClass {
  @protected
  Pointer<Void> handle;
  InternalClass$Impl(this.handle);
  @override
  void release() {}
  @override
  internal_fooBar() {
    final _fooBar_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalClass_fooBar'));
    final _handle = this.handle;
    final __result_handle = _fooBar_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_InternalClass_toFfi(InternalClass value) =>
  _smoke_InternalClass_copy_handle((value as InternalClass$Impl).handle);
InternalClass smoke_InternalClass_fromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InternalClass) return instance as InternalClass;
  final _copied_handle = _smoke_InternalClass_copy_handle(handle);
  final result = InternalClass$Impl(_copied_handle);
  __lib.cacheInstance(_copied_handle, result, _smoke_InternalClass_register_finalizer);
  return result;
}
void smoke_InternalClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_InternalClass_release_handle(handle);
Pointer<Void> smoke_InternalClass_toFfi_nullable(InternalClass value) =>
  value != null ? smoke_InternalClass_toFfi(value) : Pointer<Void>.fromAddress(0);
InternalClass smoke_InternalClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InternalClass_fromFfi(handle) : null;
void smoke_InternalClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_InternalClass_release_handle(handle);
// End of InternalClass "private" section.
