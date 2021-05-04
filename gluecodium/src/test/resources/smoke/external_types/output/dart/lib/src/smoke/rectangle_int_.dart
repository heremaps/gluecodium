import 'dart:math' as math;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
// Rectangle<int> "private" section, not exported.
final _smoke_Rectangle_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Int32, Int32, Int32),
    Pointer<Void> Function(int, int, int, int)
  >('library_smoke_Rectangle_create_handle'));
final _smoke_Rectangle_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Rectangle_release_handle'));
final _smoke_Rectangle_get_field_left = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Rectangle_get_field_left'));
final _smoke_Rectangle_get_field_top = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Rectangle_get_field_top'));
final _smoke_Rectangle_get_field_width = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Rectangle_get_field_width'));
final _smoke_Rectangle_get_field_height = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Rectangle_get_field_height'));
Pointer<Void> smoke_Rectangle_toFfi(math.Rectangle<int> value) {
  final _left_handle = (value.left);
  final _top_handle = (value.top);
  final _width_handle = (value.width);
  final _height_handle = (value.height);
  final _result = _smoke_Rectangle_create_handle(_left_handle, _top_handle, _width_handle, _height_handle);
  (_left_handle);
  (_top_handle);
  (_width_handle);
  (_height_handle);
  return _result;
}
math.Rectangle<int> smoke_Rectangle_fromFfi(Pointer<Void> handle) {
  final _left_handle = _smoke_Rectangle_get_field_left(handle);
  final _top_handle = _smoke_Rectangle_get_field_top(handle);
  final _width_handle = _smoke_Rectangle_get_field_width(handle);
  final _height_handle = _smoke_Rectangle_get_field_height(handle);
  try {
    return math.Rectangle<int>(
      (_left_handle),
      (_top_handle),
      (_width_handle),
      (_height_handle)
    );
  } finally {
    (_left_handle);
    (_top_handle);
    (_width_handle);
    (_height_handle);
  }
}
void smoke_Rectangle_releaseFfiHandle(Pointer<Void> handle) => _smoke_Rectangle_release_handle(handle);
// Nullable Rectangle<int>
final _smoke_Rectangle_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Rectangle_create_handle_nullable'));
final _smoke_Rectangle_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Rectangle_release_handle_nullable'));
final _smoke_Rectangle_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Rectangle_get_value_nullable'));
Pointer<Void> smoke_Rectangle_toFfi_nullable(math.Rectangle<int>? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Rectangle_toFfi(value);
  final result = _smoke_Rectangle_create_handle_nullable(_handle);
  smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
math.Rectangle<int>? smoke_Rectangle_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Rectangle_get_value_nullable(handle);
  final result = smoke_Rectangle_fromFfi(_handle);
  smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
void smoke_Rectangle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Rectangle_release_handle_nullable(handle);
// End of Rectangle<int> "private" section.
