import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
/// @nodoc
abstract class InternalClassWithStaticProperty {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  /// @nodoc
  static String get internal_fooBar => InternalClassWithStaticProperty$Impl.internal_fooBar;
  /// @nodoc
  static set internal_fooBar(String value) { InternalClassWithStaticProperty$Impl.internal_fooBar = value; }
}
// InternalClassWithStaticProperty "private" section, not exported.
final _smoke_InternalClassWithStaticProperty_register_finalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_InternalClassWithStaticProperty_register_finalizer'));
final _smoke_InternalClassWithStaticProperty_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InternalClassWithStaticProperty_copy_handle'));
final _smoke_InternalClassWithStaticProperty_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InternalClassWithStaticProperty_release_handle'));
class InternalClassWithStaticProperty$Impl implements InternalClassWithStaticProperty {
  @protected
  Pointer<Void> handle;
  InternalClassWithStaticProperty$Impl(this.handle);
  @override
  void release() {}
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
  _smoke_InternalClassWithStaticProperty_copy_handle((value as InternalClassWithStaticProperty$Impl).handle);
InternalClassWithStaticProperty smoke_InternalClassWithStaticProperty_fromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InternalClassWithStaticProperty) return instance as InternalClassWithStaticProperty;
  final _copied_handle = _smoke_InternalClassWithStaticProperty_copy_handle(handle);
  final result = InternalClassWithStaticProperty$Impl(_copied_handle);
  __lib.cacheInstance(_copied_handle, result, _smoke_InternalClassWithStaticProperty_register_finalizer);
  return result;
}
void smoke_InternalClassWithStaticProperty_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_InternalClassWithStaticProperty_release_handle(handle);
Pointer<Void> smoke_InternalClassWithStaticProperty_toFfi_nullable(InternalClassWithStaticProperty value) =>
  value != null ? smoke_InternalClassWithStaticProperty_toFfi(value) : Pointer<Void>.fromAddress(0);
InternalClassWithStaticProperty smoke_InternalClassWithStaticProperty_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InternalClassWithStaticProperty_fromFfi(handle) : null;
void smoke_InternalClassWithStaticProperty_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_InternalClassWithStaticProperty_release_handle(handle);
// End of InternalClassWithStaticProperty "private" section.
