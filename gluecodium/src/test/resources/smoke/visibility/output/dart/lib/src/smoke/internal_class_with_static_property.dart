import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
abstract class InternalClassWithStaticProperty {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  /// @nodoc
  static String get internal_fooBar => InternalClassWithStaticProperty$Impl.internal_fooBar;
  /// @nodoc
  static set internal_fooBar(String value) { InternalClassWithStaticProperty$Impl.internal_fooBar = value; }
}
// InternalClassWithStaticProperty "private" section, not exported.
final _smoke_InternalClassWithStaticProperty_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClassWithStaticProperty_copy_handle'));
final _smoke_InternalClassWithStaticProperty_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClassWithStaticProperty_release_handle'));
class InternalClassWithStaticProperty$Impl extends __lib.NativeBase implements InternalClassWithStaticProperty {
  InternalClassWithStaticProperty$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_InternalClassWithStaticProperty_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  static String get internal_fooBar {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_InternalClassWithStaticProperty_fooBar_get'));
    final __result_handle = _get_ffi(__lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  static set internal_fooBar(String value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('library_smoke_InternalClassWithStaticProperty_fooBar_set__String'));
    final _value_handle = String_toFfi(value);
    final __result_handle = _set_ffi(__lib.LibraryContext.isolateId, _value_handle);
    String_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_InternalClassWithStaticProperty_toFfi(InternalClassWithStaticProperty value) =>
  _smoke_InternalClassWithStaticProperty_copy_handle((value as __lib.NativeBase).handle);
InternalClassWithStaticProperty smoke_InternalClassWithStaticProperty_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is InternalClassWithStaticProperty) return instance;
  final _copied_handle = _smoke_InternalClassWithStaticProperty_copy_handle(handle);
  final result = InternalClassWithStaticProperty$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_InternalClassWithStaticProperty_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_InternalClassWithStaticProperty_release_handle(handle);
Pointer<Void> smoke_InternalClassWithStaticProperty_toFfi_nullable(InternalClassWithStaticProperty? value) =>
  value != null ? smoke_InternalClassWithStaticProperty_toFfi(value) : Pointer<Void>.fromAddress(0);
InternalClassWithStaticProperty? smoke_InternalClassWithStaticProperty_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InternalClassWithStaticProperty_fromFfi(handle) : null;
void smoke_InternalClassWithStaticProperty_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_InternalClassWithStaticProperty_release_handle(handle);
// End of InternalClassWithStaticProperty "private" section.
