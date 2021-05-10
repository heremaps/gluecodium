import 'dart:math' as math;
import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
// Rectangle<int> "private" section, not exported.
final _smokeRectangleCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Int32, Int32, Int32),
    Pointer<Void> Function(int, int, int, int)
  >('library_smoke_Rectangle_create_handle'));
final _smokeRectangleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Rectangle_release_handle'));
final _smokeRectangleGetFieldleft = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Rectangle_get_field_left'));
final _smokeRectangleGetFieldtop = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Rectangle_get_field_top'));
final _smokeRectangleGetFieldwidth = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Rectangle_get_field_width'));
final _smokeRectangleGetFieldheight = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Rectangle_get_field_height'));
Pointer<Void> smoke_Rectangle_toFfi(math.Rectangle<int> value) {
  final _leftHandle = (value.left);
  final _topHandle = (value.top);
  final _widthHandle = (value.width);
  final _heightHandle = (value.height);
  final _result = _smokeRectangleCreateHandle(_leftHandle, _topHandle, _widthHandle, _heightHandle);
  (_leftHandle);
  (_topHandle);
  (_widthHandle);
  (_heightHandle);
  return _result;
}
math.Rectangle<int> smoke_Rectangle_fromFfi(Pointer<Void> handle) {
  final _leftHandle = _smokeRectangleGetFieldleft(handle);
  final _topHandle = _smokeRectangleGetFieldtop(handle);
  final _widthHandle = _smokeRectangleGetFieldwidth(handle);
  final _heightHandle = _smokeRectangleGetFieldheight(handle);
  try {
    return math.Rectangle<int>(
      (_leftHandle),
      (_topHandle),
      (_widthHandle),
      (_heightHandle)
    );
  } finally {
    (_leftHandle);
    (_topHandle);
    (_widthHandle);
    (_heightHandle);
  }
}
void smoke_Rectangle_releaseFfiHandle(Pointer<Void> handle) => _smokeRectangleReleaseHandle(handle);
// Nullable Rectangle<int>
final _smoke_RectangleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Rectangle_create_handle_nullable'));
final _smoke_RectangleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Rectangle_release_handle_nullable'));
final _smoke_RectangleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Rectangle_get_value_nullable'));
Pointer<Void> smoke_Rectangle_toFfi_nullable(math.Rectangle<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Rectangle_toFfi(value);
  final result = _smoke_RectangleCreateHandleNullable(_handle);
  smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
math.Rectangle<int> smoke_Rectangle_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_RectangleGetValueNullable(handle);
  final result = smoke_Rectangle_fromFfi(_handle);
  smoke_Rectangle_releaseFfiHandle(_handle);
  return result;
}
void smoke_Rectangle_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_RectangleReleaseHandleNullable(handle);
// End of Rectangle<int> "private" section.
