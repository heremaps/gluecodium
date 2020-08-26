import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
abstract class InternalClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
// InternalClass "private" section, not exported.
final _smoke_InternalClass_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClass_copy_handle'));
final _smoke_InternalClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClass_release_handle'));
final _smoke_InternalClass_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_InternalClass_get_raw_pointer'));
class InternalClass$Impl implements InternalClass {
  @protected
  Pointer<Void> handle;
  InternalClass$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_InternalClass_get_raw_pointer(handle));
    _smoke_InternalClass_release_handle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_InternalClass_toFfi(InternalClass value) =>
  _smoke_InternalClass_copy_handle((value as InternalClass$Impl).handle);
InternalClass smoke_InternalClass_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_InternalClass_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as InternalClass;
  if (instance != null) return instance;
  final _copied_handle = _smoke_InternalClass_copy_handle(handle);
  final result = InternalClass$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
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
