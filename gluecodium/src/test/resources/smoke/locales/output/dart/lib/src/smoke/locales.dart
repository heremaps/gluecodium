import 'package:intl/locale.dart';
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
abstract class Locales {
  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();
  Locale localeMethod(Locale input);
  Locale get localeProperty;
  set localeProperty(Locale value);
}
class Locales_LocaleStruct {
  Locale localeField;
  Locales_LocaleStruct(this.localeField);
}
// Locales_LocaleStruct "private" section, not exported.
final _smoke_Locales_LocaleStruct_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_create_handle'));
final _smoke_Locales_LocaleStruct_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_release_handle'));
final _smoke_Locales_LocaleStruct_get_field_localeField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_get_field_localeField'));
Pointer<Void> smoke_Locales_LocaleStruct_toFfi(Locales_LocaleStruct value) {
  final _localeField_handle = Locale_toFfi(value.localeField);
  final _result = _smoke_Locales_LocaleStruct_create_handle(_localeField_handle);
  Locale_releaseFfiHandle(_localeField_handle);
  return _result;
}
Locales_LocaleStruct smoke_Locales_LocaleStruct_fromFfi(Pointer<Void> handle) {
  final _localeField_handle = _smoke_Locales_LocaleStruct_get_field_localeField(handle);
  try {
    return Locales_LocaleStruct(
      Locale_fromFfi(_localeField_handle)
    );
  } finally {
    Locale_releaseFfiHandle(_localeField_handle);
  }
}
void smoke_Locales_LocaleStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Locales_LocaleStruct_release_handle(handle);
// Nullable Locales_LocaleStruct
final _smoke_Locales_LocaleStruct_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_create_handle_nullable'));
final _smoke_Locales_LocaleStruct_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_release_handle_nullable'));
final _smoke_Locales_LocaleStruct_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_get_value_nullable'));
Pointer<Void> smoke_Locales_LocaleStruct_toFfi_nullable(Locales_LocaleStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Locales_LocaleStruct_toFfi(value);
  final result = _smoke_Locales_LocaleStruct_create_handle_nullable(_handle);
  smoke_Locales_LocaleStruct_releaseFfiHandle(_handle);
  return result;
}
Locales_LocaleStruct smoke_Locales_LocaleStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Locales_LocaleStruct_get_value_nullable(handle);
  final result = smoke_Locales_LocaleStruct_fromFfi(_handle);
  smoke_Locales_LocaleStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Locales_LocaleStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Locales_LocaleStruct_release_handle_nullable(handle);
// End of Locales_LocaleStruct "private" section.
// Locales "private" section, not exported.
final _smoke_Locales_copy_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Locales_copy_handle'));
final _smoke_Locales_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Locales_release_handle'));
class Locales$Impl implements Locales {
  @protected
  Pointer<Void> handle;
  Locales$Impl(this.handle);
  @override
  void release() {
    if (handle == null) return;
    __lib.uncacheObject(this);
    __lib.ffi_uncache_token(handle, __lib.LibraryContext.isolateId);
    _smoke_Locales_release_handle(handle);
    handle = null;
  }
  @override
  Locale localeMethod(Locale input) {
    final _localeMethod_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Locales_localeMethod__Locale'));
    final _input_handle = Locale_toFfi(input);
    final _handle = this.handle;
    final __result_handle = _localeMethod_ffi(_handle, __lib.LibraryContext.isolateId, _input_handle);
    Locale_releaseFfiHandle(_input_handle);
    try {
      return Locale_fromFfi(__result_handle);
    } finally {
      Locale_releaseFfiHandle(__result_handle);
    }
  }
  @override
  Locale get localeProperty {
    final _get_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Locales_localeProperty_get'));
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return Locale_fromFfi(__result_handle);
    } finally {
      Locale_releaseFfiHandle(__result_handle);
    }
  }
  @override
  set localeProperty(Locale value) {
    final _set_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Locales_localeProperty_set__Locale'));
    final _value_handle = Locale_toFfi(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    Locale_releaseFfiHandle(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
Pointer<Void> smoke_Locales_toFfi(Locales value) =>
  _smoke_Locales_copy_handle((value as Locales$Impl).handle);
Locales smoke_Locales_fromFfi(Pointer<Void> handle) {
  final isolateId = __lib.LibraryContext.isolateId;
  final token = __lib.ffi_get_cached_token(handle, isolateId);
  final instance = __lib.instanceCache[token] as Locales;
  if (instance != null) return instance;
  final _copied_handle = _smoke_Locales_copy_handle(handle);
  final result = Locales$Impl(_copied_handle);
  __lib.ffi_cache_token(_copied_handle, isolateId, __lib.cacheObject(result));
  return result;
}
void smoke_Locales_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Locales_release_handle(handle);
Pointer<Void> smoke_Locales_toFfi_nullable(Locales value) =>
  value != null ? smoke_Locales_toFfi(value) : Pointer<Void>.fromAddress(0);
Locales smoke_Locales_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Locales_fromFfi(handle) : null;
void smoke_Locales_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Locales_release_handle(handle);
// End of Locales "private" section.
