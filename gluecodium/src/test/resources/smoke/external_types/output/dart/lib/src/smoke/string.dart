import '../season_converter.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
enum String_internal {
    winter,
    spring,
    summer,
    autumn
}
// String "private" section, not exported.
int smoke_DartSeason_toFfi(String value_ext) {
  final value = SeasonConverter.convertToInternal(value_ext);
  switch (value) {
  case String_internal.winter:
    return 0;
  break;
  case String_internal.spring:
    return 1;
  break;
  case String_internal.summer:
    return 2;
  break;
  case String_internal.autumn:
    return 3;
  break;
  default:
    throw StateError("Invalid enum value $value for String enum.");
  }
}
String smoke_DartSeason_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return SeasonConverter.convertFromInternal(String_internal.winter);
  break;
  case 1:
    return SeasonConverter.convertFromInternal(String_internal.spring);
  break;
  case 2:
    return SeasonConverter.convertFromInternal(String_internal.summer);
  break;
  case 3:
    return SeasonConverter.convertFromInternal(String_internal.autumn);
  break;
  default:
    throw StateError("Invalid numeric value $handle for String enum.");
  }
}
void smoke_DartSeason_releaseFfiHandle(int handle) {}
final _smoke_DartSeason_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_DartSeason_create_handle_nullable'));
final _smoke_DartSeason_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartSeason_release_handle_nullable'));
final _smoke_DartSeason_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_DartSeason_get_value_nullable'));
Pointer<Void> smoke_DartSeason_toFfi_nullable(String? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DartSeason_toFfi(value);
  final result = _smoke_DartSeason_create_handle_nullable(_handle);
  smoke_DartSeason_releaseFfiHandle(_handle);
  return result;
}
String? smoke_DartSeason_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DartSeason_get_value_nullable(handle);
  final result = smoke_DartSeason_fromFfi(_handle);
  smoke_DartSeason_releaseFfiHandle(_handle);
  return result;
}
void smoke_DartSeason_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DartSeason_release_handle_nullable(handle);
// End of String "private" section.
