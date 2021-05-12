import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/parent_class.dart';
import 'dart:ffi';
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
final _smokeOuterclasswithinheritanceInnerclassCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_InnerClass_copy_handle'));
final _smokeOuterclasswithinheritanceInnerclassReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_InnerClass_release_handle'));
class OuterClassWithInheritance_InnerClass$Impl extends __lib.NativeBase implements OuterClassWithInheritance_InnerClass {
  OuterClassWithInheritance_InnerClass$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterclasswithinheritanceInnerclassReleaseHandle(handle);
    handle = null;
  }
  @override
  String bar(String input) {
    final _barFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClassWithInheritance_InnerClass_bar__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _barFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokeOuterclasswithinheritanceInnerclassToFfi(OuterClassWithInheritance_InnerClass value) =>
  _smokeOuterclasswithinheritanceInnerclassCopyHandle((value as __lib.NativeBase).handle);
OuterClassWithInheritance_InnerClass smokeOuterclasswithinheritanceInnerclassFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterClassWithInheritance_InnerClass;
  if (instance != null) return instance;
  final _copiedHandle = _smokeOuterclasswithinheritanceInnerclassCopyHandle(handle);
  final result = OuterClassWithInheritance_InnerClass$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeOuterclasswithinheritanceInnerclassReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclasswithinheritanceInnerclassReleaseHandle(handle);
Pointer<Void> smokeOuterclasswithinheritanceInnerclassToFfiNullable(OuterClassWithInheritance_InnerClass value) =>
  value != null ? smokeOuterclasswithinheritanceInnerclassToFfi(value) : Pointer<Void>.fromAddress(0);
OuterClassWithInheritance_InnerClass smokeOuterclasswithinheritanceInnerclassFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterclasswithinheritanceInnerclassFromFfi(handle) : null;
void smokeOuterclasswithinheritanceInnerclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterclasswithinheritanceInnerclassReleaseHandle(handle);
// End of OuterClassWithInheritance_InnerClass "private" section.
abstract class OuterClassWithInheritance_InnerInterface {
  OuterClassWithInheritance_InnerInterface();
  factory OuterClassWithInheritance_InnerInterface.fromLambdas({
    @required String Function(String) lambda_baz,
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
final _smokeOuterclasswithinheritanceInnerinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_InnerInterface_copy_handle'));
final _smokeOuterclasswithinheritanceInnerinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_InnerInterface_release_handle'));
final _smokeOuterclasswithinheritanceInnerinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_OuterClassWithInheritance_InnerInterface_create_proxy'));
final _smokeOuterclasswithinheritanceInnerinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
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
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterclasswithinheritanceInnerinterfaceReleaseHandle(handle);
    handle = null;
  }
  @override
  String baz(String input) {
    final _bazFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClassWithInheritance_InnerInterface_baz__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _bazFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
}
int _OuterClassWithInheritance_InnerInterfacebazStatic(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as OuterClassWithInheritance_InnerInterface).baz(stringFromFfi(input));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
Pointer<Void> smokeOuterclasswithinheritanceInnerinterfaceToFfi(OuterClassWithInheritance_InnerInterface value) {
  if (value is __lib.NativeBase) return _smokeOuterclasswithinheritanceInnerinterfaceCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeOuterclasswithinheritanceInnerinterfaceCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_OuterClassWithInheritance_InnerInterfacebazStatic, __lib.unknownError)
  );
  return result;
}
OuterClassWithInheritance_InnerInterface smokeOuterclasswithinheritanceInnerinterfaceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterClassWithInheritance_InnerInterface;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeOuterclasswithinheritanceInnerinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeOuterclasswithinheritanceInnerinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OuterClassWithInheritance_InnerInterface$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeOuterclasswithinheritanceInnerinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclasswithinheritanceInnerinterfaceReleaseHandle(handle);
Pointer<Void> smokeOuterclasswithinheritanceInnerinterfaceToFfiNullable(OuterClassWithInheritance_InnerInterface value) =>
  value != null ? smokeOuterclasswithinheritanceInnerinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);
OuterClassWithInheritance_InnerInterface smokeOuterclasswithinheritanceInnerinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterclasswithinheritanceInnerinterfaceFromFfi(handle) : null;
void smokeOuterclasswithinheritanceInnerinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterclasswithinheritanceInnerinterfaceReleaseHandle(handle);
// End of OuterClassWithInheritance_InnerInterface "private" section.
// OuterClassWithInheritance "private" section, not exported.
final _smokeOuterclasswithinheritanceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_copy_handle'));
final _smokeOuterclasswithinheritanceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_release_handle'));
final _smokeOuterclasswithinheritanceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_OuterClassWithInheritance_get_type_id'));
class OuterClassWithInheritance$Impl extends ParentClass$Impl implements OuterClassWithInheritance {
  OuterClassWithInheritance$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeOuterclasswithinheritanceReleaseHandle(handle);
    handle = null;
  }
  @override
  String foo(String input) {
    final _fooFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_OuterClassWithInheritance_foo__String'));
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
Pointer<Void> smokeOuterclasswithinheritanceToFfi(OuterClassWithInheritance value) =>
  _smokeOuterclasswithinheritanceCopyHandle((value as __lib.NativeBase).handle);
OuterClassWithInheritance smokeOuterclasswithinheritanceFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as OuterClassWithInheritance;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeOuterclasswithinheritanceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeOuterclasswithinheritanceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OuterClassWithInheritance$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeOuterclasswithinheritanceReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeOuterclasswithinheritanceReleaseHandle(handle);
Pointer<Void> smokeOuterclasswithinheritanceToFfiNullable(OuterClassWithInheritance value) =>
  value != null ? smokeOuterclasswithinheritanceToFfi(value) : Pointer<Void>.fromAddress(0);
OuterClassWithInheritance smokeOuterclasswithinheritanceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeOuterclasswithinheritanceFromFfi(handle) : null;
void smokeOuterclasswithinheritanceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeOuterclasswithinheritanceReleaseHandle(handle);
// End of OuterClassWithInheritance "private" section.
