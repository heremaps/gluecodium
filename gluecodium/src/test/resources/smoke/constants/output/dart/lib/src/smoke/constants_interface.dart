import 'package:library/src/_token_cache.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class ConstantsInterface {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static final bool boolConstant = true;
  static final int intConstant = -11;
  static final int uintConstant = 4294967295;
  static final double floatConstant = 2.71;
  static final double doubleConstant = -3.14;
  static final String stringConstant = "Foo bar";
  static final ConstantsInterface_StateEnum enumConstant = ConstantsInterface_StateEnum.on;
}
enum ConstantsInterface_StateEnum {
    off,
    on
}
// ConstantsInterface_StateEnum "private" section, not exported.
int smoke_ConstantsInterface_StateEnum_toFfi(ConstantsInterface_StateEnum value) {
  switch (value) {
  case ConstantsInterface_StateEnum.off:
    return 0;
  break;
  case ConstantsInterface_StateEnum.on:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for ConstantsInterface_StateEnum enum.");
  }
}
ConstantsInterface_StateEnum smoke_ConstantsInterface_StateEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return ConstantsInterface_StateEnum.off;
  break;
  case 1:
    return ConstantsInterface_StateEnum.on;
  break;
  default:
    throw StateError("Invalid numeric value $handle for ConstantsInterface_StateEnum enum.");
  }
}
void smoke_ConstantsInterface_StateEnum_releaseFfiHandle(int handle) {}
final _smoke_ConstantsInterface_StateEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_ConstantsInterface_StateEnum_create_handle_nullable'));
final _smoke_ConstantsInterface_StateEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ConstantsInterface_StateEnum_release_handle_nullable'));
final _smoke_ConstantsInterface_StateEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_ConstantsInterface_StateEnum_get_value_nullable'));
Pointer<Void> smoke_ConstantsInterface_StateEnum_toFfi_nullable(ConstantsInterface_StateEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_ConstantsInterface_StateEnum_toFfi(value);
  final result = _smoke_ConstantsInterface_StateEnum_create_handle_nullable(_handle);
  smoke_ConstantsInterface_StateEnum_releaseFfiHandle(_handle);
  return result;
}
ConstantsInterface_StateEnum smoke_ConstantsInterface_StateEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_ConstantsInterface_StateEnum_get_value_nullable(handle);
  final result = smoke_ConstantsInterface_StateEnum_fromFfi(_handle);
  smoke_ConstantsInterface_StateEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_ConstantsInterface_StateEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ConstantsInterface_StateEnum_release_handle_nullable(handle);
// End of ConstantsInterface_StateEnum "private" section.
// ConstantsInterface "private" section, not exported.
final _smoke_ConstantsInterface_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_ConstantsInterface_copy_handle'));
final _smoke_ConstantsInterface_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_ConstantsInterface_release_handle'));
final _smoke_ConstantsInterface_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_ConstantsInterface_get_raw_pointer'));
class ConstantsInterface$Impl implements ConstantsInterface {
  @protected
  Pointer<Void> handle;
  ConstantsInterface$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_ConstantsInterface_get_raw_pointer(handle));
    _smoke_ConstantsInterface_release_handle(handle);
    handle = null;
  }
}
Pointer<Void> smoke_ConstantsInterface_toFfi(ConstantsInterface value) =>
  _smoke_ConstantsInterface_copy_handle((value as ConstantsInterface$Impl).handle);
ConstantsInterface smoke_ConstantsInterface_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_ConstantsInterface_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle];
  if (instance is ConstantsInterface) return instance as ConstantsInterface;
  final _copied_handle = _smoke_ConstantsInterface_copy_handle(handle);
  final result = ConstantsInterface$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_ConstantsInterface_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_ConstantsInterface_release_handle(handle);
Pointer<Void> smoke_ConstantsInterface_toFfi_nullable(ConstantsInterface value) =>
  value != null ? smoke_ConstantsInterface_toFfi(value) : Pointer<Void>.fromAddress(0);
ConstantsInterface smoke_ConstantsInterface_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_ConstantsInterface_fromFfi(handle) : null;
void smoke_ConstantsInterface_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_ConstantsInterface_release_handle(handle);
// End of ConstantsInterface "private" section.
