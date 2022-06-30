import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';
class weeTypes {
}
enum weeTypes_werrEnum {
    WEE_ITEM
}
// weeTypes_werrEnum "private" section, not exported.
int smokePlatformnamesBasicenumToFfi(weeTypes_werrEnum value) {
  switch (value) {
  case weeTypes_werrEnum.WEE_ITEM:
    return 0;
  default:
    throw StateError("Invalid enum value $value for weeTypes_werrEnum enum.");
  }
}
weeTypes_werrEnum smokePlatformnamesBasicenumFromFfi(int handle) {
  switch (handle) {
  case 0:
    return weeTypes_werrEnum.WEE_ITEM;
  default:
    throw StateError("Invalid numeric value $handle for weeTypes_werrEnum enum.");
  }
}
void smokePlatformnamesBasicenumReleaseFfiHandle(int handle) {}
final _smokePlatformnamesBasicenumCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_PlatformNames_BasicEnum_create_handle_nullable'));
final _smokePlatformnamesBasicenumReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicEnum_release_handle_nullable'));
final _smokePlatformnamesBasicenumGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicEnum_get_value_nullable'));
Pointer<Void> smokePlatformnamesBasicenumToFfiNullable(weeTypes_werrEnum? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePlatformnamesBasicenumToFfi(value);
  final result = _smokePlatformnamesBasicenumCreateHandleNullable(_handle);
  smokePlatformnamesBasicenumReleaseFfiHandle(_handle);
  return result;
}
weeTypes_werrEnum? smokePlatformnamesBasicenumFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePlatformnamesBasicenumGetValueNullable(handle);
  final result = smokePlatformnamesBasicenumFromFfi(_handle);
  smokePlatformnamesBasicenumReleaseFfiHandle(_handle);
  return result;
}
void smokePlatformnamesBasicenumReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePlatformnamesBasicenumReleaseHandleNullable(handle);
// End of weeTypes_werrEnum "private" section.
class weeTypes_weeStruct {
  String WEE_FIELD;
  weeTypes_weeStruct._(this.WEE_FIELD);
  factory weeTypes_weeStruct.WeeCreate(String WeeParameter) => $prototype.WeeCreate(WeeParameter);
  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = weeTypes_weeStruct$Impl();
}
// weeTypes_weeStruct "private" section, not exported.
final _smokePlatformnamesBasicstructCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_create_handle'));
final _smokePlatformnamesBasicstructReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_release_handle'));
final _smokePlatformnamesBasicstructGetFieldstringField = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_get_field_stringField'));
/// @nodoc
@visibleForTesting
class weeTypes_weeStruct$Impl {
  weeTypes_weeStruct WeeCreate(String WeeParameter) {
    final _WeeCreateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_PlatformNames_BasicStruct_make__String'));
    final _WeeParameterHandle = stringToFfi(WeeParameter);
    final __resultHandle = _WeeCreateFfi(__lib.LibraryContext.isolateId, _WeeParameterHandle);
    stringReleaseFfiHandle(_WeeParameterHandle);
    try {
      return smokePlatformnamesBasicstructFromFfi(__resultHandle);
    } finally {
      smokePlatformnamesBasicstructReleaseFfiHandle(__resultHandle);
    }
  }
}
Pointer<Void> smokePlatformnamesBasicstructToFfi(weeTypes_weeStruct value) {
  final _WEE_FIELDHandle = stringToFfi(value.WEE_FIELD);
  final _result = _smokePlatformnamesBasicstructCreateHandle(_WEE_FIELDHandle);
  stringReleaseFfiHandle(_WEE_FIELDHandle);
  return _result;
}
weeTypes_weeStruct smokePlatformnamesBasicstructFromFfi(Pointer<Void> handle) {
  final _WEE_FIELDHandle = _smokePlatformnamesBasicstructGetFieldstringField(handle);
  try {
    return weeTypes_weeStruct._(
      stringFromFfi(_WEE_FIELDHandle)
    );
  } finally {
    stringReleaseFfiHandle(_WEE_FIELDHandle);
  }
}
void smokePlatformnamesBasicstructReleaseFfiHandle(Pointer<Void> handle) => _smokePlatformnamesBasicstructReleaseHandle(handle);
// Nullable weeTypes_weeStruct
final _smokePlatformnamesBasicstructCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_create_handle_nullable'));
final _smokePlatformnamesBasicstructReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_release_handle_nullable'));
final _smokePlatformnamesBasicstructGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNames_BasicStruct_get_value_nullable'));
Pointer<Void> smokePlatformnamesBasicstructToFfiNullable(weeTypes_weeStruct? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePlatformnamesBasicstructToFfi(value);
  final result = _smokePlatformnamesBasicstructCreateHandleNullable(_handle);
  smokePlatformnamesBasicstructReleaseFfiHandle(_handle);
  return result;
}
weeTypes_weeStruct? smokePlatformnamesBasicstructFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePlatformnamesBasicstructGetValueNullable(handle);
  final result = smokePlatformnamesBasicstructFromFfi(_handle);
  smokePlatformnamesBasicstructReleaseFfiHandle(_handle);
  return result;
}
void smokePlatformnamesBasicstructReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePlatformnamesBasicstructReleaseHandleNullable(handle);
// End of weeTypes_weeStruct "private" section.
// weeTypes "private" section, not exported.
final _smokePlatformnamesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('library_smoke_PlatformNames_create_handle'));
final _smokePlatformnamesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNames_release_handle'));
Pointer<Void> smokePlatformnamesToFfi(weeTypes value) {
  final _result = _smokePlatformnamesCreateHandle();
  return _result;
}
weeTypes smokePlatformnamesFromFfi(Pointer<Void> handle) {
  try {
    return weeTypes(
    );
  } finally {
  }
}
void smokePlatformnamesReleaseFfiHandle(Pointer<Void> handle) => _smokePlatformnamesReleaseHandle(handle);
// Nullable weeTypes
final _smokePlatformnamesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNames_create_handle_nullable'));
final _smokePlatformnamesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_PlatformNames_release_handle_nullable'));
final _smokePlatformnamesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_PlatformNames_get_value_nullable'));
Pointer<Void> smokePlatformnamesToFfiNullable(weeTypes? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokePlatformnamesToFfi(value);
  final result = _smokePlatformnamesCreateHandleNullable(_handle);
  smokePlatformnamesReleaseFfiHandle(_handle);
  return result;
}
weeTypes? smokePlatformnamesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokePlatformnamesGetValueNullable(handle);
  final result = smokePlatformnamesFromFfi(_handle);
  smokePlatformnamesReleaseFfiHandle(_handle);
  return result;
}
void smokePlatformnamesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokePlatformnamesReleaseHandleNullable(handle);
// End of weeTypes "private" section.
