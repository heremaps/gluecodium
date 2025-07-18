

import 'dart:ffi';
import 'package:intl/locale.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_native_base.dart' as __lib;
import 'package:library/src/_token_cache.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/generic_types__conversion.dart';

abstract class Locales implements Finalizable {


  Locale localeMethod(Locale input);
  Locale get localeProperty;
  set localeProperty(Locale value);

}

typedef Locales_LocaleTypeDef = Locale;
typedef Locales_LocaleArray = List<Locale>;
typedef Locales_LocaleMap = Map<String, Locale>;
typedef Locales_LocaleSet = Set<Locale>;
typedef Locales_LocaleKeyMap = Map<Locale, String>;

class Locales_LocaleStruct {
  Locale localeField;

  Locales_LocaleStruct(this.localeField);
}


// Locales_LocaleStruct "private" section, not exported.

final _smokeLocalesLocalestructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_create_handle'));
final _smokeLocalesLocalestructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_release_handle'));
final _smokeLocalesLocalestructGetFieldlocaleField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_get_field_localeField'));



Pointer<Void> smokeLocalesLocalestructToFfi(Locales_LocaleStruct value) {
  final _localeFieldHandle = localeToFfi(value.localeField);
  final _result = _smokeLocalesLocalestructCreateHandle(_localeFieldHandle);
  localeReleaseFfiHandle(_localeFieldHandle);
  return _result;
}

Locales_LocaleStruct smokeLocalesLocalestructFromFfi(Pointer<Void> handle) {
  final _localeFieldHandle = _smokeLocalesLocalestructGetFieldlocaleField(handle);
  try {
    return Locales_LocaleStruct(
      localeFromFfi(_localeFieldHandle)
    );
  } finally {
    localeReleaseFfiHandle(_localeFieldHandle);
  }
}

void smokeLocalesLocalestructReleaseFfiHandle(Pointer<Void> handle) => _smokeLocalesLocalestructReleaseHandle(handle);

// Nullable Locales_LocaleStruct

final _smokeLocalesLocalestructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_create_handle_nullable'));
final _smokeLocalesLocalestructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_release_handle_nullable'));
final _smokeLocalesLocalestructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Locales_LocaleStruct_get_value_nullable'));

Pointer<Void> smokeLocalesLocalestructToFfiNullable(Locales_LocaleStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLocalesLocalestructToFfi(value);
  final result = _smokeLocalesLocalestructCreateHandleNullable(_handle);
  smokeLocalesLocalestructReleaseFfiHandle(_handle);
  return result;
}

Locales_LocaleStruct? smokeLocalesLocalestructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLocalesLocalestructGetValueNullable(handle);
  final result = smokeLocalesLocalestructFromFfi(_handle);
  smokeLocalesLocalestructReleaseFfiHandle(_handle);
  return result;
}

void smokeLocalesLocalestructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLocalesLocalestructReleaseHandleNullable(handle);

// End of Locales_LocaleStruct "private" section.

// Locales "private" section, not exported.

final _smokeLocalesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('library_smoke_Locales_register_finalizer'));
final _smokeLocalesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Locales_copy_handle'));
final _smokeLocalesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Locales_release_handle'));




class Locales$Impl extends __lib.NativeBase implements Locales {

  Locales$Impl(Pointer<Void> handle) : super(handle);

  @override
  Locale localeMethod(Locale input) {
    final _localeMethodFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Locales_localeMethod__Locale'));
    final _inputHandle = localeToFfi(input);
    final _handle = this.handle;
    final __resultHandle = _localeMethodFfi(_handle, __lib.LibraryContext.isolateId, _inputHandle);
    localeReleaseFfiHandle(_inputHandle);
    try {
      return localeFromFfi(__resultHandle);
    } finally {
      localeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Locale get localeProperty {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Locales_localeProperty_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return localeFromFfi(__resultHandle);
    } finally {
      localeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set localeProperty(Locale value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('library_smoke_Locales_localeProperty_set__Locale'));
    final _valueHandle = localeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    localeReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> smokeLocalesToFfi(Locales value) =>
  _smokeLocalesCopyHandle((value as __lib.NativeBase).handle);

Locales smokeLocalesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Locales) return instance;

  final _copiedHandle = _smokeLocalesCopyHandle(handle);
  final result = Locales$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _smokeLocalesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void smokeLocalesReleaseFfiHandle(Pointer<Void> handle) =>
  _smokeLocalesReleaseHandle(handle);

Pointer<Void> smokeLocalesToFfiNullable(Locales? value) =>
  value != null ? smokeLocalesToFfi(value) : Pointer<Void>.fromAddress(0);

Locales? smokeLocalesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? smokeLocalesFromFfi(handle) : null;

void smokeLocalesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLocalesReleaseHandle(handle);

// End of Locales "private" section.


