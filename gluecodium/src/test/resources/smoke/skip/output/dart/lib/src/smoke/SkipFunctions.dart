import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class SkipFunctions {
  void release();
  static String notInJava(String input) => SkipFunctions$Impl.notInJava(input);
  static bool notInSwift(bool input) => SkipFunctions$Impl.notInSwift(input);
}
// SkipFunctions "private" section, not exported.
final _smoke_SkipFunctions_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SkipFunctions_copy_handle');
final _smoke_SkipFunctions_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SkipFunctions_release_handle');
final _smoke_SkipFunctions_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_SkipFunctions_get_raw_pointer');
class SkipFunctions$Impl implements SkipFunctions {
  @protected
  Pointer<Void> handle;
  SkipFunctions$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_SkipFunctions_get_raw_pointer(handle));
    _smoke_SkipFunctions_release_handle(handle);
    handle = null;
  }
  static String notInJava(String input) {
    final _notInJava_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_SkipFunctions_notInJava__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _notInJava_ffi(__lib.LibraryContext.isolateId, _input_handle);
    String_releaseFfiHandle(_input_handle);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  static bool notInSwift(bool input) {
    final _notInSwift_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Uint8), int Function(int, int)>('library_smoke_SkipFunctions_notInSwift__Boolean');
    final _input_handle = Boolean_toFfi(input);
    final __result_handle = _notInSwift_ffi(__lib.LibraryContext.isolateId, _input_handle);
    Boolean_releaseFfiHandle(_input_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_SkipFunctions_toFfi(SkipFunctions value) =>
  _smoke_SkipFunctions_copy_handle((value as SkipFunctions$Impl).handle);
SkipFunctions smoke_SkipFunctions_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_SkipFunctions_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as SkipFunctions;
  if (instance != null) {
                        print("FOOBAR cache hit ${raw_handle.address}");
                        return instance;
                      }
                        print("FOOBAR cache miss ${raw_handle.address}");
  final _copied_handle = _smoke_SkipFunctions_copy_handle(handle);
  final result = SkipFunctions$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
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
