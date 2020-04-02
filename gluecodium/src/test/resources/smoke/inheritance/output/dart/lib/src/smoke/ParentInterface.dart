import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_library_init.dart' as __lib;
abstract class ParentInterface {
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
class ParentInterface$Impl implements ParentInterface {
  final Pointer<Void> handle;
  ParentInterface$Impl(this.handle);
  @override
  void release() => _smoke_ParentInterface_release_handle(handle);
  @override
  rootMethod() {
    final _rootMethod_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootMethod');
    final _handle = this.handle;
    final __result_handle = _rootMethod_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  String get rootProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_ParentInterface_rootProperty_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  set rootProperty(String value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ParentInterface_rootProperty_set__String');
    final _value_handle = String_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    String_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
int _ParentInterface_rootMethod_static(int _token) {
  (__lib.instanceCache[_token] as ParentInterface).rootMethod();
  return 0;
}
int _ParentInterface_rootProperty_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi((__lib.instanceCache[_token] as ParentInterface).rootProperty);
  return 0;
}
int _ParentInterface_rootProperty_set_static(int _token, Pointer<Void> _value) {
  final __value = String_fromFfi(_value);
  String_releaseFfiHandle(_value);
  (__lib.instanceCache[_token] as ParentInterface).rootProperty = __value;
  return 0;
}
Pointer<Void> smoke_ParentInterface_toFfi(ParentInterface value) {
  if (value is ParentInterface$Impl) return _smoke_ParentInterface_copy_handle(value.handle);
  final result = _smoke_ParentInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64)>(_ParentInterface_rootMethod_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Pointer<Void>>)>(_ParentInterface_rootProperty_get_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_ParentInterface_rootProperty_set_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_ParentInterface_get_raw_pointer(result)] = value;
  return result;
}
ParentInterface smoke_ParentInterface_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_ParentInterface_get_raw_pointer(handle)] as ParentInterface;
  if (instance != null) return instance;
  final _copied_handle = _smoke_ParentInterface_copy_handle(handle);
  final _type_id_handle = _smoke_ParentInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  final result = factoryConstructor == null
    ? ParentInterface$Impl(_copied_handle)
    : factoryConstructor(_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
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
