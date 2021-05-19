import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
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
final _smokeSomeclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SomeClass_copy_handle'));
final _smokeSomeclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SomeClass_release_handle'));
class SomeClass$Impl extends __lib.NativeBase implements SomeClass {
  SomeClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeSomeclassReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  SomeClass fooBar() {
    final result = SomeClass$Impl(_fooBar());
    __lib.ffiCacheToken(handle, __lib.LibraryContext.isolateId, __lib.cacheObject(result));
    return result;
  }
  Pointer<Void> _fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_SomeClass_fooBar'));
    final __resultHandle = _fooBarFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }
  @override
  voidFunction() {
    final _voidFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SomeClass_voidFunction'));
    final _handle = this.handle;
    final __resultHandle = _voidFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  bool boolFunction() {
    final _boolFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_SomeClass_boolFunction'));
    final _handle = this.handle;
    final __resultHandle = _boolFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  int intFunction() {
    final _intFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_SomeClass_intFunction'));
    final _handle = this.handle;
    final __resultHandle = _intFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  @override
  String stringFunction() {
    final _stringFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SomeClass_stringFunction'));
    final _handle = this.handle;
    final __resultHandle = _stringFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  SomeClass classFunction() {
    final _classFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SomeClass_classFunction'));
    final _handle = this.handle;
    final __resultHandle = _classFunctionFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return smokeSomeclassFromFfi(__resultHandle);
    } finally {
      smokeSomeclassReleaseFfiHandle(__resultHandle);
    }
  }
  staticFunction() {
    final _staticFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_SomeClass_staticFunction'));
    final __resultHandle = _staticFunctionFfi(__lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
Pointer<Void> smokeSomeclassToFfi(SomeClass value) =>
  _smokeSomeclassCopyHandle((value as __lib.NativeBase).handle);
SomeClass smokeSomeclassFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is SomeClass) return instance;
  final _copiedHandle = _smokeSomeclassCopyHandle(handle);
  final result = SomeClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeSomeclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSomeclassReleaseHandle(handle);
Pointer<Void> smokeSomeclassToFfiNullable(SomeClass? value) =>
  value != null ? smokeSomeclassToFfi(value) : Pointer<Void>.fromAddress(0);
SomeClass? smokeSomeclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSomeclassFromFfi(handle) : null;
void smokeSomeclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSomeclassReleaseHandle(handle);
// End of SomeClass "private" section.
