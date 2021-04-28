import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_interface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ChildInterface implements ParentInterface {
  ChildInterface() {}
  factory ChildInterface.fromLambdas({
    required void Function() lambda_rootMethod,
    required void Function() lambda_childMethod,
    required String Function() lambda_rootProperty_get,
    required void Function(String) lambda_rootProperty_set
  }) => ChildInterface$Lambdas(
    lambda_rootMethod,
    lambda_childMethod,
    lambda_rootProperty_get,
    lambda_rootProperty_set
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  childMethod();
}
// ChildInterface "private" section, not exported.
final _smoke_ChildInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildInterface_copy_handle'));
final _smoke_ChildInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildInterface_release_handle'));
final _smoke_ChildInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ChildInterface_create_proxy'));
final _smoke_ChildInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildInterface_get_type_id'));
class ChildInterface$Lambdas implements ChildInterface {
  void Function() lambda_rootMethod;
  void Function() lambda_childMethod;
  String Function() lambda_rootProperty_get;
  void Function(String) lambda_rootProperty_set;
  ChildInterface$Lambdas(
    this.lambda_rootMethod,
    this.lambda_childMethod,
    this.lambda_rootProperty_get,
    this.lambda_rootProperty_set
  );
  @override
  void release() {}
  @override
  rootMethod() =>
    lambda_rootMethod();
  @override
  childMethod() =>
    lambda_childMethod();
  @override
  String get rootProperty => lambda_rootProperty_get();
  @override
  set rootProperty(String value) => lambda_rootProperty_set(value);
}
class ChildInterface$Impl extends __lib.NativeBase implements ChildInterface {
  ChildInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_ChildInterface_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  rootMethod() {
    final _rootMethod_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootMethod'));
    final _handle = this.handle;
    final __result_handle = _rootMethod_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  childMethod() {
    final _childMethod_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildInterface_childMethod'));
    final _handle = this.handle;
    final __result_handle = _childMethod_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  String get rootProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  set rootProperty(String value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentInterface_rootProperty_set__String'));
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
int _ChildInterface_rootMethod_static(int _token) {
  try {
    (__lib.instanceCache[_token] as ChildInterface).rootMethod();
  } finally {
  }
  return 0;
}
int _ChildInterface_childMethod_static(int _token) {
  try {
    (__lib.instanceCache[_token] as ChildInterface).childMethod();
  } finally {
  }
  return 0;
}
int _ChildInterface_rootProperty_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi((__lib.instanceCache[_token] as ChildInterface).rootProperty);
  return 0;
}
int _ChildInterface_rootProperty_set_static(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as ChildInterface).rootProperty =
      String_fromFfi(_value);
  } finally {
    String_releaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smoke_ChildInterface_toFfi(ChildInterface value) {
  if (value is __lib.NativeBase) return _smoke_ChildInterface_copy_handle((value as __lib.NativeBase).handle);
  final result = _smoke_ChildInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64)>(_ChildInterface_rootMethod_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64)>(_ChildInterface_childMethod_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ChildInterface_rootProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_ChildInterface_rootProperty_set_static, __lib.unknownError)
  );
  return result;
}
ChildInterface smoke_ChildInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is ChildInterface) return instance;
  final _type_id_handle = _smoke_ChildInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_ChildInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : ChildInterface$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_ChildInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ChildInterface_release_handle(handle);
Pointer<Void> smoke_ChildInterface_toFfi_nullable(ChildInterface? value) =>
  value != null ? smoke_ChildInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ChildInterface? smoke_ChildInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ChildInterface_fromFfi(handle) : null;
void smoke_ChildInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ChildInterface_release_handle(handle);
// End of ChildInterface "private" section.
