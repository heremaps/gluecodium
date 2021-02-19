import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/_type_repository.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/skip_proxy.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class InheritFromSkipped implements SkipProxy {
  InheritFromSkipped() {}
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
final _smoke_InheritFromSkipped_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InheritFromSkipped_copy_handle'));
final _smoke_InheritFromSkipped_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_InheritFromSkipped_release_handle'));
final _smoke_InheritFromSkipped_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_InheritFromSkipped_create_proxy'));
final _smoke_InheritFromSkipped_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
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
class InheritFromSkipped$Impl implements InheritFromSkipped {
  Pointer<Void> handle;
  InheritFromSkipped$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheInstance(handle);
    _smoke_InheritFromSkipped_release_handle(handle);
    handle = null;
  }
  @override
  String notInJava(String input) {
    final _notInJava_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SkipProxy_notInJava__String'));
    final _input_handle = String_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _notInJava_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  @override
  bool notInSwift(bool input) {
    final _notInSwift_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Uint8), int Function(Pointer<Void>, int, int)>('library_smoke_SkipProxy_notInSwift__Boolean'));
    final _input_handle = Boolean_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _notInSwift_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    Boolean_releaseFfiHandle(_input_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  String get skippedInJava {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SkipProxy_skippedInJava_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  set skippedInJava(String value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SkipProxy_skippedInJava_set__String'));
    final _value_handle = String_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    String_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  bool get isSkippedInSwift {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_SkipProxy_isSkippedInSwift_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  set isSkippedInSwift(bool value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('library_smoke_SkipProxy_isSkippedInSwift_set__Boolean'));
    final _value_handle = Boolean_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    Boolean_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
int _InheritFromSkipped_notInJava_static(Object _obj, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String _result_object = null;
  try {
    _result_object = (_obj as InheritFromSkipped).notInJava(String_fromFfi(input));
    _result.value = String_toFfi(_result_object);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
int _InheritFromSkipped_notInSwift_static(Object _obj, int input, Pointer<Uint8> _result) {
  bool _result_object = null;
  try {
    _result_object = (_obj as InheritFromSkipped).notInSwift(Boolean_fromFfi(input));
    _result.value = Boolean_toFfi(_result_object);
  } finally {
    Boolean_releaseFfiHandle(input);
  }
  return 0;
}
int _InheritFromSkipped_skippedInJava_get_static(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi((_obj as InheritFromSkipped).skippedInJava);
  return 0;
}
int _InheritFromSkipped_skippedInJava_set_static(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as InheritFromSkipped).skippedInJava =
      String_fromFfi(_value);
  } finally {
    String_releaseFfiHandle(_value);
  }
  return 0;
}
int _InheritFromSkipped_isSkippedInSwift_get_static(Object _obj, Pointer<Uint8> _result) {
  _result.value = Boolean_toFfi((_obj as InheritFromSkipped).isSkippedInSwift);
  return 0;
}
int _InheritFromSkipped_isSkippedInSwift_set_static(Object _obj, int _value) {
  try {
    (_obj as InheritFromSkipped).isSkippedInSwift =
      Boolean_fromFfi(_value);
  } finally {
    Boolean_releaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smoke_InheritFromSkipped_toFfi(InheritFromSkipped value) {
  if (value is InheritFromSkipped$Impl) return _smoke_InheritFromSkipped_copy_handle(value.handle);
  final result = _smoke_InheritFromSkipped_create_proxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Pointer<Void>>)>(_InheritFromSkipped_notInJava_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8, Pointer<Uint8>)>(_InheritFromSkipped_notInSwift_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_InheritFromSkipped_skippedInJava_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_InheritFromSkipped_skippedInJava_set_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_InheritFromSkipped_isSkippedInSwift_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8)>(_InheritFromSkipped_isSkippedInSwift_set_static, __lib.unknownError)
  );
  return result;
}
InheritFromSkipped smoke_InheritFromSkipped_fromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InheritFromSkipped) return instance as InheritFromSkipped;
  final _type_id_handle = _smoke_InheritFromSkipped_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_InheritFromSkipped_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : InheritFromSkipped$Impl(_copied_handle);
  __lib.cacheInstance(_copied_handle, result);
  return result;
}
void smoke_InheritFromSkipped_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_InheritFromSkipped_release_handle(handle);
Pointer<Void> smoke_InheritFromSkipped_toFfi_nullable(InheritFromSkipped value) =>
  value != null ? smoke_InheritFromSkipped_toFfi(value) : Pointer<Void>.fromAddress(0);
InheritFromSkipped smoke_InheritFromSkipped_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_InheritFromSkipped_fromFfi(handle) : null;
void smoke_InheritFromSkipped_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_InheritFromSkipped_release_handle(handle);
// End of InheritFromSkipped "private" section.
