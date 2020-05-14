import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// This looks internal
/// @nodoc
abstract class InternalClassWithComments {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// This is definitely internal
  /// @nodoc
  internal_doNothing();
}
// InternalClassWithComments "private" section, not exported.
final _smoke_InternalClassWithComments_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClassWithComments_copy_handle');
final _smoke_InternalClassWithComments_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClassWithComments_release_handle');
final _smoke_InternalClassWithComments_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_InternalClassWithComments_get_raw_pointer');
class InternalClassWithComments$Impl implements InternalClassWithComments {
  @protected
  Pointer<Void> handle;
  InternalClassWithComments$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_InternalClassWithComments_get_raw_pointer(handle));
    _smoke_InternalClassWithComments_release_handle(handle);
    handle = null;
  }
  @override
  internal_doNothing() {
    final _doNothing_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalClassWithComments_doNothing');
    final _handle = this.handle;
    final __result_handle = _doNothing_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_InternalClassWithComments_toFfi(InternalClassWithComments value) =>
  _smoke_InternalClassWithComments_copy_handle((value as InternalClassWithComments$Impl).handle);
InternalClassWithComments smoke_InternalClassWithComments_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_InternalClassWithComments_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as InternalClassWithComments;
  if (instance != null) return instance;
  final _copied_handle = _smoke_InternalClassWithComments_copy_handle(handle);
  final result = InternalClassWithComments$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_InternalClassWithComments_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_InternalClassWithComments_release_handle(handle);
Pointer<Void> smoke_InternalClassWithComments_toFfi_nullable(InternalClassWithComments value) =>
  value != null ? smoke_InternalClassWithComments_toFfi(value) : Pointer<Void>.fromAddress(0);
InternalClassWithComments smoke_InternalClassWithComments_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InternalClassWithComments_fromFfi(handle) : null;
void smoke_InternalClassWithComments_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_InternalClassWithComments_release_handle(handle);
// End of InternalClassWithComments "private" section.
