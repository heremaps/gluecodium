import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Enums {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static methodWithExternalEnum(Enums_ExternalEnum input) => Enums$Impl.methodWithExternalEnum(input);
}
enum Enums_ExternalEnum {
    fooValue,
    barValue
}
// Enums_ExternalEnum "private" section, not exported.
int smokeEnumsExternalenumToFfi(Enums_ExternalEnum value) {
  switch (value) {
  case Enums_ExternalEnum.fooValue:
    return 0;
  break;
  case Enums_ExternalEnum.barValue:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Enums_ExternalEnum enum.");
  }
}
Enums_ExternalEnum smokeEnumsExternalenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enums_ExternalEnum.fooValue;
  break;
  case 1:
    return Enums_ExternalEnum.barValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Enums_ExternalEnum enum.");
  }
}
void smokeEnumsExternalenumReleaseFfiHandle(int handle) {}
final _smokeEnumsExternalenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Enums_ExternalEnum_create_handle_nullable'));
final _smokeEnumsExternalenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_ExternalEnum_release_handle_nullable'));
final _smokeEnumsExternalenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_ExternalEnum_get_value_nullable'));
Pointer<Void> smokeEnumsExternalenumToFfiNullable(Enums_ExternalEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumsExternalenumToFfi(value);
  final result = _smokeEnumsExternalenumCreateHandleNullable(_handle);
  smokeEnumsExternalenumReleaseFfiHandle(_handle);
  return result;
}
Enums_ExternalEnum? smokeEnumsExternalenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumsExternalenumGetValueNullable(handle);
  final result = smokeEnumsExternalenumFromFfi(_handle);
  smokeEnumsExternalenumReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumsExternalenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumsExternalenumReleaseHandleNullable(handle);
// End of Enums_ExternalEnum "private" section.
enum Enums_VeryExternalEnum {
    foo,
    bar
}
// Enums_VeryExternalEnum "private" section, not exported.
int smokeEnumsVeryexternalenumToFfi(Enums_VeryExternalEnum value) {
  switch (value) {
  case Enums_VeryExternalEnum.foo:
    return 0;
  break;
  case Enums_VeryExternalEnum.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Enums_VeryExternalEnum enum.");
  }
}
Enums_VeryExternalEnum smokeEnumsVeryexternalenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enums_VeryExternalEnum.foo;
  break;
  case 1:
    return Enums_VeryExternalEnum.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Enums_VeryExternalEnum enum.");
  }
}
void smokeEnumsVeryexternalenumReleaseFfiHandle(int handle) {}
final _smokeEnumsVeryexternalenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Enums_VeryExternalEnum_create_handle_nullable'));
final _smokeEnumsVeryexternalenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_VeryExternalEnum_release_handle_nullable'));
final _smokeEnumsVeryexternalenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_VeryExternalEnum_get_value_nullable'));
Pointer<Void> smokeEnumsVeryexternalenumToFfiNullable(Enums_VeryExternalEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeEnumsVeryexternalenumToFfi(value);
  final result = _smokeEnumsVeryexternalenumCreateHandleNullable(_handle);
  smokeEnumsVeryexternalenumReleaseFfiHandle(_handle);
  return result;
}
Enums_VeryExternalEnum? smokeEnumsVeryexternalenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeEnumsVeryexternalenumGetValueNullable(handle);
  final result = smokeEnumsVeryexternalenumFromFfi(_handle);
  smokeEnumsVeryexternalenumReleaseFfiHandle(_handle);
  return result;
}
void smokeEnumsVeryexternalenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumsVeryexternalenumReleaseHandleNullable(handle);
// End of Enums_VeryExternalEnum "private" section.
// Enums "private" section, not exported.
final _smokeEnumsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_copy_handle'));
final _smokeEnumsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_release_handle'));
class Enums$Impl extends __lib.NativeBase implements Enums {
  Enums$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeEnumsReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  static methodWithExternalEnum(Enums_ExternalEnum input) {
    final _methodWithExternalEnumFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Uint32), void Function(int, int)>('library_smoke_Enums_methodWithExternalEnum__External_1Enum'));
    final _inputHandle = smokeEnumsExternalenumToFfi(input);
    final __resultHandle = _methodWithExternalEnumFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smokeEnumsExternalenumReleaseFfiHandle(_inputHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smokeEnumsToFfi(Enums value) =>
  _smokeEnumsCopyHandle((value as __lib.NativeBase).handle);
Enums smokeEnumsFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is Enums) return instance;
  final _copiedHandle = _smokeEnumsCopyHandle(handle);
  final result = Enums$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeEnumsReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeEnumsReleaseHandle(handle);
Pointer<Void> smokeEnumsToFfiNullable(Enums? value) =>
  value != null ? smokeEnumsToFfi(value) : Pointer<Void>.fromAddress(0);
Enums? smokeEnumsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeEnumsFromFfi(handle) : null;
void smokeEnumsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeEnumsReleaseHandle(handle);
// End of Enums "private" section.
