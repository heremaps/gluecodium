import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class EnableIfEnabled {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static enableIfUnquoted() => EnableIfEnabled$Impl.enableIfUnquoted();
  static enableIfUnquotedList() => EnableIfEnabled$Impl.enableIfUnquotedList();
  static enableIfQuoted() => EnableIfEnabled$Impl.enableIfQuoted();
  static enableIfQuotedList() => EnableIfEnabled$Impl.enableIfQuotedList();
  static enableIfTagged() => EnableIfEnabled$Impl.enableIfTagged();
  static enableIfTaggedList() => EnableIfEnabled$Impl.enableIfTaggedList();
  static enableIfMixedList() => EnableIfEnabled$Impl.enableIfMixedList();
}
// EnableIfEnabled "private" section, not exported.
final _smoke_EnableIfEnabled_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_EnableIfEnabled_copy_handle'));
final _smoke_EnableIfEnabled_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_EnableIfEnabled_release_handle'));
class EnableIfEnabled$Impl extends __lib.NativeBase implements EnableIfEnabled {
  EnableIfEnabled$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_EnableIfEnabled_release_handle(handle);
    handle = null;
  }
  static enableIfUnquoted() {
    final _enableIfUnquoted_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfUnquoted'));
    final __result_handle = _enableIfUnquoted_ffi(__lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static enableIfUnquotedList() {
    final _enableIfUnquotedList_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfUnquotedList'));
    final __result_handle = _enableIfUnquotedList_ffi(__lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static enableIfQuoted() {
    final _enableIfQuoted_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfQuoted'));
    final __result_handle = _enableIfQuoted_ffi(__lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static enableIfQuotedList() {
    final _enableIfQuotedList_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfQuotedList'));
    final __result_handle = _enableIfQuotedList_ffi(__lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static enableIfTagged() {
    final _enableIfTagged_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfTagged'));
    final __result_handle = _enableIfTagged_ffi(__lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static enableIfTaggedList() {
    final _enableIfTaggedList_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfTaggedList'));
    final __result_handle = _enableIfTaggedList_ffi(__lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  static enableIfMixedList() {
    final _enableIfMixedList_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_EnableIfEnabled_enableIfMixedList'));
    final __result_handle = _enableIfMixedList_ffi(__lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_EnableIfEnabled_toFfi(EnableIfEnabled value) =>
  _smoke_EnableIfEnabled_copy_handle((value as __lib.NativeBase).handle);
EnableIfEnabled smoke_EnableIfEnabled_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as EnableIfEnabled;
  if (instance != null) return instance;
  final _copied_handle = _smoke_EnableIfEnabled_copy_handle(handle);
  final result = EnableIfEnabled$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_EnableIfEnabled_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_EnableIfEnabled_release_handle(handle);
Pointer<Void> smoke_EnableIfEnabled_toFfi_nullable(EnableIfEnabled value) =>
  value != null ? smoke_EnableIfEnabled_toFfi(value) : Pointer<Void>.fromAddress(0);
EnableIfEnabled smoke_EnableIfEnabled_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_EnableIfEnabled_fromFfi(handle) : null;
void smoke_EnableIfEnabled_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_EnableIfEnabled_release_handle(handle);
// End of EnableIfEnabled "private" section.
