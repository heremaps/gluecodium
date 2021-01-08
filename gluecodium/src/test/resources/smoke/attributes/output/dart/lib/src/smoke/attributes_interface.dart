import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@OnInterface
abstract class AttributesInterface {
  AttributesInterface() {}
  factory AttributesInterface.fromLambdas({
    @required void Function(String) lambda_veryFun,
    @required String Function() lambda_prop_get,
    @required void Function(String) lambda_prop_set
  }) => AttributesInterface$Lambdas(
    lambda_veryFun,
    lambda_prop_get,
    lambda_prop_set
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  @OnConstInInterface
  static final bool pi = false;
  @OnFunctionInInterface
  veryFun(@OnParameterInInterface String param);
  @OnPropertyInInterface
  String get prop;
  @OnPropertyInInterface
  set prop(String value);
}
// AttributesInterface "private" section, not exported.
final _smoke_AttributesInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesInterface_copy_handle'));
final _smoke_AttributesInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesInterface_release_handle'));
final _smoke_AttributesInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_AttributesInterface_create_proxy'));
final _smoke_AttributesInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesInterface_get_type_id'));
class AttributesInterface$Lambdas implements AttributesInterface {
  void Function(String) lambda_veryFun;
  String Function() lambda_prop_get;
  void Function(String) lambda_prop_set;
  AttributesInterface$Lambdas(
    this.lambda_veryFun,
    this.lambda_prop_get,
    this.lambda_prop_set
  );
  @override
  void release() {}
  @override
  veryFun(@OnParameterInInterface String param) =>
    lambda_veryFun(param);
  @override
  String get prop => lambda_prop_get();
  @override
  set prop(String value) => lambda_prop_set(value);
}
class AttributesInterface$Impl implements AttributesInterface {
  Pointer<Void> handle;
  AttributesInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_AttributesInterface_release_handle(handle);
    handle = null;
  }
  @override
  veryFun(@OnParameterInInterface String param) {
    final _veryFun_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesInterface_veryFun__String'));
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
  @OnPropertyInInterface
  String get prop {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_AttributesInterface_prop_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  @OnPropertyInInterface
  set prop(String value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_AttributesInterface_prop_set__String'));
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
int _AttributesInterface_veryFun_static(int _token, Pointer<Void> param) {
  try {
    (__lib.instanceCache[_token] as AttributesInterface).veryFun(String_fromFfi(param));
  } finally {
    String_releaseFfiHandle(param);
  }
  return 0;
}
int _AttributesInterface_prop_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi((__lib.instanceCache[_token] as AttributesInterface).prop);
  return 0;
}
int _AttributesInterface_prop_set_static(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as AttributesInterface).prop =
      String_fromFfi(_value);
  } finally {
    String_releaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smoke_AttributesInterface_toFfi(AttributesInterface value) {
  if (value is AttributesInterface$Impl) return _smoke_AttributesInterface_copy_handle(value.handle);
  final result = _smoke_AttributesInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_AttributesInterface_veryFun_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_AttributesInterface_prop_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_AttributesInterface_prop_set_static, __lib.unknownError)
  );
  return result;
}
AttributesInterface smoke_AttributesInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as AttributesInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_AttributesInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_AttributesInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : AttributesInterface$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_AttributesInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_AttributesInterface_release_handle(handle);
Pointer<Void> smoke_AttributesInterface_toFfi_nullable(AttributesInterface value) =>
  value != null ? smoke_AttributesInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
AttributesInterface smoke_AttributesInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_AttributesInterface_fromFfi(handle) : null;
void smoke_AttributesInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesInterface_release_handle(handle);
// End of AttributesInterface "private" section.
