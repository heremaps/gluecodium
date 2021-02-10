import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';
import 'package:library/src/package/interface.dart';
import 'package:library/src/package/types.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Class implements Interface {
  factory Class() => Class$Impl.constructor();
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  Struct fun(List<Struct> double);
  Enum get property;
  set property(Enum value);
}
// Class "private" section, not exported.
final _package_Class_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Class_copy_handle'));
final _package_Class_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Class_release_handle'));
final _package_Class_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Class_get_type_id'));
final _fun_return_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_1package_1Types_1Struct_return_release_handle'));
final _fun_return_get_result = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_1package_1Types_1Struct_return_get_result'));
final _fun_return_get_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_1package_1Types_1Struct_return_get_error'));
final _fun_return_has_error = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_package_Class_fun__ListOf_1package_1Types_1Struct_return_has_error'));
class Class$Impl implements Class {
  @protected
  Pointer<Void> handle;
  Class$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _package_Class_release_handle(handle);
    handle = null;
  }
  Class$Impl.constructor() : handle = _constructor() {
    __lib.ffi_cache_token(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(this));
  }
  static Pointer<Void> _constructor() {
    final _constructor_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_package_Class_constructor'));
    final __result_handle = _constructor_ffi(__lib.LibraryContext.isolateId);
    return __result_handle;
  }
  @override
  Struct fun(List<Struct> double) {
    final _fun_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_package_Class_fun__ListOf_1package_1Types_1Struct'));
    final _double_handle = foobar_ListOf_package_Types_Struct_toFfi(double);
    final _handle = this.handle;
    final __call_result_handle = _fun_ffi(_handle, __lib.LibraryContext.isolateId, _double_handle);
    foobar_ListOf_package_Types_Struct_releaseFfiHandle(_double_handle);
    if (_fun_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _fun_return_get_error(__call_result_handle);
        _fun_return_release_handle(__call_result_handle);
        try {
          throw ExceptionException(package_Types_Enum_fromFfi(__error_handle));
        } finally {
          package_Types_Enum_releaseFfiHandle(__error_handle);
        }
    }
    final __result_handle = _fun_return_get_result(__call_result_handle);
    _fun_return_release_handle(__call_result_handle);
    try {
      return package_Types_Struct_fromFfi(__result_handle);
    } finally {
      package_Types_Struct_releaseFfiHandle(__result_handle);
    }
  }
  @override
  Enum get property {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_package_Class_property_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return package_Types_Enum_fromFfi(__result_handle);
    } finally {
      package_Types_Enum_releaseFfiHandle(__result_handle);
    }
  }
  @override
  set property(Enum value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('library_package_Class_property_set__enum'));
    final _value_handle = package_Types_Enum_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    package_Types_Enum_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> package_Class_toFfi(Class value) =>
  _package_Class_copy_handle((value as Class$Impl).handle);
Class package_Class_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as Class;
  if (instance != null) return instance;
  final _type_id_handle = _package_Class_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _package_Class_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : Class$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void package_Class_releaseFfiHandle(Pointer<Void> handle) =>
  _package_Class_release_handle(handle);
Pointer<Void> package_Class_toFfi_nullable(Class value) =>
  value != null ? package_Class_toFfi(value) : Pointer<Void>.fromAddress(0);
Class package_Class_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? package_Class_fromFfi(handle) : null;
void package_Class_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _package_Class_release_handle(handle);
// End of Class "private" section.
