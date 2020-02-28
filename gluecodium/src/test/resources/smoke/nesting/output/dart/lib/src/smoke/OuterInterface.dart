import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class OuterInterface {
  void release();
  String foo(String input);
}
final _smoke_OuterInterface_InnerClass_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerClass_copy_handle');
final _smoke_OuterInterface_InnerClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerClass_release_handle');
class OuterInterface_InnerClass {
  final Pointer<Void> _handle;
  OuterInterface_InnerClass._(this._handle);
  void release() => _smoke_OuterInterface_InnerClass_release_handle(_handle);
  String foo(String input) {
    final _foo_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_OuterInterface_InnerClass_foo__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _foo_ffi(_handle, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_OuterInterface_InnerClass_toFfi(OuterInterface_InnerClass value) =>
  _smoke_OuterInterface_InnerClass_copy_handle(value._handle);
OuterInterface_InnerClass smoke_OuterInterface_InnerClass_fromFfi(Pointer<Void> handle) =>
  OuterInterface_InnerClass._(_smoke_OuterInterface_InnerClass_copy_handle(handle));
void smoke_OuterInterface_InnerClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterInterface_InnerClass_release_handle(handle);
Pointer<Void> smoke_OuterInterface_InnerClass_toFfi_nullable(OuterInterface_InnerClass value) =>
  value != null ? smoke_OuterInterface_InnerClass_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterInterface_InnerClass smoke_OuterInterface_InnerClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterInterface_InnerClass_fromFfi(handle) : null;
void smoke_OuterInterface_InnerClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterInterface_InnerClass_release_handle(handle);
abstract class OuterInterface_InnerInterface {
  void release();
  String foo(String input);
}
// OuterInterface_InnerInterface "private" section, not exported.
final _smoke_OuterInterface_InnerInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerInterface_copy_handle');
final _smoke_OuterInterface_InnerInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerInterface_release_handle');
final _smoke_OuterInterface_InnerInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer)
  >('library_smoke_OuterInterface_InnerInterface_create_proxy');
final _smoke_OuterInterface_InnerInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_OuterInterface_InnerInterface_get_raw_pointer');
final _smoke_OuterInterface_InnerInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerInterface_get_type_id');
class OuterInterface_InnerInterface__Impl implements OuterInterface_InnerInterface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  OuterInterface_InnerInterface__Impl(this.handle);
  @override
  void release() => _smoke_OuterInterface_InnerInterface_release_handle(handle);
  @override
  String foo(String input) {
    final _foo_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_OuterInterface_InnerInterface_foo__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _foo_ffi(_handle, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
int _OuterInterface_InnerInterface_foo_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  final _result_object = (__lib.instanceCache[_token] as OuterInterface_InnerInterface).foo(String_fromFfi(input));
  _result.value = String_toFfi(_result_object);
  String_releaseFfiHandle(input);
  return 0;
}
Pointer<Void> smoke_OuterInterface_InnerInterface_toFfi(OuterInterface_InnerInterface value) {
  if (value is OuterInterface_InnerInterface__Impl) return _smoke_OuterInterface_InnerInterface_copy_handle(value.handle);
  final token = __lib.getNewToken();
  __lib.instanceCache[token] = value;
  final result = _smoke_OuterInterface_InnerInterface_create_proxy(token, __lib.uncacheObjectFfi, Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_OuterInterface_InnerInterface_foo_static, __lib.unknownError));
  __lib.reverseCache[_smoke_OuterInterface_InnerInterface_get_raw_pointer(result)] = value;
  return result;
}
OuterInterface_InnerInterface smoke_OuterInterface_InnerInterface_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_OuterInterface_InnerInterface_get_raw_pointer(handle)] as OuterInterface_InnerInterface;
  if (instance != null) return instance;
  final _copied_handle = _smoke_OuterInterface_InnerInterface_copy_handle(handle);
  final _type_id_handle = _smoke_OuterInterface_InnerInterface_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? OuterInterface_InnerInterface__Impl(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_OuterInterface_InnerInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterInterface_InnerInterface_release_handle(handle);
Pointer<Void> smoke_OuterInterface_InnerInterface_toFfi_nullable(OuterInterface_InnerInterface value) =>
  value != null ? smoke_OuterInterface_InnerInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterInterface_InnerInterface smoke_OuterInterface_InnerInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterInterface_InnerInterface_fromFfi(handle) : null;
void smoke_OuterInterface_InnerInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterInterface_InnerInterface_release_handle(handle);
// End of OuterInterface_InnerInterface "private" section.
// OuterInterface "private" section, not exported.
final _smoke_OuterInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_copy_handle');
final _smoke_OuterInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterInterface_release_handle');
final _smoke_OuterInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer, Pointer),
    Pointer<Void> Function(int, Pointer, Pointer)
  >('library_smoke_OuterInterface_create_proxy');
final _smoke_OuterInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_OuterInterface_get_raw_pointer');
final _smoke_OuterInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_get_type_id');
class OuterInterface__Impl implements OuterInterface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  OuterInterface__Impl(this.handle);
  @override
  void release() => _smoke_OuterInterface_release_handle(handle);
  @override
  String foo(String input) {
    final _foo_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('library_smoke_OuterInterface_foo__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _foo_ffi(_handle, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
int _OuterInterface_foo_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  final _result_object = (__lib.instanceCache[_token] as OuterInterface).foo(String_fromFfi(input));
  _result.value = String_toFfi(_result_object);
  String_releaseFfiHandle(input);
  return 0;
}
Pointer<Void> smoke_OuterInterface_toFfi(OuterInterface value) {
  if (value is OuterInterface__Impl) return _smoke_OuterInterface_copy_handle(value.handle);
  final token = __lib.getNewToken();
  __lib.instanceCache[token] = value;
  final result = _smoke_OuterInterface_create_proxy(token, __lib.uncacheObjectFfi, Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_OuterInterface_foo_static, __lib.unknownError));
  __lib.reverseCache[_smoke_OuterInterface_get_raw_pointer(result)] = value;
  return result;
}
OuterInterface smoke_OuterInterface_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_OuterInterface_get_raw_pointer(handle)] as OuterInterface;
  if (instance != null) return instance;
  final _copied_handle = _smoke_OuterInterface_copy_handle(handle);
  final _type_id_handle = _smoke_OuterInterface_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? OuterInterface__Impl(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_OuterInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterInterface_release_handle(handle);
Pointer<Void> smoke_OuterInterface_toFfi_nullable(OuterInterface value) =>
  value != null ? smoke_OuterInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterInterface smoke_OuterInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterInterface_fromFfi(handle) : null;
void smoke_OuterInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterInterface_release_handle(handle);
// End of OuterInterface "private" section.
