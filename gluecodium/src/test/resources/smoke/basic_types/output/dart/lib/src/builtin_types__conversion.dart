import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:intl/locale.dart';
import 'package:library/src/_library_context.dart' as __lib;
// Blob
final _blobCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('library_blob_create_handle'));
final _blobReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_blob_release_handle'));
final _blobGetLength = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('library_blob_get_length'));
final _blobGetDataPointer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Uint8> Function(Pointer<Void>),
    Pointer<Uint8> Function(Pointer<Void>)
>('library_blob_get_data_pointer'));
Pointer<Void> Blob_toFfi(Uint8List list) {
  final result = _blobCreateHandle(list.length);
  (_blobGetDataPointer(result) as Pointer<Uint8>).asTypedList(list.length).setRange(0, list.length, list);
  return result;
}
Uint8List Blob_fromFfi(Pointer<Void> handle) =>
  Uint8List.fromList((_blobGetDataPointer(handle) as Pointer<Uint8>).asTypedList(_blobGetLength(handle)));
void Blob_releaseFfiHandle(Pointer<Void> handle) => _blobReleaseHandle(handle);
// Boolean
int Boolean_toFfi(bool value) => value ? 1 : 0;
bool Boolean_fromFfi(int handle) => handle != 0;
void Boolean_releaseFfiHandle(int handle) {}
// Date
int Date_toFfi(DateTime value) => value.microsecondsSinceEpoch;
DateTime Date_fromFfi(int us) => DateTime.fromMicrosecondsSinceEpoch(us, isUtc: true);
void Date_releaseFfiHandle(int handle) {}
// String
final _StringCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Utf8>),
    Pointer<Void> Function(Pointer<Utf8>)
  >('library_std_string_create_handle'));
final _StringReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_std_string_release_handle'));
final _StringGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Utf8> Function(Pointer<Void>),
    Pointer<Utf8> Function(Pointer<Void>)
  >('library_std_string_get_value'));
Pointer<Void> String_toFfi(String value) {
  final cValue = Utf8.toUtf8(value);
  final result = _StringCreateHandle(cValue);
  free(cValue);
  return result;
}
String String_fromFfi(Pointer<Void> handle) => Utf8.fromUtf8(_StringGetValue(handle));
void String_releaseFfiHandle(Pointer<Void> handle) => _StringReleaseHandle(handle);
// Locale
final _LocaleCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>),
    Pointer<Void> Function(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>)
  >('library_locale_create_handle'));
final _LocaleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_locale_release_handle'));
final LocaleGetLanguageCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Utf8> Function(Pointer<Void>),
    Pointer<Utf8> Function(Pointer<Void>)
>('library_locale_get_language_code'));
final LocaleGetCountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Utf8> Function(Pointer<Void>),
    Pointer<Utf8> Function(Pointer<Void>)
>('library_locale_get_country_code'));
final LocaleGetScriptCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Utf8> Function(Pointer<Void>),
    Pointer<Utf8> Function(Pointer<Void>)
>('library_locale_get_script_code'));
final _LocaleGetLanguageTag = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Utf8> Function(Pointer<Void>),
    Pointer<Utf8> Function(Pointer<Void>)
>('library_locale_get_language_tag'));
Pointer<Void> Locale_toFfi(Locale locale) {
  final cLanguageCode = Utf8.toUtf8(locale.languageCode);
  final cCountryCode =
    locale.countryCode != null ? Utf8.toUtf8(locale.countryCode) : Pointer<Utf8>.fromAddress(0);
  final cScriptCode =
    locale.scriptCode != null ? Utf8.toUtf8(locale.scriptCode) : Pointer<Utf8>.fromAddress(0);
  final cLanguageTag = Utf8.toUtf8(locale.toLanguageTag());
  final result = _LocaleCreateHandle(cLanguageCode, cCountryCode, cScriptCode, cLanguageTag);
  free(cLanguageCode);
  if (cCountryCode.address != 0) free(cCountryCode);
  if (cScriptCode.address != 0) free(cScriptCode);
  free(cLanguageTag);
  return result;
}
Locale Locale_fromFfi(Pointer<Void> handle) {
  final Pointer<Utf8> languageTagCstring = _LocaleGetLanguageTag(handle);
  if (languageTagCstring.address != 0) {
    // BCP 47 language tag takes precedence if present.
    return Locale.parse(Utf8.fromUtf8(languageTagCstring));
  }
  final Pointer<Utf8> languageCodeCstring = LocaleGetLanguageCode(handle);
  final Pointer<Utf8> countryCodeCstring = LocaleGetCountryCode(handle);
  final Pointer<Utf8> scriptCodeCstring = LocaleGetScriptCode(handle);
  return Locale.fromSubtags(
    languageCode: languageCodeCstring.address != 0 ? Utf8.fromUtf8(languageCodeCstring) : null,
    countryCode: countryCodeCstring.address != 0 ? Utf8.fromUtf8(countryCodeCstring) : null,
    scriptCode: scriptCodeCstring.address != 0 ? Utf8.fromUtf8(scriptCodeCstring) : null
  );
}
void Locale_releaseFfiHandle(Pointer<Void> handle) => _LocaleReleaseHandle(handle);
// Nullable Byte
final _byteCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int8),
    Pointer<Void> Function(int)
  >('library_Byte_create_handle_nullable'));
final _byteReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_Byte_release_handle_nullable'));
final _byteGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_Byte_get_value_nullable'));
Pointer<Void> Byte_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _byteCreateHandleNullable(_handle);
  return result;
}
int Byte_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _byteGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void Byte_releaseFfiHandle_nullable(Pointer<Void> handle) => _byteReleaseHandleNullable(handle);
// Nullable UByte
final _uByteCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_UByte_create_handle_nullable'));
final _uByteReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_UByte_release_handle_nullable'));
final _uByteGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_UByte_get_value_nullable'));
Pointer<Void> UByte_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _uByteCreateHandleNullable(_handle);
  return result;
}
int UByte_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _uByteGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void UByte_releaseFfiHandle_nullable(Pointer<Void> handle) => _uByteReleaseHandleNullable(handle);
// Nullable Short
final _shortCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int16),
    Pointer<Void> Function(int)
  >('library_Short_create_handle_nullable'));
final _shortReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_Short_release_handle_nullable'));
final _shortGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_Short_get_value_nullable'));
Pointer<Void> Short_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _shortCreateHandleNullable(_handle);
  return result;
}
int Short_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _shortGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void Short_releaseFfiHandle_nullable(Pointer<Void> handle) => _shortReleaseHandleNullable(handle);
// Nullable UShort
final _uShortCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint16),
    Pointer<Void> Function(int)
  >('library_UShort_create_handle_nullable'));
final _uShortReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_UShort_release_handle_nullable'));
final _uShortGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_UShort_get_value_nullable'));
Pointer<Void> UShort_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _uShortCreateHandleNullable(_handle);
  return result;
}
int UShort_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _uShortGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void UShort_releaseFfiHandle_nullable(Pointer<Void> handle) => _uShortReleaseHandleNullable(handle);
// Nullable Int
final _intCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32),
    Pointer<Void> Function(int)
  >('library_Int_create_handle_nullable'));
final _intReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_Int_release_handle_nullable'));
final _intGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_Int_get_value_nullable'));
Pointer<Void> Int_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _intCreateHandleNullable(_handle);
  return result;
}
int Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _intGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void Int_releaseFfiHandle_nullable(Pointer<Void> handle) => _intReleaseHandleNullable(handle);
// Nullable UInt
final _uIntCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_UInt_create_handle_nullable'));
final _uIntReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_UInt_release_handle_nullable'));
final _uIntGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_UInt_get_value_nullable'));
Pointer<Void> UInt_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _uIntCreateHandleNullable(_handle);
  return result;
}
int UInt_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _uIntGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void UInt_releaseFfiHandle_nullable(Pointer<Void> handle) => _uIntReleaseHandleNullable(handle);
// Nullable Long
final _longCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int64),
    Pointer<Void> Function(int)
  >('library_Long_create_handle_nullable'));
final _longReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_Long_release_handle_nullable'));
final _longGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_Long_get_value_nullable'));
Pointer<Void> Long_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _longCreateHandleNullable(_handle);
  return result;
}
int Long_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _longGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void Long_releaseFfiHandle_nullable(Pointer<Void> handle) => _longReleaseHandleNullable(handle);
// Nullable ULong
final _uLongCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('library_ULong_create_handle_nullable'));
final _uLongReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_ULong_release_handle_nullable'));
final _uLongGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_ULong_get_value_nullable'));
Pointer<Void> ULong_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _uLongCreateHandleNullable(_handle);
  return result;
}
int ULong_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _uLongGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void ULong_releaseFfiHandle_nullable(Pointer<Void> handle) => _uLongReleaseHandleNullable(handle);
// Nullable Float
final _floatCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Float),
    Pointer<Void> Function(double)
  >('library_Float_create_handle_nullable'));
final _floatReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_Float_release_handle_nullable'));
final _floatGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_Float_get_value_nullable'));
Pointer<Void> Float_toFfi_nullable(double value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _floatCreateHandleNullable(_handle);
  return result;
}
double Float_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _floatGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void Float_releaseFfiHandle_nullable(Pointer<Void> handle) => _floatReleaseHandleNullable(handle);
// Nullable Double
final _doubleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('library_Double_create_handle_nullable'));
final _doubleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_Double_release_handle_nullable'));
final _doubleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_Double_get_value_nullable'));
Pointer<Void> Double_toFfi_nullable(double value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _doubleCreateHandleNullable(_handle);
  return result;
}
double Double_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _doubleGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void Double_releaseFfiHandle_nullable(Pointer<Void> handle) => _doubleReleaseHandleNullable(handle);
// Nullable Boolean
final _booleanCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('library_Boolean_create_handle_nullable'));
final _booleanReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_Boolean_release_handle_nullable'));
final _booleanGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_Boolean_get_value_nullable'));
Pointer<Void> Boolean_toFfi_nullable(bool value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = Boolean_toFfi(value);
  final result = _booleanCreateHandleNullable(_handle);
  Boolean_releaseFfiHandle(_handle);
  return result;
}
bool Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _booleanGetValueNullable(handle);
  final result = Boolean_fromFfi(_handle);
  Boolean_releaseFfiHandle(_handle);
  return result;
}
void Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) => _booleanReleaseHandleNullable(handle);
// Nullable String
final _stringCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_String_create_handle_nullable'));
final _stringReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_String_release_handle_nullable'));
final _stringGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_String_get_value_nullable'));
Pointer<Void> String_toFfi_nullable(String value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = String_toFfi(value);
  final result = _stringCreateHandleNullable(_handle);
  String_releaseFfiHandle(_handle);
  return result;
}
String String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _stringGetValueNullable(handle);
  final result = String_fromFfi(_handle);
  String_releaseFfiHandle(_handle);
  return result;
}
void String_releaseFfiHandle_nullable(Pointer<Void> handle) => _stringReleaseHandleNullable(handle);
// Nullable Blob
final _blobCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_Blob_create_handle_nullable'));
final _blobReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_Blob_release_handle_nullable'));
final _blobGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_Blob_get_value_nullable'));
Pointer<Void> Blob_toFfi_nullable(Uint8List value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = Blob_toFfi(value);
  final result = _blobCreateHandleNullable(_handle);
  Blob_releaseFfiHandle(_handle);
  return result;
}
Uint8List Blob_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _blobGetValueNullable(handle);
  final result = Blob_fromFfi(_handle);
  Blob_releaseFfiHandle(_handle);
  return result;
}
void Blob_releaseFfiHandle_nullable(Pointer<Void> handle) => _blobReleaseHandleNullable(handle);
// Nullable Date
final _dateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('library_Date_create_handle_nullable'));
final _dateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_Date_release_handle_nullable'));
final _dateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_Date_get_value_nullable'));
Pointer<Void> Date_toFfi_nullable(DateTime value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = Date_toFfi(value);
  final result = _dateCreateHandleNullable(_handle);
  Date_releaseFfiHandle(_handle);
  return result;
}
DateTime Date_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _dateGetValueNullable(handle);
  final result = Date_fromFfi(_handle);
  Date_releaseFfiHandle(_handle);
  return result;
}
void Date_releaseFfiHandle_nullable(Pointer<Void> handle) => _dateReleaseHandleNullable(handle);
// Nullable Locale
final _localeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_Locale_create_handle_nullable'));
final _localeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_Locale_release_handle_nullable'));
final _localeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_Locale_get_value_nullable'));
Pointer<Void> Locale_toFfi_nullable(Locale value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = Locale_toFfi(value);
  final result = _localeCreateHandleNullable(_handle);
  Locale_releaseFfiHandle(_handle);
  return result;
}
Locale Locale_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _localeGetValueNullable(handle);
  final result = Locale_fromFfi(_handle);
  Locale_releaseFfiHandle(_handle);
  return result;
}
void Locale_releaseFfiHandle_nullable(Pointer<Void> handle) => _localeReleaseHandleNullable(handle);
