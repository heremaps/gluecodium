import 'package:library/src/builtin_types__conversion.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:library/src/_library_context.dart' as __lib;
class StructWithMethods {
  String field;
  StructWithMethods(this.field);
  voidFunction();
  bool boolFunction();
  int intFunction();
  String stringFunction();
  StructWithMethods structFunction();
  static staticFunction() => $class.staticFunction();
  static var $class = StructWithMethods$Impl();
}
class StructWithMethods$Impl {
  String field;
  StructWithMethods(this.field);
  voidFunction() {
    final _voidFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('library_smoke_StructWithMethods_voidFunction'));
    final _handle = smoke_StructWithMethods_toFfi(this);
    final __result_handle = _voidFunction_ffi(_handle, __lib.LibraryContext.isolateId);
    smoke_StructWithMethods_releaseFfiHandle(_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  bool boolFunction() {
    final _boolFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_StructWithMethods_boolFunction'));
    final _handle = smoke_StructWithMethods_toFfi(this);
    final __result_handle = _boolFunction_ffi(_handle, __lib.LibraryContext.isolateId);
    smoke_StructWithMethods_releaseFfiHandle(_handle);
    try {
      return Boolean_fromFfi(__result_handle);
    } finally {
      Boolean_releaseFfiHandle(__result_handle);
    }
  }
  int intFunction() {
    final _intFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('library_smoke_StructWithMethods_intFunction'));
    final _handle = smoke_StructWithMethods_toFfi(this);
    final __result_handle = _intFunction_ffi(_handle, __lib.LibraryContext.isolateId);
    smoke_StructWithMethods_releaseFfiHandle(_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
  String stringFunction() {
    final _stringFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_StructWithMethods_stringFunction'));
    final _handle = smoke_StructWithMethods_toFfi(this);
    final __result_handle = _stringFunction_ffi(_handle, __lib.LibraryContext.isolateId);
    smoke_StructWithMethods_releaseFfiHandle(_handle);
    try {
      return String_fromFfi(__result_handle);
    } finally {
      String_releaseFfiHandle(__result_handle);
    }
  }
  StructWithMethods structFunction() {
    final _structFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('library_smoke_StructWithMethods_structFunction'));
    final _handle = smoke_StructWithMethods_toFfi(this);
    final __result_handle = _structFunction_ffi(_handle, __lib.LibraryContext.isolateId);
    smoke_StructWithMethods_releaseFfiHandle(_handle);
    try {
      return smoke_StructWithMethods_fromFfi(__result_handle);
    } finally {
      smoke_StructWithMethods_releaseFfiHandle(__result_handle);
    }
  }
  staticFunction() {
    final _staticFunction_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('library_smoke_StructWithMethods_staticFunction'));
    final __result_handle = _staticFunction_ffi(__lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }
}
// StructWithMethods "private" section, not exported.
final _smoke_StructWithMethods_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_create_handle'));
final _smoke_StructWithMethods_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_release_handle'));
final _smoke_StructWithMethods_get_field_field = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_get_field_field'));
Pointer<Void> smoke_StructWithMethods_toFfi(StructWithMethods value) {
  final _field_handle = String_toFfi(value.field);
  final _result = _smoke_StructWithMethods_create_handle(_field_handle);
  String_releaseFfiHandle(_field_handle);
  return _result;
}
StructWithMethods smoke_StructWithMethods_fromFfi(Pointer<Void> handle) {
  final _field_handle = _smoke_StructWithMethods_get_field_field(handle);
  try {
    return StructWithMethods(
      String_fromFfi(_field_handle)
    );
  } finally {
    String_releaseFfiHandle(_field_handle);
  }
}
void smoke_StructWithMethods_releaseFfiHandle(Pointer<Void> handle) => _smoke_StructWithMethods_release_handle(handle);
// Nullable StructWithMethods
final _smoke_StructWithMethods_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_create_handle_nullable'));
final _smoke_StructWithMethods_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_release_handle_nullable'));
final _smoke_StructWithMethods_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('library_smoke_StructWithMethods_get_value_nullable'));
Pointer<Void> smoke_StructWithMethods_toFfi_nullable(StructWithMethods value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = smoke_StructWithMethods_toFfi(value);
  final result = _smoke_StructWithMethods_create_handle_nullable(_handle);
  smoke_StructWithMethods_releaseFfiHandle(_handle);
  return result;
}
StructWithMethods smoke_StructWithMethods_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _smoke_StructWithMethods_get_value_nullable(handle);
  final result = smoke_StructWithMethods_fromFfi(_handle);
  smoke_StructWithMethods_releaseFfiHandle(_handle);
  return result;
}
void smoke_StructWithMethods_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _smoke_StructWithMethods_release_handle_nullable(handle);
// End of StructWithMethods "private" section.
