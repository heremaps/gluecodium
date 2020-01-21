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
final _createFromString_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Constructors_create__String_return_release_handle');
final _createFromString_return_get_result = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Constructors_create__String_return_get_result');
final _createFromString_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Constructors_create__String_return_get_error');
final _createFromString_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Constructors_create__String_return_has_error');
class Constructors {
  final Pointer<Void> _handle;
  Constructors._(this._handle);
  void release() => __release_handle(_handle);
  Constructors.create() : this._(_create());
  Constructors.createFromOther(Constructors other) : this._(_createFromOther(other));
  Constructors.createFromMulti(String foo, int bar) : this._(_createFromMulti(foo, bar));
  Constructors.createFromString(String input) : this._(_createFromString(input));
  Constructors.createFromList(List<double> input) : this._(_createFromList(input));
  static Pointer<Void> _create() {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('smoke_Constructors_create');
    final __result_handle = _create_ffi();
    return __result_handle;
  }
  static Pointer<Void> _createFromOther(Constructors other) {
    final _createFromOther_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Constructors_create__Constructors');
    final _other_handle = smoke_Constructors_toFfi(other);
    final __result_handle = _createFromOther_ffi(_other_handle);
    smoke_Constructors_releaseFfiHandle(_other_handle);
    return __result_handle;
  }
  static Pointer<Void> _createFromMulti(String foo, int bar) {
    final _createFromMulti_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Uint64), Pointer<Void> Function(Pointer<Void>, int)>('smoke_Constructors_create__String_ULong');
    final _foo_handle = String_toFfi(foo);
    final _bar_handle = (bar);
    final __result_handle = _createFromMulti_ffi(_foo_handle, _bar_handle);
    String_releaseFfiHandle(_foo_handle);
    (_bar_handle);
    return __result_handle;
  }
  static Pointer<Void> _createFromString(String input) {
    final _createFromString_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Constructors_create__String');
    final _input_handle = String_toFfi(input);
    final __call_result_handle = _createFromString_ffi(_input_handle);
    String_releaseFfiHandle(_input_handle);
    if (_createFromString_return_has_error(__call_result_handle) != 0) {
        final __error_handle = _createFromString_return_get_error(__call_result_handle);
        _createFromString_return_release_handle(__call_result_handle);
        final _error_value = smoke_Constructors_ErrorEnum_fromFfi(__error_handle);
        smoke_Constructors_ErrorEnum_releaseFfiHandle(__error_handle);
        throw Constructors_ConstructorExplodedException(_error_value);
    }
    final __result_handle = _createFromString_return_get_result(__call_result_handle);
    _createFromString_return_release_handle(__call_result_handle);
    return __result_handle;
  }
  static Pointer<Void> _createFromList(List<double> input) {
    final _createFromList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('smoke_Constructors_create__ListOf_1Double');
    final _input_handle = ListOf_Double_toFfi(input);
    final __result_handle = _createFromList_ffi(_input_handle);
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
class Constructors_ConstructorExplodedException implements Exception {
  final Constructors_ErrorEnum error;
  Constructors_ConstructorExplodedException(this.error);
}
