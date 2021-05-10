import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ExternalClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  someMethod(int someParameter);
  String get someProperty;
}
enum ExternalClass_SomeEnum {
    someValue
}
// ExternalClass_SomeEnum "private" section, not exported.
int smoke_ExternalClass_SomeEnum_toFfi(ExternalClass_SomeEnum value) {
  switch (value) {
  case ExternalClass_SomeEnum.someValue:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for ExternalClass_SomeEnum enum.");
  }
}
ExternalClass_SomeEnum smoke_ExternalClass_SomeEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return ExternalClass_SomeEnum.someValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ExternalClass_SomeEnum enum.");
  }
}
void smoke_ExternalClass_SomeEnum_releaseFfiHandle(int handle) {}
final _smoke_ExternalClass_SomeEnumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ExternalClass_SomeEnum_create_handle_nullable'));
final _smoke_ExternalClass_SomeEnumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeEnum_release_handle_nullable'));
final _smoke_ExternalClass_SomeEnumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeEnum_get_value_nullable'));
Pointer<Void> smoke_ExternalClass_SomeEnum_toFfi_nullable(ExternalClass_SomeEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExternalClass_SomeEnum_toFfi(value);
  final result = _smoke_ExternalClass_SomeEnumCreateHandleNullable(_handle);
  smoke_ExternalClass_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
ExternalClass_SomeEnum smoke_ExternalClass_SomeEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExternalClass_SomeEnumGetValueNullable(handle);
  final result = smoke_ExternalClass_SomeEnum_fromFfi(_handle);
  smoke_ExternalClass_SomeEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExternalClass_SomeEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalClass_SomeEnumReleaseHandleNullable(handle);
// End of ExternalClass_SomeEnum "private" section.
class ExternalClass_SomeStruct {
  String someField;
  ExternalClass_SomeStruct(this.someField);
}
// ExternalClass_SomeStruct "private" section, not exported.
final _smokeExternalclassSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_create_handle'));
final _smokeExternalclassSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_release_handle'));
final _smokeExternalclassSomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_get_field_someField'));
Pointer<Void> smoke_ExternalClass_SomeStruct_toFfi(ExternalClass_SomeStruct value) {
  final _someFieldHandle = String_toFfi(value.someField);
  final _result = _smokeExternalclassSomestructCreateHandle(_someFieldHandle);
  String_releaseFfiHandle(_someFieldHandle);
  return _result;
}
ExternalClass_SomeStruct smoke_ExternalClass_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeExternalclassSomestructGetFieldsomeField(handle);
  try {
    return ExternalClass_SomeStruct(
      String_fromFfi(_someFieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_someFieldHandle);
  }
}
void smoke_ExternalClass_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeExternalclassSomestructReleaseHandle(handle);
// Nullable ExternalClass_SomeStruct
final _smoke_ExternalClass_SomeStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_create_handle_nullable'));
final _smoke_ExternalClass_SomeStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_release_handle_nullable'));
final _smoke_ExternalClass_SomeStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_ExternalClass_SomeStruct_toFfi_nullable(ExternalClass_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ExternalClass_SomeStruct_toFfi(value);
  final result = _smoke_ExternalClass_SomeStructCreateHandleNullable(_handle);
  smoke_ExternalClass_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
ExternalClass_SomeStruct smoke_ExternalClass_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ExternalClass_SomeStructGetValueNullable(handle);
  final result = smoke_ExternalClass_SomeStruct_fromFfi(_handle);
  smoke_ExternalClass_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_ExternalClass_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ExternalClass_SomeStructReleaseHandleNullable(handle);
// End of ExternalClass_SomeStruct "private" section.
// ExternalClass "private" section, not exported.
final _smokeExternalclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ExternalClass_copy_handle'));
final _smokeExternalclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ExternalClass_release_handle'));
class ExternalClass$Impl extends __lib.NativeBase implements ExternalClass {
  ExternalClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeExternalclassReleaseHandle(handle);
    handle = null;
  }
  @override
  someMethod(int someParameter) {
    final _someMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int8), void Function(Pointer<Void>, int, int)>('library_smoke_ExternalClass_someMethod__Byte'));
    final _someParameterHandle = (someParameter);
    final _handle = this.handle;
    final __resultHandle = _someMethodFfi(_handle, __lib.LibraryContext.isolateId, _someParameterHandle);
    (_someParameterHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  String get someProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ExternalClass_someProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_ExternalClass_toFfi(ExternalClass value) =>
  _smokeExternalclassCopyHandle((value as __lib.NativeBase).handle);
ExternalClass smoke_ExternalClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as ExternalClass;
  if (instance != null) return instance;
  final _copiedHandle = _smokeExternalclassCopyHandle(handle);
  final result = ExternalClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ExternalClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeExternalclassReleaseHandle(handle);
Pointer<Void> smoke_ExternalClass_toFfi_nullable(ExternalClass value) =>
  value != null ? smoke_ExternalClass_toFfi(value) : Pointer<Void>.fromAddress(0);
ExternalClass smoke_ExternalClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ExternalClass_fromFfi(handle) : null;
void smoke_ExternalClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeExternalclassReleaseHandle(handle);
// End of ExternalClass "private" section.
