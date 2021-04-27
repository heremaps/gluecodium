import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
final _smoke_off_NestedPackages_SomeStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_create_handle'));
final _smoke_off_NestedPackages_SomeStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_release_handle'));
final _smoke_off_NestedPackages_SomeStruct_get_field_someField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_get_field_someField'));
Pointer<Void> smoke_off_NestedPackages_SomeStruct_toFfi(NestedPackages_SomeStruct value) {
  final _someField_handle = String_toFfi(value.someField);
  final _result = _smoke_off_NestedPackages_SomeStruct_create_handle(_someField_handle);
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
NestedPackages_SomeStruct smoke_off_NestedPackages_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_off_NestedPackages_SomeStruct_get_field_someField(handle);
  try {
    return NestedPackages_SomeStruct(
      String_fromFfi(_someField_handle)
    );
  } finally {
    String_releaseFfiHandle(_someField_handle);
  }
}
void smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_off_NestedPackages_SomeStruct_release_handle(handle);
// Nullable NestedPackages_SomeStruct
final _smoke_off_NestedPackages_SomeStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_create_handle_nullable'));
final _smoke_off_NestedPackages_SomeStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_release_handle_nullable'));
final _smoke_off_NestedPackages_SomeStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_off_NestedPackages_SomeStruct_toFfi_nullable(NestedPackages_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_off_NestedPackages_SomeStruct_toFfi(value);
  final result = _smoke_off_NestedPackages_SomeStruct_create_handle_nullable(_handle);
  smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
NestedPackages_SomeStruct smoke_off_NestedPackages_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_off_NestedPackages_SomeStruct_get_value_nullable(handle);
  final result = smoke_off_NestedPackages_SomeStruct_fromFfi(_handle);
  smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_off_NestedPackages_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_off_NestedPackages_SomeStruct_release_handle_nullable(handle);
// End of NestedPackages_SomeStruct "private" section.
// NestedPackages "private" section, not exported.
final _smoke_off_NestedPackages_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_copy_handle'));
final _smoke_off_NestedPackages_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_release_handle'));
class NestedPackages$Impl extends __lib.NativeBase implements NestedPackages {
  NestedPackages$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_off_NestedPackages_release_handle(handle);
    handle = null;
  }
  static NestedPackages_SomeStruct basicMethod(NestedPackages_SomeStruct input) {
    final _basicMethod_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_off_NestedPackages_basicMethod__SomeStruct'));
    final _input_handle = smoke_off_NestedPackages_SomeStruct_toFfi(input);
    final __result_handle = _basicMethod_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(_input_handle);
    try {
      return smoke_off_NestedPackages_SomeStruct_fromFfi(__result_handle);
    } finally {
      smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_off_NestedPackages_toFfi(NestedPackages value) =>
  _smoke_off_NestedPackages_copy_handle((value as __lib.NativeBase).handle);
NestedPackages smoke_off_NestedPackages_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as NestedPackages;
  if (instance != null) return instance;
  final _copied_handle = _smoke_off_NestedPackages_copy_handle(handle);
  final result = NestedPackages$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_off_NestedPackages_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_off_NestedPackages_release_handle(handle);
Pointer<Void> smoke_off_NestedPackages_toFfi_nullable(NestedPackages value) =>
  value != null ? smoke_off_NestedPackages_toFfi(value) : Pointer<Void>.fromAddress(0);
NestedPackages smoke_off_NestedPackages_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_off_NestedPackages_fromFfi(handle) : null;
void smoke_off_NestedPackages_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_off_NestedPackages_release_handle(handle);
// End of NestedPackages "private" section.
