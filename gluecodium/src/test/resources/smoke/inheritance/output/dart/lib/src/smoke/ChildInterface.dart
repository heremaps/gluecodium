import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/smoke/ParentInterface.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ChildInterface implements ParentInterface {
  ChildInterface() {}
  factory ChildInterface.fromLambdas({
    @required void Function() lambda_rootMethod,
    @required void Function() lambda_childMethod,
    @required String Function() lambda_rootProperty_get,
    @required void Function(String) lambda_rootProperty_set
  }) => ChildInterface$Lambdas(
    lambda_rootMethod,
    lambda_childMethod,
    lambda_rootProperty_get,
    lambda_rootProperty_set
  );
  void release() {}
  childMethod();
}
// ChildInterface "private" section, not exported.
final _smoke_ChildInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildInterface_copy_handle');
final _smoke_ChildInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ChildInterface_release_handle');
final _smoke_ChildInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_ChildInterface_create_proxy');
final _smoke_ChildInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_ChildInterface_get_raw_pointer');
final _smoke_ChildInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ChildInterface_get_type_id');
class ChildInterface$Lambdas extends ParentInterface$Lambdas implements ChildInterface {
  void Function() lambda_childMethod;
  ChildInterface$Lambdas(
    void Function() lambda_rootMethod,
    void Function() lambda_childMethod,
    String Function() lambda_rootProperty_get,
    void Function(String) lambda_rootProperty_set
  ) : super(
    lambda_rootMethod,
    lambda_rootProperty_get,
    lambda_rootProperty_set
  ) {
    this.lambda_childMethod = lambda_childMethod;
  }
  @override
  void release() {}
  @override
  childMethod() =>
    lambda_childMethod();
}
class ChildInterface$Impl extends ParentInterface$Impl implements ChildInterface {
  ChildInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_ChildInterface_get_raw_pointer(handle));
    _smoke_ChildInterface_release_handle(handle);
    handle = null;
  }
  @override
  childMethod() {
    final _childMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ChildInterface_childMethod');
    final _handle = this.handle;
    final __result_handle = _childMethod_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _ChildInterface_rootMethod_static(int _token) {
  (__lib.instanceCache[_token] as ChildInterface).rootMethod();
  return 0;
}
int _ChildInterface_childMethod_static(int _token) {
  (__lib.instanceCache[_token] as ChildInterface).childMethod();
  return 0;
}
int _ChildInterface_rootProperty_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi((__lib.instanceCache[_token] as ChildInterface).rootProperty);
  return 0;
}
int _ChildInterface_rootProperty_set_static(int _token, Pointer<Void> _value) {
  final __value = String_fromFfi(_value);
  String_releaseFfiHandle(_value);
  (__lib.instanceCache[_token] as ChildInterface).rootProperty = __value;
  return 0;
}
Pointer<Void> smoke_ChildInterface_toFfi(ChildInterface value) {
  if (value is ChildInterface$Impl) return _smoke_ChildInterface_copy_handle(value.handle);
  final result = _smoke_ChildInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64)>(_ChildInterface_rootMethod_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64)>(_ChildInterface_childMethod_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_ChildInterface_rootProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_ChildInterface_rootProperty_set_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_ChildInterface_get_raw_pointer(result)] = value;
  return result;
}
ChildInterface smoke_ChildInterface_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_ChildInterface_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as ChildInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_ChildInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_ChildInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : ChildInterface$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_ChildInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ChildInterface_release_handle(handle);
Pointer<Void> smoke_ChildInterface_toFfi_nullable(ChildInterface value) =>
  value != null ? smoke_ChildInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ChildInterface smoke_ChildInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ChildInterface_fromFfi(handle) : null;
void smoke_ChildInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ChildInterface_release_handle(handle);
// End of ChildInterface "private" section.
