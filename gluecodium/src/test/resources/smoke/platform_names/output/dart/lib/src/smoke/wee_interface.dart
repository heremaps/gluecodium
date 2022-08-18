import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/wee_types.dart';
import 'package:meta/meta.dart';
abstract class weeInterface {
  factory weeInterface.make(String makeParameter) => $prototype.make(makeParameter);
  weeTypes_weeStruct WeeMethod(String WeeParameter);
  int get WEE_PROPERTY;
  set WEE_PROPERTY(int value);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = weeInterface$Impl(Pointer<Void>.fromAddress(0));
}
// weeInterface "private" section, not exported.
final _smokePlatformnamesinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_PlatformNamesInterface_register_finalizer'));
final _smokePlatformnamesinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNamesInterface_copy_handle'));
final _smokePlatformnamesinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNamesInterface_release_handle'));
/// @nodoc
@visibleForTesting
class weeInterface$Impl extends __lib.NativeBase implements weeInterface {
  weeInterface$Impl(Pointer<Void> handle) : super(handle);
  weeInterface make(String makeParameter) {
    final _result_handle = _make(makeParameter);
    final _result = weeInterface$Impl(_result_handle);
    __lib.cacheInstance(_result_handle, _result);
    _smokePlatformnamesinterfaceRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }
  @override
  weeTypes_weeStruct WeeMethod(String WeeParameter) {
    final _WeeMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PlatformNamesInterface_basicMethod__String'));
    final _WeeParameterHandle = stringToFfi(WeeParameter);
    final _handle = this.handle;
    final __resultHandle = _WeeMethodFfi(_handle, __lib.LibraryContext.isolateId, _WeeParameterHandle);
    stringReleaseFfiHandle(_WeeParameterHandle);
    try {
      return smokePlatformnamesBasicstructFromFfi(__resultHandle);
    } finally {
      smokePlatformnamesBasicstructReleaseFfiHandle(__resultHandle);
    }
  }
  static Pointer<Void> _make(String makeParameter) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_PlatformNamesInterface_create__String'));
    final _makeParameterHandle = stringToFfi(makeParameter);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _makeParameterHandle);
    stringReleaseFfiHandle(_makeParameterHandle);
    return __resultHandle;
  }
  @override
  int get WEE_PROPERTY {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_PlatformNamesInterface_basicProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
    }
  }
  @override
  set WEE_PROPERTY(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_smoke_PlatformNamesInterface_basicProperty_set__UInt'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
  }
}
Pointer<Void> smokePlatformnamesinterfaceToFfi(weeInterface value) =>
  _smokePlatformnamesinterfaceCopyHandle((value as __lib.NativeBase).handle);
weeInterface smokePlatformnamesinterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is weeInterface) return instance;
  final _copiedHandle = _smokePlatformnamesinterfaceCopyHandle(handle);
  final result = weeInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokePlatformnamesinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokePlatformnamesinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokePlatformnamesinterfaceReleaseHandle(handle);
Pointer<Void> smokePlatformnamesinterfaceToFfiNullable(weeInterface? value) =>
  value != null ? smokePlatformnamesinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
weeInterface? smokePlatformnamesinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokePlatformnamesinterfaceFromFfi(handle) : null;
void smokePlatformnamesinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePlatformnamesinterfaceReleaseHandle(handle);
// End of weeInterface "private" section.
