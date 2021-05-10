import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class OuterInterface {
  OuterInterface();
  factory OuterInterface.fromLambdas({
    @required String Function(String) lambda_foo,
  }) => OuterInterface$Lambdas(
    lambda_foo,
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
final _smokeOuterinterfaceInnerclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerClass_copy_handle'));
final _smokeOuterinterfaceInnerclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerClass_release_handle'));
class OuterInterface_InnerClass$Impl extends __lib.NativeBase implements OuterInterface_InnerClass {
  OuterInterface_InnerClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterinterfaceInnerclassReleaseHandle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterInterface_InnerClass_foo__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _fooFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_OuterInterface_InnerClass_toFfi(OuterInterface_InnerClass value) =>
  _smokeOuterinterfaceInnerclassCopyHandle((value as __lib.NativeBase).handle);
OuterInterface_InnerClass smoke_OuterInterface_InnerClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterInterface_InnerClass;
  if (instance != null) return instance;
  final _copiedHandle = _smokeOuterinterfaceInnerclassCopyHandle(handle);
  final result = OuterInterface_InnerClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterInterface_InnerClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterinterfaceInnerclassReleaseHandle(handle);
Pointer<Void> smoke_OuterInterface_InnerClass_toFfi_nullable(OuterInterface_InnerClass value) =>
  value != null ? smoke_OuterInterface_InnerClass_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterInterface_InnerClass smoke_OuterInterface_InnerClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterInterface_InnerClass_fromFfi(handle) : null;
void smoke_OuterInterface_InnerClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeOuterinterfaceInnerclassReleaseHandle(handle);
// End of OuterInterface_InnerClass "private" section.
abstract class OuterInterface_InnerInterface {
  OuterInterface_InnerInterface();
  factory OuterInterface_InnerInterface.fromLambdas({
    @required String Function(String) lambda_foo,
  }) => OuterInterface_InnerInterface$Lambdas(
    lambda_foo,
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
  String foo(String input);
}
// OuterInterface_InnerInterface "private" section, not exported.
final _smokeOuterinterfaceInnerinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerInterface_copy_handle'));
final _smokeOuterinterfaceInnerinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerInterface_release_handle'));
final _smokeOuterinterfaceInnerinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_OuterInterface_InnerInterface_create_proxy'));
final _smokeOuterinterfaceInnerinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_InnerInterface_get_type_id'));
class OuterInterface_InnerInterface$Lambdas implements OuterInterface_InnerInterface {
  String Function(String) lambda_foo;
  OuterInterface_InnerInterface$Lambdas(
    this.lambda_foo,
  );
  @override
  void release() {}
  @override
  String foo(String input) =>
    lambda_foo(input);
}
class OuterInterface_InnerInterface$Impl extends __lib.NativeBase implements OuterInterface_InnerInterface {
  OuterInterface_InnerInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterinterfaceInnerinterfaceReleaseHandle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterInterface_InnerInterface_foo__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _fooFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
}
int _OuterInterface_InnerInterface_foo_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as OuterInterface_InnerInterface).foo(String_fromFfi(input));
    _result.value = String_toFfi(_resultObject);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
Pointer<Void> smoke_OuterInterface_InnerInterface_toFfi(OuterInterface_InnerInterface value) {
  if (value is __lib.NativeBase) return _smokeOuterinterfaceInnerinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeOuterinterfaceInnerinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_OuterInterface_InnerInterface_foo_static, __lib.unknownError)
  );
  return result;
}
OuterInterface_InnerInterface smoke_OuterInterface_InnerInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterInterface_InnerInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeOuterinterfaceInnerinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeOuterinterfaceInnerinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OuterInterface_InnerInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterInterface_InnerInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterinterfaceInnerinterfaceReleaseHandle(handle);
Pointer<Void> smoke_OuterInterface_InnerInterface_toFfi_nullable(OuterInterface_InnerInterface value) =>
  value != null ? smoke_OuterInterface_InnerInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterInterface_InnerInterface smoke_OuterInterface_InnerInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterInterface_InnerInterface_fromFfi(handle) : null;
void smoke_OuterInterface_InnerInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeOuterinterfaceInnerinterfaceReleaseHandle(handle);
// End of OuterInterface_InnerInterface "private" section.
// OuterInterface "private" section, not exported.
final _smokeOuterinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_copy_handle'));
final _smokeOuterinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterInterface_release_handle'));
final _smokeOuterinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_OuterInterface_create_proxy'));
final _smokeOuterinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterInterface_get_type_id'));
class OuterInterface$Lambdas implements OuterInterface {
  String Function(String) lambda_foo;
  OuterInterface$Lambdas(
    this.lambda_foo,
  );
  @override
  void release() {}
  @override
  String foo(String input) =>
    lambda_foo(input);
}
class OuterInterface$Impl extends __lib.NativeBase implements OuterInterface {
  OuterInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterinterfaceReleaseHandle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterInterface_foo__String'));
    final _inputHandle = String_toFfi(input);
    final _handle = this.handle;
    final __resultHandle = _fooFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
}
int _OuterInterface_foo_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as OuterInterface).foo(String_fromFfi(input));
    _result.value = String_toFfi(_resultObject);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
Pointer<Void> smoke_OuterInterface_toFfi(OuterInterface value) {
  if (value is __lib.NativeBase) return _smokeOuterinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeOuterinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_OuterInterface_foo_static, __lib.unknownError)
  );
  return result;
}
OuterInterface smoke_OuterInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeOuterinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeOuterinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OuterInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterinterfaceReleaseHandle(handle);
Pointer<Void> smoke_OuterInterface_toFfi_nullable(OuterInterface value) =>
  value != null ? smoke_OuterInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterInterface smoke_OuterInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterInterface_fromFfi(handle) : null;
void smoke_OuterInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeOuterinterfaceReleaseHandle(handle);
// End of OuterInterface "private" section.
