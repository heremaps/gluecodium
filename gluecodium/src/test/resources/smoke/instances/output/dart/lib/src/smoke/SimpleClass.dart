import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class SimpleClass {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  String getStringValue();
  SimpleClass useSimpleClass(SimpleClass input);
}
// SimpleClass "private" section, not exported.
final _smoke_SimpleClass_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SimpleClass_copy_handle');
final _smoke_SimpleClass_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SimpleClass_release_handle');
final _smoke_SimpleClass_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_SimpleClass_get_raw_pointer');
class SimpleClass$Impl implements SimpleClass {
  @protected
  Pointer<Void> handle;
  SimpleClass$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_SimpleClass_get_raw_pointer(handle));
    _smoke_SimpleClass_release_handle(handle);
    handle = null;
  }
  @override
  String getStringValue() {
    final _getStringValue_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_SimpleClass_getStringValue');
    final _handle = this.handle;
    final __result_handle = _getStringValue_ffi(_handle, __lib.LibraryContext.isolateId);
    final _result = String_fromFfi(__result_handle);
    String_releaseFfiHandle(__result_handle);
    return _result;
  }
  @override
  SimpleClass useSimpleClass(SimpleClass input) {
    final _useSimpleClass_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_SimpleClass_useSimpleClass__SimpleClass');
    final _input_handle = smoke_SimpleClass_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _useSimpleClass_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    smoke_SimpleClass_releaseFfiHandle(_input_handle);
    final _result = smoke_SimpleClass_fromFfi(__result_handle);
    smoke_SimpleClass_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_SimpleClass_toFfi(SimpleClass value) =>
  _smoke_SimpleClass_copy_handle((value as SimpleClass$Impl).handle);
SimpleClass smoke_SimpleClass_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_SimpleClass_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as SimpleClass;
  if (instance != null) return instance;
  final _copied_handle = _smoke_SimpleClass_copy_handle(handle);
  final result = SimpleClass$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_SimpleClass_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SimpleClass_release_handle(handle);
Pointer<Void> smoke_SimpleClass_toFfi_nullable(SimpleClass value) =>
  value != null ? smoke_SimpleClass_toFfi(value) : Pointer<Void>.fromAddress(0);
SimpleClass smoke_SimpleClass_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SimpleClass_fromFfi(handle) : null;
void smoke_SimpleClass_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SimpleClass_release_handle(handle);
// End of SimpleClass "private" section.
