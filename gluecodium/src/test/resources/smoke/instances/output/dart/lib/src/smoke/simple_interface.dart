import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class SimpleInterface {
  SimpleInterface() {}
  factory SimpleInterface.fromLambdas({
    required String Function() lambda_getStringValue,
    required SimpleInterface Function(SimpleInterface) lambda_useSimpleInterface,
  }) => SimpleInterface$Lambdas(
    lambda_getStringValue,
    lambda_useSimpleInterface,
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  String getStringValue();
  SimpleInterface useSimpleInterface(SimpleInterface input);
}
// SimpleInterface "private" section, not exported.
final _smoke_SimpleInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_copy_handle'));
final _smoke_SimpleInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_release_handle'));
final _smoke_SimpleInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer)
  >('library_smoke_SimpleInterface_create_proxy'));
final _smoke_SimpleInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_get_type_id'));
class SimpleInterface$Lambdas implements SimpleInterface {
  String Function() lambda_getStringValue;
  SimpleInterface Function(SimpleInterface) lambda_useSimpleInterface;
  SimpleInterface$Lambdas(
    this.lambda_getStringValue,
    this.lambda_useSimpleInterface,
  );
  @override
  void release() {}
  @override
  String getStringValue() =>
    lambda_getStringValue();
  @override
  SimpleInterface useSimpleInterface(SimpleInterface input) =>
    lambda_useSimpleInterface(input);
}
class SimpleInterface$Impl extends __lib.NativeBase implements SimpleInterface {
  SimpleInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_SimpleInterface_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  String getStringValue() {
    final _getStringValue_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SimpleInterface_getStringValue'));
    final _handle = this.handle;
    final __result_handle = _getStringValue_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  @override
  SimpleInterface useSimpleInterface(SimpleInterface input) {
    final _useSimpleInterface_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SimpleInterface_useSimpleInterface__SimpleInterface'));
    final _input_handle = smoke_SimpleInterface_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _useSimpleInterface_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    smoke_SimpleInterface_releaseFfiHandle(_input_handle);
    try {
      return smoke_SimpleInterface_fromFfi(__result_handle);
    } finally {
      smoke_SimpleInterface_releaseFfiHandle(__result_handle);
    }
  }
}
int _SimpleInterface_getStringValue_static(int _token, Pointer<Pointer<Void>> _result) {
  String? _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as SimpleInterface).getStringValue();
    _result.value = String_toFfi(_result_object);
  } finally {
  }
  return 0;
}
int _SimpleInterface_useSimpleInterface_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  SimpleInterface? _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as SimpleInterface).useSimpleInterface(smoke_SimpleInterface_fromFfi(input));
    _result.value = smoke_SimpleInterface_toFfi(_result_object);
  } finally {
    smoke_SimpleInterface_releaseFfiHandle(input);
    _result_object?.release();
  }
  return 0;
}
Pointer<Void> smoke_SimpleInterface_toFfi(SimpleInterface value) {
  if (value is __lib.NativeBase) return _smoke_SimpleInterface_copy_handle((value as __lib.NativeBase).handle);
  final result = _smoke_SimpleInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_SimpleInterface_getStringValue_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_SimpleInterface_useSimpleInterface_static, __lib.unknownError)
  );
  return result;
}
SimpleInterface smoke_SimpleInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is SimpleInterface) return instance;
  final _type_id_handle = _smoke_SimpleInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_SimpleInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : SimpleInterface$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_SimpleInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SimpleInterface_release_handle(handle);
Pointer<Void> smoke_SimpleInterface_toFfi_nullable(SimpleInterface? value) =>
  value != null ? smoke_SimpleInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
SimpleInterface? smoke_SimpleInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SimpleInterface_fromFfi(handle) : null;
void smoke_SimpleInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SimpleInterface_release_handle(handle);
// End of SimpleInterface "private" section.
