import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_class.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class OuterClassWithInheritance implements ParentClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  String foo(String input);
}
abstract class OuterClassWithInheritance_InnerClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  String bar(String input);
}
// OuterClassWithInheritance_InnerClass "private" section, not exported.
final _smoke_OuterClassWithInheritance_InnerClass_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_InnerClass_copy_handle'));
final _smoke_OuterClassWithInheritance_InnerClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_InnerClass_release_handle'));
class OuterClassWithInheritance_InnerClass$Impl extends __lib.NativeBase implements OuterClassWithInheritance_InnerClass {
  OuterClassWithInheritance_InnerClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_OuterClassWithInheritance_InnerClass_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  String bar(String input) {
    final _bar_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClassWithInheritance_InnerClass_bar__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _bar_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_OuterClassWithInheritance_InnerClass_toFfi(OuterClassWithInheritance_InnerClass value) =>
  _smoke_OuterClassWithInheritance_InnerClass_copy_handle((value as __lib.NativeBase).handle);
OuterClassWithInheritance_InnerClass smoke_OuterClassWithInheritance_InnerClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is OuterClassWithInheritance_InnerClass) return instance;
  final _copied_handle = _smoke_OuterClassWithInheritance_InnerClass_copy_handle(handle);
  final result = OuterClassWithInheritance_InnerClass$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterClassWithInheritance_InnerClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterClassWithInheritance_InnerClass_release_handle(handle);
Pointer<Void> smoke_OuterClassWithInheritance_InnerClass_toFfi_nullable(OuterClassWithInheritance_InnerClass? value) =>
  value != null ? smoke_OuterClassWithInheritance_InnerClass_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterClassWithInheritance_InnerClass? smoke_OuterClassWithInheritance_InnerClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterClassWithInheritance_InnerClass_fromFfi(handle) : null;
void smoke_OuterClassWithInheritance_InnerClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterClassWithInheritance_InnerClass_release_handle(handle);
// End of OuterClassWithInheritance_InnerClass "private" section.
abstract class OuterClassWithInheritance_InnerInterface {
  OuterClassWithInheritance_InnerInterface() {}
  factory OuterClassWithInheritance_InnerInterface.fromLambdas({
    required String Function(String) lambda_baz,
  }) => OuterClassWithInheritance_InnerInterface$Lambdas(
    lambda_baz,
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  String baz(String input);
}
// OuterClassWithInheritance_InnerInterface "private" section, not exported.
final _smoke_OuterClassWithInheritance_InnerInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_InnerInterface_copy_handle'));
final _smoke_OuterClassWithInheritance_InnerInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_InnerInterface_release_handle'));
final _smoke_OuterClassWithInheritance_InnerInterface_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_OuterClassWithInheritance_InnerInterface_create_proxy'));
final _smoke_OuterClassWithInheritance_InnerInterface_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_InnerInterface_get_type_id'));
class OuterClassWithInheritance_InnerInterface$Lambdas implements OuterClassWithInheritance_InnerInterface {
  String Function(String) lambda_baz;
  OuterClassWithInheritance_InnerInterface$Lambdas(
    this.lambda_baz,
  );
  @override
  void release() {}
  @override
  String baz(String input) =>
    lambda_baz(input);
}
class OuterClassWithInheritance_InnerInterface$Impl extends __lib.NativeBase implements OuterClassWithInheritance_InnerInterface {
  OuterClassWithInheritance_InnerInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_OuterClassWithInheritance_InnerInterface_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  String baz(String input) {
    final _baz_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClassWithInheritance_InnerInterface_baz__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _baz_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
}
int _OuterClassWithInheritance_InnerInterface_baz_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String? _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as OuterClassWithInheritance_InnerInterface).baz(String_fromFfi(input));
    _result.value = String_toFfi(_result_object);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
Pointer<Void> smoke_OuterClassWithInheritance_InnerInterface_toFfi(OuterClassWithInheritance_InnerInterface value) {
  if (value is __lib.NativeBase) return _smoke_OuterClassWithInheritance_InnerInterface_copy_handle((value as __lib.NativeBase).handle);
  final result = _smoke_OuterClassWithInheritance_InnerInterface_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_OuterClassWithInheritance_InnerInterface_baz_static, __lib.unknownError)
  );
  return result;
}
OuterClassWithInheritance_InnerInterface smoke_OuterClassWithInheritance_InnerInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is OuterClassWithInheritance_InnerInterface) return instance;
  final _type_id_handle = _smoke_OuterClassWithInheritance_InnerInterface_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_OuterClassWithInheritance_InnerInterface_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : OuterClassWithInheritance_InnerInterface$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterClassWithInheritance_InnerInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterClassWithInheritance_InnerInterface_release_handle(handle);
Pointer<Void> smoke_OuterClassWithInheritance_InnerInterface_toFfi_nullable(OuterClassWithInheritance_InnerInterface? value) =>
  value != null ? smoke_OuterClassWithInheritance_InnerInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterClassWithInheritance_InnerInterface? smoke_OuterClassWithInheritance_InnerInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterClassWithInheritance_InnerInterface_fromFfi(handle) : null;
void smoke_OuterClassWithInheritance_InnerInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterClassWithInheritance_InnerInterface_release_handle(handle);
// End of OuterClassWithInheritance_InnerInterface "private" section.
// OuterClassWithInheritance "private" section, not exported.
final _smoke_OuterClassWithInheritance_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_copy_handle'));
final _smoke_OuterClassWithInheritance_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_release_handle'));
final _smoke_OuterClassWithInheritance_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_get_type_id'));
class OuterClassWithInheritance$Impl extends ParentClass$Impl implements OuterClassWithInheritance {
  OuterClassWithInheritance$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_OuterClassWithInheritance_release_handle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  String foo(String input) {
    final _foo_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClassWithInheritance_foo__String'));
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
Pointer<Void> smoke_OuterClassWithInheritance_toFfi(OuterClassWithInheritance value) =>
  _smoke_OuterClassWithInheritance_copy_handle((value as __lib.NativeBase).handle);
OuterClassWithInheritance smoke_OuterClassWithInheritance_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is OuterClassWithInheritance) return instance;
  final _type_id_handle = _smoke_OuterClassWithInheritance_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_OuterClassWithInheritance_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : OuterClassWithInheritance$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterClassWithInheritance_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_OuterClassWithInheritance_release_handle(handle);
Pointer<Void> smoke_OuterClassWithInheritance_toFfi_nullable(OuterClassWithInheritance? value) =>
  value != null ? smoke_OuterClassWithInheritance_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterClassWithInheritance? smoke_OuterClassWithInheritance_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterClassWithInheritance_fromFfi(handle) : null;
void smoke_OuterClassWithInheritance_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_OuterClassWithInheritance_release_handle(handle);
// End of OuterClassWithInheritance "private" section.
