import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
enum werrEnum {
    WEE_ITEM
}
// werrEnum "private" section, not exported.
int smoke_PlatformNames_BasicEnum_toFfi(werrEnum value) {
  switch (value) {
  case werrEnum.WEE_ITEM:
    return 0;
  break;
  default:
    throw StateError("Invalid enum value $value for werrEnum enum.");
  }
}
werrEnum smoke_PlatformNames_BasicEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return werrEnum.WEE_ITEM;
  break;
  default:
    throw StateError("Invalid numeric value $handle for werrEnum enum.");
  }
}
void smoke_PlatformNames_BasicEnum_releaseFfiHandle(int handle) {}
final _smoke_PlatformNames_BasicEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_PlatformNames_BasicEnum_create_handle_nullable');
final _smoke_PlatformNames_BasicEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicEnum_release_handle_nullable');
final _smoke_PlatformNames_BasicEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicEnum_get_value_nullable');
Pointer<Void> smoke_PlatformNames_BasicEnum_toFfi_nullable(werrEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PlatformNames_BasicEnum_toFfi(value);
  final result = _smoke_PlatformNames_BasicEnum_create_handle_nullable(_handle);
  smoke_PlatformNames_BasicEnum_releaseFfiHandle(_handle);
  return result;
}
werrEnum smoke_PlatformNames_BasicEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PlatformNames_BasicEnum_get_value_nullable(handle);
  final result = smoke_PlatformNames_BasicEnum_fromFfi(_handle);
  smoke_PlatformNames_BasicEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_PlatformNames_BasicEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PlatformNames_BasicEnum_release_handle_nullable(handle);
// End of werrEnum "private" section.
class weeStruct {
  String WEE_FIELD;
  weeStruct._(this.WEE_FIELD);
  weeStruct._copy(weeStruct _other) : this._(_other.WEE_FIELD);
  weeStruct(String WeeParameter) : this._copy(_WeeCreate(WeeParameter));
  static weeStruct _WeeCreate(String WeeParameter) {
    final _WeeCreate_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_PlatformNames_BasicStruct_make__String');
    final _WeeParameter_handle = String_toFfi(WeeParameter);
    final __result_handle = _WeeCreate_ffi(_WeeParameter_handle);
    String_releaseFfiHandle(_WeeParameter_handle);
    final _result = smoke_PlatformNames_BasicStruct_fromFfi(__result_handle);
    smoke_PlatformNames_BasicStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
}
// weeStruct "private" section, not exported.
final _smoke_PlatformNames_BasicStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_create_handle');
final _smoke_PlatformNames_BasicStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_release_handle');
final _smoke_PlatformNames_BasicStruct_get_field_stringField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_get_field_stringField');
Pointer<Void> smoke_PlatformNames_BasicStruct_toFfi(weeStruct value) {
  final _WEE_FIELD_handle = String_toFfi(value.WEE_FIELD);
  final _result = _smoke_PlatformNames_BasicStruct_create_handle(_WEE_FIELD_handle);
  String_releaseFfiHandle(_WEE_FIELD_handle);
  return _result;
}
weeStruct smoke_PlatformNames_BasicStruct_fromFfi(Pointer<Void> handle) {
  final _WEE_FIELD_handle = _smoke_PlatformNames_BasicStruct_get_field_stringField(handle);
  final _result = weeStruct._(
    String_fromFfi(_WEE_FIELD_handle)
  );
  String_releaseFfiHandle(_WEE_FIELD_handle);
  return _result;
}
void smoke_PlatformNames_BasicStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_PlatformNames_BasicStruct_release_handle(handle);
// Nullable weeStruct
final _smoke_PlatformNames_BasicStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_create_handle_nullable');
final _smoke_PlatformNames_BasicStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_release_handle_nullable');
final _smoke_PlatformNames_BasicStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_get_value_nullable');
Pointer<Void> smoke_PlatformNames_BasicStruct_toFfi_nullable(weeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_PlatformNames_BasicStruct_toFfi(value);
  final result = _smoke_PlatformNames_BasicStruct_create_handle_nullable(_handle);
  smoke_PlatformNames_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
weeStruct smoke_PlatformNames_BasicStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_PlatformNames_BasicStruct_get_value_nullable(handle);
  final result = smoke_PlatformNames_BasicStruct_fromFfi(_handle);
  smoke_PlatformNames_BasicStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_PlatformNames_BasicStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_PlatformNames_BasicStruct_release_handle_nullable(handle);
// End of weeStruct "private" section.
