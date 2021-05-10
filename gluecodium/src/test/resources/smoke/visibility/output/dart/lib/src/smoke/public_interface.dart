import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/public_class.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class PublicInterface {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
}
/// @nodoc
class PublicInterface_InternalStruct {
  /// @nodoc
  PublicClass_InternalStruct internal_fieldOfInternalType;
  PublicInterface_InternalStruct(this.internal_fieldOfInternalType);
}
// PublicInterface_InternalStruct "private" section, not exported.
final _smokePublicinterfaceInternalstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_create_handle'));
final _smokePublicinterfaceInternalstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_release_handle'));
final _smokePublicinterfaceInternalstructGetFieldfieldOfInternalType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_get_field_fieldOfInternalType'));
Pointer<Void> smoke_PublicInterface_InternalStruct_toFfi(PublicInterface_InternalStruct value) {
  final _fieldOfInternalTypeHandle = smoke_PublicClass_InternalStruct_toFfi(value.internal_fieldOfInternalType);
  final _result = _smokePublicinterfaceInternalstructCreateHandle(_fieldOfInternalTypeHandle);
  smoke_PublicClass_InternalStruct_releaseFfiHandle(_fieldOfInternalTypeHandle);
  return _result;
}
PublicInterface_InternalStruct smoke_PublicInterface_InternalStruct_fromFfi(Pointer<Void> handle) {
  final _fieldOfInternalTypeHandle = _smokePublicinterfaceInternalstructGetFieldfieldOfInternalType(handle);
  try {
    return PublicInterface_InternalStruct(
      smoke_PublicClass_InternalStruct_fromFfi(_fieldOfInternalTypeHandle)
    );
  } finally {
    smoke_PublicClass_InternalStruct_releaseFfiHandle(_fieldOfInternalTypeHandle);
  }
}
void smoke_PublicInterface_InternalStruct_releaseFfiHandle(Pointer<Void> handle) => _smokePublicinterfaceInternalstructReleaseHandle(handle);
// Nullable PublicInterface_InternalStruct
final _smoke_PublicInterface_InternalStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_create_handle_nullable'));
final _smoke_PublicInterface_InternalStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_release_handle_nullable'));
final _smoke_PublicInterface_InternalStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_get_value_nullable'));
Pointer<Void> smoke_PublicInterface_InternalStruct_toFfi_nullable(PublicInterface_InternalStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PublicInterface_InternalStruct_toFfi(value);
  final result = _smoke_PublicInterface_InternalStructCreateHandleNullable(_handle);
  smoke_PublicInterface_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
PublicInterface_InternalStruct smoke_PublicInterface_InternalStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PublicInterface_InternalStructGetValueNullable(handle);
  final result = smoke_PublicInterface_InternalStruct_fromFfi(_handle);
  smoke_PublicInterface_InternalStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_PublicInterface_InternalStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PublicInterface_InternalStructReleaseHandleNullable(handle);
// End of PublicInterface_InternalStruct "private" section.
// PublicInterface "private" section, not exported.
final _smokePublicinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_copy_handle'));
final _smokePublicinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicInterface_release_handle'));
final _smokePublicinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer),
    Pointer<Void> Function(int, int, Pointer)
  >('library_smoke_PublicInterface_create_proxy'));
final _smokePublicinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_get_type_id'));
class PublicInterface$Impl extends __lib.NativeBase implements PublicInterface {
  PublicInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokePublicinterfaceReleaseHandle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_PublicInterface_toFfi(PublicInterface value) {
  if (value is __lib.NativeBase) return _smokePublicinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokePublicinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi
  );
  return result;
}
PublicInterface smoke_PublicInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as PublicInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokePublicinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokePublicinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : PublicInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_PublicInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smokePublicinterfaceReleaseHandle(handle);
Pointer<Void> smoke_PublicInterface_toFfi_nullable(PublicInterface value) =>
  value != null ? smoke_PublicInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
PublicInterface smoke_PublicInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_PublicInterface_fromFfi(handle) : null;
void smoke_PublicInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokePublicinterfaceReleaseHandle(handle);
// End of PublicInterface "private" section.
