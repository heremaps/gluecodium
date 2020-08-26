import 'package:library/src/builtin_types__conversion.dart';
import '../color_converter.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
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
final _smoke_DartColor_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Float, Float, Float, Float),
    Pointer<Void> Function(double, double, double, double)
  >('library_smoke_DartColor_create_handle'));
final _smoke_DartColor_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartColor_release_handle'));
final _smoke_DartColor_get_field_red = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DartColor_get_field_red'));
final _smoke_DartColor_get_field_green = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DartColor_get_field_green'));
final _smoke_DartColor_get_field_blue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DartColor_get_field_blue'));
final _smoke_DartColor_get_field_alpha = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_DartColor_get_field_alpha'));
Pointer<Void> smoke_DartColor_toFfi(int value_ext) {
  final value = ColorConverter.convertToInternal(value_ext);
  final _red_handle = (value.red);
  final _green_handle = (value.green);
  final _blue_handle = (value.blue);
  final _alpha_handle = (value.alpha);
  final _result = _smoke_DartColor_create_handle(_red_handle, _green_handle, _blue_handle, _alpha_handle);
  (_red_handle);
  (_green_handle);
  (_blue_handle);
  (_alpha_handle);
  return _result;
}
int smoke_DartColor_fromFfi(Pointer<Void> handle) {
  final _red_handle = _smoke_DartColor_get_field_red(handle);
  final _green_handle = _smoke_DartColor_get_field_green(handle);
  final _blue_handle = _smoke_DartColor_get_field_blue(handle);
  final _alpha_handle = _smoke_DartColor_get_field_alpha(handle);
  try {
    final result_internal = int_internal(
      (_red_handle),
      (_green_handle),
      (_blue_handle),
      (_alpha_handle)
    );
    return ColorConverter.convertFromInternal(result_internal);
  } finally {
    (_red_handle);
    (_green_handle);
    (_blue_handle);
    (_alpha_handle);
  }
}
void smoke_DartColor_releaseFfiHandle(Pointer<Void> handle) => _smoke_DartColor_release_handle(handle);
// Nullable int
final _smoke_DartColor_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartColor_create_handle_nullable'));
final _smoke_DartColor_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_DartColor_release_handle_nullable'));
final _smoke_DartColor_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_DartColor_get_value_nullable'));
Pointer<Void> smoke_DartColor_toFfi_nullable(int value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_DartColor_toFfi(value);
  final result = _smoke_DartColor_create_handle_nullable(_handle);
  smoke_DartColor_releaseFfiHandle(_handle);
  return result;
}
int smoke_DartColor_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_DartColor_get_value_nullable(handle);
  final result = smoke_DartColor_fromFfi(_handle);
  smoke_DartColor_releaseFfiHandle(_handle);
  return result;
}
void smoke_DartColor_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_DartColor_release_handle_nullable(handle);
// End of int "private" section.
