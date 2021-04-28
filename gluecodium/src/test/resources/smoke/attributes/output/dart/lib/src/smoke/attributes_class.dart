import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@OnClass
abstract class AttributesClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  @OnConstInClass
  static final bool pi = false;
  @OnFunctionInClass
  veryFun(@OnParameterInClass String param);
  @OnPropertyInClass
  String get prop;
  @OnPropertyInClass
  set prop(String value);
}
// AttributesClass "private" section, not exported.
final _smoke_AttributesClass_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesClass_copy_handle'));
final _smoke_AttributesClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesClass_release_handle'));
class AttributesClass$Impl extends __lib.NativeBase implements AttributesClass {
  AttributesClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_AttributesClass_release_handle(handle);
    handle = null;
  }
  @override
  veryFun(@OnParameterInClass String param) {
    final _veryFun_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesClass_veryFun__String'));
    final _param_handle = String_toFfi(param);
    final _handle = this.handle;
    final __result_handle = _veryFun_ffi(_handle, __lib.LibraryContext.isolateId, _param_handle);
    String_releaseFfiHandle(_param_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @OnPropertyInClass
  @override
  String get prop {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_AttributesClass_prop_get'));
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
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesClass_prop_set__String'));
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
Pointer<Void> smoke_AttributesClass_toFfi(AttributesClass value) =>
  _smoke_AttributesClass_copy_handle((value as __lib.NativeBase).handle);
AttributesClass smoke_AttributesClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as AttributesClass;
  if (instance != null) return instance;
  final _copied_handle = _smoke_AttributesClass_copy_handle(handle);
  final result = AttributesClass$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_AttributesClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_AttributesClass_release_handle(handle);
Pointer<Void> smoke_AttributesClass_toFfi_nullable(AttributesClass value) =>
  value != null ? smoke_AttributesClass_toFfi(value) : Pointer<Void>.fromAddress(0);
AttributesClass smoke_AttributesClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_AttributesClass_fromFfi(handle) : null;
void smoke_AttributesClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesClass_release_handle(handle);
// End of AttributesClass "private" section.
