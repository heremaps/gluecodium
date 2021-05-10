import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
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
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterclassInnerclassReleaseHandle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClass_InnerClass_foo__String'));
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
Pointer<Void> smoke_OuterClass_InnerClass_toFfi(OuterClass_InnerClass value) =>
  _smokeOuterclassInnerclassCopyHandle((value as __lib.NativeBase).handle);
OuterClass_InnerClass smoke_OuterClass_InnerClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterClass_InnerClass;
  if (instance != null) return instance;
  final _copiedHandle = _smokeOuterclassInnerclassCopyHandle(handle);
  final result = OuterClass_InnerClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterClass_InnerClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclassInnerclassReleaseHandle(handle);
Pointer<Void> smoke_OuterClass_InnerClass_toFfi_nullable(OuterClass_InnerClass value) =>
  value != null ? smoke_OuterClass_InnerClass_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterClass_InnerClass smoke_OuterClass_InnerClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterClass_InnerClass_fromFfi(handle) : null;
void smoke_OuterClass_InnerClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeOuterclassInnerclassReleaseHandle(handle);
// End of OuterClass_InnerClass "private" section.
abstract class OuterClass_InnerInterface {
  OuterClass_InnerInterface();
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
class OuterClass_InnerInterface$Impl extends __lib.NativeBase implements OuterClass_InnerInterface {
  OuterClass_InnerInterface$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterclassInnerinterfaceReleaseHandle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClass_InnerInterface_foo__String'));
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
int _OuterClass_InnerInterface_foo_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as OuterClass_InnerInterface).foo(String_fromFfi(input));
    _result.value = String_toFfi(_resultObject);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
Pointer<Void> smoke_OuterClass_InnerInterface_toFfi(OuterClass_InnerInterface value) {
  if (value is __lib.NativeBase) return _smokeOuterclassInnerinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeOuterclassInnerinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_OuterClass_InnerInterface_foo_static, __lib.unknownError)
  );
  return result;
}
OuterClass_InnerInterface smoke_OuterClass_InnerInterface_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterClass_InnerInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeOuterclassInnerinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_typeIdHandle)];
  String_releaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeOuterclassInnerinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OuterClass_InnerInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterClass_InnerInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclassInnerinterfaceReleaseHandle(handle);
Pointer<Void> smoke_OuterClass_InnerInterface_toFfi_nullable(OuterClass_InnerInterface value) =>
  value != null ? smoke_OuterClass_InnerInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterClass_InnerInterface smoke_OuterClass_InnerInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterClass_InnerInterface_fromFfi(handle) : null;
void smoke_OuterClass_InnerInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
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
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterclassReleaseHandle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClass_foo__String'));
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
Pointer<Void> smoke_OuterClass_toFfi(OuterClass value) =>
  _smokeOuterclassCopyHandle((value as __lib.NativeBase).handle);
OuterClass smoke_OuterClass_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterClass;
  if (instance != null) return instance;
  final _copiedHandle = _smokeOuterclassCopyHandle(handle);
  final result = OuterClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_OuterClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclassReleaseHandle(handle);
Pointer<Void> smoke_OuterClass_toFfi_nullable(OuterClass value) =>
  value != null ? smoke_OuterClass_toFfi(value) : Pointer<Void>.fromAddress(0);
OuterClass smoke_OuterClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_OuterClass_fromFfi(handle) : null;
void smoke_OuterClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeOuterclassReleaseHandle(handle);
// End of OuterClass "private" section.
