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
Pointer<Void> blobToFfi(Uint8List list) {
  final result = _blobCreateHandle(list.length);
  (_blobGetDataPointer(result) as Pointer<Uint8>).asTypedList(list.length).setRange(0, list.length, list);
  return result;
}
Uint8List blobFromFfi(Pointer<Void> handle) =>
  Uint8List.fromList((_blobGetDataPointer(handle) as Pointer<Uint8>).asTypedList(_blobGetLength(handle)));
void blobReleaseFfiHandle(Pointer<Void> handle) => _blobReleaseHandle(handle);
// Boolean
int booleanToFfi(bool value) => value ? 1 : 0;
bool booleanFromFfi(int handle) => handle != 0;
void booleanReleaseFfiHandle(int handle) {}
// Date
int dateToFfi(DateTime value) => value.microsecondsSinceEpoch;
DateTime dateFromFfi(int us) => DateTime.fromMicrosecondsSinceEpoch(us, isUtc: true);
void dateReleaseFfiHandle(int handle) {}
// String
final _stringCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Utf8>),
    Pointer<Void> Function(Pointer<Utf8>)
  >('library_std_string_create_handle'));
final _stringReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_std_string_release_handle'));
final _stringGetValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Utf8> Function(Pointer<Void>),
    Pointer<Utf8> Function(Pointer<Void>)
  >('library_std_string_get_value'));
Pointer<Void> stringToFfi(String value) {
  final cValue = value.toNativeUtf8();
  final result = _stringCreateHandle(cValue);
  malloc.free(cValue);
  return result;
}
String stringFromFfi(Pointer<Void> handle) {
  final Pointer<Utf8> cString = _stringGetValue(handle);
  return cString.toDartString();
}
void stringReleaseFfiHandle(Pointer<Void> handle) => _stringReleaseHandle(handle);
// Locale
final _localeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>),
    Pointer<Void> Function(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>)
  >('library_locale_create_handle'));
final _localeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_locale_release_handle'));
final _localeGetLanguageCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Utf8> Function(Pointer<Void>),
    Pointer<Utf8> Function(Pointer<Void>)
>('library_locale_get_language_code'));
final _localeGetCountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Utf8> Function(Pointer<Void>),
    Pointer<Utf8> Function(Pointer<Void>)
>('library_locale_get_country_code'));
final _localeGetScriptCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Utf8> Function(Pointer<Void>),
    Pointer<Utf8> Function(Pointer<Void>)
>('library_locale_get_script_code'));
final _localeGetLanguageTag = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Utf8> Function(Pointer<Void>),
    Pointer<Utf8> Function(Pointer<Void>)
>('library_locale_get_language_tag'));
Pointer<Void> localeToFfi(Locale locale) {
  final cLanguageCode = locale.languageCode.toNativeUtf8();
  final cCountryCode = locale.countryCode?.toNativeUtf8() ?? Pointer<Utf8>.fromAddress(0);
  final cScriptCode = locale.scriptCode?.toNativeUtf8() ?? Pointer<Utf8>.fromAddress(0);
  final cLanguageTag = locale.toLanguageTag().toNativeUtf8();
  final result = _localeCreateHandle(cLanguageCode, cCountryCode, cScriptCode, cLanguageTag);
  malloc.free(cLanguageCode);
  if (cCountryCode.address != 0) malloc.free(cCountryCode);
  if (cScriptCode.address != 0) malloc.free(cScriptCode);
  malloc.free(cLanguageTag);
  return result;
}
Locale localeFromFfi(Pointer<Void> handle) {
  final Pointer<Utf8> languageTagCstring = _localeGetLanguageTag(handle);
  if (languageTagCstring.address != 0) {
    // BCP 47 language tag takes precedence if present.
    return Locale.parse(languageTagCstring.toDartString());
  }
  final Pointer<Utf8> languageCodeCstring = _localeGetLanguageCode(handle);
  final Pointer<Utf8> countryCodeCstring = _localeGetCountryCode(handle);
  final Pointer<Utf8> scriptCodeCstring = _localeGetScriptCode(handle);
  return Locale.fromSubtags(
    languageCode: languageCodeCstring.address != 0 ? languageCodeCstring.toDartString() : "und",
    countryCode: countryCodeCstring.address != 0 ? countryCodeCstring.toDartString() : null,
    scriptCode: scriptCodeCstring.address != 0 ? scriptCodeCstring.toDartString() : null
  );
}
void localeReleaseFfiHandle(Pointer<Void> handle) => _localeReleaseHandle(handle);
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
Pointer<Void> byteToFfiNullable(int? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _byteCreateHandleNullable(_handle);
  return result;
}
int? byteFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _byteGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void byteReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _byteReleaseHandleNullable(handle);
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
Pointer<Void> uByteToFfiNullable(int? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _uByteCreateHandleNullable(_handle);
  return result;
}
int? uByteFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _uByteGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void uByteReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _uByteReleaseHandleNullable(handle);
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
Pointer<Void> shortToFfiNullable(int? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _shortCreateHandleNullable(_handle);
  return result;
}
int? shortFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _shortGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void shortReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _shortReleaseHandleNullable(handle);
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
Pointer<Void> uShortToFfiNullable(int? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _uShortCreateHandleNullable(_handle);
  return result;
}
int? uShortFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _uShortGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void uShortReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _uShortReleaseHandleNullable(handle);
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
Pointer<Void> intToFfiNullable(int? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _intCreateHandleNullable(_handle);
  return result;
}
int? intFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _intGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void intReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _intReleaseHandleNullable(handle);
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
Pointer<Void> uIntToFfiNullable(int? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _uIntCreateHandleNullable(_handle);
  return result;
}
int? uIntFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _uIntGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void uIntReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _uIntReleaseHandleNullable(handle);
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
Pointer<Void> longToFfiNullable(int? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _longCreateHandleNullable(_handle);
  return result;
}
int? longFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _longGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void longReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _longReleaseHandleNullable(handle);
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
Pointer<Void> uLongToFfiNullable(int? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _uLongCreateHandleNullable(_handle);
  return result;
}
int? uLongFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _uLongGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void uLongReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _uLongReleaseHandleNullable(handle);
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
Pointer<Void> floatToFfiNullable(double? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _floatCreateHandleNullable(_handle);
  return result;
}
double? floatFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _floatGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void floatReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _floatReleaseHandleNullable(handle);
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
Pointer<Void> doubleToFfiNullable(double? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _doubleCreateHandleNullable(_handle);
  return result;
}
double? doubleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _doubleGetValueNullable(handle);
  final result = (_handle);
  return result;
}
void doubleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _doubleReleaseHandleNullable(handle);
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
Pointer<Void> booleanToFfiNullable(bool? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = booleanToFfi(value);
  final result = _booleanCreateHandleNullable(_handle);
  booleanReleaseFfiHandle(_handle);
  return result;
}
bool? booleanFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _booleanGetValueNullable(handle);
  final result = booleanFromFfi(_handle);
  booleanReleaseFfiHandle(_handle);
  return result;
}
void booleanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _booleanReleaseHandleNullable(handle);
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
Pointer<Void> stringToFfiNullable(String? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = stringToFfi(value);
  final result = _stringCreateHandleNullable(_handle);
  stringReleaseFfiHandle(_handle);
  return result;
}
String? stringFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _stringGetValueNullable(handle);
  final result = stringFromFfi(_handle);
  stringReleaseFfiHandle(_handle);
  return result;
}
void stringReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _stringReleaseHandleNullable(handle);
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
Pointer<Void> blobToFfiNullable(Uint8List? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = blobToFfi(value);
  final result = _blobCreateHandleNullable(_handle);
  blobReleaseFfiHandle(_handle);
  return result;
}
Uint8List? blobFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _blobGetValueNullable(handle);
  final result = blobFromFfi(_handle);
  blobReleaseFfiHandle(_handle);
  return result;
}
void blobReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _blobReleaseHandleNullable(handle);
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
Pointer<Void> dateToFfiNullable(DateTime? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = dateToFfi(value);
  final result = _dateCreateHandleNullable(_handle);
  dateReleaseFfiHandle(_handle);
  return result;
}
DateTime? dateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _dateGetValueNullable(handle);
  final result = dateFromFfi(_handle);
  dateReleaseFfiHandle(_handle);
  return result;
}
void dateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _dateReleaseHandleNullable(handle);
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
Pointer<Void> localeToFfiNullable(Locale? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = localeToFfi(value);
  final result = _localeCreateHandleNullable(_handle);
  localeReleaseFfiHandle(_handle);
  return result;
}
Locale? localeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _localeGetValueNullable(handle);
  final result = localeFromFfi(_handle);
  localeReleaseFfiHandle(_handle);
  return result;
}
void localeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _localeReleaseHandleNullable(handle);
