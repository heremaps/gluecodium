import 'dart:ffi';
import 'package:library/src/_library_context.dart' as __lib;
import '../color_converter.dart';
class intInternal {
  double red;
  double green;
  double blue;
  double alpha;
  intInternal(this.red, this.green, this.blue, this.alpha);
  intInternal.withDefaults(double red, double green, double blue)
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
Pointer<Void> smokeDartcolorToFfi(int valueExternal) {
  final value = ColorConverter.convertToInternal(valueExternal);
  final _redHandle = (value.red);
  final _greenHandle = (value.green);
  final _blueHandle = (value.blue);
  final _alphaHandle = (value.alpha);
  final _result = _smokeDartcolorCreateHandle(_redHandle, _greenHandle, _blueHandle, _alphaHandle);
  return _result;
}
int smokeDartcolorFromFfi(Pointer<Void> handle) {
  final _redHandle = _smokeDartcolorGetFieldred(handle);
  final _greenHandle = _smokeDartcolorGetFieldgreen(handle);
  final _blueHandle = _smokeDartcolorGetFieldblue(handle);
  final _alphaHandle = _smokeDartcolorGetFieldalpha(handle);
  try {
    final resultInternal = intInternal(
      (_redHandle),
      (_greenHandle),
      (_blueHandle),
      (_alphaHandle)
    );
    return ColorConverter.convertFromInternal(resultInternal);
  } finally {
  }
}
void smokeDartcolorReleaseFfiHandle(Pointer<Void> handle) => _smokeDartcolorReleaseHandle(handle);
// Nullable int
final _smokeDartcolorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartColor_create_handle_nullable'));
final _smokeDartcolorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartColor_release_handle_nullable'));
final _smokeDartcolorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartColor_get_value_nullable'));
Pointer<Void> smokeDartcolorToFfiNullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeDartcolorToFfi(value);
  final result = _smokeDartcolorCreateHandleNullable(_handle);
  smokeDartcolorReleaseFfiHandle(_handle);
  return result;
}
int smokeDartcolorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeDartcolorGetValueNullable(handle);
  final result = smokeDartcolorFromFfi(_handle);
  smokeDartcolorReleaseFfiHandle(_handle);
  return result;
}
void smokeDartcolorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeDartcolorReleaseHandleNullable(handle);
// End of int "private" section.
