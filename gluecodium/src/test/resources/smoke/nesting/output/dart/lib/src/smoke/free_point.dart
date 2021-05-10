import 'package:library/src/builtin_types__conversion.dart';
import 'package:library/src/smoke/free_enum.dart';
import 'dart:ffi';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class FreePoint {
  double x;
  double y;
  FreePoint(this.x, this.y);
  static final FreeEnum aBar = FreeEnum.bar;
  FreePoint flip() {
    final _flipFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_FreePoint_flip'));
    final _handle = smoke_FreePoint_toFfi(this);
    final __resultHandle = _flipFfi(_handle, __lib.LibraryContext.isolateId);
    smoke_FreePoint_releaseFfiHandle(_handle);
    try {
      return smoke_FreePoint_fromFfi(__resultHandle);
    } finally {
      smoke_FreePoint_releaseFfiHandle(__resultHandle);
    }
  }
}
// FreePoint "private" section, not exported.
final _smokeFreepointCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('library_smoke_FreePoint_create_handle'));
final _smokeFreepointReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FreePoint_release_handle'));
final _smokeFreepointGetFieldx = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_FreePoint_get_field_x'));
final _smokeFreepointGetFieldy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_FreePoint_get_field_y'));
Pointer<Void> smoke_FreePoint_toFfi(FreePoint value) {
  final _xHandle = (value.x);
  final _yHandle = (value.y);
  final _result = _smokeFreepointCreateHandle(_xHandle, _yHandle);
  (_xHandle);
  (_yHandle);
  return _result;
}
FreePoint smoke_FreePoint_fromFfi(Pointer<Void> handle) {
  final _xHandle = _smokeFreepointGetFieldx(handle);
  final _yHandle = _smokeFreepointGetFieldy(handle);
  try {
    return FreePoint(
      (_xHandle),
      (_yHandle)
    );
  } finally {
    (_xHandle);
    (_yHandle);
  }
}
void smoke_FreePoint_releaseFfiHandle(Pointer<Void> handle) => _smokeFreepointReleaseHandle(handle);
// Nullable FreePoint
final _smoke_FreePointCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FreePoint_create_handle_nullable'));
final _smoke_FreePointReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FreePoint_release_handle_nullable'));
final _smoke_FreePointGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FreePoint_get_value_nullable'));
Pointer<Void> smoke_FreePoint_toFfi_nullable(FreePoint value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_FreePoint_toFfi(value);
  final result = _smoke_FreePointCreateHandleNullable(_handle);
  smoke_FreePoint_releaseFfiHandle(_handle);
  return result;
}
FreePoint smoke_FreePoint_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_FreePointGetValueNullable(handle);
  final result = smoke_FreePoint_fromFfi(_handle);
  smoke_FreePoint_releaseFfiHandle(_handle);
  return result;
}
void smoke_FreePoint_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_FreePointReleaseHandleNullable(handle);
// End of FreePoint "private" section.
