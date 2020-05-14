import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ClassWithInternalLambda {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static bool invokeInternalLambda(ClassWithInternalLambda_InternalLambda lambda, String value) => ClassWithInternalLambda$Impl.invokeInternalLambda(lambda, value);
}
typedef ClassWithInternalLambda_InternalLambda = bool Function(String);
// ClassWithInternalLambda_InternalLambda "private" section, not exported.
final _smoke_ClassWithInternalLambda_InternalLambda_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_copy_handle');
final _smoke_ClassWithInternalLambda_InternalLambda_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_release_handle');
final _smoke_ClassWithInternalLambda_InternalLambda_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_create_proxy');
final _smoke_ClassWithInternalLambda_InternalLambda_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_ClassWithInternalLambda_InternalLambda_get_raw_pointer');
class ClassWithInternalLambda_InternalLambda$Impl {
  Pointer<Void> get _handle => handle;
  final Pointer<Void> handle;
  ClassWithInternalLambda_InternalLambda$Impl(this.handle);
  void release() => _smoke_ClassWithInternalLambda_InternalLambda_release_handle(handle);
  bool internal_call(String p0) {
    final _call_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_ClassWithInternalLambda_InternalLambda_call__String');
    final _p0_handle = String_toFfi(p0);
    final _handle = this.handle;
    final __result_handle = _call_ffi(_handle, __lib.LibraryContext.isolateId, _p0_handle);
    String_releaseFfiHandle(_p0_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
}
int _ClassWithInternalLambda_InternalLambda_call_static(int _token, Pointer<Void> p0, Pointer<Uint8> _result) {
  final _result_object = (__lib.instanceCache[_token] as ClassWithInternalLambda_InternalLambda)(String_fromFfi(p0));
  _result.value = Boolean_toFfi(_result_object);
  String_releaseFfiHandle(p0);
  return 0;
}
Pointer<Void> smoke_ClassWithInternalLambda_InternalLambda_toFfi(ClassWithInternalLambda_InternalLambda value) {
  final result = _smoke_ClassWithInternalLambda_InternalLambda_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Int64 Function(Uint64, Pointer<Void>, Pointer<Uint8>)>(_ClassWithInternalLambda_InternalLambda_call_static, __lib.unknownError)
  );
  __lib.reverseCache[_smoke_ClassWithInternalLambda_InternalLambda_get_raw_pointer(result)] = value;
  return result;
}
ClassWithInternalLambda_InternalLambda smoke_ClassWithInternalLambda_InternalLambda_fromFfi(Pointer<Void> handle) {
  final instance = __lib.reverseCache[_smoke_ClassWithInternalLambda_InternalLambda_get_raw_pointer(handle)] as ClassWithInternalLambda_InternalLambda;
  if (instance != null) return instance;
  final _impl = ClassWithInternalLambda_InternalLambda$Impl(_smoke_ClassWithInternalLambda_InternalLambda_copy_handle(handle));
  return (String p0) {
    final _result =_impl.internal_call(p0);
    _impl.release();
    return _result;
  };
}
void smoke_ClassWithInternalLambda_InternalLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ClassWithInternalLambda_InternalLambda_release_handle(handle);
// Nullable ClassWithInternalLambda_InternalLambda
final _smoke_ClassWithInternalLambda_InternalLambda_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_create_handle_nullable');
final _smoke_ClassWithInternalLambda_InternalLambda_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_release_handle_nullable');
final _smoke_ClassWithInternalLambda_InternalLambda_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_InternalLambda_get_value_nullable');
Pointer<Void> smoke_ClassWithInternalLambda_InternalLambda_toFfi_nullable(ClassWithInternalLambda_InternalLambda value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ClassWithInternalLambda_InternalLambda_toFfi(value);
  final result = _smoke_ClassWithInternalLambda_InternalLambda_create_handle_nullable(_handle);
  smoke_ClassWithInternalLambda_InternalLambda_releaseFfiHandle(_handle);
  return result;
}
ClassWithInternalLambda_InternalLambda smoke_ClassWithInternalLambda_InternalLambda_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ClassWithInternalLambda_InternalLambda_get_value_nullable(handle);
  final result = smoke_ClassWithInternalLambda_InternalLambda_fromFfi(_handle);
  smoke_ClassWithInternalLambda_InternalLambda_releaseFfiHandle(_handle);
  return result;
}
void smoke_ClassWithInternalLambda_InternalLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ClassWithInternalLambda_InternalLambda_release_handle_nullable(handle);
// End of ClassWithInternalLambda_InternalLambda "private" section.
// ClassWithInternalLambda "private" section, not exported.
final _smoke_ClassWithInternalLambda_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_copy_handle');
final _smoke_ClassWithInternalLambda_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ClassWithInternalLambda_release_handle');
final _smoke_ClassWithInternalLambda_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_ClassWithInternalLambda_get_raw_pointer');
class ClassWithInternalLambda$Impl implements ClassWithInternalLambda {
  @protected
  Pointer<Void> handle;
  ClassWithInternalLambda$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_ClassWithInternalLambda_get_raw_pointer(handle));
    _smoke_ClassWithInternalLambda_release_handle(handle);
    handle = null;
  }
  static bool invokeInternalLambda(ClassWithInternalLambda_InternalLambda lambda, String value) {
    final _invokeInternalLambda_ffi = __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Pointer<Void>, Pointer<Void>), int Function(int, Pointer<Void>, Pointer<Void>)>('library_smoke_ClassWithInternalLambda_invokeInternalLambda__InternalLambda_String');
    final _lambda_handle = smoke_ClassWithInternalLambda_InternalLambda_toFfi(lambda);
    final _value_handle = String_toFfi(value);
    final __result_handle = _invokeInternalLambda_ffi(__lib.LibraryContext.isolateId, _lambda_handle, _value_handle);
    smoke_ClassWithInternalLambda_InternalLambda_releaseFfiHandle(_lambda_handle);
    String_releaseFfiHandle(_value_handle);
    final _result = Boolean_fromFfi(__result_handle);
    Boolean_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_ClassWithInternalLambda_toFfi(ClassWithInternalLambda value) =>
  _smoke_ClassWithInternalLambda_copy_handle((value as ClassWithInternalLambda$Impl).handle);
ClassWithInternalLambda smoke_ClassWithInternalLambda_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_ClassWithInternalLambda_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as ClassWithInternalLambda;
  if (instance != null) return instance;
  final _copied_handle = _smoke_ClassWithInternalLambda_copy_handle(handle);
  final result = ClassWithInternalLambda$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_ClassWithInternalLambda_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ClassWithInternalLambda_release_handle(handle);
Pointer<Void> smoke_ClassWithInternalLambda_toFfi_nullable(ClassWithInternalLambda value) =>
  value != null ? smoke_ClassWithInternalLambda_toFfi(value) : Pointer<Void>.fromAddress(0);
ClassWithInternalLambda smoke_ClassWithInternalLambda_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ClassWithInternalLambda_fromFfi(handle) : null;
void smoke_ClassWithInternalLambda_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ClassWithInternalLambda_release_handle(handle);
// End of ClassWithInternalLambda "private" section.
