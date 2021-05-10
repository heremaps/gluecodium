import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@Deprecated("")
@OnClass
abstract class AttributesWithDeprecated {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  @Deprecated("")
  @OnConstInClass
  static final bool pi = false;
  @Deprecated("")
  @OnFunctionInClass
  veryFun();
  @Deprecated("")
  @OnPropertyInClass
  String get prop;
  @Deprecated("")
  @OnPropertyInClass
  set prop(String value);
}
class AttributesWithDeprecated_SomeStruct {
  @Deprecated("")
  @OnField
  String field;
  AttributesWithDeprecated_SomeStruct(this.field);
}
// AttributesWithDeprecated_SomeStruct "private" section, not exported.
final _smokeAttributeswithdeprecatedSomestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_create_handle'));
final _smokeAttributeswithdeprecatedSomestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_release_handle'));
final _smokeAttributeswithdeprecatedSomestructGetFieldfield = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_get_field_field'));
Pointer<Void> smoke_AttributesWithDeprecated_SomeStruct_toFfi(AttributesWithDeprecated_SomeStruct value) {
  final _fieldHandle = String_toFfi(value.field);
  final _result = _smokeAttributeswithdeprecatedSomestructCreateHandle(_fieldHandle);
  String_releaseFfiHandle(_fieldHandle);
  return _result;
}
AttributesWithDeprecated_SomeStruct smoke_AttributesWithDeprecated_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _fieldHandle = _smokeAttributeswithdeprecatedSomestructGetFieldfield(handle);
  try {
    return AttributesWithDeprecated_SomeStruct(
      String_fromFfi(_fieldHandle)
    );
  } finally {
    String_releaseFfiHandle(_fieldHandle);
  }
}
void smoke_AttributesWithDeprecated_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smokeAttributeswithdeprecatedSomestructReleaseHandle(handle);
// Nullable AttributesWithDeprecated_SomeStruct
final _smoke_AttributesWithDeprecated_SomeStructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_create_handle_nullable'));
final _smoke_AttributesWithDeprecated_SomeStructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_release_handle_nullable'));
final _smoke_AttributesWithDeprecated_SomeStructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_AttributesWithDeprecated_SomeStruct_toFfi_nullable(AttributesWithDeprecated_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_AttributesWithDeprecated_SomeStruct_toFfi(value);
  final result = _smoke_AttributesWithDeprecated_SomeStructCreateHandleNullable(_handle);
  smoke_AttributesWithDeprecated_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
AttributesWithDeprecated_SomeStruct smoke_AttributesWithDeprecated_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_AttributesWithDeprecated_SomeStructGetValueNullable(handle);
  final result = smoke_AttributesWithDeprecated_SomeStruct_fromFfi(_handle);
  smoke_AttributesWithDeprecated_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_AttributesWithDeprecated_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesWithDeprecated_SomeStructReleaseHandleNullable(handle);
// End of AttributesWithDeprecated_SomeStruct "private" section.
// AttributesWithDeprecated "private" section, not exported.
final _smokeAttributeswithdeprecatedCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_copy_handle'));
final _smokeAttributeswithdeprecatedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_release_handle'));
class AttributesWithDeprecated$Impl extends __lib.NativeBase implements AttributesWithDeprecated {
  AttributesWithDeprecated$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeAttributeswithdeprecatedReleaseHandle(handle);
    handle = null;
  }
  @override
  veryFun() {
    final _veryFunFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AttributesWithDeprecated_veryFun'));
    final _handle = this.handle;
    final __resultHandle = _veryFunFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @OnPropertyInClass
  @override
  String get prop {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_AttributesWithDeprecated_prop_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
  @OnPropertyInClass
  @override
  set prop(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesWithDeprecated_prop_set__String'));
    final _valueHandle = String_toFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    String_releaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smoke_AttributesWithDeprecated_toFfi(AttributesWithDeprecated value) =>
  _smokeAttributeswithdeprecatedCopyHandle((value as __lib.NativeBase).handle);
AttributesWithDeprecated smoke_AttributesWithDeprecated_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as AttributesWithDeprecated;
  if (instance != null) return instance;
  final _copiedHandle = _smokeAttributeswithdeprecatedCopyHandle(handle);
  final result = AttributesWithDeprecated$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_AttributesWithDeprecated_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeAttributeswithdeprecatedReleaseHandle(handle);
Pointer<Void> smoke_AttributesWithDeprecated_toFfi_nullable(AttributesWithDeprecated value) =>
  value != null ? smoke_AttributesWithDeprecated_toFfi(value) : Pointer<Void>.fromAddress(0);
AttributesWithDeprecated smoke_AttributesWithDeprecated_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_AttributesWithDeprecated_fromFfi(handle) : null;
void smoke_AttributesWithDeprecated_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeAttributeswithdeprecatedReleaseHandle(handle);
// End of AttributesWithDeprecated "private" section.
