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
final _smoke_AttributesClass_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_AttributesClass_get_raw_pointer'));
class AttributesClass$Impl implements AttributesClass {
  @protected
  Pointer<Void> handle;
  AttributesClass$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_AttributesClass_get_raw_pointer(handle));
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
  _smoke_AttributesClass_copy_handle((value as AttributesClass$Impl).handle);
AttributesClass smoke_AttributesClass_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_AttributesClass_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as AttributesClass;
  if (instance != null) return instance;
  final _copied_handle = _smoke_AttributesClass_copy_handle(handle);
  final result = AttributesClass$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
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
