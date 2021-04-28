import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
final _smoke_AttributesWithDeprecated_SomeStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_create_handle'));
final _smoke_AttributesWithDeprecated_SomeStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_release_handle'));
final _smoke_AttributesWithDeprecated_SomeStruct_get_field_field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_get_field_field'));
Pointer<Void> smoke_AttributesWithDeprecated_SomeStruct_toFfi(AttributesWithDeprecated_SomeStruct value) {
  final _field_handle = String_toFfi(value.field);
  final _result = _smoke_AttributesWithDeprecated_SomeStruct_create_handle(_field_handle);
  String_releaseFfiHandle(_field_handle);
  return _result;
}
AttributesWithDeprecated_SomeStruct smoke_AttributesWithDeprecated_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _field_handle = _smoke_AttributesWithDeprecated_SomeStruct_get_field_field(handle);
  try {
    return AttributesWithDeprecated_SomeStruct(
      String_fromFfi(_field_handle)
    );
  } finally {
    String_releaseFfiHandle(_field_handle);
  }
}
void smoke_AttributesWithDeprecated_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_AttributesWithDeprecated_SomeStruct_release_handle(handle);
// Nullable AttributesWithDeprecated_SomeStruct
final _smoke_AttributesWithDeprecated_SomeStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_create_handle_nullable'));
final _smoke_AttributesWithDeprecated_SomeStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_release_handle_nullable'));
final _smoke_AttributesWithDeprecated_SomeStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_SomeStruct_get_value_nullable'));
Pointer<Void> smoke_AttributesWithDeprecated_SomeStruct_toFfi_nullable(AttributesWithDeprecated_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_AttributesWithDeprecated_SomeStruct_toFfi(value);
  final result = _smoke_AttributesWithDeprecated_SomeStruct_create_handle_nullable(_handle);
  smoke_AttributesWithDeprecated_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
AttributesWithDeprecated_SomeStruct smoke_AttributesWithDeprecated_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_AttributesWithDeprecated_SomeStruct_get_value_nullable(handle);
  final result = smoke_AttributesWithDeprecated_SomeStruct_fromFfi(_handle);
  smoke_AttributesWithDeprecated_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_AttributesWithDeprecated_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesWithDeprecated_SomeStruct_release_handle_nullable(handle);
// End of AttributesWithDeprecated_SomeStruct "private" section.
// AttributesWithDeprecated "private" section, not exported.
final _smoke_AttributesWithDeprecated_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_copy_handle'));
final _smoke_AttributesWithDeprecated_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesWithDeprecated_release_handle'));
class AttributesWithDeprecated$Impl extends __lib.NativeBase implements AttributesWithDeprecated {
  AttributesWithDeprecated$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_AttributesWithDeprecated_release_handle(handle);
    handle = null;
  }
  @override
  veryFun() {
    final _veryFun_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AttributesWithDeprecated_veryFun'));
    final _handle = this.handle;
    final __result_handle = _veryFun_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @OnPropertyInClass
  @override
  String get prop {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_AttributesWithDeprecated_prop_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  @OnPropertyInClass
  @override
  set prop(String value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesWithDeprecated_prop_set__String'));
    final _value_handle = String_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    String_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_AttributesWithDeprecated_toFfi(AttributesWithDeprecated value) =>
  _smoke_AttributesWithDeprecated_copy_handle((value as __lib.NativeBase).handle);
AttributesWithDeprecated smoke_AttributesWithDeprecated_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as AttributesWithDeprecated;
  if (instance != null) return instance;
  final _copied_handle = _smoke_AttributesWithDeprecated_copy_handle(handle);
  final result = AttributesWithDeprecated$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_AttributesWithDeprecated_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_AttributesWithDeprecated_release_handle(handle);
Pointer<Void> smoke_AttributesWithDeprecated_toFfi_nullable(AttributesWithDeprecated value) =>
  value != null ? smoke_AttributesWithDeprecated_toFfi(value) : Pointer<Void>.fromAddress(0);
AttributesWithDeprecated smoke_AttributesWithDeprecated_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_AttributesWithDeprecated_fromFfi(handle) : null;
void smoke_AttributesWithDeprecated_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesWithDeprecated_release_handle(handle);
// End of AttributesWithDeprecated "private" section.
