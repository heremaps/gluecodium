import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/public_class.dart';
import 'package:meta/meta.dart';
abstract class PublicInterface {

}
/// @nodoc
@internal
class PublicInterface_InternalStruct {
  /// @nodoc
  @internal
  PublicClass_InternalStruct _fieldOfInternalType;
  PublicInterface_InternalStruct(this._fieldOfInternalType);
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
Pointer<Void> smokePublicinterfaceInternalstructToFfi(PublicInterface_InternalStruct value) {
  final _fieldOfInternalTypeHandle = smokePublicclassInternalstructToFfi(value._fieldOfInternalType);
  final _result = _smokePublicinterfaceInternalstructCreateHandle(_fieldOfInternalTypeHandle);
  smokePublicclassInternalstructReleaseFfiHandle(_fieldOfInternalTypeHandle);
  return _result;
}
PublicInterface_InternalStruct smokePublicinterfaceInternalstructFromFfi(Pointer<Void> handle) {
  final _fieldOfInternalTypeHandle = _smokePublicinterfaceInternalstructGetFieldfieldOfInternalType(handle);
  try {
    return PublicInterface_InternalStruct(
      smokePublicclassInternalstructFromFfi(_fieldOfInternalTypeHandle)
    );
  } finally {
    smokePublicclassInternalstructReleaseFfiHandle(_fieldOfInternalTypeHandle);
  }
}
void smokePublicinterfaceInternalstructReleaseFfiHandle(Pointer<Void> handle) => _smokePublicinterfaceInternalstructReleaseHandle(handle);
// Nullable PublicInterface_InternalStruct
final _smokePublicinterfaceInternalstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_create_handle_nullable'));
final _smokePublicinterfaceInternalstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_release_handle_nullable'));
final _smokePublicinterfaceInternalstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_InternalStruct_get_value_nullable'));
Pointer<Void> smokePublicinterfaceInternalstructToFfiNullable(PublicInterface_InternalStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePublicinterfaceInternalstructToFfi(value);
  final result = _smokePublicinterfaceInternalstructCreateHandleNullable(_handle);
  smokePublicinterfaceInternalstructReleaseFfiHandle(_handle);
  return result;
}
PublicInterface_InternalStruct? smokePublicinterfaceInternalstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePublicinterfaceInternalstructGetValueNullable(handle);
  final result = smokePublicinterfaceInternalstructFromFfi(_handle);
  smokePublicinterfaceInternalstructReleaseFfiHandle(_handle);
  return result;
}
void smokePublicinterfaceInternalstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicinterfaceInternalstructReleaseHandleNullable(handle);
// End of PublicInterface_InternalStruct "private" section.
// PublicInterface "private" section, not exported.
final _smokePublicinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_PublicInterface_register_finalizer'));
final _smokePublicinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_copy_handle'));
final _smokePublicinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PublicInterface_release_handle'));
final _smokePublicinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle),
    Pointer<Void> Function(int, int, Object)
  >('library_smoke_PublicInterface_create_proxy'));
final _smokePublicinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PublicInterface_get_type_id'));
class PublicInterface$Impl extends __lib.NativeBase implements PublicInterface {
  PublicInterface$Impl(Pointer<Void> handle) : super(handle);

}
Pointer<Void> smokePublicinterfaceToFfi(PublicInterface value) {
  if (value is __lib.NativeBase) return _smokePublicinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokePublicinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value
  );
  return result;
}
PublicInterface smokePublicinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PublicInterface) return instance;
  final _typeIdHandle = _smokePublicinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokePublicinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : PublicInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokePublicinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}
void smokePublicinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokePublicinterfaceReleaseHandle(handle);
Pointer<Void> smokePublicinterfaceToFfiNullable(PublicInterface? value) =>
  value != null ? smokePublicinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
PublicInterface? smokePublicinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokePublicinterfaceFromFfi(handle) : null;
void smokePublicinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePublicinterfaceReleaseHandle(handle);
// End of PublicInterface "private" section.
