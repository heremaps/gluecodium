import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
abstract class SomeClass {
  factory SomeClass() => $class.fooBar();
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  void voidFunction();
  bool boolFunction();
  int intFunction();
  String stringFunction();
  SomeClass classFunction();
  static void staticFunction() => $class.staticFunction();
  static var $class = SomeClass$Impl(null);
}
// SomeClass "private" section, not exported.
final _smokeSomeclassRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SomeClass_register_finalizer'));
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
  void release() {}
  SomeClass fooBar() {
    final result = SomeClass$Impl(_fooBar());
    __lib.cacheInstance(handle, result);
    _smokeSomeclassRegisterFinalizer(handle, __lib.LibraryContext.isolateId, result);
    return result;
  }
  Pointer<Void> _fooBar() {
    final _fooBarFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('library_smoke_SomeClass_fooBar'));
    final __resultHandle = _fooBarFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }
  @override
  void voidFunction() {
    final _voidFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_SomeClass_voidFunction'));
    final _handle = this.handle;
    _voidFunctionFfi(_handle, __lib.LibraryContext.isolateId);
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
  void staticFunction() {
    final _staticFunctionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_SomeClass_staticFunction'));
    _staticFunctionFfi(__lib.LibraryContext.isolateId);
  }
}
Pointer<Void> smokeSomeclassToFfi(SomeClass value) =>
  _smokeSomeclassCopyHandle((value as __lib.NativeBase).handle);
SomeClass smokeSomeclassFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SomeClass) return instance as SomeClass;
  final _copiedHandle = _smokeSomeclassCopyHandle(handle);
  final result = SomeClass$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeSomeclassRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
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
