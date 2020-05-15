import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class OuterInterface {
  OuterInterface() {}
  factory OuterInterface.fromLambdas({
    @required String Function(String) lambda_foo
  }) => OuterInterface$Lambdas(
    lambda_foo
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  String foo(String input);
}
abstract class OuterInterface_InnerClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  String foo(String input);
}
// OuterInterface_InnerClass "private" section, not exported.
final _smoke_OuterInterface_InnerClass_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerClass_copy_handle');
final _smoke_OuterInterface_InnerClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerClass_release_handle');
final _smoke_OuterInterface_InnerClass_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_OuterInterface_InnerClass_get_raw_pointer');
class OuterInterface_InnerClass$Impl implements OuterInterface_InnerClass {
  @protected
  Pointer<Void> handle;
  OuterInterface_InnerClass$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_OuterInterface_InnerClass_get_raw_pointer(handle));
    _smoke_OuterInterface_InnerClass_release_handle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _foo_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterInterface_InnerClass_foo__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _foo_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_OuterInterface_InnerClass_toFfi(OuterInterface_InnerClass value) =>
  _smoke_OuterInterface_InnerClass_copy_handle((value as OuterInterface_InnerClass$Impl).handle);
OuterInterface_InnerClass smoke_OuterInterface_InnerClass_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_OuterInterface_InnerClass_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as OuterInterface_InnerClass;
  if (instance != null) return instance;
  final _copied_handle = _smoke_OuterInterface_InnerClass_copy_handle(handle);
  final result = OuterInterface_InnerClass$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_OuterInterface_InnerClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterInterface_InnerClass_release_handle(handle);
Pointer<Void> smoke_OuterInterface_InnerClass_toFfi_nullable(OuterInterface_InnerClass value) =>
  value != null ? smoke_OuterInterface_InnerClass_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterInterface_InnerClass smoke_OuterInterface_InnerClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterInterface_InnerClass_fromFfi(handle) : null;
void smoke_OuterInterface_InnerClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterInterface_InnerClass_release_handle(handle);
// End of OuterInterface_InnerClass "private" section.
abstract class OuterInterface_InnerInterface {
  OuterInterface_InnerInterface() {}
  factory OuterInterface_InnerInterface.fromLambdas({
    @required String Function(String) lambda_foo
  }) => OuterInterface_InnerInterface$Lambdas(
    lambda_foo
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
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
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_OuterInterface_InnerInterface_create_proxy');
final _smoke_OuterInterface_InnerInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_OuterInterface_InnerInterface_get_raw_pointer');
final _smoke_OuterInterface_InnerInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerInterface_get_type_id');
class OuterInterface_InnerInterface$Lambdas implements OuterInterface_InnerInterface {
  String Function(String) lambda_foo;
  OuterInterface_InnerInterface$Lambdas(
    String Function(String) lambda_foo
  ) {
    this.lambda_foo = lambda_foo;
  }
  @override
  void release() {}
  @override
  String foo(String input) =>
    lambda_foo(input);
}
class OuterInterface_InnerInterface$Impl implements OuterInterface_InnerInterface {
  @protected
  Pointer<Void> handle;
  OuterInterface_InnerInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_OuterInterface_InnerInterface_get_raw_pointer(handle));
    _smoke_OuterInterface_InnerInterface_release_handle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _foo_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterInterface_InnerInterface_foo__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _foo_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
int _OuterInterface_InnerInterface_foo_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  final __input = String_fromFfi(input);
  String_releaseFfiHandle(input);
  final _result_object = (__lib.instanceCache[_token] as OuterInterface_InnerInterface).foo(__input);
  _result.value = String_toFfi(_result_object);
  return 0;
}
Pointer<Void> smoke_OuterInterface_InnerInterface_toFfi(OuterInterface_InnerInterface value) {
  if (value is OuterInterface_InnerInterface$Impl) return _smoke_OuterInterface_InnerInterface_copy_handle(value.handle);
  final result = _smoke_OuterInterface_InnerInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_OuterInterface_InnerInterface_foo_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_OuterInterface_InnerInterface_get_raw_pointer(result)] = value;
  return result;
}
OuterInterface_InnerInterface smoke_OuterInterface_InnerInterface_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_OuterInterface_InnerInterface_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as OuterInterface_InnerInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_OuterInterface_InnerInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_OuterInterface_InnerInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : OuterInterface_InnerInterface$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
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
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_OuterInterface_create_proxy');
final _smoke_OuterInterface_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_OuterInterface_get_raw_pointer');
final _smoke_OuterInterface_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_get_type_id');
class OuterInterface$Lambdas implements OuterInterface {
  String Function(String) lambda_foo;
  OuterInterface$Lambdas(
    String Function(String) lambda_foo
  ) {
    this.lambda_foo = lambda_foo;
  }
  @override
  void release() {}
  @override
  String foo(String input) =>
    lambda_foo(input);
}
class OuterInterface$Impl implements OuterInterface {
  @protected
  Pointer<Void> handle;
  OuterInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_OuterInterface_get_raw_pointer(handle));
    _smoke_OuterInterface_release_handle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _foo_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterInterface_foo__String');
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _foo_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
}
int _OuterInterface_foo_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  final __input = String_fromFfi(input);
  String_releaseFfiHandle(input);
  final _result_object = (__lib.instanceCache[_token] as OuterInterface).foo(__input);
  _result.value = String_toFfi(_result_object);
  return 0;
}
Pointer<Void> smoke_OuterInterface_toFfi(OuterInterface value) {
  if (value is OuterInterface$Impl) return _smoke_OuterInterface_copy_handle(value.handle);
  final result = _smoke_OuterInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_OuterInterface_foo_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_OuterInterface_get_raw_pointer(result)] = value;
  return result;
}
OuterInterface smoke_OuterInterface_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_OuterInterface_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as OuterInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_OuterInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_OuterInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : OuterInterface$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
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
