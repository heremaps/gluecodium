import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/smoke/FreeEnum.dart';
import 'package:library/src/smoke/FreeException.dart';
import 'package:library/src/smoke/FreePoint.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_UseFreeTypes_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_UseFreeTypes_copy_handle');
final _smoke_UseFreeTypes_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_UseFreeTypes_release_handle');
final _doStuff_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_release_handle');
final _doStuff_return_get_result = __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_get_result');
final _doStuff_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_get_error');
final _doStuff_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum_return_has_error');
class UseFreeTypes {
  final Pointer<Void> _handle;
  UseFreeTypes._(this._handle);
  void release() => _smoke_UseFreeTypes_release_handle(_handle);
  DateTime doStuff(FreePoint point, FreeEnum mode) {
    final _doStuff_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Uint32), Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int)>('smoke_UseFreeTypes_doStuff__FreePoint_FreeEnum');
    final _point_handle = smoke_FreePoint_toFfi(point);
    final _mode_handle = smoke_FreeEnum_toFfi(mode);
    final __call_result_handle = _doStuff_ffi(_handle, _point_handle, _mode_handle);
    smoke_FreePoint_releaseFfiHandle(_point_handle);
    smoke_FreeEnum_releaseFfiHandle(_mode_handle);
    if (_doStuff_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _doStuff_return_get_error(__call_result_handle);
        _doStuff_return_release_handle(__call_result_handle);
        final _error_value = smoke_FreeEnum_fromFfi(__error_handle);
        smoke_FreeEnum_releaseFfiHandle(__error_handle);
        throw FreeException(_error_value);
    }
    final __result_handle = _doStuff_return_get_result(__call_result_handle);
    _doStuff_return_release_handle(__call_result_handle);
    final _result = Date_fromFfi(__result_handle);
    Date_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_UseFreeTypes_toFfi(UseFreeTypes value) =>
  _smoke_UseFreeTypes_copy_handle(value._handle);
UseFreeTypes smoke_UseFreeTypes_fromFfi(Pointer<Void> handle) =>
  UseFreeTypes._(_smoke_UseFreeTypes_copy_handle(handle));
void smoke_UseFreeTypes_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_UseFreeTypes_release_handle(handle);
Pointer<Void> smoke_UseFreeTypes_toFfi_nullable(UseFreeTypes value) =>
  value != null ? smoke_UseFreeTypes_toFfi(value) : Pointer<Void>.fromAddress(0);
UseFreeTypes smoke_UseFreeTypes_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_UseFreeTypes_fromFfi(handle) : null;
void smoke_UseFreeTypes_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_UseFreeTypes_release_handle(handle);