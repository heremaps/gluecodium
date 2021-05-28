import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
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
final _smokeOuterclassInnerclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClass_InnerClass_copy_handle'));
final _smokeOuterclassInnerclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClass_InnerClass_release_handle'));
class OuterClass_InnerClass$Impl extends __lib.NativeBase implements OuterClass_InnerClass {
  OuterClass_InnerClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterclassInnerclassReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClass_InnerClass_foo__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _fooFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeOuterclassInnerclassToFfi(OuterClass_InnerClass value) =>
  _smokeOuterclassInnerclassCopyHandle((value as __lib.NativeBase).handle);
OuterClass_InnerClass smokeOuterclassInnerclassFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is OuterClass_InnerClass) return instance;
  final _copiedHandle = _smokeOuterclassInnerclassCopyHandle(handle);
  final result = OuterClass_InnerClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeOuterclassInnerclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclassInnerclassReleaseHandle(handle);
Pointer<Void> smokeOuterclassInnerclassToFfiNullable(OuterClass_InnerClass? value) =>
  value != null ? smokeOuterclassInnerclassToFfi(value) : Pointer<Void>.fromAddress(0);
OuterClass_InnerClass? smokeOuterclassInnerclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterclassInnerclassFromFfi(handle) : null;
void smokeOuterclassInnerclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterclassInnerclassReleaseHandle(handle);
// End of OuterClass_InnerClass "private" section.
abstract class OuterClass_InnerInterface {
  factory OuterClass_InnerInterface(
    String Function(String) fooLambda,
  ) => OuterClass_InnerInterface$Lambdas(
    fooLambda,
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  String foo(String input);
}
// OuterClass_InnerInterface "private" section, not exported.
final _smokeOuterclassInnerinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClass_InnerInterface_copy_handle'));
final _smokeOuterclassInnerinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClass_InnerInterface_release_handle'));
final _smokeOuterclassInnerinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_OuterClass_InnerInterface_create_proxy'));
final _smokeOuterclassInnerinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClass_InnerInterface_get_type_id'));
class OuterClass_InnerInterface$Lambdas implements OuterClass_InnerInterface {
  String Function(String) fooLambda;
  OuterClass_InnerInterface$Lambdas(
    this.fooLambda,
  );
  @override
  void release() {}
  @override
  String foo(String input) =>
    fooLambda(input);
}
class OuterClass_InnerInterface$Impl extends __lib.NativeBase implements OuterClass_InnerInterface {
  OuterClass_InnerInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterclassInnerinterfaceReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClass_InnerInterface_foo__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _fooFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
int _smokeOuterclassInnerinterfacefooStatic(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (__lib.instanceCache[_token] as OuterClass_InnerInterface).foo(stringFromFfi(input));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
Pointer<Void> smokeOuterclassInnerinterfaceToFfi(OuterClass_InnerInterface value) {
  if (value is __lib.NativeBase) return _smokeOuterclassInnerinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeOuterclassInnerinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_smokeOuterclassInnerinterfacefooStatic, __lib.unknownError)
  );
  return result;
}
OuterClass_InnerInterface smokeOuterclassInnerinterfaceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is OuterClass_InnerInterface) return instance;
  final _typeIdHandle = _smokeOuterclassInnerinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeOuterclassInnerinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OuterClass_InnerInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeOuterclassInnerinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclassInnerinterfaceReleaseHandle(handle);
Pointer<Void> smokeOuterclassInnerinterfaceToFfiNullable(OuterClass_InnerInterface? value) =>
  value != null ? smokeOuterclassInnerinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
OuterClass_InnerInterface? smokeOuterclassInnerinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterclassInnerinterfaceFromFfi(handle) : null;
void smokeOuterclassInnerinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterclassInnerinterfaceReleaseHandle(handle);
// End of OuterClass_InnerInterface "private" section.
// OuterClass "private" section, not exported.
final _smokeOuterclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClass_copy_handle'));
final _smokeOuterclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClass_release_handle'));
class OuterClass$Impl extends __lib.NativeBase implements OuterClass {
  OuterClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle.address == 0) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterclassReleaseHandle(handle);
    handle = Pointer<Void>.fromAddress(0);
  }
  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClass_foo__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _fooFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeOuterclassToFfi(OuterClass value) =>
  _smokeOuterclassCopyHandle((value as __lib.NativeBase).handle);
OuterClass smokeOuterclassFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token];
  if (instance is OuterClass) return instance;
  final _copiedHandle = _smokeOuterclassCopyHandle(handle);
  final result = OuterClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeOuterclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclassReleaseHandle(handle);
Pointer<Void> smokeOuterclassToFfiNullable(OuterClass? value) =>
  value != null ? smokeOuterclassToFfi(value) : Pointer<Void>.fromAddress(0);
OuterClass? smokeOuterclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterclassFromFfi(handle) : null;
void smokeOuterclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterclassReleaseHandle(handle);
// End of OuterClass "private" section.
