import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
@OnLambda
typedef AttributesLambda = void Function();
// AttributesLambda "private" section, not exported.
final _smoke_AttributesLambda_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_copy_handle'));
final _smoke_AttributesLambda_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_release_handle'));
final _smoke_AttributesLambda_create_proxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_AttributesLambda_create_proxy'));
final _smoke_AttributesLambda_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_AttributesLambda_get_raw_pointer'));
class AttributesLambda$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  AttributesLambda$Impl(this.handle);
  void release() => _smoke_AttributesLambda_release_handle(handle);
  call() {
    final _call_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_AttributesLambda_call'));
    final _handle = this.handle;
    final __result_handle = _call_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
int _AttributesLambda_call_static(int _token) {
  try {
    (__lib.instanceCache[_token] as AttributesLambda)();
  } finally {
  }
  return 0;
}
Pointer<Void> smoke_AttributesLambda_toFfi(AttributesLambda value) {
  final result = _smoke_AttributesLambda_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64)>(_AttributesLambda_call_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_AttributesLambda_get_raw_pointer(result)] = value;
  return result;
}
AttributesLambda smoke_AttributesLambda_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_AttributesLambda_get_raw_pointer(handle)] as AttributesLambda;
  if (instance != null) return instance;
  final _impl = AttributesLambda$Impl(_smoke_AttributesLambda_copy_handle(handle));
  return () {
    final _result =_impl.call();
    _impl.release();
    return _result;
  };
}
void smoke_AttributesLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_AttributesLambda_release_handle(handle);
// Nullable AttributesLambda
final _smoke_AttributesLambda_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_create_handle_nullable'));
final _smoke_AttributesLambda_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_release_handle_nullable'));
final _smoke_AttributesLambda_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_AttributesLambda_get_value_nullable'));
Pointer<Void> smoke_AttributesLambda_toFfi_nullable(AttributesLambda value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_AttributesLambda_toFfi(value);
  final result = _smoke_AttributesLambda_create_handle_nullable(_handle);
  smoke_AttributesLambda_releaseFfiHandle(_handle);
  return result;
}
AttributesLambda smoke_AttributesLambda_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_AttributesLambda_get_value_nullable(handle);
  final result = smoke_AttributesLambda_fromFfi(_handle);
  smoke_AttributesLambda_releaseFfiHandle(_handle);
  return result;
}
void smoke_AttributesLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_AttributesLambda_release_handle_nullable(handle);
// End of AttributesLambda "private" section.
