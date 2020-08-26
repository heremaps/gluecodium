import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Enums {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  static methodWithExternalEnum(Enums_ExternalEnum input) => Enums$Impl.methodWithExternalEnum(input);
}
enum Enums_ExternalEnum {
    fooValue,
    barValue
}
// Enums_ExternalEnum "private" section, not exported.
int smoke_Enums_ExternalEnum_toFfi(Enums_ExternalEnum value) {
  switch (value) {
  case Enums_ExternalEnum.fooValue:
    return 0;
  break;
  case Enums_ExternalEnum.barValue:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Enums_ExternalEnum enum.");
  }
}
Enums_ExternalEnum smoke_Enums_ExternalEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enums_ExternalEnum.fooValue;
  break;
  case 1:
    return Enums_ExternalEnum.barValue;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Enums_ExternalEnum enum.");
  }
}
void smoke_Enums_ExternalEnum_releaseFfiHandle(int handle) {}
final _smoke_Enums_ExternalEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Enums_ExternalEnum_create_handle_nullable'));
final _smoke_Enums_ExternalEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_ExternalEnum_release_handle_nullable'));
final _smoke_Enums_ExternalEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_ExternalEnum_get_value_nullable'));
Pointer<Void> smoke_Enums_ExternalEnum_toFfi_nullable(Enums_ExternalEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Enums_ExternalEnum_toFfi(value);
  final result = _smoke_Enums_ExternalEnum_create_handle_nullable(_handle);
  smoke_Enums_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
Enums_ExternalEnum smoke_Enums_ExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Enums_ExternalEnum_get_value_nullable(handle);
  final result = smoke_Enums_ExternalEnum_fromFfi(_handle);
  smoke_Enums_ExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Enums_ExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_ExternalEnum_release_handle_nullable(handle);
// End of Enums_ExternalEnum "private" section.
enum Enums_VeryExternalEnum {
    foo,
    bar
}
// Enums_VeryExternalEnum "private" section, not exported.
int smoke_Enums_VeryExternalEnum_toFfi(Enums_VeryExternalEnum value) {
  switch (value) {
  case Enums_VeryExternalEnum.foo:
    return 0;
  break;
  case Enums_VeryExternalEnum.bar:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Enums_VeryExternalEnum enum.");
  }
}
Enums_VeryExternalEnum smoke_Enums_VeryExternalEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Enums_VeryExternalEnum.foo;
  break;
  case 1:
    return Enums_VeryExternalEnum.bar;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Enums_VeryExternalEnum enum.");
  }
}
void smoke_Enums_VeryExternalEnum_releaseFfiHandle(int handle) {}
final _smoke_Enums_VeryExternalEnum_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Enums_VeryExternalEnum_create_handle_nullable'));
final _smoke_Enums_VeryExternalEnum_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_VeryExternalEnum_release_handle_nullable'));
final _smoke_Enums_VeryExternalEnum_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Enums_VeryExternalEnum_get_value_nullable'));
Pointer<Void> smoke_Enums_VeryExternalEnum_toFfi_nullable(Enums_VeryExternalEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Enums_VeryExternalEnum_toFfi(value);
  final result = _smoke_Enums_VeryExternalEnum_create_handle_nullable(_handle);
  smoke_Enums_VeryExternalEnum_releaseFfiHandle(_handle);
  return result;
}
Enums_VeryExternalEnum smoke_Enums_VeryExternalEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Enums_VeryExternalEnum_get_value_nullable(handle);
  final result = smoke_Enums_VeryExternalEnum_fromFfi(_handle);
  smoke_Enums_VeryExternalEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Enums_VeryExternalEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_VeryExternalEnum_release_handle_nullable(handle);
// End of Enums_VeryExternalEnum "private" section.
// Enums "private" section, not exported.
final _smoke_Enums_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Enums_copy_handle'));
final _smoke_Enums_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Enums_release_handle'));
final _smoke_Enums_get_raw_pointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('library_smoke_Enums_get_raw_pointer'));
class Enums$Impl implements Enums {
  @protected
  Pointer<Void> handle;
  Enums$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_smoke_Enums_get_raw_pointer(handle));
    _smoke_Enums_release_handle(handle);
    handle = null;
  }
  static methodWithExternalEnum(Enums_ExternalEnum input) {
    final _methodWithExternalEnum_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Uint32), void Function(int, int)>('library_smoke_Enums_methodWithExternalEnum__External_1Enum'));
    final _input_handle = smoke_Enums_ExternalEnum_toFfi(input);
    final __result_handle = _methodWithExternalEnum_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_Enums_ExternalEnum_releaseFfiHandle(_input_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_Enums_toFfi(Enums value) =>
  _smoke_Enums_copy_handle((value as Enums$Impl).handle);
Enums smoke_Enums_fromFfi(Pointer<Void> handle) {
  final raw_handle = _smoke_Enums_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as Enums;
  if (instance != null) return instance;
  final _copied_handle = _smoke_Enums_copy_handle(handle);
  final result = Enums$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}
void smoke_Enums_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Enums_release_handle(handle);
Pointer<Void> smoke_Enums_toFfi_nullable(Enums value) =>
  value != null ? smoke_Enums_toFfi(value) : Pointer<Void>.fromAddress(0);
Enums smoke_Enums_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Enums_fromFfi(handle) : null;
void smoke_Enums_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Enums_release_handle(handle);
// End of Enums "private" section.
