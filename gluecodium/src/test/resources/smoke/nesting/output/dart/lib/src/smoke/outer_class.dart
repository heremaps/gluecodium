import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class OuterClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  String foo(String input);
}
abstract class OuterClass_InnerClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  String foo(String input);
}
// OuterClass_InnerClass "private" section, not exported.
final _smoke_OuterClass_InnerClass_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClass_InnerClass_copy_handle'));
final _smoke_OuterClass_InnerClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClass_InnerClass_release_handle'));
class OuterClass_InnerClass$Impl implements OuterClass_InnerClass {
  @protected
  Pointer<Void> handle;
  OuterClass_InnerClass$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_OuterClass_InnerClass_release_handle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _foo_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClass_InnerClass_foo__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _foo_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_OuterClass_InnerClass_toFfi(OuterClass_InnerClass value) =>
  _smoke_OuterClass_InnerClass_copy_handle((value as OuterClass_InnerClass$Impl).handle);
OuterClass_InnerClass smoke_OuterClass_InnerClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterClass_InnerClass;
  if (instance != null) return instance;
  final _copied_handle = _smoke_OuterClass_InnerClass_copy_handle(handle);
  final result = OuterClass_InnerClass$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterClass_InnerClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterClass_InnerClass_release_handle(handle);
Pointer<Void> smoke_OuterClass_InnerClass_toFfi_nullable(OuterClass_InnerClass value) =>
  value != null ? smoke_OuterClass_InnerClass_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterClass_InnerClass smoke_OuterClass_InnerClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterClass_InnerClass_fromFfi(handle) : null;
void smoke_OuterClass_InnerClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterClass_InnerClass_release_handle(handle);
// End of OuterClass_InnerClass "private" section.
abstract class OuterClass_InnerInterface {
  OuterClass_InnerInterface() {}
  factory OuterClass_InnerInterface.fromLambdas({
    @required String Function(String) lambda_foo,
  }) => OuterClass_InnerInterface$Lambdas(
    lambda_foo,
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  String foo(String input);
}
// OuterClass_InnerInterface "private" section, not exported.
final _smoke_OuterClass_InnerInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClass_InnerInterface_copy_handle'));
final _smoke_OuterClass_InnerInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClass_InnerInterface_release_handle'));
final _smoke_OuterClass_InnerInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_OuterClass_InnerInterface_create_proxy'));
final _smoke_OuterClass_InnerInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClass_InnerInterface_get_type_id'));
class OuterClass_InnerInterface$Lambdas implements OuterClass_InnerInterface {
  String Function(String) lambda_foo;
  OuterClass_InnerInterface$Lambdas(
    this.lambda_foo,
  );
  @override
  void release() {}
  @override
  String foo(String input) =>
    lambda_foo(input);
}
class OuterClass_InnerInterface$Impl implements OuterClass_InnerInterface {
  Pointer<Void> handle;
  OuterClass_InnerInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_OuterClass_InnerInterface_release_handle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _foo_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClass_InnerInterface_foo__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _foo_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
}
int _OuterClass_InnerInterface_foo_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as OuterClass_InnerInterface).foo(String_fromFfi(input));
    _result.value = String_toFfi(_result_object);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
Pointer<Void> smoke_OuterClass_InnerInterface_toFfi(OuterClass_InnerInterface value) {
  if (value is OuterClass_InnerInterface$Impl) return _smoke_OuterClass_InnerInterface_copy_handle(value.handle);
  final result = _smoke_OuterClass_InnerInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_OuterClass_InnerInterface_foo_static, __lib.unknownError)
  );
  return result;
}
OuterClass_InnerInterface smoke_OuterClass_InnerInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterClass_InnerInterface;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_OuterClass_InnerInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_OuterClass_InnerInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : OuterClass_InnerInterface$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
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
// OuterClass "private" section, not exported.
final _smoke_OuterClass_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClass_copy_handle'));
final _smoke_OuterClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClass_release_handle'));
class OuterClass$Impl implements OuterClass {
  @protected
  Pointer<Void> handle;
  OuterClass$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_OuterClass_release_handle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _foo_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClass_foo__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _foo_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_OuterClass_toFfi(OuterClass value) =>
  _smoke_OuterClass_copy_handle((value as OuterClass$Impl).handle);
OuterClass smoke_OuterClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterClass;
  if (instance != null) return instance;
  final _copied_handle = _smoke_OuterClass_copy_handle(handle);
  final result = OuterClass$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterClass_release_handle(handle);
Pointer<Void> smoke_OuterClass_toFfi_nullable(OuterClass value) =>
  value != null ? smoke_OuterClass_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterClass smoke_OuterClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterClass_fromFfi(handle) : null;
void smoke_OuterClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterClass_release_handle(handle);
// End of OuterClass "private" section.
