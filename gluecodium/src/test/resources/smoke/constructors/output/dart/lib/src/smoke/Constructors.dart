import 'package:library/src/BuiltInTypes__conversion.dart';
import 'package:library/src/GenericTypes__conversion.dart';
import 'package:library/src/_type_repository.dart' as __lib;
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_Constructors_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Constructors_copy_handle');
final _smoke_Constructors_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Constructors_release_handle');
final _smoke_Constructors_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Constructors_get_type_id');
final _createFromString_return_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Constructors_create__String_return_release_handle');
final _createFromString_return_get_result = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_Constructors_create__String_return_get_result');
final _createFromString_return_get_error = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Constructors_create__String_return_get_error');
final _createFromString_return_has_error = __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Constructors_create__String_return_has_error');
class Constructors {
  @protected
  final Pointer<Void> handle;
  Pointer<Void> get _handle => handle;
  @protected
  Constructors(this.handle);
  void release() => _smoke_Constructors_release_handle(_handle);
  Constructors.create() : this(_create());
  Constructors.createFromOther(Constructors other) : this(_createFromOther(other));
  Constructors.createFromMulti(String foo, int bar) : this(_createFromMulti(foo, bar));
  Constructors.createFromString(String input) : this(_createFromString(input));
  Constructors.createFromList(List<double> input) : this(_createFromList(input));
  static Pointer<Void> _create() {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(), Pointer<Void> Function()>('library_smoke_Constructors_create');
    final __result_handle = _create_ffi();
    return __result_handle;
  }
  static Pointer<Void> _createFromOther(Constructors other) {
    final _createFromOther_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Constructors_create__Constructors');
    final _other_handle = smoke_Constructors_toFfi(other);
    final __result_handle = _createFromOther_ffi(_other_handle);
    smoke_Constructors_releaseFfiHandle(_other_handle);
    return __result_handle;
  }
  static Pointer<Void> _createFromMulti(String foo, int bar) {
    final _createFromMulti_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Uint64), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_Constructors_create__String_ULong');
    final _foo_handle = String_toFfi(foo);
    final _bar_handle = (bar);
    final __result_handle = _createFromMulti_ffi(_foo_handle, _bar_handle);
    String_releaseFfiHandle(_foo_handle);
    (_bar_handle);
    return __result_handle;
  }
  static Pointer<Void> _createFromString(String input) {
    final _createFromString_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Constructors_create__String');
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
    final _createFromList_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>), Pointer<Void> Function(Pointer<Void>)>('library_smoke_Constructors_create__ListOf_1Double');
    final _input_handle = ListOf_Double_toFfi(input);
    final __result_handle = _createFromList_ffi(_input_handle);
    ListOf_Double_releaseFfiHandle(_input_handle);
    return __result_handle;
  }
}
Pointer<Void> smoke_Constructors_toFfi(Constructors value) =>
  _smoke_Constructors_copy_handle(value._handle);
Constructors smoke_Constructors_fromFfi(Pointer<Void> handle) {
  final _copied_handle = _smoke_Constructors_copy_handle(handle);
  final _type_id_handle = _smoke_Constructors_get_type_id(handle);
  final _type_id = String_fromFfi(_type_id_handle);
  final result = _type_id.isEmpty
    ? Constructors(_copied_handle)
    : __lib.typeRepository[_type_id](_copied_handle);
  String_releaseFfiHandle(_type_id_handle);
  return result;
}
void smoke_Constructors_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Constructors_release_handle(handle);
Pointer<Void> smoke_Constructors_toFfi_nullable(Constructors value) =>
  value != null ? smoke_Constructors_toFfi(value) : Pointer<Void>.fromAddress(0);
Constructors smoke_Constructors_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Constructors_fromFfi(handle) : null;
void smoke_Constructors_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Constructors_release_handle(handle);
// Internal, not exported.
class Constructors__Factory {
  static Constructors create(Pointer<Void> handle) => Constructors(handle);
}
enum Constructors_ErrorEnum {
    none,
    crashed
}
// Constructors_ErrorEnum "private" section, not exported.
int smoke_Constructors_ErrorEnum_toFfi(Constructors_ErrorEnum value) {
  switch (value) {
  case Constructors_ErrorEnum.none:
    return 0;
  break;
  case Constructors_ErrorEnum.crashed:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for Constructors_ErrorEnum enum.");
  }
}
Constructors_ErrorEnum smoke_Constructors_ErrorEnum_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return Constructors_ErrorEnum.none;
  break;
  case 1:
    return Constructors_ErrorEnum.crashed;
  break;
  default:
    throw StateError("Invalid numeric value $handle for Constructors_ErrorEnum enum.");
  }
}
void smoke_Constructors_ErrorEnum_releaseFfiHandle(int handle) {}
final _smoke_Constructors_ErrorEnum_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('library_smoke_Constructors_ErrorEnum_create_handle_nullable');
final _smoke_Constructors_ErrorEnum_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_Constructors_ErrorEnum_release_handle_nullable');
final _smoke_Constructors_ErrorEnum_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('library_smoke_Constructors_ErrorEnum_get_value_nullable');
Pointer<Void> smoke_Constructors_ErrorEnum_toFfi_nullable(Constructors_ErrorEnum value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Constructors_ErrorEnum_toFfi(value);
  final result = _smoke_Constructors_ErrorEnum_create_handle_nullable(_handle);
  smoke_Constructors_ErrorEnum_releaseFfiHandle(_handle);
  return result;
}
Constructors_ErrorEnum smoke_Constructors_ErrorEnum_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Constructors_ErrorEnum_get_value_nullable(handle);
  final result = smoke_Constructors_ErrorEnum_fromFfi(_handle);
  smoke_Constructors_ErrorEnum_releaseFfiHandle(_handle);
  return result;
}
void smoke_Constructors_ErrorEnum_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Constructors_ErrorEnum_release_handle_nullable(handle);
// End of Constructors_ErrorEnum "private" section.
class Constructors_ConstructorExplodedException implements Exception {
  final Constructors_ErrorEnum error;
  Constructors_ConstructorExplodedException(this.error);
}
