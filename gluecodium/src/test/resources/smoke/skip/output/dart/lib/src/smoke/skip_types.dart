import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
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
final _smokeSkiptypesNotinjavaCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_create_handle'));
final _smokeSkiptypesNotinjavaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_release_handle'));
final _smokeSkiptypesNotinjavaGetFieldfooField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_get_field_fooField'));
Pointer<Void> smokeSkiptypesNotinjavaToFfi(SkipTypes_NotInJava value) {
  final _fooFieldHandle = stringToFfi(value.fooField);
  final _result = _smokeSkiptypesNotinjavaCreateHandle(_fooFieldHandle);
  stringReleaseFfiHandle(_fooFieldHandle);
  return _result;
}
SkipTypes_NotInJava smokeSkiptypesNotinjavaFromFfi(Pointer<Void> handle) {
  final _fooFieldHandle = _smokeSkiptypesNotinjavaGetFieldfooField(handle);
  try {
    return SkipTypes_NotInJava(
      stringFromFfi(_fooFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_fooFieldHandle);
  }
}
void smokeSkiptypesNotinjavaReleaseFfiHandle(Pointer<Void> handle) => _smokeSkiptypesNotinjavaReleaseHandle(handle);
// Nullable SkipTypes_NotInJava
final _smokeSkiptypesNotinjavaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_create_handle_nullable'));
final _smokeSkiptypesNotinjavaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_release_handle_nullable'));
final _smokeSkiptypesNotinjavaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInJava_get_value_nullable'));
Pointer<Void> smokeSkiptypesNotinjavaToFfiNullable(SkipTypes_NotInJava value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeSkiptypesNotinjavaToFfi(value);
  final result = _smokeSkiptypesNotinjavaCreateHandleNullable(_handle);
  smokeSkiptypesNotinjavaReleaseFfiHandle(_handle);
  return result;
}
SkipTypes_NotInJava smokeSkiptypesNotinjavaFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeSkiptypesNotinjavaGetValueNullable(handle);
  final result = smokeSkiptypesNotinjavaFromFfi(_handle);
  smokeSkiptypesNotinjavaReleaseFfiHandle(_handle);
  return result;
}
void smokeSkiptypesNotinjavaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkiptypesNotinjavaReleaseHandleNullable(handle);
// End of SkipTypes_NotInJava "private" section.
class SkipTypes_NotInSwift {
  String fooField;
  SkipTypes_NotInSwift(this.fooField);
}
// SkipTypes_NotInSwift "private" section, not exported.
final _smokeSkiptypesNotinswiftCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_create_handle'));
final _smokeSkiptypesNotinswiftReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_release_handle'));
final _smokeSkiptypesNotinswiftGetFieldfooField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_get_field_fooField'));
Pointer<Void> smokeSkiptypesNotinswiftToFfi(SkipTypes_NotInSwift value) {
  final _fooFieldHandle = stringToFfi(value.fooField);
  final _result = _smokeSkiptypesNotinswiftCreateHandle(_fooFieldHandle);
  stringReleaseFfiHandle(_fooFieldHandle);
  return _result;
}
SkipTypes_NotInSwift smokeSkiptypesNotinswiftFromFfi(Pointer<Void> handle) {
  final _fooFieldHandle = _smokeSkiptypesNotinswiftGetFieldfooField(handle);
  try {
    return SkipTypes_NotInSwift(
      stringFromFfi(_fooFieldHandle)
    );
  } finally {
    stringReleaseFfiHandle(_fooFieldHandle);
  }
}
void smokeSkiptypesNotinswiftReleaseFfiHandle(Pointer<Void> handle) => _smokeSkiptypesNotinswiftReleaseHandle(handle);
// Nullable SkipTypes_NotInSwift
final _smokeSkiptypesNotinswiftCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_create_handle_nullable'));
final _smokeSkiptypesNotinswiftReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_release_handle_nullable'));
final _smokeSkiptypesNotinswiftGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_NotInSwift_get_value_nullable'));
Pointer<Void> smokeSkiptypesNotinswiftToFfiNullable(SkipTypes_NotInSwift value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeSkiptypesNotinswiftToFfi(value);
  final result = _smokeSkiptypesNotinswiftCreateHandleNullable(_handle);
  smokeSkiptypesNotinswiftReleaseFfiHandle(_handle);
  return result;
}
SkipTypes_NotInSwift smokeSkiptypesNotinswiftFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeSkiptypesNotinswiftGetValueNullable(handle);
  final result = smokeSkiptypesNotinswiftFromFfi(_handle);
  smokeSkiptypesNotinswiftReleaseFfiHandle(_handle);
  return result;
}
void smokeSkiptypesNotinswiftReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkiptypesNotinswiftReleaseHandleNullable(handle);
// End of SkipTypes_NotInSwift "private" section.
// SkipTypes "private" section, not exported.
final _smokeSkiptypesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipTypes_copy_handle'));
final _smokeSkiptypesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipTypes_release_handle'));
class SkipTypes$Impl extends __lib.NativeBase implements SkipTypes {
  SkipTypes$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeSkiptypesReleaseHandle(handle);
    handle = null;
  }
}
Pointer<Void> smokeSkiptypesToFfi(SkipTypes value) =>
  _smokeSkiptypesCopyHandle((value as __lib.NativeBase).handle);
SkipTypes smokeSkiptypesFromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as SkipTypes;
  if (instance != null) return instance;
  final _copiedHandle = _smokeSkiptypesCopyHandle(handle);
  final result = SkipTypes$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smokeSkiptypesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeSkiptypesReleaseHandle(handle);
Pointer<Void> smokeSkiptypesToFfiNullable(SkipTypes value) =>
  value != null ? smokeSkiptypesToFfi(value) : Pointer<Void>.fromAddress(0);
SkipTypes smokeSkiptypesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeSkiptypesFromFfi(handle) : null;
void smokeSkiptypesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeSkiptypesReleaseHandle(handle);
// End of SkipTypes "private" section.
