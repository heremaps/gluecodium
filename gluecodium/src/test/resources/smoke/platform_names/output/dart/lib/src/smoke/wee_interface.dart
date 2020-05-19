import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/wee_types.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class weeInterface {
  factory weeInterface(String makeParameter) => weeInterface$Impl.make(makeParameter);
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  weeStruct WeeMethod(String WeeParameter);
  int get WEE_PROPERTY;
  set WEE_PROPERTY(int value);
}
// weeInterface "private" section, not exported.
final _smoke_PlatformNamesInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNamesInterface_copy_handle');
final _smoke_PlatformNamesInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNamesInterface_release_handle');
final _smoke_PlatformNamesInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_PlatformNamesInterface_get_raw_pointer');
class weeInterface$Impl implements weeInterface {
  @protected
  Pointer<Void> handle;
  weeInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_PlatformNamesInterface_get_raw_pointer(handle));
    _smoke_PlatformNamesInterface_release_handle(handle);
    handle = null;
  }
  weeInterface$Impl.make(String makeParameter) : handle = _make(makeParameter) {
    __lib.reverseCache[_smoke_PlatformNamesInterface_get_raw_pointer(handle)] = this;
  }
  @override
  weeStruct WeeMethod(String WeeParameter) {
    final _WeeMethod_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PlatformNamesInterface_basicMethod__String');
    final _WeeParameter_handle = String_toFfi(WeeParameter);
    final _handle = this.handle;
    final __result_handle = _WeeMethod_ffi(_handle, __lib.LibraryContext.isolateId, _WeeParameter_handle);
    String_releaseFfiHandle(_WeeParameter_handle);
    final _result = smoke_PlatformNames_BasicStruct_fromFfi(__result_handle);
    smoke_PlatformNames_BasicStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
  static Pointer<Void> _make(String makeParameter) {
    final _make_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_PlatformNamesInterface_create__String');
    final _makeParameter_handle = String_toFfi(makeParameter);
    final __result_handle = _make_ffi(__lib.LibraryContext.isolateId, _makeParameter_handle);
    String_releaseFfiHandle(_makeParameter_handle);
    return __result_handle;
  }
  @override
  int get WEE_PROPERTY {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_PlatformNamesInterface_basicProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  set WEE_PROPERTY(int value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_smoke_PlatformNamesInterface_basicProperty_set__UInt');
    final _value_handle = (value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    (_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_PlatformNamesInterface_toFfi(weeInterface value) =>
  _smoke_PlatformNamesInterface_copy_handle((value as weeInterface$Impl).handle);
weeInterface smoke_PlatformNamesInterface_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_PlatformNamesInterface_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as weeInterface;
  if (instance != null) return instance;
  final _copied_handle = _smoke_PlatformNamesInterface_copy_handle(handle);
  final result = weeInterface$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_PlatformNamesInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_PlatformNamesInterface_release_handle(handle);
Pointer<Void> smoke_PlatformNamesInterface_toFfi_nullable(weeInterface value) =>
  value != null ? smoke_PlatformNamesInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
weeInterface smoke_PlatformNamesInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_PlatformNamesInterface_fromFfi(handle) : null;
void smoke_PlatformNamesInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PlatformNamesInterface_release_handle(handle);
// End of weeInterface "private" section.
