import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import '../season_converter.dart';
enum StringInternal {
    winter,
    spring,
    summer,
    autumn
}
// String "private" section, not exported.
int smokeDartseasonToFfi(String valueExternal) {
  final value = SeasonConverter.convertToInternal(valueExternal);
  switch (value) {
  case StringInternal.winter:
    return 0;
  break;
  case StringInternal.spring:
    return 1;
  break;
  case StringInternal.summer:
    return 2;
  break;
  case StringInternal.autumn:
    return 3;
  break;
  default:
    throw StateError("Invalid enum value $value for String enum.");
  }
}
String smokeDartseasonFromFfi(int handle) {
  switch (handle) {
  case 0:
    return SeasonConverter.convertFromInternal(StringInternal.winter);
  break;
  case 1:
    return SeasonConverter.convertFromInternal(StringInternal.spring);
  break;
  case 2:
    return SeasonConverter.convertFromInternal(StringInternal.summer);
  break;
  case 3:
    return SeasonConverter.convertFromInternal(StringInternal.autumn);
  break;
  default:
    throw StateError("Invalid numeric value $handle for String enum.");
  }
}
void smokeDartseasonReleaseFfiHandle(int handle) {}
final _smokeDartseasonCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_DartSeason_create_handle_nullable'));
final _smokeDartseasonReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartSeason_release_handle_nullable'));
final _smokeDartseasonGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DartSeason_get_value_nullable'));
Pointer<Void> smokeDartseasonToFfiNullable(String value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartseasonToFfi(value);
  final result = _smokeDartseasonCreateHandleNullable(_handle);
  smokeDartseasonReleaseFfiHandle(_handle);
  return result;
}
String smokeDartseasonFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartseasonGetValueNullable(handle);
  final result = smokeDartseasonFromFfi(_handle);
  smokeDartseasonReleaseFfiHandle(_handle);
  return result;
}
void smokeDartseasonReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartseasonReleaseHandleNullable(handle);
// End of String "private" section.
