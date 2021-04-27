import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class SkipTypes {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
}
class SkipTypes_NotInJava {
  String fooField;
  SkipTypes_NotInJava(this.fooField);
}
// SkipTypes_NotInJava "private" section, not exported.
final _smoke_SkipTypes_NotInJava_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_create_handle'));
final _smoke_SkipTypes_NotInJava_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_release_handle'));
final _smoke_SkipTypes_NotInJava_get_field_fooField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_get_field_fooField'));
Pointer<Void> smoke_SkipTypes_NotInJava_toFfi(SkipTypes_NotInJava value) {
  final _fooField_handle = String_toFfi(value.fooField);
  final _result = _smoke_SkipTypes_NotInJava_create_handle(_fooField_handle);
  String_releaseFfiHandle(_fooField_handle);
  return _result;
}
SkipTypes_NotInJava smoke_SkipTypes_NotInJava_fromFfi(Pointer<Void> handle) {
  final _fooField_handle = _smoke_SkipTypes_NotInJava_get_field_fooField(handle);
  try {
    return SkipTypes_NotInJava(
      String_fromFfi(_fooField_handle)
    );
  } finally {
    String_releaseFfiHandle(_fooField_handle);
  }
}
void smoke_SkipTypes_NotInJava_releaseFfiHandle(Pointer<Void> handle) => _smoke_SkipTypes_NotInJava_release_handle(handle);
// Nullable SkipTypes_NotInJava
final _smoke_SkipTypes_NotInJava_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_create_handle_nullable'));
final _smoke_SkipTypes_NotInJava_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_release_handle_nullable'));
final _smoke_SkipTypes_NotInJava_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_get_value_nullable'));
Pointer<Void> smoke_SkipTypes_NotInJava_toFfi_nullable(SkipTypes_NotInJava value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_SkipTypes_NotInJava_toFfi(value);
  final result = _smoke_SkipTypes_NotInJava_create_handle_nullable(_handle);
  smoke_SkipTypes_NotInJava_releaseFfiHandle(_handle);
  return result;
}
SkipTypes_NotInJava smoke_SkipTypes_NotInJava_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_SkipTypes_NotInJava_get_value_nullable(handle);
  final result = smoke_SkipTypes_NotInJava_fromFfi(_handle);
  smoke_SkipTypes_NotInJava_releaseFfiHandle(_handle);
  return result;
}
void smoke_SkipTypes_NotInJava_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SkipTypes_NotInJava_release_handle_nullable(handle);
// End of SkipTypes_NotInJava "private" section.
class SkipTypes_NotInSwift {
  String fooField;
  SkipTypes_NotInSwift(this.fooField);
}
// SkipTypes_NotInSwift "private" section, not exported.
final _smoke_SkipTypes_NotInSwift_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_create_handle'));
final _smoke_SkipTypes_NotInSwift_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_release_handle'));
final _smoke_SkipTypes_NotInSwift_get_field_fooField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_get_field_fooField'));
Pointer<Void> smoke_SkipTypes_NotInSwift_toFfi(SkipTypes_NotInSwift value) {
  final _fooField_handle = String_toFfi(value.fooField);
  final _result = _smoke_SkipTypes_NotInSwift_create_handle(_fooField_handle);
  String_releaseFfiHandle(_fooField_handle);
  return _result;
}
SkipTypes_NotInSwift smoke_SkipTypes_NotInSwift_fromFfi(Pointer<Void> handle) {
  final _fooField_handle = _smoke_SkipTypes_NotInSwift_get_field_fooField(handle);
  try {
    return SkipTypes_NotInSwift(
      String_fromFfi(_fooField_handle)
    );
  } finally {
    String_releaseFfiHandle(_fooField_handle);
  }
}
void smoke_SkipTypes_NotInSwift_releaseFfiHandle(Pointer<Void> handle) => _smoke_SkipTypes_NotInSwift_release_handle(handle);
// Nullable SkipTypes_NotInSwift
final _smoke_SkipTypes_NotInSwift_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_create_handle_nullable'));
final _smoke_SkipTypes_NotInSwift_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_release_handle_nullable'));
final _smoke_SkipTypes_NotInSwift_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_get_value_nullable'));
Pointer<Void> smoke_SkipTypes_NotInSwift_toFfi_nullable(SkipTypes_NotInSwift value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_SkipTypes_NotInSwift_toFfi(value);
  final result = _smoke_SkipTypes_NotInSwift_create_handle_nullable(_handle);
  smoke_SkipTypes_NotInSwift_releaseFfiHandle(_handle);
  return result;
}
SkipTypes_NotInSwift smoke_SkipTypes_NotInSwift_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_SkipTypes_NotInSwift_get_value_nullable(handle);
  final result = smoke_SkipTypes_NotInSwift_fromFfi(_handle);
  smoke_SkipTypes_NotInSwift_releaseFfiHandle(_handle);
  return result;
}
void smoke_SkipTypes_NotInSwift_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SkipTypes_NotInSwift_release_handle_nullable(handle);
// End of SkipTypes_NotInSwift "private" section.
// SkipTypes "private" section, not exported.
final _smoke_SkipTypes_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_copy_handle'));
final _smoke_SkipTypes_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypes_release_handle'));
class SkipTypes$Impl extends __lib.NativeBase implements SkipTypes {
  SkipTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_SkipTypes_release_handle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_SkipTypes_toFfi(SkipTypes value) =>
  _smoke_SkipTypes_copy_handle((value as __lib.NativeBase).handle);
SkipTypes smoke_SkipTypes_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as SkipTypes;
  if (instance != null) return instance;
  final _copied_handle = _smoke_SkipTypes_copy_handle(handle);
  final result = SkipTypes$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_SkipTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SkipTypes_release_handle(handle);
Pointer<Void> smoke_SkipTypes_toFfi_nullable(SkipTypes value) =>
  value != null ? smoke_SkipTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
SkipTypes smoke_SkipTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SkipTypes_fromFfi(handle) : null;
void smoke_SkipTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SkipTypes_release_handle(handle);
// End of SkipTypes "private" section.
