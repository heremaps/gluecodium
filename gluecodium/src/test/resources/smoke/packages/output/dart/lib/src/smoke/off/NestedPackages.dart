import 'package:library/src/BuiltInTypes__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
import 'package:library/src/_library_init.dart' as __lib;
abstract class NestedPackages {
  void release();
  static NestedPackages_SomeStruct basicMethod(NestedPackages_SomeStruct input) => NestedPackages$Impl.basicMethod(input);
}
class NestedPackages_SomeStruct {
  String someField;
  NestedPackages_SomeStruct(this.someField);
}
// NestedPackages_SomeStruct "private" section, not exported.
final _smoke_off_NestedPackages_SomeStruct_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_create_handle');
final _smoke_off_NestedPackages_SomeStruct_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_release_handle');
final _smoke_off_NestedPackages_SomeStruct_get_field_someField = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_get_field_someField');
Pointer<Void> smoke_off_NestedPackages_SomeStruct_toFfi(NestedPackages_SomeStruct value) {
  final _someField_handle = String_toFfi(value.someField);
  final _result = _smoke_off_NestedPackages_SomeStruct_create_handle(_someField_handle);
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
NestedPackages_SomeStruct smoke_off_NestedPackages_SomeStruct_fromFfi(Pointer<Void> handle) {
  final _someField_handle = _smoke_off_NestedPackages_SomeStruct_get_field_someField(handle);
  final _result = NestedPackages_SomeStruct(
    String_fromFfi(_someField_handle)
  );
  String_releaseFfiHandle(_someField_handle);
  return _result;
}
void smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(Pointer<Void> handle) => _smoke_off_NestedPackages_SomeStruct_release_handle(handle);
// Nullable NestedPackages_SomeStruct
final _smoke_off_NestedPackages_SomeStruct_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_create_handle_nullable');
final _smoke_off_NestedPackages_SomeStruct_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_release_handle_nullable');
final _smoke_off_NestedPackages_SomeStruct_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_SomeStruct_get_value_nullable');
Pointer<Void> smoke_off_NestedPackages_SomeStruct_toFfi_nullable(NestedPackages_SomeStruct value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_off_NestedPackages_SomeStruct_toFfi(value);
  final result = _smoke_off_NestedPackages_SomeStruct_create_handle_nullable(_handle);
  smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
NestedPackages_SomeStruct smoke_off_NestedPackages_SomeStruct_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_off_NestedPackages_SomeStruct_get_value_nullable(handle);
  final result = smoke_off_NestedPackages_SomeStruct_fromFfi(_handle);
  smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(_handle);
  return result;
}
void smoke_off_NestedPackages_SomeStruct_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_off_NestedPackages_SomeStruct_release_handle_nullable(handle);
// End of NestedPackages_SomeStruct "private" section.
// NestedPackages "private" section, not exported.
final _smoke_off_NestedPackages_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_copy_handle');
final _smoke_off_NestedPackages_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_off_NestedPackages_release_handle');
class NestedPackages$Impl implements NestedPackages {
  final Pointer<Void> handle;
  NestedPackages$Impl(this.handle);
  @override
  void release() => _smoke_off_NestedPackages_release_handle(handle);
  static NestedPackages_SomeStruct basicMethod(NestedPackages_SomeStruct input) {
    final _basicMethod_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('library_smoke_off_NestedPackages_basicMethod__SomeStruct');
    final _input_handle = smoke_off_NestedPackages_SomeStruct_toFfi(input);
    final __result_handle = _basicMethod_ffi(__lib.LibraryContext.isolateId, _input_handle);
    smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(_input_handle);
    final _result = smoke_off_NestedPackages_SomeStruct_fromFfi(__result_handle);
    smoke_off_NestedPackages_SomeStruct_releaseFfiHandle(__result_handle);
    return _result;
  }
}
Pointer<Void> smoke_off_NestedPackages_toFfi(NestedPackages value) =>
  _smoke_off_NestedPackages_copy_handle((value as NestedPackages$Impl).handle);
NestedPackages smoke_off_NestedPackages_fromFfi(Pointer<Void> handle) =>
  NestedPackages$Impl(_smoke_off_NestedPackages_copy_handle(handle));
void smoke_off_NestedPackages_releaseFfiHandle(Pointer<Void> handle) =>
  _smoke_off_NestedPackages_release_handle(handle);
Pointer<Void> smoke_off_NestedPackages_toFfi_nullable(NestedPackages value) =>
  value != null ? smoke_off_NestedPackages_toFfi(value) : Pointer<Void>.fromAddress(0);
NestedPackages smoke_off_NestedPackages_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? smoke_off_NestedPackages_fromFfi(handle) : null;
void smoke_off_NestedPackages_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_off_NestedPackages_release_handle(handle);
// End of NestedPackages "private" section.
