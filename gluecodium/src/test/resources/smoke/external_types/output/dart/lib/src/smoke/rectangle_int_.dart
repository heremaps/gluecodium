import 'dart:ffi';
import 'dart:math' as math;
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
Pointer<Void> smokeRectangleToFfi(math.Rectangle<int> value) {
  final _leftHandle = (value.left);
  final _topHandle = (value.top);
  final _widthHandle = (value.width);
  final _heightHandle = (value.height);
  final _result = _smokeRectangleCreateHandle(_leftHandle, _topHandle, _widthHandle, _heightHandle);
  return _result;
}
math.Rectangle<int> smokeRectangleFromFfi(Pointer<Void> handle) {
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
  }
}
void smokeRectangleReleaseFfiHandle(Pointer<Void> handle) => _smokeRectangleReleaseHandle(handle);
// Nullable Rectangle<int>
final _smokeRectangleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Rectangle_create_handle_nullable'));
final _smokeRectangleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Rectangle_release_handle_nullable'));
final _smokeRectangleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Rectangle_get_value_nullable'));
Pointer<Void> smokeRectangleToFfiNullable(math.Rectangle<int> value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smokeRectangleToFfi(value);
  final result = _smokeRectangleCreateHandleNullable(_handle);
  smokeRectangleReleaseFfiHandle(_handle);
  return result;
}
math.Rectangle<int> smokeRectangleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smokeRectangleGetValueNullable(handle);
  final result = smokeRectangleFromFfi(_handle);
  smokeRectangleReleaseFfiHandle(_handle);
  return result;
}
void smokeRectangleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _smokeRectangleReleaseHandleNullable(handle);
// End of Rectangle<int> "private" section.
