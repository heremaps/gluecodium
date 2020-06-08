import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ParentInterface {
  ParentInterface() {}
  factory ParentInterface.fromLambdas({
    @required void Function() lambda_rootMethod,
    @required String Function() lambda_rootProperty_get,
    @required void Function(String) lambda_rootProperty_set
  }) => ParentInterface$Lambdas(
    lambda_rootMethod,
    lambda_rootProperty_get,
    lambda_rootProperty_set
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  rootMethod();
  String get rootProperty;
  set rootProperty(String value);
}
// ParentInterface "private" section, not exported.
final _smoke_ParentInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ParentInterface_copy_handle');
final _smoke_ParentInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ParentInterface_release_handle');
final _smoke_ParentInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ParentInterface_create_proxy');
final _smoke_ParentInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_ParentInterface_get_raw_pointer');
final _smoke_ParentInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ParentInterface_get_type_id');
class ParentInterface$Lambdas implements ParentInterface {
  void Function() lambda_rootMethod;
  String Function() lambda_rootProperty_get;
  void Function(String) lambda_rootProperty_set;
  ParentInterface$Lambdas(
    void Function() lambda_rootMethod,
    String Function() lambda_rootProperty_get,
    void Function(String) lambda_rootProperty_set
  ) {
    this.lambda_rootMethod = lambda_rootMethod;
    this.lambda_rootProperty_get = lambda_rootProperty_get;
    this.lambda_rootProperty_set = lambda_rootProperty_set;
  }
  @override
  void release() {}
  @override
  rootMethod() =>
    lambda_rootMethod();
  @override
  String get rootProperty => lambda_rootProperty_get();
  @override
  set rootProperty(String value) => lambda_rootProperty_set(value);
}
class ParentInterface$Impl implements ParentInterface {
  @protected
  Pointer<Void> handle;
  ParentInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_ParentInterface_get_raw_pointer(handle));
    _smoke_ParentInterface_release_handle(handle);
    handle = null;
  }
  @override
  rootMethod() {
    final _rootMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootMethod');
    final _handle = this.handle;
    final __result_handle = _rootMethod_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  String get rootProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  set rootProperty(String value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentInterface_rootProperty_set__String');
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
int _ParentInterface_rootMethod_static(int _token) {
  try {
    (__lib.instanceCache[_token] as ParentInterface).rootMethod();
  } finally {
  }
  return 0;
}
int _ParentInterface_rootProperty_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi((__lib.instanceCache[_token] as ParentInterface).rootProperty);
  return 0;
}
int _ParentInterface_rootProperty_set_static(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as ParentInterface).rootProperty =
      String_fromFfi(_value);
  } finally {
    String_releaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smoke_ParentInterface_toFfi(ParentInterface value) {
  if (value is ParentInterface$Impl) return _smoke_ParentInterface_copy_handle(value.handle);
  final result = _smoke_ParentInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64)>(_ParentInterface_rootMethod_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ParentInterface_rootProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_ParentInterface_rootProperty_set_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_ParentInterface_get_raw_pointer(result)] = value;
  return result;
}
ParentInterface smoke_ParentInterface_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_ParentInterface_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as ParentInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_ParentInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_ParentInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : ParentInterface$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_ParentInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ParentInterface_release_handle(handle);
Pointer<Void> smoke_ParentInterface_toFfi_nullable(ParentInterface value) =>
  value != null ? smoke_ParentInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ParentInterface smoke_ParentInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ParentInterface_fromFfi(handle) : null;
void smoke_ParentInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ParentInterface_release_handle(handle);
// End of ParentInterface "private" section.
