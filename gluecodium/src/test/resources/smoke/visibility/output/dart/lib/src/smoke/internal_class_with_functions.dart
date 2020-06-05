import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
abstract class InternalClassWithFunctions {
  /// @nodoc
  factory InternalClassWithFunctions.make() => InternalClassWithFunctions$Impl.internal_make();
  /// @nodoc
  factory InternalClassWithFunctions.remake(String foo) => InternalClassWithFunctions$Impl.internal_remake(foo);
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// @nodoc
  internal_fooBar();
}
// InternalClassWithFunctions "private" section, not exported.
final _smoke_InternalClassWithFunctions_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClassWithFunctions_copy_handle');
final _smoke_InternalClassWithFunctions_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClassWithFunctions_release_handle');
final _smoke_InternalClassWithFunctions_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_InternalClassWithFunctions_get_raw_pointer');
class InternalClassWithFunctions$Impl implements InternalClassWithFunctions {
  @protected
  Pointer<Void> handle;
  InternalClassWithFunctions$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_InternalClassWithFunctions_get_raw_pointer(handle));
    _smoke_InternalClassWithFunctions_release_handle(handle);
    handle = null;
  }
  InternalClassWithFunctions$Impl.internal_make() : handle = _make() {
    __lib.reverseCache[_smoke_InternalClassWithFunctions_get_raw_pointer(handle)] = this;
  }
  InternalClassWithFunctions$Impl.internal_remake(String foo) : handle = _remake(foo) {
    __lib.reverseCache[_smoke_InternalClassWithFunctions_get_raw_pointer(handle)] = this;
  }
  @override
  internal_fooBar() {
    final _fooBar_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_InternalClassWithFunctions_fooBar');
    final _handle = this.handle;
    final __result_handle = _fooBar_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static Pointer<Void> _make() {
    final _make_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_InternalClassWithFunctions_make');
    final __result_handle = _make_ffi(__lib.LibraryContext.isolateId);
    return __result_handle;
  }
  static Pointer<Void> _remake(String foo) {
    final _remake_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_InternalClassWithFunctions_make__String');
    final _foo_handle = String_toFfi(foo);
    final __result_handle = _remake_ffi(__lib.LibraryContext.isolateId, _foo_handle);
    String_releaseFfiHandle(_foo_handle);
    return __result_handle;
  }
}
Pointer<Void> smoke_InternalClassWithFunctions_toFfi(InternalClassWithFunctions value) =>
  _smoke_InternalClassWithFunctions_copy_handle((value as InternalClassWithFunctions$Impl).handle);
InternalClassWithFunctions smoke_InternalClassWithFunctions_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_InternalClassWithFunctions_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as InternalClassWithFunctions;
  if (instance != null) return instance;
  final _copied_handle = _smoke_InternalClassWithFunctions_copy_handle(handle);
  final result = InternalClassWithFunctions$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_InternalClassWithFunctions_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_InternalClassWithFunctions_release_handle(handle);
Pointer<Void> smoke_InternalClassWithFunctions_toFfi_nullable(InternalClassWithFunctions value) =>
  value != null ? smoke_InternalClassWithFunctions_toFfi(value) : Pointer<Void>.fromAddress(0);
InternalClassWithFunctions smoke_InternalClassWithFunctions_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InternalClassWithFunctions_fromFfi(handle) : null;
void smoke_InternalClassWithFunctions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_InternalClassWithFunctions_release_handle(handle);
// End of InternalClassWithFunctions "private" section.
