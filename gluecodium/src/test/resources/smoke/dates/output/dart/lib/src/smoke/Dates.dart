import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_init.dart' as __lib;
final _smoke_Dates_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Dates_copy_handle');
final _smoke_Dates_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Dates_release_handle');
class Dates {
  final Pointer<Void> _handle;
  Dates._(this._handle);
  void release() => _smoke_Dates_release_handle(_handle);
  DateTime dateMethod(DateTime input) {
    final _dateMethod_ffi = __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Uint64), int Function(Pointer<Void>, int)>('smoke_Dates_dateMethod__Date');
    final _input_handle = Date_toFfi(input);
    final __result_handle = _dateMethod_ffi(_handle, _input_handle);
    Date_releaseFfiHandle(_input_handle);
    final _result = Date_fromFfi(__result_handle);
    Date_releaseFfiHandle(__result_handle);
    return _result;
  }
  DateTime get dateProperty {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>), int Function(Pointer<Void>)>('smoke_Dates_dateProperty_get');
    final __result_handle = _get_ffi(_handle);
    final _result = Date_fromFfi(__result_handle);
    Date_releaseFfiHandle(__result_handle);
    return _result;
  }
  set dateProperty(DateTime value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Uint64), void Function(Pointer<Void>, int)>('smoke_Dates_dateProperty_set__Date');
    final _value_handle = Date_toFfi(value);
    final __result_handle = _set_ffi(_handle, _value_handle);
    Date_releaseFfiHandle(_value_handle);
    final _result = (__result_handle);
    (__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_Dates_toFfi(Dates value) =>
  _smoke_Dates_copy_handle(value._handle);
Dates smoke_Dates_fromFfi(Pointer<Void> handle) =>
  Dates._(_smoke_Dates_copy_handle(handle));
void smoke_Dates_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_Dates_release_handle(handle);
Pointer<Void> smoke_Dates_toFfi_nullable(Dates value) =>
  value != null ? smoke_Dates_toFfi(value) : Pointer<Void>.fromAddress(0);
Dates smoke_Dates_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_Dates_fromFfi(handle) : null;
void smoke_Dates_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Dates_release_handle(handle);
class Dates_DateStruct {
  DateTime dateField;
  Dates_DateStruct(this.dateField);
}
// Dates_DateStruct "private" section, not exported.
final _smoke_Dates_DateStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64),
    Pointer<Void> Function(int)
  >('smoke_Dates_DateStruct_create_handle');
final _smoke_Dates_DateStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Dates_DateStruct_release_handle');
final _smoke_Dates_DateStruct_get_field_dateField = __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('smoke_Dates_DateStruct_get_field_dateField');
Pointer<Void> smoke_Dates_DateStruct_toFfi(Dates_DateStruct value) {
  final _dateField_handle = Date_toFfi(value.dateField);
  final _result = _smoke_Dates_DateStruct_create_handle(_dateField_handle);
  Date_releaseFfiHandle(_dateField_handle);
  return _result;
}
Dates_DateStruct smoke_Dates_DateStruct_fromFfi(Pointer<Void> handle) {
  final _dateField_handle = _smoke_Dates_DateStruct_get_field_dateField(handle);
  final _result = Dates_DateStruct(
    Date_fromFfi(_dateField_handle)
  );
  Date_releaseFfiHandle(_dateField_handle);
  return _result;
}
void smoke_Dates_DateStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_Dates_DateStruct_release_handle(handle);
// Nullable Dates_DateStruct
final _smoke_Dates_DateStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Dates_DateStruct_create_handle_nullable');
final _smoke_Dates_DateStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('smoke_Dates_DateStruct_release_handle_nullable');
final _smoke_Dates_DateStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('smoke_Dates_DateStruct_get_value_nullable');
Pointer<Void> smoke_Dates_DateStruct_toFfi_nullable(Dates_DateStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_Dates_DateStruct_toFfi(value);
  final result = _smoke_Dates_DateStruct_create_handle_nullable(_handle);
  smoke_Dates_DateStruct_releaseFfiHandle(_handle);
  return result;
}
Dates_DateStruct smoke_Dates_DateStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_Dates_DateStruct_get_value_nullable(handle);
  final result = smoke_Dates_DateStruct_fromFfi(_handle);
  smoke_Dates_DateStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_Dates_DateStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_Dates_DateStruct_release_handle_nullable(handle);
// End of Dates_DateStruct "private" section.
