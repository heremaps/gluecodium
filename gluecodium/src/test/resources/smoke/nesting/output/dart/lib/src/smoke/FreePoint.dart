import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/smoke/FreeEnum.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;

class FreePoint {
  double x;
  double y;
  FreePoint(this.x, this.y);
  static final FreeEnum aBar = FreeEnum.bar;
  FreePoint flip() {
    final _flip_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_FreePoint_flip');
    final _handle = smoke_FreePoint_toFfi(this);
    final __result_handle = _flip_ffi(_handle, __lib.LibraryContext.isolateId);
    smoke_FreePoint_releaseFfiHandle(_handle);
    final _result = smoke_FreePoint_fromFfi(__result_handle);
    smoke_FreePoint_releaseFfiHandle(__result_handle);
    return _result;
  }
}
// FreePoint "private" section, not exported.
final _smoke_FreePoint_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('library_smoke_FreePoint_create_handle');
final _smoke_FreePoint_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FreePoint_release_handle');
final _smoke_FreePoint_get_field_x = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_FreePoint_get_field_x');
final _smoke_FreePoint_get_field_y = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('library_smoke_FreePoint_get_field_y');
Pointer<Void> smoke_FreePoint_toFfi(FreePoint value) {
  final _x_handle = (value.x);
  final _y_handle = (value.y);
  final _result = _smoke_FreePoint_create_handle(_x_handle, _y_handle);
  (_x_handle);
  (_y_handle);
  return _result;
}
FreePoint smoke_FreePoint_fromFfi(Pointer<Void> handle) {
  final _x_handle = _smoke_FreePoint_get_field_x(handle);
  final _y_handle = _smoke_FreePoint_get_field_y(handle);
  final _result = FreePoint(
    (_x_handle),
    (_y_handle)
  );
  (_x_handle);
  (_y_handle);
  return _result;
}
void smoke_FreePoint_releaseFfiHandle(Pointer<Void> handle) => _smoke_FreePoint_release_handle(handle);
// Nullable FreePoint
final _smoke_FreePoint_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FreePoint_create_handle_nullable');
final _smoke_FreePoint_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_FreePoint_release_handle_nullable');
final _smoke_FreePoint_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_FreePoint_get_value_nullable');
Pointer<Void> smoke_FreePoint_toFfi_nullable(FreePoint value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_FreePoint_toFfi(value);
  final result = _smoke_FreePoint_create_handle_nullable(_handle);
  smoke_FreePoint_releaseFfiHandle(_handle);
  return result;
}
FreePoint smoke_FreePoint_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_FreePoint_get_value_nullable(handle);
  final result = smoke_FreePoint_fromFfi(_handle);
  smoke_FreePoint_releaseFfiHandle(_handle);
  return result;
}
void smoke_FreePoint_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_FreePoint_release_handle_nullable(handle);
// End of FreePoint "private" section.
