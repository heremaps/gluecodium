import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class NestedPackages {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static NestedPackages_SomeStruct basicMethod(NestedPackages_SomeStruct input) => NestedPackages$Impl.basicMethod(input);
}
class NestedPackages_SomeStruct {
  String someField;
  NestedPackages_SomeStruct(this.someField);
}
// NestedPackages_SomeStruct "private" section, not exported.
final _smokeOffNestedpackagesSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_create_handle'));
final _smokeOffNestedpackagesSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_release_handle'));
final _smokeOffNestedpackagesSomestructGetFieldsomeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_get_field_someField'));
Pointer<Void> smoke_off_NestedPackages_SomeStruct_toFfi(NestedPackages_SomeStruct value) {
  final _someFieldHandle = String_toFfi(value.someField);
  final _result = _smokeOffNestedpackagesSomestructCreateHandle(_someFieldHandle);
  String_releaseFfiHandle(_someFieldHandle);
  return _result;
}
NestedPackages_SomeStruct smoke_off_NestedPackages_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someFieldHandle = _smokeOffNestedpackagesSomestructGetFieldsomeField(handle);
  try {
    return NestedPackages_SomeStruct(
      String_fromFfi(_someFieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_someFieldHandle);
  }
}
void smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeOffNestedpackagesSomestructReleaseHandle(handle);
// Nullable NestedPackages_SomeStruct
final _smoke_off_NestedPackages_SomeStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_create_handle_nullable'));
final _smoke_off_NestedPackages_SomeStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_release_handle_nullable'));
final _smoke_off_NestedPackages_SomeStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_off_NestedPackages_SomeStruct_toFfi_nullable(NestedPackages_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_off_NestedPackages_SomeStruct_toFfi(value);
  final result = _smoke_off_NestedPackages_SomeStructCreateHandleNullable(_handle);
  smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
NestedPackages_SomeStruct smoke_off_NestedPackages_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_off_NestedPackages_SomeStructGetValueNullable(handle);
  final result = smoke_off_NestedPackages_SomeStruct_fromFfi(_handle);
  smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_off_NestedPackages_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_off_NestedPackages_SomeStructReleaseHandleNullable(handle);
// End of NestedPackages_SomeStruct "private" section.
// NestedPackages "private" section, not exported.
final _smokeOffNestedpackagesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_copy_handle'));
final _smokeOffNestedpackagesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_release_handle'));
class NestedPackages$Impl extends __lib.NativeBase implements NestedPackages {
  NestedPackages$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOffNestedpackagesReleaseHandle(handle);
    handle = null;
  }
  static NestedPackages_SomeStruct basicMethod(NestedPackages_SomeStruct input) {
    final _basicMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_off_NestedPackages_basicMethod__SomeStruct'));
    final _inputHandle = smoke_off_NestedPackages_SomeStruct_toFfi(input);
    final __resultHandle = _basicMethodFfi(__lib.LibraryContext.isolateId, _inputHandle);
    smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(_inputHandle);
    try {
      return smoke_off_NestedPackages_SomeStruct_fromFfi(__resultHandle);
    } finally {
      smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_off_NestedPackages_toFfi(NestedPackages value) =>
  _smokeOffNestedpackagesCopyHandle((value as __lib.NativeBase).handle);
NestedPackages smoke_off_NestedPackages_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as NestedPackages;
  if (instance != null) return instance;
  final _copiedHandle = _smokeOffNestedpackagesCopyHandle(handle);
  final result = NestedPackages$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_off_NestedPackages_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeOffNestedpackagesReleaseHandle(handle);
Pointer<Void> smoke_off_NestedPackages_toFfi_nullable(NestedPackages value) =>
  value != null ? smoke_off_NestedPackages_toFfi(value) : Pointer<Void>.fromAddress(0);
NestedPackages smoke_off_NestedPackages_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_off_NestedPackages_fromFfi(handle) : null;
void smoke_off_NestedPackages_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeOffNestedpackagesReleaseHandle(handle);
// End of NestedPackages "private" section.
