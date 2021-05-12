import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/lambdas_declaration_order.dart';
import 'package:library/src/smoke/lambdas_interface.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class LambdasWithStructuredTypes {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  doClassStuff(LambdasWithStructuredTypes_ClassCallback callback);
  doStructStuff(LambdasWithStructuredTypes_StructCallback callback);
}
typedef LambdasWithStructuredTypes_ClassCallback = void Function(LambdasInterface);
// LambdasWithStructuredTypes_ClassCallback "private" section, not exported.
final _smokeLambdaswithstructuredtypesClasscallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_copy_handle'));
final _smokeLambdaswithstructuredtypesClasscallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_release_handle'));
final _smokeLambdaswithstructuredtypesClasscallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_create_proxy'));
class LambdasWithStructuredTypes_ClassCallback$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  LambdasWithStructuredTypes_ClassCallback$Impl(this.handle);
  void release() => _smokeLambdaswithstructuredtypesClasscallbackReleaseHandle(handle);
  call(LambdasInterface p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_ClassCallback_call__LambdasInterface'));
    final _p0Handle = smokeLambdasinterfaceToFfi(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    smokeLambdasinterfaceReleaseFfiHandle(_p0Handle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _LambdasWithStructuredTypes_ClassCallbackcallStatic(int _token, Pointer<Void> p0) {
  try {
    (__lib.instanceCache[_token] as LambdasWithStructuredTypes_ClassCallback)(smokeLambdasinterfaceFromFfi(p0));
  } finally {
    smokeLambdasinterfaceReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeLambdaswithstructuredtypesClasscallbackToFfi(LambdasWithStructuredTypes_ClassCallback value) {
  final result = _smokeLambdaswithstructuredtypesClasscallbackCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_LambdasWithStructuredTypes_ClassCallbackcallStatic, __lib.unknownError)
  );
  return result;
}
LambdasWithStructuredTypes_ClassCallback smokeLambdaswithstructuredtypesClasscallbackFromFfi(Pointer<Void> handle) {
  final _impl = LambdasWithStructuredTypes_ClassCallback$Impl(_smokeLambdaswithstructuredtypesClasscallbackCopyHandle(handle));
  return (LambdasInterface p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smokeLambdaswithstructuredtypesClasscallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesClasscallbackReleaseHandle(handle);
// Nullable LambdasWithStructuredTypes_ClassCallback
final _smokeLambdaswithstructuredtypesClasscallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_create_handle_nullable'));
final _smokeLambdaswithstructuredtypesClasscallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_release_handle_nullable'));
final _smokeLambdaswithstructuredtypesClasscallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_ClassCallback_get_value_nullable'));
Pointer<Void> smokeLambdaswithstructuredtypesClasscallbackToFfiNullable(LambdasWithStructuredTypes_ClassCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdaswithstructuredtypesClasscallbackToFfi(value);
  final result = _smokeLambdaswithstructuredtypesClasscallbackCreateHandleNullable(_handle);
  smokeLambdaswithstructuredtypesClasscallbackReleaseFfiHandle(_handle);
  return result;
}
LambdasWithStructuredTypes_ClassCallback smokeLambdaswithstructuredtypesClasscallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdaswithstructuredtypesClasscallbackGetValueNullable(handle);
  final result = smokeLambdaswithstructuredtypesClasscallbackFromFfi(_handle);
  smokeLambdaswithstructuredtypesClasscallbackReleaseFfiHandle(_handle);
  return result;
}
void smokeLambdaswithstructuredtypesClasscallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesClasscallbackReleaseHandleNullable(handle);
// End of LambdasWithStructuredTypes_ClassCallback "private" section.
typedef LambdasWithStructuredTypes_StructCallback = void Function(LambdasDeclarationOrder_SomeStruct);
// LambdasWithStructuredTypes_StructCallback "private" section, not exported.
final _smokeLambdaswithstructuredtypesStructcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_copy_handle'));
final _smokeLambdaswithstructuredtypesStructcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_release_handle'));
final _smokeLambdaswithstructuredtypesStructcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_create_proxy'));
class LambdasWithStructuredTypes_StructCallback$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  LambdasWithStructuredTypes_StructCallback$Impl(this.handle);
  void release() => _smokeLambdaswithstructuredtypesStructcallbackReleaseHandle(handle);
  call(LambdasDeclarationOrder_SomeStruct p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_StructCallback_call__SomeStruct'));
    final _p0Handle = smokeLambdasdeclarationorderSomestructToFfi(p0);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    smokeLambdasdeclarationorderSomestructReleaseFfiHandle(_p0Handle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _LambdasWithStructuredTypes_StructCallbackcallStatic(int _token, Pointer<Void> p0) {
  try {
    (__lib.instanceCache[_token] as LambdasWithStructuredTypes_StructCallback)(smokeLambdasdeclarationorderSomestructFromFfi(p0));
  } finally {
    smokeLambdasdeclarationorderSomestructReleaseFfiHandle(p0);
  }
  return 0;
}
Pointer<Void> smokeLambdaswithstructuredtypesStructcallbackToFfi(LambdasWithStructuredTypes_StructCallback value) {
  final result = _smokeLambdaswithstructuredtypesStructcallbackCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>)>(_LambdasWithStructuredTypes_StructCallbackcallStatic, __lib.unknownError)
  );
  return result;
}
LambdasWithStructuredTypes_StructCallback smokeLambdaswithstructuredtypesStructcallbackFromFfi(Pointer<Void> handle) {
  final _impl = LambdasWithStructuredTypes_StructCallback$Impl(_smokeLambdaswithstructuredtypesStructcallbackCopyHandle(handle));
  return (LambdasDeclarationOrder_SomeStruct p0) {
    final _result =_impl.call(p0);
    _impl.release();
    return _result;
  };
}
void smokeLambdaswithstructuredtypesStructcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesStructcallbackReleaseHandle(handle);
// Nullable LambdasWithStructuredTypes_StructCallback
final _smokeLambdaswithstructuredtypesStructcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_create_handle_nullable'));
final _smokeLambdaswithstructuredtypesStructcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_release_handle_nullable'));
final _smokeLambdaswithstructuredtypesStructcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_StructCallback_get_value_nullable'));
Pointer<Void> smokeLambdaswithstructuredtypesStructcallbackToFfiNullable(LambdasWithStructuredTypes_StructCallback value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLambdaswithstructuredtypesStructcallbackToFfi(value);
  final result = _smokeLambdaswithstructuredtypesStructcallbackCreateHandleNullable(_handle);
  smokeLambdaswithstructuredtypesStructcallbackReleaseFfiHandle(_handle);
  return result;
}
LambdasWithStructuredTypes_StructCallback smokeLambdaswithstructuredtypesStructcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLambdaswithstructuredtypesStructcallbackGetValueNullable(handle);
  final result = smokeLambdaswithstructuredtypesStructcallbackFromFfi(_handle);
  smokeLambdaswithstructuredtypesStructcallbackReleaseFfiHandle(_handle);
  return result;
}
void smokeLambdaswithstructuredtypesStructcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesStructcallbackReleaseHandleNullable(handle);
// End of LambdasWithStructuredTypes_StructCallback "private" section.
// LambdasWithStructuredTypes "private" section, not exported.
final _smokeLambdaswithstructuredtypesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_copy_handle'));
final _smokeLambdaswithstructuredtypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LambdasWithStructuredTypes_release_handle'));
class LambdasWithStructuredTypes$Impl extends __lib.NativeBase implements LambdasWithStructuredTypes {
  LambdasWithStructuredTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeLambdaswithstructuredtypesReleaseHandle(handle);
    handle = null;
  }
  @override
  doClassStuff(LambdasWithStructuredTypes_ClassCallback callback) {
    final _doClassStuffFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_doClassStuff__ClassCallback'));
    final _callbackHandle = smokeLambdaswithstructuredtypesClasscallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _doClassStuffFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    smokeLambdaswithstructuredtypesClasscallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  doStructStuff(LambdasWithStructuredTypes_StructCallback callback) {
    final _doStructStuffFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_LambdasWithStructuredTypes_doStructStuff__StructCallback'));
    final _callbackHandle = smokeLambdaswithstructuredtypesStructcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _doStructStuffFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    smokeLambdaswithstructuredtypesStructcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smokeLambdaswithstructuredtypesToFfi(LambdasWithStructuredTypes value) =>
  _smokeLambdaswithstructuredtypesCopyHandle((value as __lib.NativeBase).handle);
LambdasWithStructuredTypes smokeLambdaswithstructuredtypesFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as LambdasWithStructuredTypes;
  if (instance != null) return instance;
  final _copiedHandle = _smokeLambdaswithstructuredtypesCopyHandle(handle);
  final result = LambdasWithStructuredTypes$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeLambdaswithstructuredtypesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesReleaseHandle(handle);
Pointer<Void> smokeLambdaswithstructuredtypesToFfiNullable(LambdasWithStructuredTypes value) =>
  value != null ? smokeLambdaswithstructuredtypesToFfi(value) : Pointer<Void>.fromAddress(0);
LambdasWithStructuredTypes smokeLambdaswithstructuredtypesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeLambdaswithstructuredtypesFromFfi(handle) : null;
void smokeLambdaswithstructuredtypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLambdaswithstructuredtypesReleaseHandle(handle);
// End of LambdasWithStructuredTypes "private" section.
