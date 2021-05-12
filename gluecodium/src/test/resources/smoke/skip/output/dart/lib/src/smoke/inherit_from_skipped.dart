import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/skip_proxy.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class InheritFromSkipped implements SkipProxy {
  InheritFromSkipped();
  factory InheritFromSkipped.fromLambdas({
    @required String Function(String) lambda_notInJava,
    @required bool Function(bool) lambda_notInSwift,
    @required String Function() lambda_skippedInJava_get,
    @required void Function(String) lambda_skippedInJava_set,
    @required bool Function() lambda_isSkippedInSwift_get,
    @required void Function(bool) lambda_isSkippedInSwift_set
  }) => InheritFromSkipped$Lambdas(
    lambda_notInJava,
    lambda_notInSwift,
    lambda_skippedInJava_get,
    lambda_skippedInJava_set,
    lambda_isSkippedInSwift_get,
    lambda_isSkippedInSwift_set
  );
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}
}
// InheritFromSkipped "private" section, not exported.
final _smokeInheritfromskippedCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InheritFromSkipped_copy_handle'));
final _smokeInheritfromskippedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InheritFromSkipped_release_handle'));
final _smokeInheritfromskippedCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_InheritFromSkipped_create_proxy'));
final _smokeInheritfromskippedGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InheritFromSkipped_get_type_id'));
class InheritFromSkipped$Lambdas implements InheritFromSkipped {
  String Function(String) lambda_notInJava;
  bool Function(bool) lambda_notInSwift;
  String Function() lambda_skippedInJava_get;
  void Function(String) lambda_skippedInJava_set;
  bool Function() lambda_isSkippedInSwift_get;
  void Function(bool) lambda_isSkippedInSwift_set;
  InheritFromSkipped$Lambdas(
    this.lambda_notInJava,
    this.lambda_notInSwift,
    this.lambda_skippedInJava_get,
    this.lambda_skippedInJava_set,
    this.lambda_isSkippedInSwift_get,
    this.lambda_isSkippedInSwift_set
  );
  @override
  void release() {}
  @override
  String notInJava(String input) =>
    lambda_notInJava(input);
  @override
  bool notInSwift(bool input) =>
    lambda_notInSwift(input);
  @override
  String get skippedInJava => lambda_skippedInJava_get();
  @override
  set skippedInJava(String value) => lambda_skippedInJava_set(value);
  @override
  bool get isSkippedInSwift => lambda_isSkippedInSwift_get();
  @override
  set isSkippedInSwift(bool value) => lambda_isSkippedInSwift_set(value);
}
class InheritFromSkipped$Impl extends __lib.NativeBase implements InheritFromSkipped {
  InheritFromSkipped$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeInheritfromskippedReleaseHandle(handle);
    handle = null;
  }
  @override
  String notInJava(String input) {
    final _notInJavaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SkipProxy_notInJava__String'));
    final _inputHandle = stringToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _notInJavaFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  @override
  bool notInSwift(bool input) {
    final _notInSwiftFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint8), int Function(Pointer<Void>, int, int)>('library_smoke_SkipProxy_notInSwift__Boolean'));
    final _inputHandle = booleanToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _notInSwiftFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    booleanReleaseFfiHandle(_inputHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  String get skippedInJava {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SkipProxy_skippedInJava_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);
    }
  }
  set skippedInJava(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SkipProxy_skippedInJava_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
  bool get isSkippedInSwift {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_SkipProxy_isSkippedInSwift_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);
    }
  }
  set isSkippedInSwift(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_SkipProxy_isSkippedInSwift_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);
    try {
      return (__resultHandle);
    } finally {
      (__resultHandle);
    }
  }
}
int _InheritFromSkippednotInJavaStatic(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as InheritFromSkipped).notInJava(stringFromFfi(input));
    _result.value = stringToFfi(_resultObject);
  } finally {
    stringReleaseFfiHandle(input);
  }
  return 0;
}
int _InheritFromSkippednotInSwiftStatic(int _token, int input, Pointer<Uint8> _result) {
  bool _resultObject = null;
  try {
    _resultObject = (__lib.instanceCache[_token] as InheritFromSkipped).notInSwift(booleanFromFfi(input));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    booleanReleaseFfiHandle(input);
  }
  return 0;
}
int _InheritFromSkippedskippedInJavaGetStatic(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = stringToFfi((__lib.instanceCache[_token] as InheritFromSkipped).skippedInJava);
  return 0;
}
int _InheritFromSkippedskippedInJavaSetStatic(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as InheritFromSkipped).skippedInJava =
      stringFromFfi(_value);
  } finally {
    stringReleaseFfiHandle(_value);
  }
  return 0;
}
int _InheritFromSkippedisSkippedInSwiftGetStatic(int _token, Pointer<Uint8> _result) {
  _result.value = booleanToFfi((__lib.instanceCache[_token] as InheritFromSkipped).isSkippedInSwift);
  return 0;
}
int _InheritFromSkippedisSkippedInSwiftSetStatic(int _token, int _value) {
  try {
    (__lib.instanceCache[_token] as InheritFromSkipped).isSkippedInSwift =
      booleanFromFfi(_value);
  } finally {
    booleanReleaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smokeInheritfromskippedToFfi(InheritFromSkipped value) {
  if (value is __lib.NativeBase) return _smokeInheritfromskippedCopyHandle((value as __lib.NativeBase).handle);
  final result = _smokeInheritfromskippedCreateProxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_InheritFromSkippednotInJavaStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint8, Pointer<Uint8>)>(_InheritFromSkippednotInSwiftStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_InheritFromSkippedskippedInJavaGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_InheritFromSkippedskippedInJavaSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_InheritFromSkippedisSkippedInSwiftGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint8)>(_InheritFromSkippedisSkippedInSwiftSetStatic, __lib.unknownError)
  );
  return result;
}
InheritFromSkipped smokeInheritfromskippedFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as InheritFromSkipped;
  if (instance != null) return instance;
  final _typeIdHandle = _smokeInheritfromskippedGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);
  final _copiedHandle = _smokeInheritfromskippedCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : InheritFromSkipped$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeInheritfromskippedReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeInheritfromskippedReleaseHandle(handle);
Pointer<Void> smokeInheritfromskippedToFfiNullable(InheritFromSkipped value) =>
  value != null ? smokeInheritfromskippedToFfi(value) : Pointer<Void>.fromAddress(0);
InheritFromSkipped smokeInheritfromskippedFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeInheritfromskippedFromFfi(handle) : null;
void smokeInheritfromskippedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeInheritfromskippedReleaseHandle(handle);
// End of InheritFromSkipped "private" section.
