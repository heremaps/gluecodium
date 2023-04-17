import 'dart:ffi';
import 'package:intl/locale.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
class LocaleDefaults {
  Locale english;
  Locale latAmSpanish;
  Locale romanshSursilvan;
  Locale serbianCyrillic;
  Locale traditionalChineseTaiwan;
  Locale zuerichGerman;
  LocaleDefaults._(this.english, this.latAmSpanish, this.romanshSursilvan, this.serbianCyrillic, this.traditionalChineseTaiwan, this.zuerichGerman);
  LocaleDefaults()
    : english = Locale.parse("en"), latAmSpanish = Locale.parse("es-419"), romanshSursilvan = Locale.parse("rm-sursilv"), serbianCyrillic = Locale.parse("sr-Cyrl"), traditionalChineseTaiwan = Locale.parse("nan-Hant-TW"), zuerichGerman = Locale.parse("gsw-u-sd-chzh");
}
// LocaleDefaults "private" section, not exported.
final _smokeLocaledefaultsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('library_smoke_LocaleDefaults_create_handle'));
final _smokeLocaledefaultsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LocaleDefaults_release_handle'));
final _smokeLocaledefaultsGetFieldenglish = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LocaleDefaults_get_field_english'));
final _smokeLocaledefaultsGetFieldlatAmSpanish = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LocaleDefaults_get_field_latAmSpanish'));
final _smokeLocaledefaultsGetFieldromanshSursilvan = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LocaleDefaults_get_field_romanshSursilvan'));
final _smokeLocaledefaultsGetFieldserbianCyrillic = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LocaleDefaults_get_field_serbianCyrillic'));
final _smokeLocaledefaultsGetFieldtraditionalChineseTaiwan = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LocaleDefaults_get_field_traditionalChineseTaiwan'));
final _smokeLocaledefaultsGetFieldzuerichGerman = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LocaleDefaults_get_field_zuerichGerman'));
Pointer<Void> smokeLocaledefaultsToFfi(LocaleDefaults value) {
  final _englishHandle = localeToFfi(value.english);
  final _latAmSpanishHandle = localeToFfi(value.latAmSpanish);
  final _romanshSursilvanHandle = localeToFfi(value.romanshSursilvan);
  final _serbianCyrillicHandle = localeToFfi(value.serbianCyrillic);
  final _traditionalChineseTaiwanHandle = localeToFfi(value.traditionalChineseTaiwan);
  final _zuerichGermanHandle = localeToFfi(value.zuerichGerman);
  final _result = _smokeLocaledefaultsCreateHandle(_englishHandle, _latAmSpanishHandle, _romanshSursilvanHandle, _serbianCyrillicHandle, _traditionalChineseTaiwanHandle, _zuerichGermanHandle);
  localeReleaseFfiHandle(_englishHandle);
  localeReleaseFfiHandle(_latAmSpanishHandle);
  localeReleaseFfiHandle(_romanshSursilvanHandle);
  localeReleaseFfiHandle(_serbianCyrillicHandle);
  localeReleaseFfiHandle(_traditionalChineseTaiwanHandle);
  localeReleaseFfiHandle(_zuerichGermanHandle);
  return _result;
}
LocaleDefaults smokeLocaledefaultsFromFfi(Pointer<Void> handle) {
  final _englishHandle = _smokeLocaledefaultsGetFieldenglish(handle);
  final _latAmSpanishHandle = _smokeLocaledefaultsGetFieldlatAmSpanish(handle);
  final _romanshSursilvanHandle = _smokeLocaledefaultsGetFieldromanshSursilvan(handle);
  final _serbianCyrillicHandle = _smokeLocaledefaultsGetFieldserbianCyrillic(handle);
  final _traditionalChineseTaiwanHandle = _smokeLocaledefaultsGetFieldtraditionalChineseTaiwan(handle);
  final _zuerichGermanHandle = _smokeLocaledefaultsGetFieldzuerichGerman(handle);
  try {
    return LocaleDefaults._(
      localeFromFfi(_englishHandle),
      localeFromFfi(_latAmSpanishHandle),
      localeFromFfi(_romanshSursilvanHandle),
      localeFromFfi(_serbianCyrillicHandle),
      localeFromFfi(_traditionalChineseTaiwanHandle),
      localeFromFfi(_zuerichGermanHandle)
    );
  } finally {
    localeReleaseFfiHandle(_englishHandle);
    localeReleaseFfiHandle(_latAmSpanishHandle);
    localeReleaseFfiHandle(_romanshSursilvanHandle);
    localeReleaseFfiHandle(_serbianCyrillicHandle);
    localeReleaseFfiHandle(_traditionalChineseTaiwanHandle);
    localeReleaseFfiHandle(_zuerichGermanHandle);
  }
}
void smokeLocaledefaultsReleaseFfiHandle(Pointer<Void> handle) => _smokeLocaledefaultsReleaseHandle(handle);
// Nullable LocaleDefaults
final _smokeLocaledefaultsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LocaleDefaults_create_handle_nullable'));
final _smokeLocaledefaultsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_LocaleDefaults_release_handle_nullable'));
final _smokeLocaledefaultsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_LocaleDefaults_get_value_nullable'));
Pointer<Void> smokeLocaledefaultsToFfiNullable(LocaleDefaults? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeLocaledefaultsToFfi(value);
  final result = _smokeLocaledefaultsCreateHandleNullable(_handle);
  smokeLocaledefaultsReleaseFfiHandle(_handle);
  return result;
}
LocaleDefaults? smokeLocaledefaultsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeLocaledefaultsGetValueNullable(handle);
  final result = smokeLocaledefaultsFromFfi(_handle);
  smokeLocaledefaultsReleaseFfiHandle(_handle);
  return result;
}
void smokeLocaledefaultsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeLocaledefaultsReleaseHandleNullable(handle);
// End of LocaleDefaults "private" section.
