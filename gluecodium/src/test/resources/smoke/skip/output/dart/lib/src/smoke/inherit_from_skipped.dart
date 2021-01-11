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
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('library_smoke_InheritFromSkipped_create_proxy'));
final _smoke_InheritFromSkipped_get_type_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_InheritFromSkipped_get_type_id'));
class InheritFromSkipped$Lambdas extends SkipProxy$Lambdas implements InheritFromSkipped {
  InheritFromSkipped$Lambdas(
    String Function(String) lambda_notInJava,
    bool Function(bool) lambda_notInSwift,
    String Function() lambda_skippedInJava_get,
    void Function(String) lambda_skippedInJava_set,
    bool Function() lambda_isSkippedInSwift_get,
    void Function(bool) lambda_isSkippedInSwift_set
  ) : super(
    lambda_notInJava,
    lambda_notInSwift,
    lambda_skippedInJava_get,
    lambda_skippedInJava_set,
    lambda_isSkippedInSwift_get,
    lambda_isSkippedInSwift_set
  ) {
  }
  @override
  void release() {}
}
class InheritFromSkipped$Impl extends SkipProxy$Impl implements InheritFromSkipped {
  InheritFromSkipped$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_InheritFromSkipped_release_handle(handle);
    handle = null;
  }
}
int _InheritFromSkipped_notInJava_static(int _token, Pointer<Void> input, Pointer<Pointer<Void>> _result) {
  String _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as InheritFromSkipped).notInJava(String_fromFfi(input));
    _result.value = String_toFfi(_result_object);
  } finally {
    String_releaseFfiHandle(input);
  }
  return 0;
}
int _InheritFromSkipped_notInSwift_static(int _token, int input, Pointer<Uint8> _result) {
  bool _result_object = null;
  try {
    _result_object = (__lib.instanceCache[_token] as InheritFromSkipped).notInSwift(Boolean_fromFfi(input));
    _result.value = Boolean_toFfi(_result_object);
  } finally {
    Boolean_releaseFfiHandle(input);
  }
  return 0;
}
int _InheritFromSkipped_skippedInJava_get_static(int _token, Pointer<Pointer<Void>> _result) {
  _result.value = String_toFfi((__lib.instanceCache[_token] as InheritFromSkipped).skippedInJava);
  return 0;
}
int _InheritFromSkipped_skippedInJava_set_static(int _token, Pointer<Void> _value) {
  try {
    (__lib.instanceCache[_token] as InheritFromSkipped).skippedInJava =
      String_fromFfi(_value);
  } finally {
    String_releaseFfiHandle(_value);
  }
  return 0;
}
int _InheritFromSkipped_isSkippedInSwift_get_static(int _token, Pointer<Uint8> _result) {
  _result.value = Boolean_toFfi((__lib.instanceCache[_token] as InheritFromSkipped).isSkippedInSwift);
  return 0;
}
int _InheritFromSkipped_isSkippedInSwift_set_static(int _token, int _value) {
  try {
    (__lib.instanceCache[_token] as InheritFromSkipped).isSkippedInSwift =
      Boolean_fromFfi(_value);
  } finally {
    Boolean_releaseFfiHandle(_value);
  }
  return 0;
}
Pointer<Void> smoke_InheritFromSkipped_toFfi(InheritFromSkipped value) {
  if (value is InheritFromSkipped$Impl) return _smoke_InheritFromSkipped_copy_handle(value.handle);
  final result = _smoke_InheritFromSkipped_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>, Pointer<Pointer<Void>>)>(_InheritFromSkipped_notInJava_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint8, Pointer<Uint8>)>(_InheritFromSkipped_notInSwift_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Pointer<Void>>)>(_InheritFromSkipped_skippedInJava_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Void>)>(_InheritFromSkipped_skippedInJava_set_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Pointer<Uint8>)>(_InheritFromSkipped_isSkippedInSwift_get_static, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Uint64, Uint8)>(_InheritFromSkipped_isSkippedInSwift_set_static, __lib.unknownError)
  );
  return result;
}
InheritFromSkipped smoke_InheritFromSkipped_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as InheritFromSkipped;
  if (instance != null) return instance;
  final _type_id_handle = _smoke_InheritFromSkipped_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);
  final _copied_handle = _smoke_InheritFromSkipped_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : InheritFromSkipped$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
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
