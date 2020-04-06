import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;

abstract class SimpleInterface {
  void release() {}
  String getStringValue();
  SimpleInterface useSimpleInterface(SimpleInterface input);
}
// SimpleInterface "private" section, not exported.
final _smoke_SimpleInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_copy_handle');
final _smoke_SimpleInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_release_handle');
final _smoke_SimpleInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer)
  >('library_smoke_SimpleInterface_create_proxy');
final _smoke_SimpleInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_SimpleInterface_get_raw_pointer');
final _smoke_SimpleInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleInterface_get_type_id');
class SimpleInterface$Impl implements SimpleInterface {
  final Pointer<Void> handle;
  SimpleInterface$Impl(this.handle);
  @override
  void release() => _smoke_SimpleInterface_release_handle(handle);
  @override
  String getStringValue() {
    final _getStringValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SimpleInterface_getStringValue');
    final _handle = this.handle;
    final __result_handle = _getStringValue_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  SimpleInterface useSimpleInterface(SimpleInterface input) {
    final _useSimpleInterface_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SimpleInterface_useSimpleInterface__SimpleInterface');
    final _input_handle = smoke_SimpleInterface_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _useSimpleInterface_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    smoke_SimpleInterface_releaseFfiHandle(_input_handle);
    final _result = smoke_SimpleInterface_fromFfi(__result_handle);
    smoke_SimpleInterface_releaseFfiHandle(__result_handle);
    return _result;
  }
}
int _SimpleInterface_getStringValue_static(int _token, Pointer<Pointer<Void>> _result) {
  final _result_object = (__lib.instanceCache[_token] as SimpleInterface).getStringValue();
  _result.value = String_toFfi(_result_object);
  return 0;
}
int _SimpleInterface_useSimpleInterface_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  final __input = smoke_SimpleInterface_fromFfi(input);
  smoke_SimpleInterface_releaseFfiHandle(input);
  final _result_object = (__lib.instanceCache[_token] as SimpleInterface).useSimpleInterface(__input);
  _result.value = smoke_SimpleInterface_toFfi(_result_object);
  if (_result_object != null) _result_object.release();
  return 0;
}
Pointer<Void> smoke_SimpleInterface_toFfi(SimpleInterface value) {
  if (value is SimpleInterface$Impl) return _smoke_SimpleInterface_copy_handle(value.handle);
  final result = _smoke_SimpleInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Pointer<Void>>)>(_SimpleInterface_getStringValue_static, __lib.unknownError),
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_SimpleInterface_useSimpleInterface_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_SimpleInterface_get_raw_pointer(result)] = value;
  return result;
}
SimpleInterface smoke_SimpleInterface_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_SimpleInterface_get_raw_pointer(handle)] as SimpleInterface;
  if (instance != null) return instance;
  final _copied_handle = _smoke_SimpleInterface_copy_handle(handle);
  final _type_id_handle = _smoke_SimpleInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  final result = factoryConstructor == null
    ? SimpleInterface$Impl(_copied_handle)
    : factoryConstructor(_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_SimpleInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SimpleInterface_release_handle(handle);
Pointer<Void> smoke_SimpleInterface_toFfi_nullable(SimpleInterface value) =>
  value != null ? smoke_SimpleInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
SimpleInterface smoke_SimpleInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SimpleInterface_fromFfi(handle) : null;
void smoke_SimpleInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SimpleInterface_release_handle(handle);
// End of SimpleInterface "private" section.
