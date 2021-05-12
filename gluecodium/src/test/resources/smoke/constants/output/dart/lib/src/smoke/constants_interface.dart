import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ConstantsInterface {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static final bool boolConstant = true;
  static final int intConstant = -11;
  static final int uintConstant = 4294967295;
  static final double floatConstant = 2.71;
  static final double doubleConstant = -3.14;
  static final String stringConstant = "Foo bar";
  static final ConstantsInterface_StateEnum enumConstant = ConstantsInterface_StateEnum.on;
}
enum ConstantsInterface_StateEnum {
    off,
    on
}
// ConstantsInterface_StateEnum "private" section, not exported.
int smokeConstantsinterfaceStateenumToFfi(ConstantsInterface_StateEnum value) {
  switch (value) {
  case ConstantsInterface_StateEnum.off:
    return 0;
  break;
  case ConstantsInterface_StateEnum.on:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for ConstantsInterface_StateEnum enum.");
  }
}
ConstantsInterface_StateEnum smokeConstantsinterfaceStateenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ConstantsInterface_StateEnum.off;
  break;
  case 1:
    return ConstantsInterface_StateEnum.on;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ConstantsInterface_StateEnum enum.");
  }
}
void smokeConstantsinterfaceStateenumReleaseFfiHandle(int handle) {}
final _smokeConstantsinterfaceStateenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ConstantsInterface_StateEnum_create_handle_nullable'));
final _smokeConstantsinterfaceStateenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ConstantsInterface_StateEnum_release_handle_nullable'));
final _smokeConstantsinterfaceStateenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ConstantsInterface_StateEnum_get_value_nullable'));
Pointer<Void> smokeConstantsinterfaceStateenumToFfiNullable(ConstantsInterface_StateEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeConstantsinterfaceStateenumToFfi(value);
  final result = _smokeConstantsinterfaceStateenumCreateHandleNullable(_handle);
  smokeConstantsinterfaceStateenumReleaseFfiHandle(_handle);
  return result;
}
ConstantsInterface_StateEnum smokeConstantsinterfaceStateenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeConstantsinterfaceStateenumGetValueNullable(handle);
  final result = smokeConstantsinterfaceStateenumFromFfi(_handle);
  smokeConstantsinterfaceStateenumReleaseFfiHandle(_handle);
  return result;
}
void smokeConstantsinterfaceStateenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeConstantsinterfaceStateenumReleaseHandleNullable(handle);
// End of ConstantsInterface_StateEnum "private" section.
// ConstantsInterface "private" section, not exported.
final _smokeConstantsinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ConstantsInterface_copy_handle'));
final _smokeConstantsinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ConstantsInterface_release_handle'));
class ConstantsInterface$Impl extends __lib.NativeBase implements ConstantsInterface {
  ConstantsInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeConstantsinterfaceReleaseHandle(handle);
    handle = null;
  }
}
Pointer<Void> smokeConstantsinterfaceToFfi(ConstantsInterface value) =>
  _smokeConstantsinterfaceCopyHandle((value as __lib.NativeBase).handle);
ConstantsInterface smokeConstantsinterfaceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ConstantsInterface;
  if (instance != null) return instance;
  final _copiedHandle = _smokeConstantsinterfaceCopyHandle(handle);
  final result = ConstantsInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeConstantsinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeConstantsinterfaceReleaseHandle(handle);
Pointer<Void> smokeConstantsinterfaceToFfiNullable(ConstantsInterface value) =>
  value != null ? smokeConstantsinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
ConstantsInterface smokeConstantsinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeConstantsinterfaceFromFfi(handle) : null;
void smokeConstantsinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeConstantsinterfaceReleaseHandle(handle);
// End of ConstantsInterface "private" section.
