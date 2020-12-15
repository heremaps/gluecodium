import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class SomeClass {
  factory SomeClass() => $class.fooBar();
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  voidFunction();
  bool boolFunction();
  int intFunction();
  String stringFunction();
  SomeClass classFunction();
  static staticFunction() => $class.staticFunction();
  static var $class = SomeClass$Impl();
}
// SomeClass "private" section, not exported.
final _smoke_SomeClass_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SomeClass_copy_handle'));
final _smoke_SomeClass_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SomeClass_release_handle'));
class SomeClass$Impl implements SomeClass {
  @protected
  Pointer<Void> handle;
  SomeClass$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_SomeClass_release_handle(handle);
    handle = null;
  }
  SomeClass fooBar() {
    final result = SomeClass$Impl(_fooBar());
    __lib.ffi_cache_token(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(result));
    return result;
  }
  Pointer<Void> _fooBar() {
    final _fooBar_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_SomeClass_fooBar'));
    final __result_handle = _fooBar_ffi(__lib.LibraryContext.isolateId);
    return __result_handle;
  }
  @override
  voidFunction() {
    final _voidFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SomeClass_voidFunction'));
    final _handle = this.handle;
    final __result_handle = _voidFunction_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  bool boolFunction() {
    final _boolFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_SomeClass_boolFunction'));
    final _handle = this.handle;
    final __result_handle = _boolFunction_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  @override
  int intFunction() {
    final _intFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_SomeClass_intFunction'));
    final _handle = this.handle;
    final __result_handle = _intFunction_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  @override
  String stringFunction() {
    final _stringFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SomeClass_stringFunction'));
    final _handle = this.handle;
    final __result_handle = _stringFunction_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  @override
  SomeClass classFunction() {
    final _classFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SomeClass_classFunction'));
    final _handle = this.handle;
    final __result_handle = _classFunction_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smoke_SomeClass_fromFfi(__result_handle);
    } finally {
      smoke_SomeClass_releaseFfiHandle(__result_handle);
    }
  }
  staticFunction() {
    final _staticFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_SomeClass_staticFunction'));
    final __result_handle = _staticFunction_ffi(__lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_SomeClass_toFfi(SomeClass value) =>
  _smoke_SomeClass_copy_handle((value as SomeClass$Impl).handle);
SomeClass smoke_SomeClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as SomeClass;
  if (instance != null) return instance;
  final _copied_handle = _smoke_SomeClass_copy_handle(handle);
  final result = SomeClass$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_SomeClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SomeClass_release_handle(handle);
Pointer<Void> smoke_SomeClass_toFfi_nullable(SomeClass value) =>
  value != null ? smoke_SomeClass_toFfi(value) : Pointer<Void>.fromAddress(0);
SomeClass smoke_SomeClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SomeClass_fromFfi(handle) : null;
void smoke_SomeClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SomeClass_release_handle(handle);
// End of SomeClass "private" section.
