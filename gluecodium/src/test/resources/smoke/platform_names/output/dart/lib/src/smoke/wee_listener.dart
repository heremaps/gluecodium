import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
abstract class weeListener {
  factory weeListener(
    void Function(String) WeeMethodLambda,
  ) => weeListener$Lambdas(
    WeeMethodLambda,
  );
  /// @nodoc
  @Deprecated("Does nothing")
  void release() {}
  void WeeMethod(String WeeParameter);
}
// weeListener "private" section, not exported.
final _smokePlatformnameslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_PlatformNamesListener_register_finalizer'));
final _smokePlatformnameslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNamesListener_copy_handle'));
final _smokePlatformnameslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNamesListener_release_handle'));
final _smokePlatformnameslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('library_smoke_PlatformNamesListener_create_proxy'));
final _smokePlatformnameslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNamesListener_get_type_id'));
class weeListener$Lambdas implements weeListener {
  void Function(String) WeeMethodLambda;
  weeListener$Lambdas(
    this.WeeMethodLambda,
  );
  @override
  void release() {}
  @override
  void WeeMethod(String WeeParameter) =>
    WeeMethodLambda(WeeParameter);
}
class weeListener$Impl extends __lib.NativeBase implements weeListener {
  weeListener$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {}
  @override
  void WeeMethod(String WeeParameter) {
    final _WeeMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_PlatformNamesListener_basicMethod__String'));
    final _WeeParameterHandle = stringToFfi(WeeParameter);
    final _handle = this.handle;
    _WeeMethodFfi(_handle, __lib.LibraryContext.isolateId, _WeeParameterHandle);
    stringReleaseFfiHandle(_WeeParameterHandle);
  }
}
int _smokePlatformnameslistenerWeeMethodStatic(Object _obj, Pointer<Void> WeeParameter) {
  try {
    (_obj as weeListener).WeeMethod(stringFromFfi(WeeParameter));
  } finally {
    stringReleaseFfiHandle(WeeParameter);
  }
  return 0;
}
Pointer<Void> smokePlatformnameslistenerToFfi(weeListener value) {
  if (value is __lib.NativeBase) return _smokePlatformnameslistenerCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokePlatformnameslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_smokePlatformnameslistenerWeeMethodStatic, __lib.unknownError)
  );
  return result;
}
weeListener smokePlatformnameslistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is weeListener) return instance as weeListener;
  final _typeIdHandle = _smokePlatformnameslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokePlatformnameslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : weeListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokePlatformnameslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokePlatformnameslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _smokePlatformnameslistenerReleaseHandle(handle);
Pointer<Void> smokePlatformnameslistenerToFfiNullable(weeListener? value) =>
  value != null ? smokePlatformnameslistenerToFfi(value) : Pointer<Void>.fromAddress(0);
weeListener? smokePlatformnameslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokePlatformnameslistenerFromFfi(handle) : null;
void smokePlatformnameslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePlatformnameslistenerReleaseHandle(handle);
// End of weeListener "private" section.
