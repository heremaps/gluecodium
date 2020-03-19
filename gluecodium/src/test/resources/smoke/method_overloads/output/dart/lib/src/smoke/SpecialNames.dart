import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
abstract class SpecialNames {
  void release();
  create();
  reallyRelease();
  createProxy();
  Uppercase();
}
// SpecialNames "private" section, not exported.
final _smoke_SpecialNames_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_SpecialNames_copy_handle');
final _smoke_SpecialNames_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_SpecialNames_release_handle');
class SpecialNames$Impl implements SpecialNames {
  final Pointer<Void> handle;
  SpecialNames$Impl(this.handle);
  @override
  void release() => _smoke_SpecialNames_release_handle(handle);
  @override
  create() {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('library_smoke_SpecialNames_create');
    final _handle = this.handle;
    final __result_handle = _create_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  reallyRelease() {
    final _reallyRelease_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('library_smoke_SpecialNames_release');
    final _handle = this.handle;
    final __result_handle = _reallyRelease_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  createProxy() {
    final _createProxy_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('library_smoke_SpecialNames_createProxy');
    final _handle = this.handle;
    final __result_handle = _createProxy_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
  @override
  Uppercase() {
    final _Uppercase_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>('library_smoke_SpecialNames_Uppercase');
    final _handle = this.handle;
    final __result_handle = _Uppercase_ffi(_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_SpecialNames_toFfi(SpecialNames value) =>
  _smoke_SpecialNames_copy_handle((value as SpecialNames$Impl).handle);
SpecialNames smoke_SpecialNames_fromFfi(Pointer<Void> handle) =>
  SpecialNames$Impl(_smoke_SpecialNames_copy_handle(handle));
void smoke_SpecialNames_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_SpecialNames_release_handle(handle);
Pointer<Void> smoke_SpecialNames_toFfi_nullable(SpecialNames value) =>
  value != null ? smoke_SpecialNames_toFfi(value) : Pointer<Void>.fromAddress(0);
SpecialNames smoke_SpecialNames_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_SpecialNames_fromFfi(handle) : null;
void smoke_SpecialNames_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_SpecialNames_release_handle(handle);
// End of SpecialNames "private" section.
