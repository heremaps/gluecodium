import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class SkipFunctions {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static String notInJava(String input) => SkipFunctions$Impl.notInJava(input);
  static bool notInSwift(bool input) => SkipFunctions$Impl.notInSwift(input);
}
// SkipFunctions "private" section, not exported.
final _smokeSkipfunctionsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipFunctions_copy_handle'));
final _smokeSkipfunctionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipFunctions_release_handle'));
class SkipFunctions$Impl extends __lib.NativeBase implements SkipFunctions {
  SkipFunctions$Impl(Pointer<Void> handle) : super(handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffiUncacheToken(handle, __lib.LibraryContext.isolateId);
    _smokeSkipfunctionsReleaseHandle(handle);
    handle = null;
  }
  static String notInJava(String input) {
    final _notInJavaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_SkipFunctions_notInJava__String'));
    final _inputHandle = String_toFfi(input);
    final __resultHandle = _notInJavaFfi(__lib.LibraryContext.isolateId, _inputHandle);
    String_releaseFfiHandle(_inputHandle);
    try {
      return String_fromFfi(__resultHandle);
    } finally {
      String_releaseFfiHandle(__resultHandle);
    }
  }
  static bool notInSwift(bool input) {
    final _notInSwiftFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Uint8), int Function(int, int)>('library_smoke_SkipFunctions_notInSwift__Boolean'));
    final _inputHandle = Boolean_toFfi(input);
    final __resultHandle = _notInSwiftFfi(__lib.LibraryContext.isolateId, _inputHandle);
    Boolean_releaseFfiHandle(_inputHandle);
    try {
      return Boolean_fromFfi(__resultHandle);
    } finally {
      Boolean_releaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smoke_SkipFunctions_toFfi(SkipFunctions value) =>
  _smokeSkipfunctionsCopyHandle((value as __lib.NativeBase).handle);
SkipFunctions smoke_SkipFunctions_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffiGetCachedToken(handle, isolateId);
  final instance = __lib.instanceCache[token] as SkipFunctions;
  if (instance != null) return instance;
  final _copiedHandle = _smokeSkipfunctionsCopyHandle(handle);
  final result = SkipFunctions$Impl(_copiedHandle);
  __lib.ffiCacheToken(_copiedHandle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_SkipFunctions_releaseFfiHandle(Pointer<Void> handle) =>
  _smokeSkipfunctionsReleaseHandle(handle);
Pointer<Void> smoke_SkipFunctions_toFfi_nullable(SkipFunctions value) =>
  value != null ? smoke_SkipFunctions_toFfi(value) : Pointer<Void>.fromAddress(0);
SkipFunctions smoke_SkipFunctions_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SkipFunctions_fromFfi(handle) : null;
void smoke_SkipFunctions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smokeSkipfunctionsReleaseHandle(handle);
// End of SkipFunctions "private" section.
