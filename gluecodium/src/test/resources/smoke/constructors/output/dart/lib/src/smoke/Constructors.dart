import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/String__conversion.dart';
import 'package:library/src/smoke/Constructors_ErrorEnum__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:library/src/_library_init.dart' as __lib;
final __release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Constructors_release_handle');
class Constructors {
  final Pointer<Void> _handle;
  Constructors._(this._handle);
  void release() => __release_handle(_handle);
  Constructors() : this._(_create());
  Constructors(Constructors other) : this._(_create(other));
  Constructors(String foo, int bar) : this._(_create(foo, bar));
  Constructors(String input) : this._(_create(input));
  Constructors(List<double> input) : this._(_create(input));
  static Pointer<Void> _create() {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Constructors_create');
    final __result_handle = _create_ffi();
    return __result_handle;
  }
  static Pointer<Void> _create(Constructors other) {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Constructors_create__Constructors');
    final _other_handle = smoke_Constructors_toFfi(other);
    final __result_handle = _create_ffi(_other_handle);
    smoke_Constructors_releaseFfiHandle(_other_handle);
    return __result_handle;
  }
  static Pointer<Void> _create(String foo, int bar) {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Uint64), Pointer<Void> Function(Pointer<Void>, int)>('smoke_Constructors_create__String_ULong');
    final _foo_handle = String_toFfi(foo);
    final _bar_handle = (bar);
    final __result_handle = _create_ffi(_foo_handle, _bar_handle);
    String_releaseFfiHandle(_foo_handle);
    (_bar_handle);
    return __result_handle;
  }
  static Pointer<Void> _create(String input) {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Constructors_create__String');
    final _input_handle = String_toFfi(input);
    final __result_handle = _create_ffi(_input_handle);
    String_releaseFfiHandle(_input_handle);
    return __result_handle;
  }
  static Pointer<Void> _create(List<double> input) {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Constructors_create__ListOf_1Double');
    final _input_handle = ListOf_Double_toFfi(input);
    final __result_handle = _create_ffi(_input_handle);
    ListOf_Double_releaseFfiHandle(_input_handle);
    return __result_handle;
  }
}
Pointer<Void> smoke_Constructors_toFfi(Constructors value) =>
  value != null ? value._handle : Pointer<Void>.fromAddress(0);
Constructors smoke_Constructors_fromFfi(Pointer<Void> handle) =>
  handle.address != 0 ? Constructors._(handle) : null;
void smoke_Constructors_releaseFfiHandle(Pointer<Void> handle) {}
enum Constructors_ErrorEnum {
    none,
    crashed
}
