import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
// Blob
final _Blob_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('blob_create_handle');
final _Blob_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('blob_release_handle');
final _Blob_get_length = __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
>('blob_get_length');
final _Blob_get_at = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>, Uint64),
    int Function(Pointer<Void>, int)
>('blob_get_at');
final _Blob_set_at = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Uint64, Uint8),
    void Function(Pointer<Void>, int, int)
  >('blob_set_at');
Pointer<Void> Blob_toFfi(Uint8List list) {
  final length = list.length;
  final result = _Blob_create_handle(length);
  for (int i = 0; i < length; ++i) {
    _Blob_set_at(result, i, list[i]);
  }
  return result;
}
Uint8List Blob_fromFfi(Pointer<Void> handle) {
  final length = _Blob_get_length(handle);
  final result = Uint8List(length);
  for (int i = 0; i < length; ++i) {
    result[i] = _Blob_get_at(handle, i);
  }
  return result;
}
void Blob_releaseFfiHandle(Pointer<Void> handle) => _Blob_release_handle(handle);
// Boolean
int Boolean_toFfi(bool value) => value ? 1 : 0;
bool Boolean_fromFfi(int handle) => handle != 0;
void Boolean_releaseFfiHandle(int handle) {}
// Date
int Date_toFfi(DateTime value) => value.microsecondsSinceEpoch;
DateTime Date_fromFfi(int us) => DateTime.fromMicrosecondsSinceEpoch(us, isUtc: true);
void Date_releaseFfiHandle(int handle) {}
// String
final _String_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Utf8>),
    Pointer<Void> Function(Pointer<Utf8>)
  >('std_string_create_handle');
final _String_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('std_string_release_handle');
final _String_get_value = __lib.nativeLibrary.lookupFunction<
    Pointer<Utf8> Function(Pointer<Void>),
    Pointer<Utf8> Function(Pointer<Void>)
  >('std_string_get_value');
Pointer<Void> String_toFfi(String value) {
  final cValue = Utf8.toUtf8(value);
  final result = _String_create_handle(cValue);
  free(cValue);
  return result;
}
String String_fromFfi(Pointer<Void> handle) => Utf8.fromUtf8(_String_get_value(handle));
void String_releaseFfiHandle(Pointer<Void> handle) => _String_release_handle(handle);
// Nullable Byte
final _Byte_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int8),
    Pointer<Void> Function(int)
  >('Byte_create_handle_nullable');
final _Byte_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('Byte_release_handle_nullable');
final _Byte_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Int8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('Byte_get_value_nullable');
Pointer<Void> Byte_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _Byte_create_handle_nullable(_handle);
  return result;
}
int Byte_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _Byte_get_value_nullable(handle);
  final result = (_handle);
  return result;
}
void Byte_releaseFfiHandle_nullable(Pointer<Void> handle) => _Byte_release_handle_nullable(handle);
// Nullable UByte
final _UByte_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('UByte_create_handle_nullable');
final _UByte_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('UByte_release_handle_nullable');
final _UByte_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('UByte_get_value_nullable');
Pointer<Void> UByte_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _UByte_create_handle_nullable(_handle);
  return result;
}
int UByte_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _UByte_get_value_nullable(handle);
  final result = (_handle);
  return result;
}
void UByte_releaseFfiHandle_nullable(Pointer<Void> handle) => _UByte_release_handle_nullable(handle);
// Nullable Short
final _Short_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int16),
    Pointer<Void> Function(int)
  >('Short_create_handle_nullable');
final _Short_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('Short_release_handle_nullable');
final _Short_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Int16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('Short_get_value_nullable');
Pointer<Void> Short_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _Short_create_handle_nullable(_handle);
  return result;
}
int Short_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _Short_get_value_nullable(handle);
  final result = (_handle);
  return result;
}
void Short_releaseFfiHandle_nullable(Pointer<Void> handle) => _Short_release_handle_nullable(handle);
// Nullable UShort
final _UShort_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint16),
    Pointer<Void> Function(int)
  >('UShort_create_handle_nullable');
final _UShort_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('UShort_release_handle_nullable');
final _UShort_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('UShort_get_value_nullable');
Pointer<Void> UShort_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _UShort_create_handle_nullable(_handle);
  return result;
}
int UShort_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _UShort_get_value_nullable(handle);
  final result = (_handle);
  return result;
}
void UShort_releaseFfiHandle_nullable(Pointer<Void> handle) => _UShort_release_handle_nullable(handle);
// Nullable Int
final _Int_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32),
    Pointer<Void> Function(int)
  >('Int_create_handle_nullable');
final _Int_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('Int_release_handle_nullable');
final _Int_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('Int_get_value_nullable');
Pointer<Void> Int_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _Int_create_handle_nullable(_handle);
  return result;
}
int Int_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _Int_get_value_nullable(handle);
  final result = (_handle);
  return result;
}
void Int_releaseFfiHandle_nullable(Pointer<Void> handle) => _Int_release_handle_nullable(handle);
// Nullable UInt
final _UInt_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('UInt_create_handle_nullable');
final _UInt_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('UInt_release_handle_nullable');
final _UInt_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('UInt_get_value_nullable');
Pointer<Void> UInt_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _UInt_create_handle_nullable(_handle);
  return result;
}
int UInt_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _UInt_get_value_nullable(handle);
  final result = (_handle);
  return result;
}
void UInt_releaseFfiHandle_nullable(Pointer<Void> handle) => _UInt_release_handle_nullable(handle);
// Nullable Long
final _Long_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int64),
    Pointer<Void> Function(int)
  >('Long_create_handle_nullable');
final _Long_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('Long_release_handle_nullable');
final _Long_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('Long_get_value_nullable');
Pointer<Void> Long_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _Long_create_handle_nullable(_handle);
  return result;
}
int Long_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _Long_get_value_nullable(handle);
  final result = (_handle);
  return result;
}
void Long_releaseFfiHandle_nullable(Pointer<Void> handle) => _Long_release_handle_nullable(handle);
// Nullable ULong
final _ULong_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('ULong_create_handle_nullable');
final _ULong_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('ULong_release_handle_nullable');
final _ULong_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('ULong_get_value_nullable');
Pointer<Void> ULong_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _ULong_create_handle_nullable(_handle);
  return result;
}
int ULong_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _ULong_get_value_nullable(handle);
  final result = (_handle);
  return result;
}
void ULong_releaseFfiHandle_nullable(Pointer<Void> handle) => _ULong_release_handle_nullable(handle);
// Nullable Float
final _Float_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Float),
    Pointer<Void> Function(double)
  >('Float_create_handle_nullable');
final _Float_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('Float_release_handle_nullable');
final _Float_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('Float_get_value_nullable');
Pointer<Void> Float_toFfi_nullable(double value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _Float_create_handle_nullable(_handle);
  return result;
}
double Float_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _Float_get_value_nullable(handle);
  final result = (_handle);
  return result;
}
void Float_releaseFfiHandle_nullable(Pointer<Void> handle) => _Float_release_handle_nullable(handle);
// Nullable Double
final _Double_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('Double_create_handle_nullable');
final _Double_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('Double_release_handle_nullable');
final _Double_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('Double_get_value_nullable');
Pointer<Void> Double_toFfi_nullable(double value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = (value);
  final result = _Double_create_handle_nullable(_handle);
  return result;
}
double Double_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _Double_get_value_nullable(handle);
  final result = (_handle);
  return result;
}
void Double_releaseFfiHandle_nullable(Pointer<Void> handle) => _Double_release_handle_nullable(handle);
// Nullable Boolean
final _Boolean_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('Boolean_create_handle_nullable');
final _Boolean_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('Boolean_release_handle_nullable');
final _Boolean_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('Boolean_get_value_nullable');
Pointer<Void> Boolean_toFfi_nullable(bool value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = Boolean_toFfi(value);
  final result = _Boolean_create_handle_nullable(_handle);
  Boolean_releaseFfiHandle(_handle);
  return result;
}
bool Boolean_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _Boolean_get_value_nullable(handle);
  final result = Boolean_fromFfi(_handle);
  Boolean_releaseFfiHandle(_handle);
  return result;
}
void Boolean_releaseFfiHandle_nullable(Pointer<Void> handle) => _Boolean_release_handle_nullable(handle);
// Nullable String
final _String_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('String_create_handle_nullable');
final _String_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('String_release_handle_nullable');
final _String_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('String_get_value_nullable');
Pointer<Void> String_toFfi_nullable(String value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = String_toFfi(value);
  final result = _String_create_handle_nullable(_handle);
  String_releaseFfiHandle(_handle);
  return result;
}
String String_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _String_get_value_nullable(handle);
  final result = String_fromFfi(_handle);
  String_releaseFfiHandle(_handle);
  return result;
}
void String_releaseFfiHandle_nullable(Pointer<Void> handle) => _String_release_handle_nullable(handle);
// Nullable Blob
final _Blob_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('Blob_create_handle_nullable');
final _Blob_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('Blob_release_handle_nullable');
final _Blob_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('Blob_get_value_nullable');
Pointer<Void> Blob_toFfi_nullable(Uint8List value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = Blob_toFfi(value);
  final result = _Blob_create_handle_nullable(_handle);
  Blob_releaseFfiHandle(_handle);
  return result;
}
Uint8List Blob_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _Blob_get_value_nullable(handle);
  final result = Blob_fromFfi(_handle);
  Blob_releaseFfiHandle(_handle);
  return result;
}
void Blob_releaseFfiHandle_nullable(Pointer<Void> handle) => _Blob_release_handle_nullable(handle);
// Nullable Date
final _Date_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('Date_create_handle_nullable');
final _Date_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('Date_release_handle_nullable');
final _Date_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('Date_get_value_nullable');
Pointer<Void> Date_toFfi_nullable(DateTime value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = Date_toFfi(value);
  final result = _Date_create_handle_nullable(_handle);
  Date_releaseFfiHandle(_handle);
  return result;
}
DateTime Date_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _Date_get_value_nullable(handle);
  final result = Date_fromFfi(_handle);
  Date_releaseFfiHandle(_handle);
  return result;
}
void Date_releaseFfiHandle_nullable(Pointer<Void> handle) => _Date_release_handle_nullable(handle);
