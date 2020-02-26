import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_OuterClass_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_OuterClass_copy_handle');
final _smoke_OuterClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_OuterClass_release_handle');
class OuterClass {
  final Pointer<Void> _handle;
  OuterClass._(this._handle);
  void release() => _smoke_OuterClass_release_handle(_handle);
  String foo(String input) {
    final _foo_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_OuterClass_foo__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _foo_ffi(_handle, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_OuterClass_toFfi(OuterClass value) =>
  _smoke_OuterClass_copy_handle(value._handle);
OuterClass smoke_OuterClass_fromFfi(Pointer<Void> handle) =>
  OuterClass._(_smoke_OuterClass_copy_handle(handle));
void smoke_OuterClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterClass_release_handle(handle);
Pointer<Void> smoke_OuterClass_toFfi_nullable(OuterClass value) =>
  value != null ? smoke_OuterClass_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterClass smoke_OuterClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterClass_fromFfi(handle) : null;
void smoke_OuterClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterClass_release_handle(handle);
final _smoke_OuterClass_InnerClass_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_OuterClass_InnerClass_copy_handle');
final _smoke_OuterClass_InnerClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_OuterClass_InnerClass_release_handle');
class OuterClass_InnerClass {
  final Pointer<Void> _handle;
  OuterClass_InnerClass._(this._handle);
  void release() => _smoke_OuterClass_InnerClass_release_handle(_handle);
  String foo(String input) {
    final _foo_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_OuterClass_InnerClass_foo__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _foo_ffi(_handle, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_OuterClass_InnerClass_toFfi(OuterClass_InnerClass value) =>
  _smoke_OuterClass_InnerClass_copy_handle(value._handle);
OuterClass_InnerClass smoke_OuterClass_InnerClass_fromFfi(Pointer<Void> handle) =>
  OuterClass_InnerClass._(_smoke_OuterClass_InnerClass_copy_handle(handle));
void smoke_OuterClass_InnerClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterClass_InnerClass_release_handle(handle);
Pointer<Void> smoke_OuterClass_InnerClass_toFfi_nullable(OuterClass_InnerClass value) =>
  value != null ? smoke_OuterClass_InnerClass_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterClass_InnerClass smoke_OuterClass_InnerClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterClass_InnerClass_fromFfi(handle) : null;
void smoke_OuterClass_InnerClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterClass_InnerClass_release_handle(handle);
abstract class OuterClass_InnerInterface {
  void release();
  String foo(String input);
}
// OuterClass_InnerInterface "private" section, not exported.
final _smoke_OuterClass_InnerInterface_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_OuterClass_InnerInterface_copy_handle');
final _smoke_OuterClass_InnerInterface_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_OuterClass_InnerInterface_release_handle');
final _smoke_OuterClass_InnerInterface_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer),
    Pointer<Void> Function(int, Pointer)
  >('smoke_OuterClass_InnerInterface_create_proxy');
final _smoke_OuterClass_InnerInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('smoke_OuterClass_InnerInterface_get_raw_pointer');
final _smoke_OuterClass_InnerInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_OuterClass_InnerInterface_get_type_id');
int _OuterClass_InnerInterface_instance_counter = 1024;
final Map<int, OuterClass_InnerInterface> _OuterClass_InnerInterface_instance_cache = {};
final Map<Pointer<Void>, OuterClass_InnerInterface> _OuterClass_InnerInterface_reverse_cache = {};
class OuterClass_InnerInterface__Impl implements OuterClass_InnerInterface {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  OuterClass_InnerInterface__Impl(this.handle);
  @override
  void release() => _smoke_OuterClass_InnerInterface_release_handle(handle);
  @override
  String foo(String input) {
    final _foo_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, Pointer<Void>)>('smoke_OuterClass_InnerInterface_foo__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _foo_ffi(_handle, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
int _OuterClass_InnerInterface_foo_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  final _result_object = _OuterClass_InnerInterface_instance_cache[_token].foo(String_fromFfi(input));
  _result.value = String_toFfi(_result_object);
  String_releaseFfiHandle(input);
  return 0;
}
Pointer<Void> smoke_OuterClass_InnerInterface_toFfi(OuterClass_InnerInterface value) {
  if (value is OuterClass_InnerInterface__Impl) return _smoke_OuterClass_InnerInterface_copy_handle(value.handle);
  const UNKNOWN_ERROR = -1;
  final token = _OuterClass_InnerInterface_instance_counter++;
  _OuterClass_InnerInterface_instance_cache[token] = value;
  final result = _smoke_OuterClass_InnerInterface_create_proxy(token, Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_OuterClass_InnerInterface_foo_static, UNKNOWN_ERROR));
  _OuterClass_InnerInterface_reverse_cache[_smoke_OuterClass_InnerInterface_get_raw_pointer(result)] = value;
  return result;
}
OuterClass_InnerInterface smoke_OuterClass_InnerInterface_fromFfi(Pointer<Void> handle) {
  final instance = _OuterClass_InnerInterface_reverse_cache[_smoke_OuterClass_InnerInterface_get_raw_pointer(handle)];
  if (instance != null) return instance;
  final _copied_handle = _smoke_OuterClass_InnerInterface_copy_handle(handle);
  final _type_id_handle = _smoke_OuterClass_InnerInterface_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? OuterClass_InnerInterface__Impl(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_OuterClass_InnerInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterClass_InnerInterface_release_handle(handle);
Pointer<Void> smoke_OuterClass_InnerInterface_toFfi_nullable(OuterClass_InnerInterface value) =>
  value != null ? smoke_OuterClass_InnerInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterClass_InnerInterface smoke_OuterClass_InnerInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterClass_InnerInterface_fromFfi(handle) : null;
void smoke_OuterClass_InnerInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterClass_InnerInterface_release_handle(handle);
// End of OuterClass_InnerInterface "private" section.
