import 'package:library/src/builtin_types__conversion.dart';
import '../color_converter.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class int_internal {
  double red;
  double green;
  double blue;
  double alpha;
  int_internal(this.red, this.green, this.blue, this.alpha);
  int_internal.withDefaults(double red, double green, double blue)
    : red = red, green = green, blue = blue, alpha = 0;
}
// int "private" section, not exported.
final _smokeDartcolorCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Float, Float, Float, Float),
    Pointer<Void> Function(double, double, double, double)
  >('library_smoke_DartColor_create_handle'));
final _smokeDartcolorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartColor_release_handle'));
final _smokeDartcolorGetFieldred = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DartColor_get_field_red'));
final _smokeDartcolorGetFieldgreen = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DartColor_get_field_green'));
final _smokeDartcolorGetFieldblue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DartColor_get_field_blue'));
final _smokeDartcolorGetFieldalpha = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DartColor_get_field_alpha'));
Pointer<Void> smoke_DartColor_toFfi(int value_ext) {
  final value = ColorConverter.convertToInternal(value_ext);
  final _redHandle = (value.red);
  final _greenHandle = (value.green);
  final _blueHandle = (value.blue);
  final _alphaHandle = (value.alpha);
  final _result = _smokeDartcolorCreateHandle(_redHandle, _greenHandle, _blueHandle, _alphaHandle);
  (_redHandle);
  (_greenHandle);
  (_blueHandle);
  (_alphaHandle);
  return _result;
}
int smoke_DartColor_fromFfi(Pointer<Void> handle) {
  final _redHandle = _smokeDartcolorGetFieldred(handle);
  final _greenHandle = _smokeDartcolorGetFieldgreen(handle);
  final _blueHandle = _smokeDartcolorGetFieldblue(handle);
  final _alphaHandle = _smokeDartcolorGetFieldalpha(handle);
  try {
    final resultInternal = int_internal(
      (_redHandle),
      (_greenHandle),
      (_blueHandle),
      (_alphaHandle)
    );
    return ColorConverter.convertFromInternal(resultInternal);
  } finally {
    (_redHandle);
    (_greenHandle);
    (_blueHandle);
    (_alphaHandle);
  }
}
void smoke_DartColor_releaseFfiHandle(Pointer<Void> handle) => _smokeDartcolorReleaseHandle(handle);
// Nullable int
final _smoke_DartColorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartColor_create_handle_nullable'));
final _smoke_DartColorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartColor_release_handle_nullable'));
final _smoke_DartColorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartColor_get_value_nullable'));
Pointer<Void> smoke_DartColor_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DartColor_toFfi(value);
  final result = _smoke_DartColorCreateHandleNullable(_handle);
  smoke_DartColor_releaseFfiHandle(_handle);
  return result;
}
int smoke_DartColor_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DartColorGetValueNullable(handle);
  final result = smoke_DartColor_fromFfi(_handle);
  smoke_DartColor_releaseFfiHandle(_handle);
  return result;
}
void smoke_DartColor_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DartColorReleaseHandleNullable(handle);
// End of int "private" section.
