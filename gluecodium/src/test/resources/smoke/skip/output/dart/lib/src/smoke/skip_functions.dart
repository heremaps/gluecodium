import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class SkipFunctions {
  /// @nodoc
  @Deprecated("Does nothing")
  void release();
  static String notInJava(String input) => SkipFunctions$Impl.notInJava(input);
  static bool notInSwift(bool input) => SkipFunctions$Impl.notInSwift(input);
}
// SkipFunctions "private" section, not exported.
final _smoke_SkipFunctions_register_finalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_SkipFunctions_register_finalizer'));
final _smoke_SkipFunctions_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipFunctions_copy_handle'));
final _smoke_SkipFunctions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipFunctions_release_handle'));
class SkipFunctions$Impl implements SkipFunctions {
  @protected
  Pointer<Void> handle;
  SkipFunctions$Impl(this.handle);
  @override
  void release() {}
  static String notInJava(String input) {
    final _notInJava_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_SkipFunctions_notInJava__String'));
    final _input_handle = String_toFfi(input);
    final __result_handle = _notInJava_ffi(__lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  static bool notInSwift(bool input) {
    final _notInSwift_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Uint8), int Function(int, int)>('library_smoke_SkipFunctions_notInSwift__Boolean'));
    final _input_handle = Boolean_toFfi(input);
    final __result_handle = _notInSwift_ffi(__lib.LibraryContext.isolateId, _input_handle);
    Boolean_releaseFfiHandle(_input_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
}
Pointer<Void> smoke_SkipFunctions_toFfi(SkipFunctions value) =>
  _smoke_SkipFunctions_copy_handle((value as SkipFunctions$Impl).handle);
SkipFunctions smoke_SkipFunctions_fromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SkipFunctions) return instance as SkipFunctions;
  final _copied_handle = _smoke_SkipFunctions_copy_handle(handle);
  final result = SkipFunctions$Impl(_copied_handle);
  __lib.cacheInstance(_copied_handle, result, _smoke_SkipFunctions_register_finalizer);
  return result;
}
void smoke_SkipFunctions_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SkipFunctions_release_handle(handle);
Pointer<Void> smoke_SkipFunctions_toFfi_nullable(SkipFunctions value) =>
  value != null ? smoke_SkipFunctions_toFfi(value) : Pointer<Void>.fromAddress(0);
SkipFunctions smoke_SkipFunctions_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SkipFunctions_fromFfi(handle) : null;
void smoke_SkipFunctions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SkipFunctions_release_handle(handle);
// End of SkipFunctions "private" section.
